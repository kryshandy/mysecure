import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';
import '../../../core/models/wifi_models.dart';
import '../../../core/models/project_models.dart';
import '../../../core/services/project_service.dart';
import '../../../core/services/wifi_service.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/extensions/extensions.dart';
import '../../../shared/widgets/main_scaffold.dart';

class WifiDetailScreen extends ConsumerStatefulWidget {
  final String bssid;

  const WifiDetailScreen({super.key, required this.bssid});

  @override
  ConsumerState<WifiDetailScreen> createState() => _WifiDetailScreenState();
}

class _WifiDetailScreenState extends ConsumerState<WifiDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  AccessPoint? _accessPoint;
  List<HandshakeCapture> _handshakes = [];
  List<PmkidCapture> _pmkids = [];
  List<WpsPin> _wpsPins = [];
  List<VulnerabilityFinding> _vulns = [];
  String? _assessmentId;
  Object? _loadError;
  bool _isLoading = true;
  bool _actionInProgress = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _loadError = null;
      });
    }

    try {
      final service = ref.read(wifiServiceProvider);
      final accessPoint = await service.getAccessPointByBssid(widget.bssid);
      if (accessPoint == null) {
        throw StateError(
          'This access point is no longer present in the scan history.',
        );
      }
      final history = await service.getScanHistory();
      history.sort((a, b) => b.startedAt.compareTo(a.startedAt));

      String? assessmentId;
      for (final session in history) {
        if (session.accessPointIds.contains(accessPoint.id)) {
          assessmentId = session.assessmentId ?? session.id;
          break;
        }
      }

      final results = await Future.wait<Object>([
        service.getClientsByAccessPoint(accessPoint.id),
        service.getHandshakesByAccessPoint(accessPoint.id),
        service.getPmkidsByAccessPoint(accessPoint.id),
        service.getWpsPinsByAccessPoint(accessPoint.id),
        service.getVulnerabilitiesByAccessPoint(accessPoint.id),
      ]);
      if (!mounted) return;
      setState(() {
        _accessPoint = accessPoint.copyWith(
          associatedClients: results[0] as List<ClientDevice>,
        );
        _assessmentId = assessmentId;
        _handshakes = results[1] as List<HandshakeCapture>;
        _pmkids = results[2] as List<PmkidCapture>;
        _wpsPins = results[3] as List<WpsPin>;
        _vulns = results[4] as List<VulnerabilityFinding>;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loadError = error;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_accessPoint?.ssid ?? 'AP Details'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Symbols.info, size: 18)),
            Tab(text: 'Clients', icon: Icon(Symbols.devices, size: 18)),
            Tab(text: 'Captures', icon: Icon(Symbols.save, size: 18)),
            Tab(
              text: 'Vulnerabilities',
              icon: Icon(Symbols.bug_report, size: 18),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleAction,
            itemBuilder: (context) => [
              if (_accessPoint?.wpsEnabled == true)
                const PopupMenuItem(
                  value: 'test_wps',
                  child: ListTile(
                    leading: Icon(Symbols.key, size: 20),
                    title: Text('Test WPS'),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              const PopupMenuItem(
                value: 'capture_handshake',
                child: ListTile(
                  leading: Icon(Symbols.download, size: 20),
                  title: Text('Capture Handshake'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'capture_pmkid',
                child: ListTile(
                  leading: Icon(Symbols.fingerprint, size: 20),
                  title: Text('Capture PMKID'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'deauth',
                child: ListTile(
                  leading: Icon(Symbols.block, size: 20, color: Colors.red),
                  title: Text(
                    'Send Deauth',
                    style: TextStyle(color: Colors.red),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'export',
                child: ListTile(
                  leading: Icon(Symbols.file_download, size: 20),
                  title: Text('Export Data'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _loadError != null
          ? _buildLoadError()
          : _accessPoint == null
          ? _buildLoadError()
          : TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                _buildClientsTab(),
                _buildCapturesTab(),
                _buildVulnsTab(),
              ],
            ),
    );
  }

  Widget _buildLoadError() {
    return EmptyState(
      icon: Symbols.wifi_find,
      title: 'Access Point Unavailable',
      message: _friendlyError(_loadError),
      action: FilledButton.icon(
        onPressed: _loadData,
        icon: const Icon(Symbols.refresh),
        label: const Text('Retry'),
      ),
    );
  }

  Widget _buildOverviewTab() {
    final ap = _accessPoint!;
    final theme = Theme.of(context);
    final securityColor = _getSecurityColor(ap.security);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: securityColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      ap.security == SecurityProtocol.open
                          ? Symbols.wifi_off
                          : Symbols.wifi,
                      color: securityColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ap.ssid,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ap.bssid,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'JetBrainsMono',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SeverityBadge(
                              severity: _securityToSeverity(ap.security),
                            ),
                            const SizedBox(width: 8),
                            if (ap.wpsEnabled)
                              StatusBadge(
                                label: 'WPS Enabled',
                                color: Colors.orange,
                                icon: Symbols.key,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${ap.signalLevel} dBm',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _signalColor(ap.signalLevel),
                          fontFamily: 'JetBrainsMono',
                        ),
                      ),
                      Text(
                        'Channel ${ap.channel}',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Details Grid
          _DetailGrid(
            items: [
              _DetailItem(
                label: 'Frequency',
                value: '${ap.frequency} MHz',
                icon: Symbols.waves,
              ),
              _DetailItem(
                label: 'Channel',
                value: '${ap.channel} (${_getBand(ap.frequency)})',
                icon: Symbols.tv,
              ),
              _DetailItem(
                label: 'Security',
                value: ap.security.displayName,
                icon: Symbols.shield,
              ),
              _DetailItem(
                label: 'Beacon Interval',
                value: '${ap.beaconInterval} TU',
                icon: Symbols.schedule,
              ),
              _DetailItem(
                label: 'Capabilities',
                value:
                    '0x${ap.capabilityMask.toRadixString(16).padLeft(4, '0')}',
              ),
              _DetailItem(
                label: 'First Seen',
                value: DateFormat('MMM d, yyyy HH:mm:ss').format(ap.firstSeen),
                icon: Symbols.history,
              ),
              _DetailItem(
                label: 'Last Seen',
                value: DateFormat('MMM d, yyyy HH:mm:ss').format(ap.lastSeen),
                icon: Symbols.update,
              ),
              _DetailItem(
                label: 'Packets Captured',
                value: ap.packetCount.toString(),
                icon: Symbols.speed,
              ),
              _DetailItem(
                label: 'Associated Clients',
                value: ap.associatedClients.length.toString(),
                icon: Symbols.devices,
              ),
              if (ap.wpsManufacturer != null)
                _DetailItem(
                  label: 'WPS Manufacturer',
                  value: ap.wpsManufacturer!,
                  icon: Symbols.factory,
                ),
              if (ap.wpsModel != null)
                _DetailItem(
                  label: 'WPS Model',
                  value: ap.wpsModel!,
                  icon: Symbols.developer_board,
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Supported Protocols
          if (ap.supportedProtocols.isNotEmpty) ...[
            Text(
              'Supported Protocols',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: ap.supportedProtocols
                  .map(
                    (p) => Chip(
                      label: Text(p.displayName),
                      backgroundColor: _getSecurityColor(
                        p,
                      ).withValues(alpha: 0.15),
                      side: BorderSide(
                        color: _getSecurityColor(p).withValues(alpha: 0.5),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
          ],

          // Vendor IEs
          if (ap.vendorIEs.isNotEmpty) ...[
            Text(
              'Vendor Information Elements',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ...ap.vendorIEs.entries.map(
              (e) => ListTile(
                dense: true,
                leading: const Icon(Symbols.tag, size: 18),
                title: Text(e.key),
                subtitle: Text(e.value.toString()),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildClientsTab() {
    final clients = _accessPoint!.associatedClients;

    if (clients.isEmpty) {
      return EmptyState(
        icon: Symbols.devices_other,
        title: 'No Associated Clients',
        message: 'No clients currently associated with this access point',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: clients.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final client = clients[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _signalColor(
                client.signalLevel,
              ).withValues(alpha: 0.15),
              child: Icon(
                Symbols.devices_other,
                color: _signalColor(client.signalLevel),
              ),
            ),
            title: Text(
              client.macAddress,
              style: const TextStyle(fontFamily: 'JetBrainsMono'),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (client.vendor != null) Text('Vendor: ${client.vendor}'),
                if (client.hostname != null)
                  Text('Hostname: ${client.hostname}'),
                Text(
                  'Frames: ${client.dataFrames} • ${client.signalLevel} dBm',
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  client.firstSeen.toRelativeString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  client.lastSeen.toRelativeString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            onTap: () => _showClientDetails(client),
          ),
        );
      },
    );
  }

  Widget _buildCapturesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handshakes
          _CaptureSection(
            title: 'Handshake Captures (${_handshakes.length})',
            icon: Symbols.download,
            emptyMessage: 'No handshakes captured yet',
            items: _handshakes
                .map(
                  (h) => _CaptureListItem(
                    title: 'Handshake: ${h.type.name}',
                    subtitle:
                        'Frames: ${h.frameCount} • ${h.isComplete ? 'Complete' : 'Incomplete'}',
                    time: h.capturedAt,
                    onTap: () => _showHandshakeDetails(h),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),

          // PMKIDs
          _CaptureSection(
            title: 'PMKID Captures (${_pmkids.length})',
            icon: Symbols.fingerprint,
            emptyMessage: 'No PMKIDs captured yet',
            items: _pmkids
                .map(
                  (p) => _CaptureListItem(
                    title: 'PMKID Capture',
                    subtitle: 'PMKID: ${bytesToHex(p.pmkidData)}',
                    time: p.capturedAt,
                    onTap: () => _showPmkidDetails(p),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),

          // WPS Pins
          _CaptureSection(
            title: 'WPS PINs Recovered (${_wpsPins.length})',
            icon: Symbols.key,
            emptyMessage: 'No WPS PINs recovered',
            items: _wpsPins
                .map(
                  (w) => _CaptureListItem(
                    title: 'WPS PIN: ${w.pin}',
                    subtitle: 'Method: ${w.method.name}',
                    time: w.recoveredAt,
                    onTap: () => _showWpsDetails(w),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildVulnsTab() {
    if (_vulns.isEmpty) {
      return EmptyState(
        icon: Symbols.security,
        title: 'No Vulnerabilities Found',
        message: 'Run a vulnerability scan to identify security issues',
        action: FilledButton.icon(
          icon: const Icon(Symbols.play_arrow),
          label: const Text('Start Vuln Scan'),
          onPressed: () => _showMessage(
            'Vulnerability analysis runs automatically during a Wi-Fi scan.',
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _vulns.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final vuln = _vulns[index];
        return Card(
          child: ExpansionTile(
            leading: Icon(
              AppTheme.severityIcon(vuln.severity),
              color: AppTheme.severityColor(vuln.severity),
            ),
            title: Text(
              vuln.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: SeverityBadge(severity: vuln.severity),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vuln.description),
                    const SizedBox(height: 12),
                    Text(
                      'Recommendation',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(vuln.recommendation),
                    const SizedBox(height: 12),
                    if (vuln.cvssVector != null)
                      Text(
                        'CVSS: ${vuln.cvssVector!.vectorString} (${vuln.cvssVector!.baseScore})',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'JetBrainsMono',
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleAction(String action) {
    switch (action) {
      case 'test_wps':
        _testWps();
        break;
      case 'capture_handshake':
        _captureHandshake();
        break;
      case 'capture_pmkid':
        _capturePmkid();
        break;
      case 'deauth':
        _sendDeauth();
        break;
      case 'export':
        _exportData();
        break;
    }
  }

  Future<void> _testWps() async {
    if (!await _authorizeTechnique(
      'wps_testing',
      title: 'Approve WPS Test',
      message: 'Run the authorized WPS test against this access point?',
    )) {
      return;
    }
    final request = await _requestInterface(
      title: 'Test WPS',
      warning:
          'Run this test only against an access point covered by your authorization.',
    );
    if (request == null || _accessPoint == null) {
      return;
    }
    if (_assessmentId == null) {
      _showMessage('No assessment is linked to this capture.', isError: true);
      return;
    }
    await _runAction(() async {
      final result = await ref
          .read(wifiServiceProvider)
          .testWps(
            interface: request,
            bssid: _accessPoint!.bssid,
            channel: _accessPoint!.channel,
            assessmentId: _assessmentId!,
          );
      if (result == null) {
        _showMessage('WPS testing is unavailable on this device.');
      } else {
        setState(() => _wpsPins = [..._wpsPins, result]);
        _showMessage('WPS test completed.');
      }
    });
  }

  Future<void> _captureHandshake() async {
    if (!await _authorizeTechnique(
      'handshake_capture',
      title: 'Approve Handshake Capture',
      message: 'Capture authentication frames from this access point?',
    )) {
      return;
    }
    final interface = await _requestInterface(title: 'Capture Handshake');
    if (interface == null || _accessPoint == null) {
      return;
    }
    if (_assessmentId == null) {
      _showMessage('No assessment is linked to this capture.', isError: true);
      return;
    }
    await _runAction(() async {
      final result = await ref
          .read(wifiServiceProvider)
          .captureHandshake(
            interface: interface,
            bssid: _accessPoint!.bssid,
            channel: _accessPoint!.channel,
            assessmentId: _assessmentId!,
          );
      if (result == null) {
        _showMessage('Handshake capture is unavailable on this device.');
      } else {
        setState(() => _handshakes = [..._handshakes, result]);
        _showMessage('Handshake capture completed.');
      }
    });
  }

  Future<void> _capturePmkid() async {
    if (!await _authorizeTechnique(
      'pmkid',
      title: 'Approve PMKID Capture',
      message: 'Attempt an authorized PMKID capture on this access point?',
    )) {
      return;
    }
    final interface = await _requestInterface(title: 'Capture PMKID');
    if (interface == null || _accessPoint == null) {
      return;
    }
    if (_assessmentId == null) {
      _showMessage('No assessment is linked to this capture.', isError: true);
      return;
    }
    await _runAction(() async {
      final result = await ref
          .read(wifiServiceProvider)
          .capturePmkid(
            interface: interface,
            bssid: _accessPoint!.bssid,
            channel: _accessPoint!.channel,
            assessmentId: _assessmentId!,
          );
      if (result == null) {
        _showMessage('PMKID capture is unavailable on this device.');
      } else {
        setState(() => _pmkids = [..._pmkids, result]);
        _showMessage('PMKID capture completed.');
      }
    });
  }

  Future<void> _sendDeauth() async {
    final confirmed = await _authorizeTechnique(
      'deauthentication',
      title: 'Approve Deauthentication',
      message:
          'This disruptive action can disconnect clients. Send deauthentication frames now?',
      destructive: true,
    );

    if (confirmed && _accessPoint != null) {
      await _runAction(() async {
        final success = await ref
            .read(wifiServiceProvider)
            .sendDeauth(bssid: _accessPoint!.bssid);
        _showMessage(
          success
              ? 'Deauthentication frames sent.'
              : 'Deauthentication is unavailable on this device.',
        );
      });
    }
  }

  Future<bool> _authorizeTechnique(
    String techniqueId, {
    required String title,
    required String message,
    bool destructive = false,
  }) async {
    final assessmentId = _assessmentId;
    final accessPoint = _accessPoint;
    if (assessmentId == null || accessPoint == null) {
      _showMessage(
        'No assessment is linked to this access point.',
        isError: true,
      );
      return false;
    }

    final projectService = ref.read(projectServiceProvider);
    final assessment = await projectService.getAssessment(assessmentId);
    if (assessment == null) {
      _showMessage('The linked assessment could not be found.', isError: true);
      return false;
    }
    final project = await projectService.getProject(assessment.projectId);
    if (!mounted) return false;
    if (project == null) {
      _showMessage(
        'The authorization project could not be found.',
        isError: true,
      );
      return false;
    }

    final authorization = project.authorization;
    final now = DateTime.now();
    if (!authorization.isVerified ||
        now.isBefore(authorization.validFrom) ||
        now.isAfter(authorization.validUntil)) {
      _showMessage(
        'The project authorization is unverified or outside its validity period.',
        isError: true,
      );
      return false;
    }

    final excluded = assessment.scope.excludedTargets
        .map((value) => value.toLowerCase())
        .toSet();
    if (excluded.contains(accessPoint.bssid.toLowerCase()) ||
        excluded.contains(accessPoint.ssid.toLowerCase())) {
      _showMessage(
        'This access point is explicitly excluded from scope.',
        isError: true,
      );
      return false;
    }

    final targetBssids = assessment.scope.targetBssids
        .map((value) => value.toLowerCase())
        .toSet();
    final targetSsids = assessment.scope.targetSsids
        .map((value) => value.toLowerCase())
        .toSet();
    if ((targetBssids.isNotEmpty || targetSsids.isNotEmpty) &&
        !targetBssids.contains(accessPoint.bssid.toLowerCase()) &&
        !targetSsids.contains(accessPoint.ssid.toLowerCase())) {
      _showMessage(
        'This access point is outside the assessment scope.',
        isError: true,
      );
      return false;
    }

    TechniqueAuthorization? permission;
    for (final candidate in authorization.techniques) {
      if (candidate.techniqueId == techniqueId) {
        permission = candidate;
        break;
      }
    }
    if (permission == null || permission.action == TechniqueAction.deny) {
      _showMessage(
        'This technique is not authorized for the project.',
        isError: true,
      );
      return false;
    }
    if (permission.action == TechniqueAction.allow && !destructive) return true;

    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                style: destructive
                    ? FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                      )
                    : null,
                child: const Text('Approve'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> _exportData() async {
    final ap = _accessPoint;
    if (ap == null) return;
    final payload =
        '''SSID: ${ap.ssid}
BSSID: ${ap.bssid}
Channel: ${ap.channel}
Frequency: ${ap.frequency} MHz
Signal: ${ap.signalLevel} dBm
Security: ${ap.security.displayName}
WPS: ${ap.wpsEnabled ? 'Enabled' : 'Disabled'}
Clients: ${ap.associatedClients.length}
Handshakes: ${_handshakes.length}
PMKIDs: ${_pmkids.length}
WPS PINs: ${_wpsPins.length}
Vulnerabilities: ${_vulns.length}''';
    await Clipboard.setData(ClipboardData(text: payload));
    _showMessage('Access point data copied to the clipboard.');
  }

  void _showClientDetails(ClientDevice client) => _showDetails(
    title: client.hostname ?? client.macAddress,
    rows: {
      'MAC address': client.macAddress,
      'Vendor': client.vendor ?? 'Unknown',
      'Signal': '${client.signalLevel} dBm',
      'Data frames': '${client.dataFrames}',
      'First seen': DateFormat.yMMMd().add_Hms().format(client.firstSeen),
      'Last seen': DateFormat.yMMMd().add_Hms().format(client.lastSeen),
    },
  );

  void _showHandshakeDetails(HandshakeCapture capture) => _showDetails(
    title: 'Handshake Capture',
    rows: {
      'Type': capture.type.name,
      'BSSID': capture.bssid,
      'Frames': '${capture.frameCount}',
      'Status': capture.isComplete ? 'Complete' : 'Incomplete',
      'Captured': DateFormat.yMMMd().add_Hms().format(capture.capturedAt),
    },
  );

  void _showPmkidDetails(PmkidCapture capture) => _showDetails(
    title: 'PMKID Capture',
    rows: {
      'BSSID': capture.bssid,
      'PMKID': bytesToHex(capture.pmkidData),
      'Captured': DateFormat.yMMMd().add_Hms().format(capture.capturedAt),
    },
  );

  void _showWpsDetails(WpsPin pin) => _showDetails(
    title: 'Recovered WPS PIN',
    rows: {
      'PIN': pin.pin,
      'Method': pin.method.name,
      'Recovered': DateFormat.yMMMd().add_Hms().format(pin.recoveredAt),
    },
  );

  Future<String?> _requestInterface({
    required String title,
    String? warning,
  }) async {
    final controller = TextEditingController(text: 'wlan0');
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (warning != null) ...[Text(warning), const SizedBox(height: 16)],
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Wireless interface',
                hintText: 'wlan0',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final value = controller.text.trim();
              if (value.isNotEmpty) Navigator.pop(dialogContext, value);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
    controller.dispose();
    return result;
  }

  Future<void> _runAction(Future<void> Function() action) async {
    if (_actionInProgress) return;
    setState(() => _actionInProgress = true);
    try {
      await action();
    } catch (error) {
      _showMessage(_friendlyError(error), isError: true);
    } finally {
      if (mounted) setState(() => _actionInProgress = false);
    }
  }

  void _showDetails({
    required String title,
    required Map<String, String> rows,
  }) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: 420,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: rows.entries
                .map(
                  (entry) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(entry.key),
                    subtitle: SelectableText(entry.value),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showMessage(String message, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Theme.of(context).colorScheme.error : null,
      ),
    );
  }

  String _friendlyError(Object? error) {
    if (error == null) return 'The access point could not be loaded.';
    return error.toString().replaceFirst(
      RegExp(r'^(Exception|Bad state):\s*'),
      '',
    );
  }

  Color _getSecurityColor(SecurityProtocol protocol) {
    switch (protocol) {
      case SecurityProtocol.open:
        return Colors.red;
      case SecurityProtocol.wep:
        return Colors.deepOrange;
      case SecurityProtocol.wpa:
        return Colors.orange;
      case SecurityProtocol.wpa2:
        return Colors.blue;
      case SecurityProtocol.wpa3:
        return Colors.green;
      case SecurityProtocol.wpa2_wpa3:
        return Colors.teal;
      case SecurityProtocol.owe:
        return Colors.cyan;
      case SecurityProtocol.unknown:
        return Colors.grey;
    }
  }

  Severity _securityToSeverity(SecurityProtocol protocol) {
    switch (protocol) {
      case SecurityProtocol.open:
        return Severity.critical;
      case SecurityProtocol.wep:
        return Severity.high;
      case SecurityProtocol.wpa:
        return Severity.medium;
      case SecurityProtocol.wpa2:
        return Severity.low;
      case SecurityProtocol.wpa3:
        return Severity.info;
      case SecurityProtocol.wpa2_wpa3:
        return Severity.low;
      case SecurityProtocol.owe:
        return Severity.info;
      case SecurityProtocol.unknown:
        return Severity.medium;
    }
  }

  Color _signalColor(int signal) {
    if (signal >= -50) return Colors.green;
    if (signal >= -60) return Colors.lightGreen;
    if (signal >= -70) return Colors.yellow;
    if (signal >= -80) return Colors.orange;
    return Colors.red;
  }

  String _getBand(int freq) {
    if (freq >= 2412 && freq <= 2484) return '2.4 GHz';
    if (freq >= 5180 && freq <= 5825) return '5 GHz';
    if (freq >= 5955 && freq <= 7115) return '6 GHz';
    return 'Unknown';
  }

  String bytesToHex(List<int> bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(':');
}

class _DetailGrid extends StatelessWidget {
  final List<_DetailItem> items;

  const _DetailGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 2.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => _DetailCard(item: items[index]),
        );
      },
    );
  }
}

class _DetailItem {
  final String label;
  final String value;
  final IconData? icon;

  _DetailItem({required this.label, required this.value, this.icon});
}

class _DetailCard extends StatelessWidget {
  final _DetailItem item;

  const _DetailCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (item.icon != null) ...[
                  Icon(
                    item.icon,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              item.value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: item.value.contains(':') || item.value.contains('.')
                    ? 'JetBrainsMono'
                    : null,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _CaptureSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final String emptyMessage;
  final List<Widget> items;

  const _CaptureSection({
    required this.title,
    required this.icon,
    required this.emptyMessage,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (items.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  emptyMessage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          )
        else
          ...items,
      ],
    );
  }
}

class _CaptureListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime time;
  final VoidCallback onTap;

  const _CaptureListItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle),
        trailing: Text(
          time.toShortString(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
