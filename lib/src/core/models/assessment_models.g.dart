// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentImpl _$$AssessmentImplFromJson(Map<String, dynamic> json) =>
    _$AssessmentImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$AssessmentTypeEnumMap, json['type']),
      status: $enumDecode(_$AssessmentStatusEnumMap, json['status']),
      scope: AssessmentScope.fromJson(json['scope'] as Map<String, dynamic>),
      config: AssessmentConfig.fromJson(json['config'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      pausedAt: json['pausedAt'] == null
          ? null
          : DateTime.parse(json['pausedAt'] as String),
      totalDuration: json['totalDuration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['totalDuration'] as num).toInt()),
      progress: json['progress'] == null
          ? const AssessmentProgress()
          : AssessmentProgress.fromJson(
              json['progress'] as Map<String, dynamic>,
            ),
      phases:
          (json['phases'] as List<dynamic>?)
              ?.map((e) => AssessmentPhase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      findingIds:
          (json['findingIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      evidenceIds:
          (json['evidenceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      assignedTo: json['assignedTo'] as String?,
      parentAssessmentId: json['parentAssessmentId'] as String?,
    );

Map<String, dynamic> _$$AssessmentImplToJson(_$AssessmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'type': _$AssessmentTypeEnumMap[instance.type]!,
      'status': _$AssessmentStatusEnumMap[instance.status]!,
      'scope': instance.scope.toJson(),
      'config': instance.config.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'pausedAt': instance.pausedAt?.toIso8601String(),
      'totalDuration': instance.totalDuration.inMicroseconds,
      'progress': instance.progress.toJson(),
      'phases': instance.phases.map((e) => e.toJson()).toList(),
      'findingIds': instance.findingIds,
      'evidenceIds': instance.evidenceIds,
      'metadata': instance.metadata,
      'assignedTo': instance.assignedTo,
      'parentAssessmentId': instance.parentAssessmentId,
    };

const _$AssessmentTypeEnumMap = {
  AssessmentType.wifiRecon: 'wifi_recon',
  AssessmentType.wifiVulnScan: 'wifi_vuln_scan',
  AssessmentType.wifiExploitation: 'wifi_exploitation',
  AssessmentType.networkDiscovery: 'network_discovery',
  AssessmentType.portScan: 'port_scan',
  AssessmentType.serviceEnum: 'service_enum',
  AssessmentType.vulnScan: 'vuln_scan',
  AssessmentType.webCrawl: 'web_crawl',
  AssessmentType.webVulnScan: 'web_vuln_scan',
  AssessmentType.apiTest: 'api_test',
  AssessmentType.credentialTest: 'credential_test',
  AssessmentType.postExploitation: 'post_exploitation',
  AssessmentType.custom: 'custom',
};

const _$AssessmentStatusEnumMap = {
  AssessmentStatus.draft: 'draft',
  AssessmentStatus.queued: 'queued',
  AssessmentStatus.initializing: 'initializing',
  AssessmentStatus.running: 'running',
  AssessmentStatus.paused: 'paused',
  AssessmentStatus.completed: 'completed',
  AssessmentStatus.failed: 'failed',
  AssessmentStatus.cancelled: 'cancelled',
  AssessmentStatus.archived: 'archived',
};

_$AssessmentScopeImpl _$$AssessmentScopeImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentScopeImpl(
  targetBssids:
      (json['targetBssids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  targetSsids:
      (json['targetSsids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  targetNetworks:
      (json['targetNetworks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  targetDomains:
      (json['targetDomains'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  targetUrls:
      (json['targetUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  targetIps:
      (json['targetIps'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  targetPorts:
      (json['targetPorts'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  excludedTargets:
      (json['excludedTargets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  includeWireless: json['includeWireless'] as bool? ?? true,
  includeWired: json['includeWired'] as bool? ?? false,
  includeBluetooth: json['includeBluetooth'] as bool? ?? false,
  notes: json['notes'] as String? ?? '',
);

Map<String, dynamic> _$$AssessmentScopeImplToJson(
  _$AssessmentScopeImpl instance,
) => <String, dynamic>{
  'targetBssids': instance.targetBssids,
  'targetSsids': instance.targetSsids,
  'targetNetworks': instance.targetNetworks,
  'targetDomains': instance.targetDomains,
  'targetUrls': instance.targetUrls,
  'targetIps': instance.targetIps,
  'targetPorts': instance.targetPorts,
  'excludedTargets': instance.excludedTargets,
  'includeWireless': instance.includeWireless,
  'includeWired': instance.includeWired,
  'includeBluetooth': instance.includeBluetooth,
  'notes': instance.notes,
};

_$AssessmentConfigImpl _$$AssessmentConfigImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentConfigImpl(
  pluginConfigs: json['pluginConfigs'] as Map<String, dynamic>? ?? const {},
  maxConcurrentTasks: (json['maxConcurrentTasks'] as num?)?.toInt() ?? 5,
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt() ?? 3600,
  continueOnError: json['continueOnError'] as bool? ?? true,
  captureEvidence: json['captureEvidence'] as bool? ?? true,
  realTimeUpdates: json['realTimeUpdates'] as bool? ?? true,
  logLevel:
      $enumDecodeNullable(_$LogLevelEnumMap, json['logLevel']) ?? LogLevel.info,
  customParams: json['customParams'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$$AssessmentConfigImplToJson(
  _$AssessmentConfigImpl instance,
) => <String, dynamic>{
  'pluginConfigs': instance.pluginConfigs,
  'maxConcurrentTasks': instance.maxConcurrentTasks,
  'timeoutSeconds': instance.timeoutSeconds,
  'continueOnError': instance.continueOnError,
  'captureEvidence': instance.captureEvidence,
  'realTimeUpdates': instance.realTimeUpdates,
  'logLevel': _$LogLevelEnumMap[instance.logLevel]!,
  'customParams': instance.customParams,
};

const _$LogLevelEnumMap = {
  LogLevel.debug: 'debug',
  LogLevel.info: 'info',
  LogLevel.warning: 'warning',
  LogLevel.error: 'error',
};

_$AssessmentProgressImpl _$$AssessmentProgressImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentProgressImpl(
  overall: (json['overall'] as num?)?.toDouble() ?? 0.0,
  completedTasks: (json['completedTasks'] as num?)?.toInt() ?? 0,
  totalTasks: (json['totalTasks'] as num?)?.toInt() ?? 0,
  currentPhaseIndex: (json['currentPhaseIndex'] as num?)?.toInt() ?? 0,
  phaseProgress:
      (json['phaseProgress'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ) ??
      const {},
  tasksCompleted:
      (json['tasksCompleted'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
  tasksTotal:
      (json['tasksTotal'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
);

Map<String, dynamic> _$$AssessmentProgressImplToJson(
  _$AssessmentProgressImpl instance,
) => <String, dynamic>{
  'overall': instance.overall,
  'completedTasks': instance.completedTasks,
  'totalTasks': instance.totalTasks,
  'currentPhaseIndex': instance.currentPhaseIndex,
  'phaseProgress': instance.phaseProgress,
  'tasksCompleted': instance.tasksCompleted,
  'tasksTotal': instance.tasksTotal,
};

_$AssessmentPhaseImpl _$$AssessmentPhaseImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentPhaseImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  status: $enumDecode(_$PhaseStatusEnumMap, json['status']),
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  tasks:
      (json['tasks'] as List<dynamic>?)
          ?.map((e) => AssessmentTask.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  output: json['output'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$$AssessmentPhaseImplToJson(
  _$AssessmentPhaseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'status': _$PhaseStatusEnumMap[instance.status]!,
  'startedAt': instance.startedAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'tasks': instance.tasks.map((e) => e.toJson()).toList(),
  'output': instance.output,
};

const _$PhaseStatusEnumMap = {
  PhaseStatus.pending: 'pending',
  PhaseStatus.running: 'running',
  PhaseStatus.completed: 'completed',
  PhaseStatus.failed: 'failed',
  PhaseStatus.skipped: 'skipped',
};

_$AssessmentTaskImpl _$$AssessmentTaskImplFromJson(Map<String, dynamic> json) =>
    _$AssessmentTaskImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      pluginId: json['pluginId'] as String,
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      input: json['input'] as Map<String, dynamic>? ?? const {},
      output: json['output'] as Map<String, dynamic>? ?? const {},
      evidenceIds:
          (json['evidenceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      findingIds:
          (json['findingIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      duration: json['duration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$AssessmentTaskImplToJson(
  _$AssessmentTaskImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'pluginId': instance.pluginId,
  'status': _$TaskStatusEnumMap[instance.status]!,
  'startedAt': instance.startedAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'input': instance.input,
  'output': instance.output,
  'evidenceIds': instance.evidenceIds,
  'findingIds': instance.findingIds,
  'errorMessage': instance.errorMessage,
  'retryCount': instance.retryCount,
  'duration': instance.duration.inMicroseconds,
};

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.running: 'running',
  TaskStatus.completed: 'completed',
  TaskStatus.failed: 'failed',
  TaskStatus.cancelled: 'cancelled',
  TaskStatus.retrying: 'retrying',
};

_$AssessmentEventImpl _$$AssessmentEventImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentEventImpl(
  id: json['id'] as String,
  assessmentId: json['assessmentId'] as String,
  type: $enumDecode(_$EventTypeEnumMap, json['type']),
  timestamp: DateTime.parse(json['timestamp'] as String),
  message: json['message'] as String,
  data: json['data'] as Map<String, dynamic>? ?? const {},
  level: $enumDecodeNullable(_$LogLevelEnumMap, json['level']) ?? LogLevel.info,
  phaseId: json['phaseId'] as String?,
  taskId: json['taskId'] as String?,
);

Map<String, dynamic> _$$AssessmentEventImplToJson(
  _$AssessmentEventImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'assessmentId': instance.assessmentId,
  'type': _$EventTypeEnumMap[instance.type]!,
  'timestamp': instance.timestamp.toIso8601String(),
  'message': instance.message,
  'data': instance.data,
  'level': _$LogLevelEnumMap[instance.level]!,
  'phaseId': instance.phaseId,
  'taskId': instance.taskId,
};

const _$EventTypeEnumMap = {
  EventType.assessmentStarted: 'assessment_started',
  EventType.assessmentCompleted: 'assessment_completed',
  EventType.assessmentFailed: 'assessment_failed',
  EventType.assessmentPaused: 'assessment_paused',
  EventType.assessmentResumed: 'assessment_resumed',
  EventType.phaseStarted: 'phase_started',
  EventType.phaseCompleted: 'phase_completed',
  EventType.taskStarted: 'task_started',
  EventType.taskCompleted: 'task_completed',
  EventType.taskFailed: 'task_failed',
  EventType.findingDiscovered: 'finding_discovered',
  EventType.evidenceCaptured: 'evidence_captured',
  EventType.log: 'log',
  EventType.progressUpdate: 'progress_update',
  EventType.error: 'error',
};

_$EvidenceImpl _$$EvidenceImplFromJson(Map<String, dynamic> json) =>
    _$EvidenceImpl(
      id: json['id'] as String,
      assessmentId: json['assessmentId'] as String,
      type: $enumDecode(_$EvidenceTypeEnumMap, json['type']),
      name: json['name'] as String,
      description: json['description'] as String,
      filePath: json['filePath'] as String,
      hashSha256: json['hashSha256'] as String,
      sizeBytes: (json['sizeBytes'] as num).toInt(),
      capturedAt: DateTime.parse(json['capturedAt'] as String),
      capturedBy: json['capturedBy'] as String,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      isEncrypted: json['isEncrypted'] as bool? ?? false,
      encryptionKeyId: json['encryptionKeyId'] as String?,
    );

Map<String, dynamic> _$$EvidenceImplToJson(_$EvidenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assessmentId': instance.assessmentId,
      'type': _$EvidenceTypeEnumMap[instance.type]!,
      'name': instance.name,
      'description': instance.description,
      'filePath': instance.filePath,
      'hashSha256': instance.hashSha256,
      'sizeBytes': instance.sizeBytes,
      'capturedAt': instance.capturedAt.toIso8601String(),
      'capturedBy': instance.capturedBy,
      'metadata': instance.metadata,
      'tags': instance.tags,
      'isEncrypted': instance.isEncrypted,
      'encryptionKeyId': instance.encryptionKeyId,
    };

const _$EvidenceTypeEnumMap = {
  EvidenceType.pcap: 'pcap',
  EvidenceType.handshake: 'handshake',
  EvidenceType.pmkid: 'pmkid',
  EvidenceType.wpsPin: 'wps_pin',
  EvidenceType.screenshot: 'screenshot',
  EvidenceType.log: 'log',
  EvidenceType.config: 'config',
  EvidenceType.output: 'output',
  EvidenceType.hash: 'hash',
  EvidenceType.other: 'other',
};

_$FindingImpl _$$FindingImplFromJson(Map<String, dynamic> json) =>
    _$FindingImpl(
      id: json['id'] as String,
      assessmentId: json['assessmentId'] as String,
      type: $enumDecode(_$FindingTypeEnumMap, json['type']),
      severity: $enumDecode(_$SeverityEnumMap, json['severity']),
      title: json['title'] as String,
      description: json['description'] as String,
      recommendation: json['recommendation'] as String,
      affectedTarget: json['affectedTarget'] as String,
      evidence: json['evidence'] as Map<String, dynamic>? ?? const {},
      evidenceIds:
          (json['evidenceIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cvss: CvssVector.fromJson(json['cvss'] as Map<String, dynamic>),
      discoveredAt: DateTime.parse(json['discoveredAt'] as String),
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      verified: json['verified'] as bool? ?? false,
      falsePositive: json['falsePositive'] as bool? ?? false,
      references: json['references'] as String? ?? '',
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$FindingImplToJson(_$FindingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assessmentId': instance.assessmentId,
      'type': _$FindingTypeEnumMap[instance.type]!,
      'severity': _$SeverityEnumMap[instance.severity]!,
      'title': instance.title,
      'description': instance.description,
      'recommendation': instance.recommendation,
      'affectedTarget': instance.affectedTarget,
      'evidence': instance.evidence,
      'evidenceIds': instance.evidenceIds,
      'cvss': instance.cvss.toJson(),
      'discoveredAt': instance.discoveredAt.toIso8601String(),
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'verified': instance.verified,
      'falsePositive': instance.falsePositive,
      'references': instance.references,
      'metadata': instance.metadata,
    };

const _$FindingTypeEnumMap = {
  FindingType.vulnerability: 'vulnerability',
  FindingType.misconfiguration: 'misconfiguration',
  FindingType.weakCredential: 'weak_credential',
  FindingType.exposedService: 'exposed_service',
  FindingType.informationDisclosure: 'information_disclosure',
  FindingType.complianceViolation: 'compliance_violation',
  FindingType.anomaly: 'anomaly',
};

const _$SeverityEnumMap = {
  Severity.critical: 'critical',
  Severity.high: 'high',
  Severity.medium: 'medium',
  Severity.low: 'low',
  Severity.info: 'info',
};
