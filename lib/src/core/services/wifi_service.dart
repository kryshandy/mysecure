import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_scan/wifi_scan.dart';
import 'package:uuid/uuid.dart';
import '../database/database_connection.dart';
import '../database/app_database.dart' as db;
import '../database/daos.dart';
import '../models/wifi_models.dart';
import '../models/assessment_models.dart';
import '../ffi/native_bindings.dart';

final wifiServiceProvider = Provider<WifiService>((ref) {
  final db = ref.watch(databaseProvider);
  return WifiService(
    apDao: db.accessPointDao,
    clientDao: db.clientDeviceDao,
    hsDao: db.handshakeCaptureDao,
    pmkidDao: db.pmkidCaptureDao,
    wpsDao: db.wpsPinDao,
    vulnDao: db.vulnerabilityFindingDao,
    sessionDao: db.scanSessionDao,
    eventDao: db.assessmentEventDao,
  );
});

final scanHistoryProvider = StreamProvider<List<ScanSession>>(
  (ref) => ref.watch(wifiServiceProvider).watchScanHistory(),
);

class WifiService {
  final AccessPointDao _apDao;
  final ClientDeviceDao _clientDao;
  final HandshakeCaptureDao _hsDao;
  final PmkidCaptureDao _pmkidDao;
  final WpsPinDao _wpsDao;
  final VulnerabilityFindingDao _vulnDao;
  final ScanSessionDao _sessionDao;
  final AssessmentEventDao _eventDao;

  final _logger = Logger();
  NativeWifiBindings? _nativeBindings;
  bool _nativeInitialized = false;
  StreamController<AccessPoint>? _scanStreamController;
  StreamController<AssessmentEvent>? _eventStreamController;

  ScanSession? _currentSession;
  Timer? _scanTimer;
  final Set<String> _seenBssids = <String>{};

  WifiService({
    required AccessPointDao apDao,
    required ClientDeviceDao clientDao,
    required HandshakeCaptureDao hsDao,
    required PmkidCaptureDao pmkidDao,
    required WpsPinDao wpsDao,
    required VulnerabilityFindingDao vulnDao,
    required ScanSessionDao sessionDao,
    required AssessmentEventDao eventDao,
  }) : _apDao = apDao,
       _clientDao = clientDao,
       _hsDao = hsDao,
       _pmkidDao = pmkidDao,
       _wpsDao = wpsDao,
       _vulnDao = vulnDao,
       _sessionDao = sessionDao,
       _eventDao = eventDao;

  Future<void> initialize() async {
    await _requestPermissions();
    await _initializeNative();
  }

  Future<void> _requestPermissions() async {
    final statuses = await [
      Permission.location,
      Permission.locationWhenInUse,
      Permission.nearbyWifiDevices,
    ].request();

    _logger.i('Permission statuses: $statuses');
  }

  Future<void> _initializeNative() async {
    try {
      await NativeLibraryLoader.initialize();
      if (NativeLibraryLoader.isInitialized) {
        _nativeBindings = NativeWifiBindings();
        _nativeInitialized = true;
        _logger.i('Native WiFi bindings initialized');
      }
    } catch (e) {
      _logger.w('Native initialization failed: $e');
    }
  }

  // Stream getters
  Stream<AccessPoint> get scanStream =>
      _scanStreamController?.stream ?? const Stream.empty();
  Stream<AssessmentEvent> get eventStream =>
      _eventStreamController?.stream ?? const Stream.empty();

