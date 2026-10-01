// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessPointImpl _$$AccessPointImplFromJson(Map<String, dynamic> json) =>
    _$AccessPointImpl(
      id: json['id'] as String,
      bssid: json['bssid'] as String,
      ssid: json['ssid'] as String,
      frequency: (json['frequency'] as num).toInt(),
      channel: (json['channel'] as num).toInt(),
      signalLevel: (json['signalLevel'] as num).toInt(),
      noiseLevel: (json['noiseLevel'] as num).toInt(),
      security: $enumDecode(_$SecurityProtocolEnumMap, json['security']),
      supportedProtocols: (json['supportedProtocols'] as List<dynamic>)
          .map((e) => $enumDecode(_$SecurityProtocolEnumMap, e))
          .toList(),
      wpsEnabled: json['wpsEnabled'] as bool,
      wpsManufacturer: json['wpsManufacturer'] as String?,
      wpsModel: json['wpsModel'] as String?,
      beaconInterval: (json['beaconInterval'] as num).toInt(),
      capabilityMask: (json['capabilityMask'] as num).toInt(),
      firstSeen: DateTime.parse(json['firstSeen'] as String),
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      packetCount: (json['packetCount'] as num).toInt(),
      vendorIEs: json['vendorIEs'] as Map<String, dynamic>,
      associatedClients:
          (json['associatedClients'] as List<dynamic>?)
              ?.map((e) => ClientDevice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AccessPointImplToJson(_$AccessPointImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bssid': instance.bssid,
      'ssid': instance.ssid,
      'frequency': instance.frequency,
      'channel': instance.channel,
      'signalLevel': instance.signalLevel,
      'noiseLevel': instance.noiseLevel,
      'security': _$SecurityProtocolEnumMap[instance.security]!,
      'supportedProtocols': instance.supportedProtocols
          .map((e) => _$SecurityProtocolEnumMap[e]!)
          .toList(),
      'wpsEnabled': instance.wpsEnabled,
      'wpsManufacturer': instance.wpsManufacturer,
      'wpsModel': instance.wpsModel,
      'beaconInterval': instance.beaconInterval,
      'capabilityMask': instance.capabilityMask,
      'firstSeen': instance.firstSeen.toIso8601String(),
      'lastSeen': instance.lastSeen.toIso8601String(),
      'packetCount': instance.packetCount,
      'vendorIEs': instance.vendorIEs,
      'associatedClients': instance.associatedClients
          .map((e) => e.toJson())
          .toList(),
    };

const _$SecurityProtocolEnumMap = {
  SecurityProtocol.open: 'open',
  SecurityProtocol.wep: 'wep',
  SecurityProtocol.wpa: 'wpa',
  SecurityProtocol.wpa2: 'wpa2',
  SecurityProtocol.wpa3: 'wpa3',
  SecurityProtocol.wpa2_wpa3: 'wpa2_wpa3',
  SecurityProtocol.owe: 'owe',
  SecurityProtocol.unknown: 'unknown',
};

_$ClientDeviceImpl _$$ClientDeviceImplFromJson(Map<String, dynamic> json) =>
    _$ClientDeviceImpl(
      id: json['id'] as String,
      macAddress: json['macAddress'] as String,
      hostname: json['hostname'] as String?,
      vendor: json['vendor'] as String?,
      signalLevel: (json['signalLevel'] as num).toInt(),
      dataFrames: (json['dataFrames'] as num).toInt(),
      firstSeen: DateTime.parse(json['firstSeen'] as String),
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      associatedBssid: json['associatedBssid'] as String,
      probeRequests:
          (json['probeRequests'] as List<dynamic>?)
              ?.map((e) => ProbeRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ClientDeviceImplToJson(_$ClientDeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'macAddress': instance.macAddress,
      'hostname': instance.hostname,
      'vendor': instance.vendor,
      'signalLevel': instance.signalLevel,
      'dataFrames': instance.dataFrames,
      'firstSeen': instance.firstSeen.toIso8601String(),
      'lastSeen': instance.lastSeen.toIso8601String(),
      'associatedBssid': instance.associatedBssid,
      'probeRequests': instance.probeRequests.map((e) => e.toJson()).toList(),
    };

_$ProbeRequestImpl _$$ProbeRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProbeRequestImpl(
      ssid: json['ssid'] as String,
      signalLevel: (json['signalLevel'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ProbeRequestImplToJson(_$ProbeRequestImpl instance) =>
    <String, dynamic>{
      'ssid': instance.ssid,
      'signalLevel': instance.signalLevel,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$HandshakeCaptureImpl _$$HandshakeCaptureImplFromJson(
  Map<String, dynamic> json,
) => _$HandshakeCaptureImpl(
  id: json['id'] as String,
  accessPointId: json['accessPointId'] as String,
  bssid: json['bssid'] as String,
  ssid: json['ssid'] as String,
  type: $enumDecode(_$HandshakeTypeEnumMap, json['type']),
  eapolFrames: (json['eapolFrames'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  capturedAt: DateTime.parse(json['capturedAt'] as String),
  frameCount: (json['frameCount'] as num).toInt(),
  isComplete: json['isComplete'] as bool,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$HandshakeCaptureImplToJson(
  _$HandshakeCaptureImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'accessPointId': instance.accessPointId,
  'bssid': instance.bssid,
  'ssid': instance.ssid,
  'type': _$HandshakeTypeEnumMap[instance.type]!,
  'eapolFrames': instance.eapolFrames,
  'capturedAt': instance.capturedAt.toIso8601String(),
  'frameCount': instance.frameCount,
  'isComplete': instance.isComplete,
  'metadata': instance.metadata,
};

const _$HandshakeTypeEnumMap = {
  HandshakeType.wpa2_4way: 'wpa2_4way',
  HandshakeType.wpa3_sae: 'wpa3_sae',
  HandshakeType.pmkid: 'pmkid',
  HandshakeType.wps: 'wps',
};

_$PmkidCaptureImpl _$$PmkidCaptureImplFromJson(Map<String, dynamic> json) =>
    _$PmkidCaptureImpl(
      id: json['id'] as String,
      accessPointId: json['accessPointId'] as String,
      bssid: json['bssid'] as String,
      ssid: json['ssid'] as String,
      pmkidData: (json['pmkidData'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      capturedAt: DateTime.parse(json['capturedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$PmkidCaptureImplToJson(_$PmkidCaptureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessPointId': instance.accessPointId,
      'bssid': instance.bssid,
      'ssid': instance.ssid,
      'pmkidData': instance.pmkidData,
      'capturedAt': instance.capturedAt.toIso8601String(),
      'metadata': instance.metadata,
    };

_$WpsPinImpl _$$WpsPinImplFromJson(Map<String, dynamic> json) => _$WpsPinImpl(
  id: json['id'] as String,
  accessPointId: json['accessPointId'] as String,
  bssid: json['bssid'] as String,
  pin: json['pin'] as String,
  method: $enumDecode(_$WpsMethodEnumMap, json['method']),
  recoveredAt: DateTime.parse(json['recoveredAt'] as String),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$WpsPinImplToJson(_$WpsPinImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessPointId': instance.accessPointId,
      'bssid': instance.bssid,
      'pin': instance.pin,
      'method': _$WpsMethodEnumMap[instance.method]!,
      'recoveredAt': instance.recoveredAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$WpsMethodEnumMap = {
  WpsMethod.pixieDust: 'pixie_dust',
  WpsMethod.bruteForce: 'brute_force',
  WpsMethod.nullPin: 'null_pin',
};

_$ScanSessionImpl _$$ScanSessionImplFromJson(
  Map<String, dynamic> json,
) => _$ScanSessionImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  mode: $enumDecode(_$ScanModeEnumMap, json['mode']),
  status: $enumDecode(_$ScanStatusEnumMap, json['status']),
  startedAt: DateTime.parse(json['startedAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  config: ScanConfig.fromJson(json['config'] as Map<String, dynamic>),
  statistics: ScanStatistics.fromJson(
    json['statistics'] as Map<String, dynamic>,
  ),
  assessmentId: json['assessmentId'] as String?,
  accessPointIds:
      (json['accessPointIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  handshakeIds:
      (json['handshakeIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  pmkidIds:
      (json['pmkidIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  wpsPinIds:
      (json['wpsPinIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$ScanSessionImplToJson(_$ScanSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mode': _$ScanModeEnumMap[instance.mode]!,
      'status': _$ScanStatusEnumMap[instance.status]!,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'config': instance.config.toJson(),
      'statistics': instance.statistics.toJson(),
      'assessmentId': instance.assessmentId,
      'accessPointIds': instance.accessPointIds,
      'handshakeIds': instance.handshakeIds,
      'pmkidIds': instance.pmkidIds,
      'wpsPinIds': instance.wpsPinIds,
    };

const _$ScanModeEnumMap = {
  ScanMode.passive: 'passive',
  ScanMode.active: 'active',
  ScanMode.targeted: 'targeted',
};

const _$ScanStatusEnumMap = {
  ScanStatus.pending: 'pending',
  ScanStatus.running: 'running',
  ScanStatus.paused: 'paused',
  ScanStatus.completed: 'completed',
  ScanStatus.failed: 'failed',
  ScanStatus.cancelled: 'cancelled',
};

_$ScanConfigImpl _$$ScanConfigImplFromJson(Map<String, dynamic> json) =>
    _$ScanConfigImpl(
      enablePassiveScan: json['enablePassiveScan'] as bool? ?? true,
      enableActiveScan: json['enableActiveScan'] as bool? ?? false,
      enableDeauth: json['enableDeauth'] as bool? ?? false,
      enablePmkid: json['enablePmkid'] as bool? ?? false,
      enableWps: json['enableWps'] as bool? ?? false,
      targetBssids:
          (json['targetBssids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      targetChannels:
          (json['targetChannels'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      dwellTimeMs: (json['dwellTimeMs'] as num?)?.toInt() ?? 30,
      scanCycles: (json['scanCycles'] as num?)?.toInt() ?? 5,
      hopChannels: json['hopChannels'] as bool? ?? true,
      interface: json['interface'] as String? ?? '',
    );

Map<String, dynamic> _$$ScanConfigImplToJson(_$ScanConfigImpl instance) =>
    <String, dynamic>{
      'enablePassiveScan': instance.enablePassiveScan,
      'enableActiveScan': instance.enableActiveScan,
      'enableDeauth': instance.enableDeauth,
      'enablePmkid': instance.enablePmkid,
      'enableWps': instance.enableWps,
      'targetBssids': instance.targetBssids,
      'targetChannels': instance.targetChannels,
      'dwellTimeMs': instance.dwellTimeMs,
      'scanCycles': instance.scanCycles,
      'hopChannels': instance.hopChannels,
      'interface': instance.interface,
    };

_$ScanStatisticsImpl _$$ScanStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$ScanStatisticsImpl(
      totalPackets: (json['totalPackets'] as num?)?.toInt() ?? 0,
      beaconFrames: (json['beaconFrames'] as num?)?.toInt() ?? 0,
      probeRequests: (json['probeRequests'] as num?)?.toInt() ?? 0,
      probeResponses: (json['probeResponses'] as num?)?.toInt() ?? 0,
      authFrames: (json['authFrames'] as num?)?.toInt() ?? 0,
      assocFrames: (json['assocFrames'] as num?)?.toInt() ?? 0,
      deauthFrames: (json['deauthFrames'] as num?)?.toInt() ?? 0,
      eapolFrames: (json['eapolFrames'] as num?)?.toInt() ?? 0,
      uniqueAps: (json['uniqueAps'] as num?)?.toInt() ?? 0,
      uniqueClients: (json['uniqueClients'] as num?)?.toInt() ?? 0,
      handshakesCaptured: (json['handshakesCaptured'] as num?)?.toInt() ?? 0,
      pmkidsCaptured: (json['pmkidsCaptured'] as num?)?.toInt() ?? 0,
      wpsPinsRecovered: (json['wpsPinsRecovered'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ScanStatisticsImplToJson(
  _$ScanStatisticsImpl instance,
) => <String, dynamic>{
  'totalPackets': instance.totalPackets,
  'beaconFrames': instance.beaconFrames,
  'probeRequests': instance.probeRequests,
  'probeResponses': instance.probeResponses,
  'authFrames': instance.authFrames,
  'assocFrames': instance.assocFrames,
  'deauthFrames': instance.deauthFrames,
  'eapolFrames': instance.eapolFrames,
  'uniqueAps': instance.uniqueAps,
  'uniqueClients': instance.uniqueClients,
  'handshakesCaptured': instance.handshakesCaptured,
  'pmkidsCaptured': instance.pmkidsCaptured,
  'wpsPinsRecovered': instance.wpsPinsRecovered,
};

_$VulnerabilityFindingImpl _$$VulnerabilityFindingImplFromJson(
  Map<String, dynamic> json,
) => _$VulnerabilityFindingImpl(
  id: json['id'] as String,
  accessPointId: json['accessPointId'] as String,
  type: $enumDecode(_$VulnerabilityTypeEnumMap, json['type']),
  severity: $enumDecode(_$SeverityEnumMap, json['severity']),
  title: json['title'] as String,
  description: json['description'] as String,
  recommendation: json['recommendation'] as String,
  evidence: json['evidence'] as Map<String, dynamic>,
  discoveredAt: DateTime.parse(json['discoveredAt'] as String),
  cvssVector: json['cvssVector'] == null
      ? null
      : CvssVector.fromJson(json['cvssVector'] as Map<String, dynamic>),
  verified: json['verified'] as bool? ?? false,
);

Map<String, dynamic> _$$VulnerabilityFindingImplToJson(
  _$VulnerabilityFindingImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'accessPointId': instance.accessPointId,
  'type': _$VulnerabilityTypeEnumMap[instance.type]!,
  'severity': _$SeverityEnumMap[instance.severity]!,
  'title': instance.title,
  'description': instance.description,
  'recommendation': instance.recommendation,
  'evidence': instance.evidence,
  'discoveredAt': instance.discoveredAt.toIso8601String(),
  'cvssVector': instance.cvssVector?.toJson(),
  'verified': instance.verified,
};

const _$VulnerabilityTypeEnumMap = {
  VulnerabilityType.weakEncryption: 'weak_encryption',
  VulnerabilityType.wpsEnabled: 'wps_enabled',
  VulnerabilityType.pmkidVulnerable: 'pmkid_vulnerable',
  VulnerabilityType.defaultCredentials: 'default_credentials',
  VulnerabilityType.rogueAp: 'rogue_ap',
  VulnerabilityType.evilTwinPotential: 'evil_twin_potential',
  VulnerabilityType.weakWpsPin: 'weak_wps_pin',
  VulnerabilityType.outdatedFirmware: 'outdated_firmware',
  VulnerabilityType.insecureConfiguration: 'insecure_configuration',
};

const _$SeverityEnumMap = {
  Severity.critical: 'critical',
  Severity.high: 'high',
  Severity.medium: 'medium',
  Severity.low: 'low',
  Severity.info: 'info',
};

_$CvssVectorImpl _$$CvssVectorImplFromJson(Map<String, dynamic> json) =>
    _$CvssVectorImpl(
      vectorString: json['vectorString'] as String,
      baseScore: (json['baseScore'] as num).toDouble(),
      temporalScore: (json['temporalScore'] as num).toDouble(),
      environmentalScore: (json['environmentalScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$CvssVectorImplToJson(_$CvssVectorImpl instance) =>
    <String, dynamic>{
      'vectorString': instance.vectorString,
      'baseScore': instance.baseScore,
      'temporalScore': instance.temporalScore,
      'environmentalScore': instance.environmentalScore,
    };
