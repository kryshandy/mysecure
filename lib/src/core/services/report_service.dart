import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';
import '../database/database_connection.dart';
import '../database/app_database.dart' as db;
import '../database/daos.dart';
import '../models/report_models.dart';
import '../models/project_models.dart';
import '../models/assessment_models.dart';
import '../models/wifi_models.dart';

final reportServiceProvider = Provider<ReportService>((ref) {
  final db = ref.watch(databaseProvider);
  return ReportService(
    reportDao: db.reportDao,
    projectDao: db.projectDao,
    assessmentDao: db.assessmentDao,
    findingDao: db.findingDao,
    evidenceDao: db.evidenceDao,
    accessPointDao: db.accessPointDao,
    vulnerabilityFindingDao: db.vulnerabilityFindingDao,
  );
});

final reportsProvider = StreamProvider<List<Report>>(
  (ref) => ref.watch(reportServiceProvider).watchAllReports(),
);

final reportProvider = FutureProvider.family<Report?, String>(
  (ref, id) => ref.watch(reportServiceProvider).getReport(id),
);

class ReportService {
  final ReportDao _reportDao;
  final ProjectDao _projectDao;
  final AssessmentDao _assessmentDao;
  final FindingDao _findingDao;
  final EvidenceDao _evidenceDao;
  final AccessPointDao _accessPointDao;
  final VulnerabilityFindingDao _vulnerabilityFindingDao;

  final _logger = Logger();

  ReportService({
    required ReportDao reportDao,
    required ProjectDao projectDao,
    required AssessmentDao assessmentDao,
    required FindingDao findingDao,
    required EvidenceDao evidenceDao,
    required AccessPointDao accessPointDao,
    required VulnerabilityFindingDao vulnerabilityFindingDao,
  }) : _reportDao = reportDao,
       _projectDao = projectDao,
       _assessmentDao = assessmentDao,
       _findingDao = findingDao,
       _evidenceDao = evidenceDao,
       _accessPointDao = accessPointDao,
       _vulnerabilityFindingDao = vulnerabilityFindingDao;

