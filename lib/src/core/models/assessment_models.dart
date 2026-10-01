import 'package:freezed_annotation/freezed_annotation.dart';
import 'wifi_models.dart';

part 'assessment_models.freezed.dart';
part 'assessment_models.g.dart';

@freezed
sealed class Assessment with _$Assessment {
  const factory Assessment({
    required String id,
    required String projectId,
    required String name,
    required AssessmentType type,
    required AssessmentStatus status,
    required AssessmentScope scope,
    required AssessmentConfig config,
    required DateTime createdAt,
    required DateTime? startedAt,
    required DateTime? completedAt,
    required DateTime? pausedAt,
    @Default(Duration.zero) Duration totalDuration,
    @Default(AssessmentProgress()) AssessmentProgress progress,
    @Default([]) List<AssessmentPhase> phases,
    @Default([]) List<String> findingIds,
    @Default([]) List<String> evidenceIds,
    @Default({}) Map<String, dynamic> metadata,
    String? assignedTo,
    String? parentAssessmentId,
  }) = _Assessment;

  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);
}

enum AssessmentType {
  @JsonValue('wifi_recon')
  wifiRecon,
  @JsonValue('wifi_vuln_scan')
  wifiVulnScan,
  @JsonValue('wifi_exploitation')
  wifiExploitation,
  @JsonValue('network_discovery')
  networkDiscovery,
  @JsonValue('port_scan')
  portScan,
  @JsonValue('service_enum')
  serviceEnum,
  @JsonValue('vuln_scan')
  vulnScan,
  @JsonValue('web_crawl')
  webCrawl,
  @JsonValue('web_vuln_scan')
  webVulnScan,
  @JsonValue('api_test')
  apiTest,
  @JsonValue('credential_test')
  credentialTest,
  @JsonValue('post_exploitation')
  postExploitation,
  @JsonValue('custom')
  custom,
}

enum AssessmentStatus {
  @JsonValue('draft')
  draft,
  @JsonValue('queued')
  queued,
  @JsonValue('initializing')
  initializing,
  @JsonValue('running')
  running,
  @JsonValue('paused')
  paused,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('archived')
  archived,
}

@freezed
sealed class AssessmentScope with _$AssessmentScope {
  const factory AssessmentScope({
    @Default([]) List<String> targetBssids,
    @Default([]) List<String> targetSsids,
    @Default([]) List<String> targetNetworks,
    @Default([]) List<String> targetDomains,
    @Default([]) List<String> targetUrls,
    @Default([]) List<String> targetIps,
    @Default([]) List<int> targetPorts,
    @Default([]) List<String> excludedTargets,
    @Default(true) bool includeWireless,
    @Default(false) bool includeWired,
    @Default(false) bool includeBluetooth,
    @Default('') String notes,
  }) = _AssessmentScope;

  factory AssessmentScope.fromJson(Map<String, dynamic> json) =>
      _$AssessmentScopeFromJson(json);
}

@freezed
sealed class AssessmentConfig with _$AssessmentConfig {
  const factory AssessmentConfig({
    @Default({}) Map<String, dynamic> pluginConfigs,
    @Default(5) int maxConcurrentTasks,
    @Default(3600) int timeoutSeconds,
    @Default(true) bool continueOnError,
    @Default(true) bool captureEvidence,
    @Default(true) bool realTimeUpdates,
    @Default(LogLevel.info) LogLevel logLevel,
    @Default({}) Map<String, dynamic> customParams,
  }) = _AssessmentConfig;

  factory AssessmentConfig.fromJson(Map<String, dynamic> json) =>
      _$AssessmentConfigFromJson(json);
}

enum LogLevel {
  @JsonValue('debug')
  debug,
  @JsonValue('info')
  info,
  @JsonValue('warning')
  warning,
  @JsonValue('error')
  error,
}

@freezed
sealed class AssessmentProgress with _$AssessmentProgress {
  const factory AssessmentProgress({
    @Default(0.0) double overall,
    @Default(0) int completedTasks,
    @Default(0) int totalTasks,
    @Default(0) int currentPhaseIndex,
    @Default({}) Map<String, double> phaseProgress,
    @Default({}) Map<String, int> tasksCompleted,
    @Default({}) Map<String, int> tasksTotal,
  }) = _AssessmentProgress;

  factory AssessmentProgress.fromJson(Map<String, dynamic> json) =>
      _$AssessmentProgressFromJson(json);
}

@freezed
sealed class AssessmentPhase with _$AssessmentPhase {
  const factory AssessmentPhase({
    required String id,
    required String name,
    required String description,
    required PhaseStatus status,
    required DateTime? startedAt,
    required DateTime? completedAt,
    @Default([]) List<AssessmentTask> tasks,
    @Default({}) Map<String, dynamic> output,
  }) = _AssessmentPhase;

