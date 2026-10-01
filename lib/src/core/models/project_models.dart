import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_models.freezed.dart';
part 'project_models.g.dart';

@freezed
sealed class Project with _$Project {
  const factory Project({
    required String id,
    required String name,
    required String description,
    required ProjectType type,
    required ProjectStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? startedAt,
    required DateTime? completedAt,
    required ClientInfo client,
    required ScopeDefinition scope,
    required Authorization authorization,
    required ProjectSettings settings,
    @Default([]) List<String> assessmentIds,
    @Default([]) List<String> teamMembers,
    @Default({}) Map<String, dynamic> metadata,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

enum ProjectType {
  @JsonValue('wifi_audit')
  wifiAudit,
  @JsonValue('network_pentest')
  networkPentest,
  @JsonValue('web_app_pentest')
  webAppPentest,
  @JsonValue('mobile_pentest')
  mobilePentest,
  @JsonValue('cloud_audit')
  cloudAudit,
  @JsonValue('red_team')
  redTeam,
  @JsonValue('compliance')
  compliance,
  @JsonValue('custom')
  custom,
}

enum ProjectStatus {
  @JsonValue('draft')
  draft,
  @JsonValue('planning')
  planning,
  @JsonValue('active')
  active,
  @JsonValue('on_hold')
  onHold,
  @JsonValue('completed')
  completed,
  @JsonValue('archived')
  archived,
}

@freezed
sealed class ClientInfo with _$ClientInfo {
  const factory ClientInfo({
    required String name,
    required String contactEmail,
    required String? contactPhone,
    required String? company,
    required String? address,
    @Default({}) Map<String, dynamic> customFields,
  }) = _ClientInfo;

  factory ClientInfo.fromJson(Map<String, dynamic> json) =>
      _$ClientInfoFromJson(json);
}

@freezed
sealed class ScopeDefinition with _$ScopeDefinition {
  const factory ScopeDefinition({
    @Default([]) List<String> targetNetworks,
    @Default([]) List<String> targetDomains,
    @Default([]) List<String> targetIps,
    @Default([]) List<String> targetSsids,
    @Default([]) List<String> excludedNetworks,
    @Default([]) List<String> excludedDomains,
    @Default(true) bool wirelessInScope,
    @Default(true) bool wiredInScope,
    @Default(false) bool socialEngineeringInScope,
    @Default(false) bool physicalInScope,
    @Default('') String notes,
  }) = _ScopeDefinition;

  factory ScopeDefinition.fromJson(Map<String, dynamic> json) =>
      _$ScopeDefinitionFromJson(json);
}

@freezed
sealed class Authorization with _$Authorization {
  const factory Authorization({
    required String documentId,
    required String signedBy,
    required DateTime signedAt,
    required DateTime validFrom,
    required DateTime validUntil,
    required List<TechniqueAuthorization> techniques,
    required DataHandlingPolicy dataPolicy,
    required String? legalEntityId,
    @Default('') String notes,
    @Default(false) bool isVerified,
  }) = _Authorization;

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);
}

@freezed
sealed class TechniqueAuthorization with _$TechniqueAuthorization {
  const factory TechniqueAuthorization({
    required String techniqueId,
    required TechniqueAction action,
    @Default('') String conditions,
  }) = _TechniqueAuthorization;

  factory TechniqueAuthorization.fromJson(Map<String, dynamic> json) =>
      _$TechniqueAuthorizationFromJson(json);
}

enum TechniqueAction {
  @JsonValue('allow')
  allow,
  @JsonValue('deny')
  deny,
  @JsonValue('require_approval')
  requireApproval,
}

@freezed
sealed class DataHandlingPolicy with _$DataHandlingPolicy {
  const factory DataHandlingPolicy({
    required int retentionDays,
    required bool encryptAtRest,
    required bool encryptInTransit,
    required bool autoDeleteEvidence,
    required List<String> allowedExportFormats,
    @Default('') String jurisdiction,
  }) = _DataHandlingPolicy;

  factory DataHandlingPolicy.fromJson(Map<String, dynamic> json) =>
      _$DataHandlingPolicyFromJson(json);
}

@freezed
sealed class ProjectSettings with _$ProjectSettings {
  const factory ProjectSettings({
    @Default(true) bool autoGenerateReports,
    @Default(ReportFormat.pdf) ReportFormat defaultReportFormat,
    @Default('en') String language,
    @Default('UTC') String timezone,
    @Default({}) Map<String, dynamic> pluginSettings,
    @Default([]) List<String> enabledPlugins,
    @Default({}) Map<String, dynamic> notificationSettings,
  }) = _ProjectSettings;

  factory ProjectSettings.fromJson(Map<String, dynamic> json) =>
      _$ProjectSettingsFromJson(json);
}

enum ReportFormat {
  @JsonValue('pdf')
  pdf,
  @JsonValue('html')
  html,
  @JsonValue('json')
  json,
  @JsonValue('markdown')
  markdown,
  @JsonValue('docx')
  docx,
}
