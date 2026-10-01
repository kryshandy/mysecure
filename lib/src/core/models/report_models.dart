import 'package:freezed_annotation/freezed_annotation.dart';
import 'project_models.dart';
import 'wifi_models.dart';

part 'report_models.freezed.dart';
part 'report_models.g.dart';

Map<Severity, int> _severityCountsFromJson(Map<String, dynamic> value) =>
    value.map(
      (key, count) => MapEntry(
        Severity.values.firstWhere(
          (s) => s.name == key,
          orElse: () => Severity.info,
        ),
        (count as num).toInt(),
      ),
    );

Map<String, int> _severityCountsToJson(Map<Severity, int> value) =>
    value.map((key, count) => MapEntry(key.name, count));

@freezed
sealed class Report with _$Report {
  const factory Report({
    required String id,
    required String projectId,
    required String assessmentId,
    required String title,
    required ReportType type,
    required ReportStatus status,
    required ReportFormat format,
    required ReportTemplate template,
    required ReportContent content,
    required ReportMetadata metadata,
    required DateTime createdAt,
    required DateTime? generatedAt,
    required DateTime? deliveredAt,
    @Default([]) List<String> attachedEvidenceIds,
    @Default({}) Map<String, dynamic> customData,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

enum ReportType {
  @JsonValue('executive_summary')
  executiveSummary,
  @JsonValue('technical_findings')
  technicalFindings,
  @JsonValue('full_pentest')
  fullPentest,
  @JsonValue('compliance')
  compliance,
  @JsonValue('vulnerability_scan')
  vulnerabilityScan,
  @JsonValue('wifi_audit')
  wifiAudit,
  @JsonValue('custom')
  custom,
}

enum ReportStatus {
  @JsonValue('draft')
  draft,
  @JsonValue('generating')
  generating,
  @JsonValue('review')
  review,
  @JsonValue('finalized')
  finalized,
  @JsonValue('delivered')
  delivered,
  @JsonValue('archived')
  archived,
}

enum ReportTemplate {
  @JsonValue('owasp_wstg')
  owaspWstg,
  @JsonValue('ptes')
  ptes,
  @JsonValue('nist_800_115')
  nist800115,
  @JsonValue('pci_dss')
  pciDss,
  @JsonValue('iso_27001')
  iso27001,
  @JsonValue('custom')
  custom,
}

@freezed
sealed class ReportContent with _$ReportContent {
  const factory ReportContent({
    required ExecutiveSummary executiveSummary,
    required Methodology methodology,
    required ScopeDocumentation scope,
    required List<TechnicalFinding> findings,
    required RiskAssessment riskAssessment,
    required RemediationRoadmap remediation,
    required Appendices appendices,
  }) = _ReportContent;

  factory ReportContent.fromJson(Map<String, dynamic> json) =>
      _$ReportContentFromJson(json);
}

@freezed
sealed class ExecutiveSummary with _$ExecutiveSummary {
  const factory ExecutiveSummary({
    required String overview,
    required int totalFindings,
    @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
    required Map<Severity, int> findingsBySeverity,
    required double overallRiskScore,
    required String riskRating,
    required List<KeyMetric> keyMetrics,
    required List<String> criticalRecommendations,
  }) = _ExecutiveSummary;

  factory ExecutiveSummary.fromJson(Map<String, dynamic> json) =>
      _$ExecutiveSummaryFromJson(json);
}

@freezed
sealed class KeyMetric with _$KeyMetric {
  const factory KeyMetric({
    required String name,
    required String value,
    required String unit,
    required MetricTrend trend,
  }) = _KeyMetric;

  factory KeyMetric.fromJson(Map<String, dynamic> json) =>
      _$KeyMetricFromJson(json);
}

enum MetricTrend {
  @JsonValue('improving')
  improving,
  @JsonValue('stable')
  stable,
  @JsonValue('degrading')
  degrading,
}

@freezed
sealed class Methodology with _$Methodology {
  const factory Methodology({
    required String description,
    required List<String> standards,
    required List<String> tools,
    required List<String> techniques,
    required List<String> exclusions,
    required DateTime assessmentPeriodStart,
    required DateTime assessmentPeriodEnd,
  }) = _Methodology;

  factory Methodology.fromJson(Map<String, dynamic> json) =>
      _$MethodologyFromJson(json);
}

@freezed
sealed class ScopeDocumentation with _$ScopeDocumentation {
  const factory ScopeDocumentation({
    required List<String> inScope,
    required List<String> outOfScope,
    required List<String> limitations,
    required String assumptions,
  }) = _ScopeDocumentation;

  factory ScopeDocumentation.fromJson(Map<String, dynamic> json) =>
      _$ScopeDocumentationFromJson(json);
}

@freezed
sealed class TechnicalFinding with _$TechnicalFinding {
  const factory TechnicalFinding({
    required String id,
    required String title,
    required Severity severity,
    required CvssVector cvss,
    required String affectedComponent,
    required String description,
    required String impact,
    required String likelihood,
    required String reproductionSteps,
    required String evidence,
    required String recommendation,
    required List<String> references,
    required Map<String, dynamic> metadata,
    @Default([]) List<String> tags,
  }) = _TechnicalFinding;

  factory TechnicalFinding.fromJson(Map<String, dynamic> json) =>
      _$TechnicalFindingFromJson(json);
}

@freezed
sealed class RiskAssessment with _$RiskAssessment {
  const factory RiskAssessment({
    required double overallScore,
    required String overallRating,
    required Map<String, double> categoryScores,
    required Map<String, String> categoryRatings,
    required List<RiskFactor> riskFactors,
    required String riskAppetiteAlignment,
  }) = _RiskAssessment;

  factory RiskAssessment.fromJson(Map<String, dynamic> json) =>
      _$RiskAssessmentFromJson(json);
}

@freezed
sealed class RiskFactor with _$RiskFactor {
  const factory RiskFactor({
    required String name,
    required double score,
    required String rating,
    required String description,
    required List<String> contributingFindings,
  }) = _RiskFactor;

  factory RiskFactor.fromJson(Map<String, dynamic> json) =>
      _$RiskFactorFromJson(json);
}

@freezed
sealed class RemediationRoadmap with _$RemediationRoadmap {
  const factory RemediationRoadmap({
    required List<RemediationAction> immediate,
    required List<RemediationAction> shortTerm,
    required List<RemediationAction> mediumTerm,
    required List<RemediationAction> longTerm,
    required String prioritizationMethodology,
  }) = _RemediationRoadmap;

  factory RemediationRoadmap.fromJson(Map<String, dynamic> json) =>
      _$RemediationRoadmapFromJson(json);
}

@freezed
sealed class RemediationAction with _$RemediationAction {
  const factory RemediationAction({
    required String id,
    required String title,
    required String description,
    required Priority priority,
    required Effort effort,
    required List<String> relatedFindingIds,
    required String responsibleParty,
    required DateTime? targetDate,
    @Default(false) bool completed,
  }) = _RemediationAction;

  factory RemediationAction.fromJson(Map<String, dynamic> json) =>
      _$RemediationActionFromJson(json);
}

enum Priority {
  @JsonValue('critical')
  critical,
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low,
}

enum Effort {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}

@freezed
sealed class Appendices with _$Appendices {
  const factory Appendices({
    @Default({}) Map<String, String> rawOutputs,
    @Default([]) List<String> toolVersions,
    @Default([]) List<String> allEvidence,
    @Default('') String glossary,
    @Default('') String references,
    @Default({}) Map<String, dynamic> customSections,
  }) = _Appendices;

  factory Appendices.fromJson(Map<String, dynamic> json) =>
      _$AppendicesFromJson(json);
}

@freezed
sealed class ReportMetadata with _$ReportMetadata {
  const factory ReportMetadata({
    required String generatedBy,
    required String generatorVersion,
    required Map<String, String> toolVersions,
    required int pageCount,
    required int wordCount,
    required String classification,
    @Default({}) Map<String, dynamic> customFields,
  }) = _ReportMetadata;

  factory ReportMetadata.fromJson(Map<String, dynamic> json) =>
      _$ReportMetadataFromJson(json);
}