  Future<Report> generateReport({
    required String projectId,
    required String assessmentId,
    required String title,
    required ReportType type,
    required ReportFormat format,
    required ReportTemplate template,
  }) async {
    final project = await _projectDao.getProject(projectId);
    final assessment = await _assessmentDao.getAssessment(assessmentId);

    if (project == null) throw Exception('Project not found');
    if (assessment == null) throw Exception('Assessment not found');

    final findings = await _findingDao.getFindingsByAssessment(assessmentId);
    final vulns = await _vulnerabilityFindingDao.getVulnsByAssessment(
      assessmentId,
    );
    final evidence = await _evidenceDao.getEvidenceByAssessment(assessmentId);
    final aps = await _accessPointDao.getAccessPointsByAssessment(assessmentId);

    final content = await _buildReportContent(
      project: project,
      assessment: assessment,
      findings: findings,
      vulns: vulns,
      evidence: evidence,
      accessPoints: aps,
      template: template,
    );

    final report = Report(
      id: const Uuid().v4(),
      projectId: projectId,
      assessmentId: assessmentId,
      title: title,
      type: type,
      status: ReportStatus.generating,
      format: format,
      template: template,
      content: content,
      metadata: ReportMetadata(
        generatedBy: 'mySecure',
        generatorVersion: '1.0.0',
        toolVersions: {'mySecure': '1.0.0', 'pdf': '3.10.7'},
        pageCount: 0,
        wordCount: 0,
        classification: 'CONFIDENTIAL',
      ),
      createdAt: DateTime.now(),
      generatedAt: null,
      deliveredAt: null,
      attachedEvidenceIds: evidence.map((e) => e.id).toList(),
    );

    // Save initial report
    await _reportDao.insertReport(
      db.ReportsCompanion(
        id: Value(report.id),
        projectId: Value(report.projectId),
        assessmentId: Value(report.assessmentId),
        title: Value(report.title),
        type: Value(report.type),
        status: Value(report.status),
        format: Value(report.format),
        template: Value(report.template),
        contentJson: Value(report.content),
        metadataJson: Value(report.metadata),
        createdAt: Value(report.createdAt),
        attachedEvidenceIds: Value(report.attachedEvidenceIds),
        customData: const Value({}),
      ),
    );

    late final String filePath;
    try {
      filePath = await _generateReportFile(report);
    } on Object catch (error, stackTrace) {
      await _reportDao.updateReport(
        db.ReportsCompanion(
          id: Value(report.id),
          status: const Value(ReportStatus.draft),
          customData: Value({
            ...report.customData,
            'generationError': error.toString(),
          }),
        ),
      );
      _logger.e(
        'Report generation failed',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }

    // Update with final metadata
    final finalReport = report.copyWith(
      status: ReportStatus.finalized,
      generatedAt: DateTime.now(),
      metadata: report.metadata.copyWith(
        pageCount: _countPages(content),
        wordCount: _countWords(content),
      ),
      customData: {...report.customData, 'filePath': filePath},
    );

    await _reportDao.updateReport(
      db.ReportsCompanion(
        id: Value(finalReport.id),
        status: Value(finalReport.status),
        generatedAt: Value(finalReport.generatedAt),
        metadataJson: Value(finalReport.metadata),
        customData: Value(finalReport.customData),
      ),
    );

    return finalReport;
  }

  Future<ReportContent> _buildReportContent({
    required Project project,
    required Assessment assessment,
    required List<Finding> findings,
    required List<VulnerabilityFinding> vulns,
    required List<Evidence> evidence,
    required List<AccessPoint> accessPoints,
    required ReportTemplate template,
  }) async {
    final allFindings = [
      ...findings,
      ...vulns.map(
        (v) => Finding(
          id: v.id,
          assessmentId: assessment.id,
          type: FindingType.vulnerability,
          severity: v.severity,
          title: v.title,
          description: v.description,
          recommendation: v.recommendation,
          affectedTarget: v.accessPointId,
          evidence: v.evidence,
          cvss:
              v.cvssVector ??
              CvssVector(
                vectorString: '',
                baseScore: 0,
                temporalScore: 0,
                environmentalScore: 0,
              ),
          discoveredAt: v.discoveredAt,
          verifiedAt: v.verified ? v.discoveredAt : null,
          verified: v.verified,
          references: '',
        ),
      ),
    ];

    final severityCounts = <Severity, int>{};
    for (final f in allFindings) {
      severityCounts[f.severity] = (severityCounts[f.severity] ?? 0) + 1;
    }

    final overallRisk = _calculateOverallRisk(allFindings);
    final riskRating = _getRiskRating(overallRisk);

    return ReportContent(
      executiveSummary: ExecutiveSummary(
        overview: _generateOverview(
          project,
          assessment,
          allFindings.length,
          severityCounts,
          overallRisk,
        ),
        totalFindings: allFindings.length,
        findingsBySeverity: severityCounts,
        overallRiskScore: overallRisk,
        riskRating: riskRating,
        keyMetrics: _generateKeyMetrics(assessment, accessPoints, allFindings),
        criticalRecommendations: _generateCriticalRecommendations(allFindings),
      ),
      methodology: Methodology(
        description: _generateMethodology(assessment),
        standards: ['PTES', 'OWASP WSTG', 'NIST SP 800-115'],
        tools: ['mySecure 1.0', 'wifi_scan', 'nuclei', 'reaver', 'hcxdumptool'],
        techniques: _getTechniquesUsed(assessment),
        exclusions: [],
        assessmentPeriodStart: assessment.startedAt ?? assessment.createdAt,
        assessmentPeriodEnd: assessment.completedAt ?? DateTime.now(),
      ),
      scope: ScopeDocumentation(
        inScope: _getInScope(assessment),
        outOfScope: _getOutOfScope(assessment),
        limitations: [
          'Passive scanning only unless explicitly authorized',
          'No denial of service testing',
        ],
        assumptions:
            'Network topology as discovered; credentials are not tested unless explicitly in scope.',
      ),
      findings: allFindings.map(_toTechnicalFinding).toList(),
      riskAssessment: RiskAssessment(
        overallScore: overallRisk,
        overallRating: riskRating,
        categoryScores: _calculateCategoryScores(allFindings),
        categoryRatings: _calculateCategoryRatings(allFindings),
        riskFactors: _generateRiskFactors(allFindings, accessPoints),
        riskAppetiteAlignment: 'To be determined by client',
      ),
      remediation: RemediationRoadmap(
        immediate: _getImmediateActions(allFindings),
        shortTerm: _getShortTermActions(allFindings),
        mediumTerm: _getMediumTermActions(allFindings),
        longTerm: _getLongTermActions(allFindings),
        prioritizationMethodology:
            'CVSS v3.1 scoring with business impact weighting',
      ),
      appendices: Appendices(
        rawOutputs: {},
        toolVersions: const ['mySecure 1.0.0'],
        allEvidence: evidence.map((e) => e.id).toList(),
        glossary: _getGlossary(),
        references: _getReferences().join('\n'),
      ),
    );
  }

  String _generateOverview(
    Project project,
    Assessment assessment,
    int totalFindings,
    Map<Severity, int> counts,
    double overallRisk,
  ) {
    return '''
Security assessment "${assessment.name}" was conducted for ${project.client.name} 
(${project.client.company ?? 'N/A'}) as part of project "${project.name}".

The assessment was performed from ${assessment.startedAt?.toString().split('.')[0] ?? 'N/A'} 
to ${assessment.completedAt?.toString().split('.')[0] ?? 'N/A'}.

A total of $totalFindings findings were identified:
${counts.entries.map((e) => '- ${e.key.name.toUpperCase()}: ${e.value}').join('\n')}

Overall risk rating: ${_getRiskRating(overallRisk)}
''';
  }

  double _calculateOverallRisk(List<Finding> findings) {
    if (findings.isEmpty) return 0.0;

    final weights = {
      Severity.critical: 10.0,
      Severity.high: 7.5,
      Severity.medium: 5.0,
      Severity.low: 2.5,
      Severity.info: 1.0,
    };

    double score = 0;
    for (final f in findings) {
      score += weights[f.severity] ?? 0;
    }

    // Normalize to 0-10 scale
    return (score / findings.length).clamp(0.0, 10.0);
  }

  String _getRiskRating(double score) {
    if (score >= 9.0) return 'CRITICAL';
    if (score >= 7.0) return 'HIGH';
    if (score >= 4.0) return 'MEDIUM';
    if (score >= 2.0) return 'LOW';
    return 'INFORMATIONAL';
  }

  List<KeyMetric> _generateKeyMetrics(
    Assessment assessment,
    List<AccessPoint> aps,
    List<Finding> findings,
  ) {
    return [
      KeyMetric(
        name: 'Networks Discovered',
        value: aps.length.toString(),
        unit: 'count',
        trend: MetricTrend.stable,
      ),
      KeyMetric(
        name: 'Total Findings',
        value: findings.length.toString(),
        unit: 'count',
        trend: MetricTrend.stable,
      ),
      KeyMetric(
        name: 'Critical Findings',
        value: findings
            .where((f) => f.severity == Severity.critical)
            .length
            .toString(),
        unit: 'count',
        trend: MetricTrend.stable,
      ),
      KeyMetric(
        name: 'WPS Enabled APs',
        value: aps.where((a) => a.wpsEnabled).length.toString(),
        unit: 'count',
        trend: MetricTrend.stable,
      ),
      KeyMetric(
        name: 'Open Networks',
        value: aps
            .where((a) => a.security == SecurityProtocol.open)
            .length
            .toString(),
        unit: 'count',
        trend: MetricTrend.stable,
      ),
      KeyMetric(
        name: 'Assessment Duration',
        value: assessment.totalDuration.inMinutes.toString(),
        unit: 'minutes',
        trend: MetricTrend.stable,
      ),
    ];
  }

  List<String> _generateCriticalRecommendations(List<Finding> findings) {
    return findings
        .where(
          (f) => f.severity == Severity.critical || f.severity == Severity.high,
        )
        .take(5)
        .map((f) => f.recommendation)
        .toList();
  }

  String _generateMethodology(Assessment assessment) {
    return '''
This assessment followed the Penetration Testing Execution Standard (PTES) 
and OWASP Web Security Testing Guide (WSTG) methodologies.

Assessment Type: ${assessment.type.name}
Scope: ${assessment.scope.targetSsids.isNotEmpty ? assessment.scope.targetSsids.join(', ') : 'All discovered networks'}

The assessment included:
1. Passive wireless reconnaissance
2. Active network discovery (if authorized)
3. Vulnerability identification and validation
4. Exploitation verification (if authorized)
5. Post-exploitation enumeration (if authorized)
6. Reporting and remediation guidance
''';
  }

  List<String> _getTechniquesUsed(Assessment assessment) {
    final techniques = <String>[];
    if (assessment.type == AssessmentType.wifiRecon ||
        assessment.type == AssessmentType.wifiVulnScan) {
      techniques.addAll([
        '802.11 Passive Scanning',
        'Beacon Frame Analysis',
        'Probe Request Monitoring',
      ]);
    }
    if (assessment.type == AssessmentType.wifiExploitation) {
      techniques.addAll([
        'WPA/WPA2 4-Way Handshake Capture',
        'PMKID Attack',
        'WPS Pixie-Dust',
        'Deauthentication Attack',
      ]);
    }
    return techniques;
  }

  List<String> _getInScope(Assessment assessment) {
    return [
      ...assessment.scope.targetSsids,
      ...assessment.scope.targetBssids,
      ...assessment.scope.targetNetworks,
      ...assessment.scope.targetDomains,
      ...assessment.scope.targetUrls,
    ];
  }

  List<String> _getOutOfScope(Assessment assessment) {
    return [
      ...assessment.scope.excludedTargets,
      'Social engineering',
      'Physical security',
      'Denial of service attacks',
      'Third-party networks',
    ];
  }

  TechnicalFinding _toTechnicalFinding(Finding finding) {
    return TechnicalFinding(
      id: finding.id,
      title: finding.title,
      severity: finding.severity,
      cvss: finding.cvss,
      affectedComponent: finding.affectedTarget,
      description: finding.description,
      impact: _assessImpact(finding),
      likelihood: _assessLikelihood(finding),
      reproductionSteps:
          finding.metadata['reproductionSteps']?.toString() ?? 'See evidence',
      evidence: finding.evidence.toString(),
      recommendation: finding.recommendation,
      references: finding.references
          .split('\n')
          .where((s) => s.isNotEmpty)
          .toList(),
      metadata: finding.metadata,
      tags: [],
    );
  }

  String _assessImpact(Finding finding) {
    switch (finding.severity) {
      case Severity.critical:
        return 'Complete compromise of confidentiality, integrity, and/or availability';
      case Severity.high:
        return 'Significant impact on confidentiality, integrity, or availability';
      case Severity.medium:
        return 'Moderate impact on security posture';
      case Severity.low:
        return 'Limited impact, primarily informational';
      case Severity.info:
        return 'No direct impact, informational only';
    }
  }

  String _assessLikelihood(Finding finding) {
    switch (finding.severity) {
      case Severity.critical:
        return 'Almost certain - trivial to exploit';
      case Severity.high:
        return 'High - readily exploitable with common tools';
      case Severity.medium:
        return 'Medium - requires specific conditions or skill';
      case Severity.low:
        return 'Low - difficult to exploit or limited impact';
      case Severity.info:
        return 'N/A - informational';
    }
  }

  Map<String, double> _calculateCategoryScores(List<Finding> findings) {
    final categories = <String, List<Finding>>{};
    for (final f in findings) {
      final cat = f.type.name;
      categories.putIfAbsent(cat, () => []).add(f);
    }

    return categories.map(
      (cat, list) => MapEntry(cat, _calculateOverallRisk(list)),
    );
  }

  Map<String, String> _calculateCategoryRatings(List<Finding> findings) {
    return _calculateCategoryScores(
      findings,
    ).map((cat, score) => MapEntry(cat, _getRiskRating(score)));
  }

  List<RiskFactor> _generateRiskFactors(
    List<Finding> findings,
    List<AccessPoint> aps,
  ) {
    return [
      RiskFactor(
        name: 'Wireless Encryption',
        score:
            aps
                .where(
                  (a) =>
                      a.security == SecurityProtocol.open ||
                      a.security == SecurityProtocol.wep,
                )
                .isNotEmpty
            ? 9.0
            : 2.0,
        rating:
            aps
                .where(
                  (a) =>
                      a.security == SecurityProtocol.open ||
                      a.security == SecurityProtocol.wep,
                )
                .isNotEmpty
            ? 'CRITICAL'
            : 'LOW',
        description: 'Use of deprecated or no encryption protocols',
        contributingFindings: findings
            .where(
              (f) =>
                  f.type == FindingType.vulnerability &&
                  f.title.contains('Encryption'),
            )
            .map((f) => f.id)
            .toList(),
      ),
      RiskFactor(
        name: 'WPS Configuration',
        score: aps.where((a) => a.wpsEnabled).isNotEmpty ? 6.0 : 1.0,
        rating: aps.where((a) => a.wpsEnabled).isNotEmpty ? 'MEDIUM' : 'INFO',
        description: 'WiFi Protected Setup enabled on access points',
        contributingFindings: findings
            .where(
              (f) =>
                  f.type == FindingType.misconfiguration &&
                  f.title.contains('WPS'),
            )
            .map((f) => f.id)
            .toList(),
      ),
    ];
  }

  List<RemediationAction> _getImmediateActions(List<Finding> findings) {
    return findings
        .where((f) => f.severity == Severity.critical)
        .map(
          (f) => RemediationAction(
            id: const Uuid().v4(),
            title: 'Remediate: ${f.title}',
            description: f.recommendation,
            priority: Priority.critical,
            effort: Effort.low,
            relatedFindingIds: [f.id],
            responsibleParty: 'Network Administrator',
            targetDate: DateTime.now().add(const Duration(days: 7)),
          ),
        )
        .toList();
  }

  List<RemediationAction> _getShortTermActions(List<Finding> findings) {
    return findings
        .where((f) => f.severity == Severity.high)
        .map(
          (f) => RemediationAction(
            id: const Uuid().v4(),
            title: 'Remediate: ${f.title}',
            description: f.recommendation,
            priority: Priority.high,
            effort: Effort.medium,
            relatedFindingIds: [f.id],
            responsibleParty: 'Network Administrator',
            targetDate: DateTime.now().add(const Duration(days: 30)),
          ),
        )
        .toList();
  }

  List<RemediationAction> _getMediumTermActions(List<Finding> findings) {
    return findings
        .where((f) => f.severity == Severity.medium)
        .map(
          (f) => RemediationAction(
            id: const Uuid().v4(),
            title: 'Remediate: ${f.title}',
            description: f.recommendation,
            priority: Priority.medium,
            effort: Effort.medium,
            relatedFindingIds: [f.id],
            responsibleParty: 'IT Security Team',
            targetDate: DateTime.now().add(const Duration(days: 90)),
          ),
        )
        .toList();
  }

  List<RemediationAction> _getLongTermActions(List<Finding> findings) {
    return findings
        .where((f) => f.severity == Severity.low || f.severity == Severity.info)
        .map(
          (f) => RemediationAction(
            id: const Uuid().v4(),
            title: 'Improve: ${f.title}',
            description: f.recommendation,
            priority: Priority.low,
            effort: Effort.high,
            relatedFindingIds: [f.id],
            responsibleParty: 'IT Strategy',
            targetDate: DateTime.now().add(const Duration(days: 180)),
          ),
        )
        .toList();
  }

  String _getGlossary() => '''
AP - Access Point
BSSID - Basic Service Set Identifier
CVSS - Common Vulnerability Scoring System
EAPOL - Extensible Authentication Protocol over LAN
PMKID - Pairwise Master Key Identifier
PSK - Pre-Shared Key
PTES - Penetration Testing Execution Standard
WPA - Wi-Fi Protected Access
WPS - Wi-Fi Protected Setup
''';

  List<String> _getReferences() => [
    'PTES Technical Guidelines - http://www.pentest-standard.org',
    'OWASP WSTG - https://owasp.org/www-project-testing-guide/',
    'NIST SP 800-115 - Technical Guide to Information Security Testing',
    'IEEE 802.11 Standards',
    'Wi-Fi Alliance Security Specifications',
  ];

  Future<String> _generateReportFile(Report report) async {
    final dir = await getApplicationDocumentsDirectory();
    final reportsDir = Directory(p.join(dir.path, 'reports'));
    if (!reportsDir.existsSync()) reportsDir.createSync(recursive: true);

    final safeTitle = report.title
        .replaceAll(RegExp(r'[^A-Za-z0-9._-]+'), '_')
        .replaceAll(RegExp(r'^\.+'), '')
        .replaceAll(RegExp(r'_+'), '_');
    final baseName =
        '${safeTitle.isEmpty ? 'report' : safeTitle}_${DateTime.now().millisecondsSinceEpoch}';

    switch (report.format) {
      case ReportFormat.pdf:
        return _generatePdf(report, reportsDir, '$baseName.pdf');
      case ReportFormat.html:
        final file = File(p.join(reportsDir.path, '$baseName.html'));
        await file.writeAsString(_reportAsHtml(report), flush: true);
        return file.path;
      case ReportFormat.json:
        final file = File(p.join(reportsDir.path, '$baseName.json'));
        await file.writeAsString(
          const JsonEncoder.withIndent('  ').convert(report.toJson()),
          flush: true,
        );
        return file.path;
      case ReportFormat.markdown:
        final file = File(p.join(reportsDir.path, '$baseName.md'));
        await file.writeAsString(_reportAsMarkdown(report), flush: true);
        return file.path;
      case ReportFormat.docx:
        return _generateDocx(report, reportsDir, '$baseName.docx');
    }
  }

  Future<String> _generatePdf(
    Report report,
    Directory reportsDir,
    String fileName,
  ) async {
    final file = File(p.join(reportsDir.path, fileName));

    final pdf = pw.Document();

    // Add pages
    pdf.addPage(_buildCoverPage(report));
    pdf.addPage(_buildExecutiveSummary(report));
    pdf.addPage(_buildMethodology(report));
    pdf.addPage(_buildScope(report));

    for (final finding in report.content.findings) {
      pdf.addPage(_buildFindingPage(finding));
    }

    pdf.addPage(_buildRiskAssessment(report));
    pdf.addPage(_buildRemediation(report));
    pdf.addPage(_buildAppendices(report));

    await file.writeAsBytes(await pdf.save());
    return file.path;
  }

  String _reportAsMarkdown(Report report) {
    final buffer = StringBuffer()
      ..writeln('# ${report.title}')
      ..writeln()
      ..writeln('**Classification:** ${report.metadata.classification}')
      ..writeln()
      ..writeln('## Executive summary')
      ..writeln()
      ..writeln(report.content.executiveSummary.overview)
      ..writeln()
      ..writeln(
        '**Overall risk:** ${report.content.riskAssessment.overallRating} '
        '(${report.content.riskAssessment.overallScore.toStringAsFixed(1)}/10)',
      )
      ..writeln()
      ..writeln('## Technical findings')
      ..writeln();

    for (final finding in report.content.findings) {
      buffer
        ..writeln('### ${finding.title}')
        ..writeln()
        ..writeln('**Severity:** ${finding.severity.name.toUpperCase()}')
        ..writeln()
        ..writeln(finding.description)
        ..writeln()
        ..writeln('**Recommendation:** ${finding.recommendation}')
        ..writeln();
    }

    buffer
      ..writeln('## References')
      ..writeln()
      ..writeln(report.content.appendices.references);
    return buffer.toString();
  }

  String _reportAsHtml(Report report) {
    final markdown = _reportAsMarkdown(report);
    final escaped = const HtmlEscape().convert(markdown);
    return '<!doctype html><html lang="en"><head><meta charset="utf-8">'
        '<meta name="viewport" content="width=device-width,initial-scale=1">'
        '<title>${const HtmlEscape().convert(report.title)}</title>'
        '<style>body{font-family:system-ui,sans-serif;max-width:960px;margin:40px auto;'
        'padding:0 20px;line-height:1.55;color:#172033}pre{white-space:pre-wrap}</style>'
        '</head><body><pre>$escaped</pre></body></html>';
  }

  Future<String> _generateDocx(
    Report report,
    Directory reportsDir,
    String fileName,
  ) async {
    final documentText = _xmlEscape(_reportAsMarkdown(report));
    final archive = Archive()
      ..addFile(
        ArchiveFile.string(
          '[Content_Types].xml',
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
              '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
              '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
              '<Default Extension="xml" ContentType="application/xml"/>'
              '<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>'
              '</Types>',
        ),
      )
      ..addFile(
        ArchiveFile.string(
          '_rels/.rels',
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
              '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
              '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>'
              '</Relationships>',
        ),
      )
      ..addFile(
        ArchiveFile.string(
          'word/document.xml',
          '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
              '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
              '<w:body><w:p><w:r><w:t xml:space="preserve">$documentText</w:t></w:r></w:p>'
              '<w:sectPr/></w:body></w:document>',
        ),
      );
    final bytes = ZipEncoder().encode(archive);
    final file = File(p.join(reportsDir.path, fileName));
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  String _xmlEscape(String value) => value
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&apos;');

  pw.Page _buildCoverPage(Report report) => pw.Page(
    build: (context) => pw.Center(
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Text(
            'mySecure',
            style: pw.TextStyle(fontSize: 48, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 16),
          pw.Text(
            'Security Assessment Report',
            style: pw.TextStyle(fontSize: 24),
          ),
          pw.SizedBox(height: 32),
          pw.Text(report.title, style: pw.TextStyle(fontSize: 20)),
          pw.SizedBox(height: 8),
          pw.Text(
            'Project: ${report.projectId}',
            style: pw.TextStyle(fontSize: 14),
          ),
          pw.Text(
            'Assessment: ${report.assessmentId}',
            style: pw.TextStyle(fontSize: 14),
          ),
          pw.SizedBox(height: 32),
          pw.Text(
            'Generated: ${DateTime.now().toString().split('.')[0]}',
            style: pw.TextStyle(fontSize: 12),
          ),
          pw.Text(
            'Classification: ${report.metadata.classification}',
            style: pw.TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );

  pw.Page _buildExecutiveSummary(Report report) => pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Executive Summary',
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 16),
        pw.Text(report.content.executiveSummary.overview),
        pw.SizedBox(height: 16),
        pw.Text(
          'Key Metrics',
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 8),
        pw.Table(
          children: [
            pw.TableRow(
              children: [
                pw.Text(
                  'Metric',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Value',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
            ...report.content.executiveSummary.keyMetrics.map(
              (m) => pw.TableRow(
                children: [pw.Text(m.name), pw.Text('${m.value} ${m.unit}')],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'Findings by Severity',
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.Table(
          children: [
            pw.TableRow(
              children: [
                pw.Text(
                  'Severity',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Count',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
            ...report.content.executiveSummary.findingsBySeverity.entries.map(
              (e) => pw.TableRow(
                children: [
                  pw.Text(e.key.name.toUpperCase()),
                  pw.Text(e.value.toString()),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  pw.Page _buildMethodology(Report report) => pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Methodology',
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 16),
        pw.Text(report.content.methodology.description),
        pw.SizedBox(height: 16),
        pw.Text(
          'Standards',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Bullet(text: report.content.methodology.standards.join(', ')),
        pw.SizedBox(height: 8),
        pw.Text(
          'Tools',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Bullet(text: report.content.methodology.tools.join(', ')),
        pw.SizedBox(height: 8),
        pw.Text(
          'Techniques',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Bullet(text: report.content.methodology.techniques.join(', ')),
      ],
    ),
  );

  pw.Page _buildScope(Report report) => pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Scope',
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'In Scope',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Bullet(text: report.content.scope.inScope.join(', ')),
        pw.SizedBox(height: 8),
        pw.Text(
          'Out of Scope',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Bullet(text: report.content.scope.outOfScope.join(', ')),
        pw.SizedBox(height: 8),
        pw.Text(
          'Limitations',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Bullet(text: report.content.scope.limitations.join(', ')),
      ],
    ),
  );

  pw.Page _buildFindingPage(TechnicalFinding finding) => pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              finding.title,
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.Container(
              padding: const pw.EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              color: _severityColor(finding.severity),
              child: pw.Text(
                finding.severity.name.toUpperCase(),
                style: pw.TextStyle(
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Text('Component: ${finding.affectedComponent}'),
        pw.Text(
          'CVSS: ${finding.cvss.vectorString} (${finding.cvss.baseScore})',
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'Description',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(finding.description),
        pw.SizedBox(height: 8),
        pw.Text(
          'Impact',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(finding.impact),
        pw.SizedBox(height: 8),
        pw.Text(
          'Likelihood',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(finding.likelihood),
        pw.SizedBox(height: 8),
        pw.Text(
          'Evidence',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(finding.evidence),
        pw.SizedBox(height: 8),
        pw.Text(
          'Recommendation',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(finding.recommendation),
        if (finding.references.isNotEmpty) ...[
          pw.SizedBox(height: 8),
          pw.Text(
            'References',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          ...finding.references.map((r) => pw.Bullet(text: r)),
        ],
      ],
    ),
  );

  pw.Page _buildRiskAssessment(Report report) => pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Risk Assessment',
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'Overall Risk: ${report.content.riskAssessment.overallRating} (${report.content.riskAssessment.overallScore.toStringAsFixed(1)}/10)',
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'Category Scores',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Table(
          children: [
            pw.TableRow(
              children: [
                pw.Text(
                  'Category',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Score',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Rating',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
            ...report.content.riskAssessment.categoryScores.entries.map(
              (e) => pw.TableRow(
                children: [
                  pw.Text(e.key),
                  pw.Text(e.value.toStringAsFixed(1)),
                  pw.Text(
                    report.content.riskAssessment.categoryRatings[e.key] ?? '',
                  ),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'Risk Factors',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        ...report.content.riskAssessment.riskFactors.map(
          (rf) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                '${rf.name}: ${rf.rating} (${rf.score}/10)',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(rf.description),
              pw.SizedBox(height: 8),
            ],
          ),
        ),
      ],
    ),
  );

  pw.Page _buildRemediation(Report report) => pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Remediation Roadmap',
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 16),
        ...[
          ('Immediate (0-7 days)', report.content.remediation.immediate),
          ('Short-term (30 days)', report.content.remediation.shortTerm),
          ('Medium-term (90 days)', report.content.remediation.mediumTerm),
          ('Long-term (180 days)', report.content.remediation.longTerm),
        ].map(
          (e) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                e.$1,
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              ...e.$2.map(
                (a) => pw.Bullet(
                  text:
                      '${a.title} - ${a.responsibleParty} (Due: ${a.targetDate?.toString().split('.')[0] ?? 'TBD'})',
                ),
              ),
              pw.SizedBox(height: 8),
            ],
          ),
        ),
      ],
    ),
  );

  pw.Page _buildAppendices(Report report) => pw.Page(
    build: (context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Appendices',
          style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 16),
        pw.Text(
          'Glossary',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(report.content.appendices.glossary),
        pw.SizedBox(height: 16),
        pw.Text(
          'References',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        ...report.content.appendices.references
            .split('\n')
            .where((reference) => reference.trim().isNotEmpty)
            .map((reference) => pw.Bullet(text: reference)),
      ],
    ),
  );

  int _countPages(ReportContent content) => 7 + content.findings.length;
  int _countWords(ReportContent content) =>
      content.executiveSummary.overview.split(' ').length +
      content.findings.length * 100;

  PdfColor _severityColor(Severity severity) {
    switch (severity) {
      case Severity.critical:
        return PdfColors.red900;
      case Severity.high:
        return PdfColors.red600;
      case Severity.medium:
        return PdfColors.orange600;
      case Severity.low:
        return PdfColors.green600;
      case Severity.info:
        return PdfColors.blue600;
    }
  }

  Future<List<Report>> getReportsByProject(String projectId) {
    return _reportDao.getReportsByProject(projectId);
  }

  Future<List<Report>> getAllReports() => _reportDao.getAllReports();

  Stream<List<Report>> watchAllReports() => _reportDao.watchAllReports();

  Future<Report?> getReport(String id) => _reportDao.getReport(id);

  Future<void> deleteReport(String id) async {
    final report = await _reportDao.getReport(id);
    final filePath = report?.customData['filePath'];
    if (filePath is String && filePath.isNotEmpty) {
      final documents = await getApplicationDocumentsDirectory();
      final reportsPath = p.normalize(
        p.absolute(p.join(documents.path, 'reports')),
      );
      final candidate = p.normalize(p.absolute(filePath));
      if (p.isWithin(reportsPath, candidate)) {
        final file = File(candidate);
        if (await file.exists()) await file.delete();
      } else {
        _logger.w('Ignored report file outside managed report directory');
      }
    }
    await _reportDao.deleteReport(id);
  }
}
