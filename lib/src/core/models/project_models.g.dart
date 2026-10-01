// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ProjectTypeEnumMap, json['type']),
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      client: ClientInfo.fromJson(json['client'] as Map<String, dynamic>),
      scope: ScopeDefinition.fromJson(json['scope'] as Map<String, dynamic>),
      authorization: Authorization.fromJson(
        json['authorization'] as Map<String, dynamic>,
      ),
      settings: ProjectSettings.fromJson(
        json['settings'] as Map<String, dynamic>,
      ),
      assessmentIds:
          (json['assessmentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      teamMembers:
          (json['teamMembers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$ProjectTypeEnumMap[instance.type]!,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'client': instance.client.toJson(),
      'scope': instance.scope.toJson(),
      'authorization': instance.authorization.toJson(),
      'settings': instance.settings.toJson(),
      'assessmentIds': instance.assessmentIds,
      'teamMembers': instance.teamMembers,
      'metadata': instance.metadata,
    };

const _$ProjectTypeEnumMap = {
  ProjectType.wifiAudit: 'wifi_audit',
  ProjectType.networkPentest: 'network_pentest',
  ProjectType.webAppPentest: 'web_app_pentest',
  ProjectType.mobilePentest: 'mobile_pentest',
  ProjectType.cloudAudit: 'cloud_audit',
  ProjectType.redTeam: 'red_team',
  ProjectType.compliance: 'compliance',
  ProjectType.custom: 'custom',
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.draft: 'draft',
  ProjectStatus.planning: 'planning',
  ProjectStatus.active: 'active',
  ProjectStatus.onHold: 'on_hold',
  ProjectStatus.completed: 'completed',
  ProjectStatus.archived: 'archived',
};

_$ClientInfoImpl _$$ClientInfoImplFromJson(Map<String, dynamic> json) =>
    _$ClientInfoImpl(
      name: json['name'] as String,
      contactEmail: json['contactEmail'] as String,
      contactPhone: json['contactPhone'] as String?,
      company: json['company'] as String?,
      address: json['address'] as String?,
      customFields: json['customFields'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ClientInfoImplToJson(_$ClientInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'company': instance.company,
      'address': instance.address,
      'customFields': instance.customFields,
    };

_$ScopeDefinitionImpl _$$ScopeDefinitionImplFromJson(
  Map<String, dynamic> json,
) => _$ScopeDefinitionImpl(
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
  targetIps:
      (json['targetIps'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  targetSsids:
      (json['targetSsids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  excludedNetworks:
      (json['excludedNetworks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  excludedDomains:
      (json['excludedDomains'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  wirelessInScope: json['wirelessInScope'] as bool? ?? true,
  wiredInScope: json['wiredInScope'] as bool? ?? true,
  socialEngineeringInScope: json['socialEngineeringInScope'] as bool? ?? false,
  physicalInScope: json['physicalInScope'] as bool? ?? false,
  notes: json['notes'] as String? ?? '',
);

Map<String, dynamic> _$$ScopeDefinitionImplToJson(
  _$ScopeDefinitionImpl instance,
) => <String, dynamic>{
  'targetNetworks': instance.targetNetworks,
  'targetDomains': instance.targetDomains,
  'targetIps': instance.targetIps,
  'targetSsids': instance.targetSsids,
  'excludedNetworks': instance.excludedNetworks,
  'excludedDomains': instance.excludedDomains,
  'wirelessInScope': instance.wirelessInScope,
  'wiredInScope': instance.wiredInScope,
  'socialEngineeringInScope': instance.socialEngineeringInScope,
  'physicalInScope': instance.physicalInScope,
  'notes': instance.notes,
};

_$AuthorizationImpl _$$AuthorizationImplFromJson(Map<String, dynamic> json) =>
    _$AuthorizationImpl(
      documentId: json['documentId'] as String,
      signedBy: json['signedBy'] as String,
      signedAt: DateTime.parse(json['signedAt'] as String),
      validFrom: DateTime.parse(json['validFrom'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
      techniques: (json['techniques'] as List<dynamic>)
          .map(
            (e) => TechniqueAuthorization.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      dataPolicy: DataHandlingPolicy.fromJson(
        json['dataPolicy'] as Map<String, dynamic>,
      ),
      legalEntityId: json['legalEntityId'] as String?,
      notes: json['notes'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthorizationImplToJson(_$AuthorizationImpl instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'signedBy': instance.signedBy,
      'signedAt': instance.signedAt.toIso8601String(),
      'validFrom': instance.validFrom.toIso8601String(),
      'validUntil': instance.validUntil.toIso8601String(),
      'techniques': instance.techniques.map((e) => e.toJson()).toList(),
      'dataPolicy': instance.dataPolicy.toJson(),
      'legalEntityId': instance.legalEntityId,
      'notes': instance.notes,
      'isVerified': instance.isVerified,
    };

_$TechniqueAuthorizationImpl _$$TechniqueAuthorizationImplFromJson(
  Map<String, dynamic> json,
) => _$TechniqueAuthorizationImpl(
  techniqueId: json['techniqueId'] as String,
  action: $enumDecode(_$TechniqueActionEnumMap, json['action']),
  conditions: json['conditions'] as String? ?? '',
);

Map<String, dynamic> _$$TechniqueAuthorizationImplToJson(
  _$TechniqueAuthorizationImpl instance,
) => <String, dynamic>{
  'techniqueId': instance.techniqueId,
  'action': _$TechniqueActionEnumMap[instance.action]!,
  'conditions': instance.conditions,
};

const _$TechniqueActionEnumMap = {
  TechniqueAction.allow: 'allow',
  TechniqueAction.deny: 'deny',
  TechniqueAction.requireApproval: 'require_approval',
};

_$DataHandlingPolicyImpl _$$DataHandlingPolicyImplFromJson(
  Map<String, dynamic> json,
) => _$DataHandlingPolicyImpl(
  retentionDays: (json['retentionDays'] as num).toInt(),
  encryptAtRest: json['encryptAtRest'] as bool,
  encryptInTransit: json['encryptInTransit'] as bool,
  autoDeleteEvidence: json['autoDeleteEvidence'] as bool,
  allowedExportFormats: (json['allowedExportFormats'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  jurisdiction: json['jurisdiction'] as String? ?? '',
);

Map<String, dynamic> _$$DataHandlingPolicyImplToJson(
  _$DataHandlingPolicyImpl instance,
) => <String, dynamic>{
  'retentionDays': instance.retentionDays,
  'encryptAtRest': instance.encryptAtRest,
  'encryptInTransit': instance.encryptInTransit,
  'autoDeleteEvidence': instance.autoDeleteEvidence,
  'allowedExportFormats': instance.allowedExportFormats,
  'jurisdiction': instance.jurisdiction,
};

_$ProjectSettingsImpl _$$ProjectSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectSettingsImpl(
  autoGenerateReports: json['autoGenerateReports'] as bool? ?? true,
  defaultReportFormat:
      $enumDecodeNullable(_$ReportFormatEnumMap, json['defaultReportFormat']) ??
      ReportFormat.pdf,
  language: json['language'] as String? ?? 'en',
  timezone: json['timezone'] as String? ?? 'UTC',
  pluginSettings: json['pluginSettings'] as Map<String, dynamic>? ?? const {},
  enabledPlugins:
      (json['enabledPlugins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  notificationSettings:
      json['notificationSettings'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$$ProjectSettingsImplToJson(
  _$ProjectSettingsImpl instance,
) => <String, dynamic>{
  'autoGenerateReports': instance.autoGenerateReports,
  'defaultReportFormat': _$ReportFormatEnumMap[instance.defaultReportFormat]!,
  'language': instance.language,
  'timezone': instance.timezone,
  'pluginSettings': instance.pluginSettings,
  'enabledPlugins': instance.enabledPlugins,
  'notificationSettings': instance.notificationSettings,
};

const _$ReportFormatEnumMap = {
  ReportFormat.pdf: 'pdf',
  ReportFormat.html: 'html',
  ReportFormat.json: 'json',
  ReportFormat.markdown: 'markdown',
  ReportFormat.docx: 'docx',
};