  factory AssessmentPhase.fromJson(Map<String, dynamic> json) =>
      _$AssessmentPhaseFromJson(json);
}

enum PhaseStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('running')
  running,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('skipped')
  skipped,
}

@freezed
sealed class AssessmentTask with _$AssessmentTask {
  const factory AssessmentTask({
    required String id,
    required String name,
    required String pluginId,
    required TaskStatus status,
    required DateTime? startedAt,
    required DateTime? completedAt,
    @Default({}) Map<String, dynamic> input,
    @Default({}) Map<String, dynamic> output,
    @Default([]) List<String> evidenceIds,
    @Default([]) List<String> findingIds,
    String? errorMessage,
    @Default(0) int retryCount,
    @Default(Duration.zero) Duration duration,
  }) = _AssessmentTask;

  factory AssessmentTask.fromJson(Map<String, dynamic> json) =>
      _$AssessmentTaskFromJson(json);
}

enum TaskStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('running')
  running,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('retrying')
  retrying,
}

@freezed
sealed class AssessmentEvent with _$AssessmentEvent {
  const factory AssessmentEvent({
    required String id,
    required String assessmentId,
    required EventType type,
    required DateTime timestamp,
    required String message,
    @Default({}) Map<String, dynamic> data,
    @Default(LogLevel.info) LogLevel level,
    String? phaseId,
    String? taskId,
  }) = _AssessmentEvent;

  factory AssessmentEvent.fromJson(Map<String, dynamic> json) =>
      _$AssessmentEventFromJson(json);
}

enum EventType {
  @JsonValue('assessment_started')
  assessmentStarted,
  @JsonValue('assessment_completed')
  assessmentCompleted,
  @JsonValue('assessment_failed')
  assessmentFailed,
  @JsonValue('assessment_paused')
  assessmentPaused,
  @JsonValue('assessment_resumed')
  assessmentResumed,
  @JsonValue('phase_started')
  phaseStarted,
  @JsonValue('phase_completed')
  phaseCompleted,
  @JsonValue('task_started')
  taskStarted,
  @JsonValue('task_completed')
  taskCompleted,
  @JsonValue('task_failed')
  taskFailed,
  @JsonValue('finding_discovered')
  findingDiscovered,
  @JsonValue('evidence_captured')
  evidenceCaptured,
  @JsonValue('log')
  log,
  @JsonValue('progress_update')
  progressUpdate,
  @JsonValue('error')
  error,
}

@freezed
sealed class Evidence with _$Evidence {
  const factory Evidence({
    required String id,
    required String assessmentId,
    required EvidenceType type,
    required String name,
    required String description,
    required String filePath,
    required String hashSha256,
    required int sizeBytes,
    required DateTime capturedAt,
    required String capturedBy,
    @Default({}) Map<String, dynamic> metadata,
    @Default([]) List<String> tags,
    @Default(false) bool isEncrypted,
    String? encryptionKeyId,
  }) = _Evidence;

  factory Evidence.fromJson(Map<String, dynamic> json) =>
      _$EvidenceFromJson(json);
}

enum EvidenceType {
  @JsonValue('pcap')
  pcap,
  @JsonValue('handshake')
  handshake,
  @JsonValue('pmkid')
  pmkid,
  @JsonValue('wps_pin')
  wpsPin,
  @JsonValue('screenshot')
  screenshot,
  @JsonValue('log')
  log,
  @JsonValue('config')
  config,
  @JsonValue('output')
  output,
  @JsonValue('hash')
  hash,
  @JsonValue('other')
  other,
}

@freezed
sealed class Finding with _$Finding {
  const factory Finding({
    required String id,
    required String assessmentId,
    required FindingType type,
    required Severity severity,
    required String title,
    required String description,
    required String recommendation,
    required String affectedTarget,
    @Default({}) Map<String, dynamic> evidence,
    @Default([]) List<String> evidenceIds,
    required CvssVector cvss,
    required DateTime discoveredAt,
    required DateTime? verifiedAt,
    @Default(false) bool verified,
    @Default(false) bool falsePositive,
    @Default('') String references,
    @Default({}) Map<String, dynamic> metadata,
  }) = _Finding;

  factory Finding.fromJson(Map<String, dynamic> json) =>
      _$FindingFromJson(json);
}

enum FindingType {
  @JsonValue('vulnerability')
  vulnerability,
  @JsonValue('misconfiguration')
  misconfiguration,
  @JsonValue('weak_credential')
  weakCredential,
  @JsonValue('exposed_service')
  exposedService,
  @JsonValue('information_disclosure')
  informationDisclosure,
  @JsonValue('compliance_violation')
  complianceViolation,
  @JsonValue('anomaly')
  anomaly,
}