  // Scan Operations
  Future<ScanSession> startScan({
    required String name,
    required ScanMode mode,
    required ScanConfig config,
    String? assessmentId,
  }) async {
    final session = ScanSession(
      id: const Uuid().v4(),
      name: name,
      mode: mode,
      status: ScanStatus.running,
      startedAt: DateTime.now(),
      completedAt: null,
      config: config,
      statistics: const ScanStatistics(),
      assessmentId: assessmentId,
    );

    await _sessionDao.insertSession(
      db.ScanSessionsCompanion(
        id: Value(session.id),
        assessmentId: Value(session.assessmentId),
        name: Value(session.name),
        mode: Value(session.mode),
        status: Value(session.status),
        startedAt: Value(session.startedAt),
        configJson: Value(session.config),
        statisticsJson: Value(session.statistics),
        accessPointIds: Value(session.accessPointIds),
        handshakeIds: Value(session.handshakeIds),
        pmkidIds: Value(session.pmkidIds),
        wpsPinIds: Value(session.wpsPinIds),
      ),
    );

    _currentSession = session;
    _seenBssids.clear();
    _scanStreamController = StreamController.broadcast();
    _eventStreamController = StreamController.broadcast();

    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId ?? '',
        type: EventType.assessmentStarted,
        timestamp: DateTime.now(),
        message: 'WiFi scan started: $name',
        level: LogLevel.info,
      ),
    );

    if (_nativeInitialized && _nativeBindings != null) {
      _startNativeScan(session, config);
    } else {
      _startFlutterScan(session, config);
    }

    return session;
  }

  void _startNativeScan(ScanSession session, ScanConfig config) {
    // This would use the FFI bindings
    // For now, fallback to Flutter scan
    _startFlutterScan(session, config);
  }

  void _startFlutterScan(ScanSession session, ScanConfig config) async {
    try {
      // Start WiFi scan
      final canScan = await WiFiScan.instance.canStartScan();
      if (canScan != CanStartScan.yes) {
        _logger.w('Cannot start scan: $canScan');
        await _completeScan(ScanStatus.failed);
        return;
      }

      await WiFiScan.instance.startScan();

      _scanTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
        if (_currentSession == null ||
            _currentSession!.status != ScanStatus.running) {
          timer.cancel();
          return;
        }

        await _processScanResults(session);
      });

      // Complete after configured cycles
      Future.delayed(Duration(seconds: config.scanCycles * 5), () {
        if (_currentSession?.id == session.id &&
            _currentSession?.status == ScanStatus.running) {
          _completeScan(ScanStatus.completed);
        }
      });
    } catch (e) {
      _logger.e('Flutter scan failed: $e');
      await _completeScan(ScanStatus.failed);
    }
  }

  Future<void> _processScanResults(ScanSession session) async {
    try {
      final results = await WiFiScan.instance.getScannedResults();

      var stats = _currentSession?.statistics ?? session.statistics;
      final newAps = <AccessPoint>[];

      for (final result in results) {
        if (!_seenBssids.add(result.bssid)) continue;
        final security = _parseSecurity(result.capabilities);
        final ap = AccessPoint(
          id: const Uuid().v4(),
          bssid: result.bssid,
          ssid: result.ssid.isEmpty ? '<hidden>' : result.ssid,
          frequency: result.frequency,
          channel: _frequencyToChannel(result.frequency),
          signalLevel: result.level,
          noiseLevel: -95, // Estimated
          security: security,
          supportedProtocols: _parseProtocols(result.capabilities),
          wpsEnabled: result.capabilities.contains('WPS'),
          wpsManufacturer: null,
          wpsModel: null,
          beaconInterval: 100,
          capabilityMask: 0,
          firstSeen: DateTime.now(),
          lastSeen: DateTime.now(),
          packetCount: 1,
          vendorIEs: {},
        );

        newAps.add(ap);
        stats = stats.copyWith(
          uniqueAps: stats.uniqueAps + 1,
          beaconFrames: stats.beaconFrames + 1,
        );
      }

      if (newAps.isNotEmpty) {
        await _apDao.insertAccessPoints(
          newAps
              .map(
                (ap) => db.AccessPointsCompanion(
                  id: Value(ap.id),
                  assessmentId: Value(session.assessmentId ?? session.id),
                  bssid: Value(ap.bssid),
                  ssid: Value(ap.ssid),
                  frequency: Value(ap.frequency),
                  channel: Value(ap.channel),
                  signalLevel: Value(ap.signalLevel),
                  noiseLevel: Value(ap.noiseLevel),
                  security: Value(ap.security),
                  supportedProtocols: Value(ap.supportedProtocols),
                  wpsEnabled: Value(ap.wpsEnabled),
                  wpsManufacturer: Value(ap.wpsManufacturer),
                  wpsModel: Value(ap.wpsModel),
                  beaconInterval: Value(ap.beaconInterval),
                  capabilityMask: Value(ap.capabilityMask),
                  firstSeen: Value(ap.firstSeen),
                  lastSeen: Value(ap.lastSeen),
                  packetCount: Value(ap.packetCount),
                  vendorIEs: Value(ap.vendorIEs),
                  clientIds: Value(
                    ap.associatedClients.map((c) => c.id).toList(),
                  ),
                ),
              )
              .toList(),
        );

        for (final ap in newAps) {
          _scanStreamController?.add(ap);
        }

        // Update session statistics
        final allIds = <String>{
          ...?_currentSession?.accessPointIds,
          ...newAps.map((ap) => ap.id),
        }.toList();
        _currentSession = (_currentSession ?? session).copyWith(
          statistics: stats,
          accessPointIds: allIds,
        );
        await _sessionDao.updateSession(
          db.ScanSessionsCompanion(
            id: Value(session.id),
            statisticsJson: Value(_currentSession!.statistics),
            accessPointIds: Value(allIds),
          ),
        );

        // Analyze vulnerabilities
        await _analyzeVulnerabilities(
          newAps,
          session.assessmentId ?? session.id,
        );
      }
    } catch (e) {
      _logger.e('Error processing scan results: $e');
    }
  }

  Future<void> _analyzeVulnerabilities(
    List<AccessPoint> aps,
    String sessionId,
  ) async {
    for (final ap in aps) {
      final vulns = <VulnerabilityFinding>[];

      // Check for weak encryption
      if (ap.security == SecurityProtocol.open) {
        vulns.add(
          VulnerabilityFinding(
            id: const Uuid().v4(),
            accessPointId: ap.id,
            type: VulnerabilityType.weakEncryption,
            severity: Severity.critical,
            title: 'Open Network - No Encryption',
            description:
                'The network "${ap.ssid}" (${ap.bssid}) uses no encryption. All traffic is transmitted in cleartext.',
            recommendation: 'Enable WPA3 or at minimum WPA2-AES encryption.',
            evidence: {'bssid': ap.bssid, 'ssid': ap.ssid},
            discoveredAt: DateTime.now(),
            cvssVector: CvssVector(
              vectorString: 'CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N',
              baseScore: 7.5,
              temporalScore: 7.5,
              environmentalScore: 7.5,
            ),
          ),
        );
      } else if (ap.security == SecurityProtocol.wep) {
        vulns.add(
          VulnerabilityFinding(
            id: const Uuid().v4(),
            accessPointId: ap.id,
            type: VulnerabilityType.weakEncryption,
            severity: Severity.high,
            title: 'WEP Encryption - Deprecated and Insecure',
            description:
                'WEP can be cracked in minutes. This network uses deprecated WEP encryption.',
            recommendation: 'Upgrade to WPA3 or WPA2-AES immediately.',
            evidence: {'bssid': ap.bssid, 'ssid': ap.ssid},
            discoveredAt: DateTime.now(),
            cvssVector: CvssVector(
              vectorString: 'CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N',
              baseScore: 7.5,
              temporalScore: 7.5,
              environmentalScore: 7.5,
            ),
          ),
        );
      }

      // Check for WPS
      if (ap.wpsEnabled) {
        vulns.add(
          VulnerabilityFinding(
            id: const Uuid().v4(),
            accessPointId: ap.id,
            type: VulnerabilityType.wpsEnabled,
            severity: Severity.medium,
            title: 'WPS Enabled - Vulnerable to Pixie-Dust Attack',
            description:
                'WiFi Protected Setup is enabled, which may allow PIN recovery via Pixie-Dust attack.',
            recommendation: 'Disable WPS in router configuration.',
            evidence: {'bssid': ap.bssid, 'ssid': ap.ssid},
            discoveredAt: DateTime.now(),
            cvssVector: CvssVector(
              vectorString: 'CVSS:3.1/AV:A/AC:H/PR:N/UI:N/S:U/C:H/I:N/A:N',
              baseScore: 5.9,
              temporalScore: 5.9,
              environmentalScore: 5.9,
            ),
          ),
        );
      }

      // Check for PMKID vulnerability (WPA2/WPA3)
      if (ap.security == SecurityProtocol.wpa2 ||
          ap.security == SecurityProtocol.wpa3 ||
          ap.security == SecurityProtocol.wpa2_wpa3) {
        vulns.add(
          VulnerabilityFinding(
            id: const Uuid().v4(),
            accessPointId: ap.id,
            type: VulnerabilityType.pmkidVulnerable,
            severity: Severity.medium,
            title: 'Potential PMKID Attack Vector',
            description:
                'WPA2/WPA3 networks may be vulnerable to PMKID attack if using PSK authentication.',
            recommendation:
                'Use strong PSK (20+ chars), consider WPA3-Enterprise with 802.1X.',
            evidence: {'bssid': ap.bssid, 'ssid': ap.ssid},
            discoveredAt: DateTime.now(),
            cvssVector: CvssVector(
              vectorString: 'CVSS:3.1/AV:A/AC:H/PR:N/UI:N/S:U/C:H/I:N/A:N',
              baseScore: 5.9,
              temporalScore: 5.9,
              environmentalScore: 5.9,
            ),
          ),
        );
      }

      if (vulns.isNotEmpty) {
        for (final vuln in vulns) {
          await _vulnDao.insertVulnerability(
            db.VulnerabilityFindingsCompanion(
              id: Value(vuln.id),
              assessmentId: Value(sessionId),
              accessPointId: Value(vuln.accessPointId),
              type: Value(vuln.type),
              severity: Value(vuln.severity),
              title: Value(vuln.title),
              description: Value(vuln.description),
              recommendation: Value(vuln.recommendation),
              evidence: Value(vuln.evidence),
              discoveredAt: Value(vuln.discoveredAt),
              cvssVectorJson: Value(vuln.cvssVector),
              verified: Value(vuln.verified),
            ),
          );
        }
      }
    }
  }

  Future<void> _completeScan(ScanStatus status) async {
    _scanTimer?.cancel();

    if (_currentSession != null) {
      final completedSession = _currentSession!.copyWith(
        status: status,
        completedAt: DateTime.now(),
      );

      await _sessionDao.updateSession(
        db.ScanSessionsCompanion(
          id: Value(completedSession.id),
          status: Value(completedSession.status),
          completedAt: Value(completedSession.completedAt),
        ),
      );

      _emitEvent(
        AssessmentEvent(
          id: const Uuid().v4(),
          assessmentId: completedSession.assessmentId ?? completedSession.id,
          type: status == ScanStatus.completed
              ? EventType.assessmentCompleted
              : EventType.assessmentFailed,
          timestamp: DateTime.now(),
          message: 'Scan ${status.name}',
          level: status == ScanStatus.completed
              ? LogLevel.info
              : LogLevel.error,
        ),
      );

      _scanStreamController?.close();
      _eventStreamController?.close();
      _currentSession = null;
      _seenBssids.clear();
    }
  }

  Future<void> stopScan() async {
    await _completeScan(ScanStatus.cancelled);
    if (_nativeInitialized && _nativeBindings != null) {
      _nativeBindings!.stopScan();
    }
  }

  Future<void> pauseScan() async {
    if (_currentSession != null) {
      _scanTimer?.cancel();
      await _sessionDao.updateSession(
        db.ScanSessionsCompanion(
          id: Value(_currentSession!.id),
          status: Value(ScanStatus.paused),
        ),
      );
      _currentSession = _currentSession!.copyWith(status: ScanStatus.paused);
    }
  }

  Future<void> resumeScan() async {
    if (_currentSession != null) {
      await _sessionDao.updateSession(
        db.ScanSessionsCompanion(
          id: Value(_currentSession!.id),
          status: Value(ScanStatus.running),
        ),
      );
      _currentSession = _currentSession!.copyWith(status: ScanStatus.running);
      _scanTimer?.cancel();
      _scanTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
        if (_currentSession?.status != ScanStatus.running) {
          timer.cancel();
          return;
        }
        await _processScanResults(_currentSession!);
      });
    }
  }

  // Active Attacks (require authorization check in UI)
  Future<HandshakeCapture?> captureHandshake({
    required String interface,
    required String bssid,
    required int channel,
    required String assessmentId,
  }) async {
    if (!_nativeInitialized || _nativeBindings == null) {
      _logger.w('Native bindings not available for handshake capture');
      return null;
    }

    final capture = HandshakeCapture(
      id: const Uuid().v4(),
      accessPointId: '', // Would be resolved from BSSID
      bssid: bssid,
      ssid: '',
      type: HandshakeType.wpa2_4way,
      eapolFrames: [],
      capturedAt: DateTime.now(),
      frameCount: 0,
      isComplete: false,
      metadata: {'interface': interface, 'channel': channel},
    );

    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.taskStarted,
        timestamp: DateTime.now(),
        message: 'Starting handshake capture for $bssid',
        level: LogLevel.info,
      ),
    );

    // This would use the native bindings
    // await _nativeBindings!.captureHandshake(...)

    return capture;
  }

  Future<PmkidCapture?> capturePmkid({
    required String interface,
    required String bssid,
    required int channel,
    required String assessmentId,
  }) async {
    if (!_nativeInitialized || _nativeBindings == null) {
      _logger.w('Native bindings not available for PMKID capture');
      return null;
    }

    final capture = PmkidCapture(
      id: const Uuid().v4(),
      accessPointId: '',
      bssid: bssid,
      ssid: '',
      pmkidData: [],
      capturedAt: DateTime.now(),
      metadata: {'interface': interface, 'channel': channel},
    );

    return capture;
  }

  Future<WpsPin?> testWps({
    required String interface,
    required String bssid,
    required int channel,
    required String assessmentId,
  }) async {
    if (!_nativeInitialized || _nativeBindings == null) {
      _logger.w('Native bindings not available for WPS test');
      return null;
    }

    return null;
  }

  // Deauth (for handshake capture assistance)
  Future<bool> sendDeauth({
    required String bssid,
    int count = 5,
    int intervalMs = 100,
  }) async {
    if (!_nativeInitialized || _nativeBindings == null) {
      return false;
    }

    final result = _nativeBindings!.sendDeauth(bssid, count, intervalMs);
    return result == 0;
  }

  // Data Access
  Future<List<AccessPoint>> getAccessPoints(String assessmentId) {
    return _apDao.getAccessPointsByAssessment(assessmentId);
  }

  Future<AccessPoint?> getAccessPointByBssid(String bssid) {
    return _apDao.getAccessPointByBssid(bssid);
  }

  Future<List<ClientDevice>> getClientsByAccessPoint(String accessPointId) {
    return _clientDao.getClientsByAccessPoint(accessPointId);
  }

  Future<List<HandshakeCapture>> getHandshakesByAccessPoint(
    String accessPointId,
  ) {
    return _hsDao.getHandshakesByAccessPoint(accessPointId);
  }

  Future<List<PmkidCapture>> getPmkidsByAccessPoint(String accessPointId) {
    return _pmkidDao.getPmkidsByAccessPoint(accessPointId);
  }

  Future<List<WpsPin>> getWpsPinsByAccessPoint(String accessPointId) {
    return _wpsDao.getWpsPinsByAccessPoint(accessPointId);
  }

  Future<List<VulnerabilityFinding>> getVulnerabilitiesByAccessPoint(
    String accessPointId,
  ) {
    return _vulnDao.getVulnsByAccessPoint(accessPointId);
  }

  Stream<List<AccessPoint>> watchAccessPoints(String assessmentId) {
    return _apDao.watchAccessPointsByAssessment(assessmentId);
  }

  Future<List<HandshakeCapture>> getHandshakes(String assessmentId) {
    return _hsDao.getHandshakesByAssessment(assessmentId);
  }

  Future<List<PmkidCapture>> getPmkids(String assessmentId) {
    return _pmkidDao.getPmkidsByAssessment(assessmentId);
  }

  Future<List<WpsPin>> getWpsPins(String assessmentId) {
    return _wpsDao.getWpsPinsByAssessment(assessmentId);
  }

  Future<List<VulnerabilityFinding>> getVulnerabilities(String assessmentId) {
    return _vulnDao.getVulnsByAssessment(assessmentId);
  }

  Future<List<ScanSession>> getScanHistory() {
    return _sessionDao.getAllSessions();
  }

  Stream<List<ScanSession>> watchScanHistory() {
    return _sessionDao.watchAllSessions();
  }

  // Helpers
  SecurityProtocol _parseSecurity(String capabilities) {
    if (capabilities.contains('WPA3')) return SecurityProtocol.wpa3;
    if (capabilities.contains('WPA2')) return SecurityProtocol.wpa2;
    if (capabilities.contains('WPA')) return SecurityProtocol.wpa;
    if (capabilities.contains('WEP')) return SecurityProtocol.wep;
    if (capabilities.contains('OWE')) return SecurityProtocol.owe;
    return SecurityProtocol.open;
  }

  List<SecurityProtocol> _parseProtocols(String capabilities) {
    final protocols = <SecurityProtocol>[];
    if (capabilities.contains('WPA3')) protocols.add(SecurityProtocol.wpa3);
    if (capabilities.contains('WPA2')) protocols.add(SecurityProtocol.wpa2);
    if (capabilities.contains('WPA')) protocols.add(SecurityProtocol.wpa);
    if (capabilities.contains('WEP')) protocols.add(SecurityProtocol.wep);
    if (capabilities.contains('OWE')) protocols.add(SecurityProtocol.owe);
    if (protocols.isEmpty) protocols.add(SecurityProtocol.open);
    return protocols;
  }

  int _frequencyToChannel(int freq) {
    if (freq >= 2412 && freq <= 2472) return ((freq - 2407) / 5).round();
    if (freq == 2484) return 14;
    if (freq >= 5180 && freq <= 5825) return ((freq - 5000) / 5).round();
    return 0;
  }

  void _emitEvent(AssessmentEvent event) {
    _eventStreamController?.add(event);
    _eventDao.insertEvent(
      db.AssessmentEventsCompanion(
        id: Value(event.id),
        assessmentId: Value(event.assessmentId),
        type: Value(event.type),
        timestamp: Value(event.timestamp),
        message: Value(event.message),
        data: Value(event.data),
        level: Value(event.level),
        phaseId: Value(event.phaseId),
        taskId: Value(event.taskId),
      ),
    );
  }

  void dispose() {
    _scanTimer?.cancel();
    _scanStreamController?.close();
    _eventStreamController?.close();
  }
}
