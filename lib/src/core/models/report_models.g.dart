// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  assessmentId: json['assessmentId'] as String,
  title: json['title'] as String,
  type: $enumDecode(_$ReportTypeEnumMap, json['type']),
  status: $enumDecode(_$ReportStatusEnumMap, json['status']),
  format: $enumDecode(_$ReportFormatEnumMap, json['format']),
  template: $enumDecode(_$ReportTemplateEnumMap, json['template']),
  content: ReportContent.fromJson(json['content'] as Map<String, dynamic>),
  metadata: ReportMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  generatedAt: json['generatedAt'] == null
      ? null
      : DateTime.parse(json['generatedAt'] as String),
  deliveredAt: json['deliveredAt'] == null
      ? null
      : DateTime.parse(json['deliveredAt'] as String),
  attachedEvidenceIds:
      (json['attachedEvidenceIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  customData: json['customData'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'assessmentId': instance.assessmentId,
      'title': instance.title,
      'type': _$ReportTypeEnumMap[instance.type]!,
      'status': _$ReportStatusEnumMap[instance.status]!,
      'format': _$ReportFormatEnumMap[instance.format]!,
      'template': _$ReportTemplateEnumMap[instance.template]!,
      'content': instance.content.toJson(),
      'metadata': instance.metadata.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'generatedAt': instance.generatedAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'attachedEvidenceIds': instance.attachedEvidenceIds,
      'customData': instance.customData,
    };

const _$ReportTypeEnumMap = {
  ReportType.executiveSummary: 'executive_summary',
  ReportType.technicalFindings: 'technical_findings',
  ReportType.fullPentest: 'full_pentest',
  ReportType.compliance: 'compliance',
  ReportType.vulnerabilityScan: 'vulnerability_scan',
  ReportType.wifiAudit: 'wifi_audit',
  ReportType.custom: 'custom',
};

const _$ReportStatusEnumMap = {
  ReportStatus.draft: 'draft',
  ReportStatus.generating: 'generating',
  ReportStatus.review: 'review',
  ReportStatus.finalized: 'finalized',
  ReportStatus.delivered: 'delivered',
  ReportStatus.archived: 'archived',
};

const _$ReportFormatEnumMap = {
  ReportFormat.pdf: 'pdf',
  ReportFormat.html: 'html',
  ReportFormat.json: 'json',
  ReportFormat.markdown: 'markdown',
  ReportFormat.docx: 'docx',
};

const _$ReportTemplateEnumMap = {
  ReportTemplate.owaspWstg: 'owasp_wstg',
  ReportTemplate.ptes: 'ptes',
  ReportTemplate.nist800115: 'nist_800_115',
  ReportTemplate.pciDss: 'pci_dss',
  ReportTemplate.iso27001: 'iso_27001',
  ReportTemplate.custom: 'custom',
};

_$ReportContentImpl _$$ReportContentImplFromJson(Map<String, dynamic> json) =>
    _$ReportContentImpl(
      executiveSummary: ExecutiveSummary.fromJson(
        json['executiveSummary'] as Map<String, dynamic>,
      ),
      methodology: Methodology.fromJson(
        json['methodology'] as Map<String, dynamic>,
      ),
      scope: ScopeDocumentation.fromJson(json['scope'] as Map<String, dynamic>),
      findings: (json['findings'] as List<dynamic>)
          .map((e) => TechnicalFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      riskAssessment: RiskAssessment.fromJson(
        json['riskAssessment'] as Map<String, dynamic>,
      ),
      remediation: RemediationRoadmap.fromJson(
        json['remediation'] as Map<String, dynamic>,
      ),
      appendices: Appendices.fromJson(
        json['appendices'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$ReportContentImplToJson(_$ReportContentImpl instance) =>
    <String, dynamic>{
      'executiveSummary': instance.executiveSummary.toJson(),
      'methodology': instance.methodology.toJson(),
      'scope': instance.scope.toJson(),
      'findings': instance.findings.map((e) => e.toJson()).toList(),
      'riskAssessment': instance.riskAssessment.toJson(),
      'remediation': instance.remediation.toJson(),
      'appendices': instance.appendices.toJson(),
    };

_$ExecutiveSummaryImpl _$$ExecutiveSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ExecutiveSummaryImpl(
  overview: json['overview'] as String,
  totalFindings: (json['totalFindings'] as num).toInt(),
  findingsBySeverity: _severityCountsFromJson(
    json['findingsBySeverity'] as Map<String, dynamic>,
  ),
  overallRiskScore: (json['overallRiskScore'] as num).toDouble(),
  riskRating: json['riskRating'] as String,
  keyMetrics: (json['keyMetrics'] as List<dynamic>)
      .map((e) => KeyMetric.fromJson(e as Map<String, dynamic>))
      .toList(),
  criticalRecommendations: (json['criticalRecommendations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$ExecutiveSummaryImplToJson(
  _$ExecutiveSummaryImpl instance,
) => <String, dynamic>{
  'overview': instance.overview,
  'totalFindings': instance.totalFindings,
  'findingsBySeverity': _severityCountsToJson(instance.findingsBySeverity),
  'overallRiskScore': instance.overallRiskScore,
  'riskRating': instance.riskRating,
  'keyMetrics': instance.keyMetrics.map((e) => e.toJson()).toList(),
  'criticalRecommendations': instance.criticalRecommendations,
};

_$KeyMetricImpl _$$KeyMetricImplFromJson(Map<String, dynamic> json) =>
    _$KeyMetricImpl(
      name: json['name'] as String,
      value: json['value'] as String,
      unit: json['unit'] as String,
      trend: $enumDecode(_$MetricTrendEnumMap, json['trend']),
    );

Map<String, dynamic> _$$KeyMetricImplToJson(_$KeyMetricImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'unit': instance.unit,
      'trend': _$MetricTrendEnumMap[instance.trend]!,
    };

const _$MetricTrendEnumMap = {
  MetricTrend.improving: 'improving',
  MetricTrend.stable: 'stable',
  MetricTrend.degrading: 'degrading',
};

_$MethodologyImpl _$$MethodologyImplFromJson(Map<String, dynamic> json) =>
    _$MethodologyImpl(
      description: json['description'] as String,
      standards: (json['standards'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tools: (json['tools'] as List<dynamic>).map((e) => e as String).toList(),
      techniques: (json['techniques'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      exclusions: (json['exclusions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      assessmentPeriodStart: DateTime.parse(
        json['assessmentPeriodStart'] as String,
      ),
      assessmentPeriodEnd: DateTime.parse(
        json['assessmentPeriodEnd'] as String,
      ),
    );

Map<String, dynamic> _$$MethodologyImplToJson(_$MethodologyImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'standards': instance.standards,
      'tools': instance.tools,
      'techniques': instance.techniques,
      'exclusions': instance.exclusions,
      'assessmentPeriodStart': instance.assessmentPeriodStart.toIso8601String(),
      'assessmentPeriodEnd': instance.assessmentPeriodEnd.toIso8601String(),
    };

_$ScopeDocumentationImpl _$$ScopeDocumentationImplFromJson(
  Map<String, dynamic> json,
) => _$ScopeDocumentationImpl(
  inScope: (json['inScope'] as List<dynamic>).map((e) => e as String).toList(),
  outOfScope: (json['outOfScope'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  limitations: (json['limitations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  assumptions: json['assumptions'] as String,
);

Map<String, dynamic> _$$ScopeDocumentationImplToJson(
  _$ScopeDocumentationImpl instance,
) => <String, dynamic>{
  'inScope': instance.inScope,
  'outOfScope': instance.outOfScope,
  'limitations': instance.limitations,
  'assumptions': instance.assumptions,
};

_$TechnicalFindingImpl _$$TechnicalFindingImplFromJson(
  Map<String, dynamic> json,
) => _$TechnicalFindingImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  severity: $enumDecode(_$SeverityEnumMap, json['severity']),
  cvss: CvssVector.fromJson(json['cvss'] as Map<String, dynamic>),
  affectedComponent: json['affectedComponent'] as String,
  description: json['description'] as String,
  impact: json['impact'] as String,
  likelihood: json['likelihood'] as String,
  reproductionSteps: json['reproductionSteps'] as String,
  evidence: json['evidence'] as String,
  recommendation: json['recommendation'] as String,
  references: (json['references'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$TechnicalFindingImplToJson(
  _$TechnicalFindingImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'severity': _$SeverityEnumMap[instance.severity]!,
  'cvss': instance.cvss.toJson(),
  'affectedComponent': instance.affectedComponent,
  'description': instance.description,
  'impact': instance.impact,
  'likelihood': instance.likelihood,
  'reproductionSteps': instance.reproductionSteps,
  'evidence': instance.evidence,
  'recommendation': instance.recommendation,
  'references': instance.references,
  'metadata': instance.metadata,
  'tags': instance.tags,
};

const _$SeverityEnumMap = {
  Severity.critical: 'critical',
  Severity.high: 'high',
  Severity.medium: 'medium',
  Severity.low: 'low',
  Severity.info: 'info',
};

_$RiskAssessmentImpl _$$RiskAssessmentImplFromJson(Map<String, dynamic> json) =>
    _$RiskAssessmentImpl(
      overallScore: (json['overallScore'] as num).toDouble(),
      overallRating: json['overallRating'] as String,
      categoryScores: (json['categoryScores'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      categoryRatings: Map<String, String>.from(json['categoryRatings'] as Map),
      riskFactors: (json['riskFactors'] as List<dynamic>)
          .map((e) => RiskFactor.fromJson(e as Map<String, dynamic>))
          .toList(),
      riskAppetiteAlignment: json['riskAppetiteAlignment'] as String,
    );

Map<String, dynamic> _$$RiskAssessmentImplToJson(
  _$RiskAssessmentImpl instance,
) => <String, dynamic>{
  'overallScore': instance.overallScore,
  'overallRating': instance.overallRating,
  'categoryScores': instance.categoryScores,
  'categoryRatings': instance.categoryRatings,
  'riskFactors': instance.riskFactors.map((e) => e.toJson()).toList(),
  'riskAppetiteAlignment': instance.riskAppetiteAlignment,
};

_$RiskFactorImpl _$$RiskFactorImplFromJson(Map<String, dynamic> json) =>
    _$RiskFactorImpl(
      name: json['name'] as String,
      score: (json['score'] as num).toDouble(),
      rating: json['rating'] as String,
      description: json['description'] as String,
      contributingFindings: (json['contributingFindings'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$RiskFactorImplToJson(_$RiskFactorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'score': instance.score,
      'rating': instance.rating,
      'description': instance.description,
      'contributingFindings': instance.contributingFindings,
    };

_$RemediationRoadmapImpl _$$RemediationRoadmapImplFromJson(
  Map<String, dynamic> json,
) => _$RemediationRoadmapImpl(
  immediate: (json['immediate'] as List<dynamic>)
      .map((e) => RemediationAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  shortTerm: (json['shortTerm'] as List<dynamic>)
      .map((e) => RemediationAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  mediumTerm: (json['mediumTerm'] as List<dynamic>)
      .map((e) => RemediationAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  longTerm: (json['longTerm'] as List<dynamic>)
      .map((e) => RemediationAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  prioritizationMethodology: json['prioritizationMethodology'] as String,
);

Map<String, dynamic> _$$RemediationRoadmapImplToJson(
  _$RemediationRoadmapImpl instance,
) => <String, dynamic>{
  'immediate': instance.immediate.map((e) => e.toJson()).toList(),
  'shortTerm': instance.shortTerm.map((e) => e.toJson()).toList(),
  'mediumTerm': instance.mediumTerm.map((e) => e.toJson()).toList(),
  'longTerm': instance.longTerm.map((e) => e.toJson()).toList(),
  'prioritizationMethodology': instance.prioritizationMethodology,
};

_$RemediationActionImpl _$$RemediationActionImplFromJson(
  Map<String, dynamic> json,
) => _$RemediationActionImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  priority: $enumDecode(_$PriorityEnumMap, json['priority']),
  effort: $enumDecode(_$EffortEnumMap, json['effort']),
  relatedFindingIds: (json['relatedFindingIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  responsibleParty: json['responsibleParty'] as String,
  targetDate: json['targetDate'] == null
      ? null
      : DateTime.parse(json['targetDate'] as String),
  completed: json['completed'] as bool? ?? false,
);

Map<String, dynamic> _$$RemediationActionImplToJson(
  _$RemediationActionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'priority': _$PriorityEnumMap[instance.priority]!,
  'effort': _$EffortEnumMap[instance.effort]!,
  'relatedFindingIds': instance.relatedFindingIds,
  'responsibleParty': instance.responsibleParty,
  'targetDate': instance.targetDate?.toIso8601String(),
  'completed': instance.completed,
};

const _$PriorityEnumMap = {
  Priority.critical: 'critical',
  Priority.high: 'high',
  Priority.medium: 'medium',
  Priority.low: 'low',
};

const _$EffortEnumMap = {
  Effort.low: 'low',
  Effort.medium: 'medium',
  Effort.high: 'high',
};

_$AppendicesImpl _$$AppendicesImplFromJson(Map<String, dynamic> json) =>
    _$AppendicesImpl(
      rawOutputs:
          (json['rawOutputs'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      toolVersions:
          (json['toolVersions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allEvidence:
          (json['allEvidence'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      glossary: json['glossary'] as String? ?? '',
      references: json['references'] as String? ?? '',
      customSections:
          json['customSections'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$AppendicesImplToJson(_$AppendicesImpl instance) =>
    <String, dynamic>{
      'rawOutputs': instance.rawOutputs,
      'toolVersions': instance.toolVersions,
      'allEvidence': instance.allEvidence,
      'glossary': instance.glossary,
      'references': instance.references,
      'customSections': instance.customSections,
    };

_$ReportMetadataImpl _$$ReportMetadataImplFromJson(Map<String, dynamic> json) =>
    _$ReportMetadataImpl(
      generatedBy: json['generatedBy'] as String,
      generatorVersion: json['generatorVersion'] as String,
      toolVersions: Map<String, String>.from(json['toolVersions'] as Map),
      pageCount: (json['pageCount'] as num).toInt(),
      wordCount: (json['wordCount'] as num).toInt(),
      classification: json['classification'] as String,
      customFields: json['customFields'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ReportMetadataImplToJson(
  _$ReportMetadataImpl instance,
) => <String, dynamic>{
  'generatedBy': instance.generatedBy,
  'generatorVersion': instance.generatorVersion,
  'toolVersions': instance.toolVersions,
  'pageCount': instance.pageCount,
  'wordCount': instance.wordCount,
  'classification': instance.classification,
  'customFields': instance.customFields,
};
