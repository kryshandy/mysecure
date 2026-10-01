import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/models/assessment_models.dart';
import '../../../core/models/project_models.dart';
import '../../../core/models/report_models.dart';
import '../../../core/services/project_service.dart';
import '../../../core/services/report_service.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/extensions/extensions.dart';
import '../../../shared/widgets/main_scaffold.dart';

class ReportListScreen extends ConsumerStatefulWidget {
  const ReportListScreen({super.key});

  @override
  ConsumerState<ReportListScreen> createState() => _ReportListScreenState();
}

class _ReportListScreenState extends ConsumerState<ReportListScreen> {
  String? _selectedProjectId;
  ReportStatus? _statusFilter;
  List<Project> _projects = const [];
  List<Report> _reports = const [];
  Object? _error;
  bool _isLoading = true;
  bool _isGenerating = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadReports);
  }

  Future<void> _loadReports() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _error = null;
      });
    }
    try {
      final projects = await ref.read(projectServiceProvider).getAllProjects();
      final service = ref.read(reportServiceProvider);
      final reports = await service.getAllReports()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      if (!mounted) return;
      setState(() {
        _projects = projects;
        _reports = reports;
        if (_selectedProjectId != null &&
            !projects.any((p) => p.id == _selectedProjectId)) {
          _selectedProjectId = null;
        }
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          PopupMenuButton<ReportStatus?>(
            initialValue: _statusFilter,
            onSelected: (value) => setState(() => _statusFilter = value),
            itemBuilder: (context) => [
              const PopupMenuItem(value: null, child: Text('All Statuses')),
              ...ReportStatus.values.map(
                (status) => PopupMenuItem(
                  value: status,
                  child: Text(_label(status.name)),
                ),
              ),
            ],
            icon: Badge(
              isLabelVisible: _statusFilter != null,
              child: const Icon(Symbols.filter_list),
            ),
            tooltip: 'Filter by status',
          ),
          IconButton(
            icon: const Icon(Symbols.refresh),
            onPressed: _isLoading ? null : _loadReports,
            tooltip: 'Refresh',
          ),
          IconButton(
            icon: const Icon(Symbols.add),
            onPressed: _projects.isEmpty || _isGenerating
                ? null
                : _createReport,
            tooltip: 'Generate Report',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return EmptyState(
        icon: Symbols.error_outline,
        title: 'Reports Could Not Be Loaded',
        message: _friendlyError(_error),
        action: FilledButton.icon(
          onPressed: _loadReports,
          icon: const Icon(Symbols.refresh),
          label: const Text('Retry'),
        ),
      );
    }
    if (_projects.isEmpty) {
      return EmptyState(
        icon: Symbols.folder_off,
        title: 'No Projects',
        message:
            'Create a project and an assessment before generating a report.',
        action: FilledButton.icon(
          onPressed: () => context.go('/projects/create'),
          icon: const Icon(Symbols.add),
          label: const Text('Create Project'),
        ),
      );
    }

    final reports = _reports.where((report) {
      final matchesProject =
          _selectedProjectId == null || report.projectId == _selectedProjectId;
      final matchesStatus =
          _statusFilter == null || report.status == _statusFilter;
      return matchesProject && matchesStatus;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: DropdownButtonFormField<String?>(
            initialValue: _selectedProjectId,
            decoration: const InputDecoration(
              labelText: 'Project',
              prefixIcon: Icon(Symbols.folder),
            ),
            items: [
              const DropdownMenuItem<String?>(
                value: null,
                child: Text('All projects'),
              ),
              ..._projects.map(
                (project) => DropdownMenuItem<String?>(
                  value: project.id,
                  child: Text(project.name),
                ),
              ),
            ],
            onChanged: (value) => setState(() => _selectedProjectId = value),
          ),
        ),
        Expanded(
          child: reports.isEmpty
              ? EmptyState(
                  icon: Symbols.description,
                  title: 'No Reports',
                  message: _statusFilter == null
                      ? 'Generate a report from an assessment.'
                      : 'No report matches the selected filters.',
                  action: _statusFilter != null
                      ? OutlinedButton.icon(
                          onPressed: () => setState(() => _statusFilter = null),
                          icon: const Icon(Symbols.filter_alt_off),
                          label: const Text('Clear Filter'),
                        )
                      : FilledButton.icon(
                          onPressed: _isGenerating ? null : _createReport,
                          icon: const Icon(Symbols.add),
                          label: const Text('Generate Report'),
                        ),
                )
              : RefreshIndicator(
                  onRefresh: _loadReports,
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    itemCount: reports.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => _ReportCard(
                      report: reports[index],
                      projectName: _projectName(reports[index].projectId),
                      onOpen: () => context.push(
                        '/projects/${reports[index].projectId}/reports/${reports[index].id}',
                      ),
                      onDelete: () => _deleteReport(reports[index]),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> _createReport() async {
    final draft = await showDialog<_ReportDraft>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _GenerateReportDialog(
        projects: _projects,
        initialProjectId: _selectedProjectId,
      ),
    );
    if (draft == null || !mounted) return;

    setState(() => _isGenerating = true);
    try {
      final report = await ref
          .read(reportServiceProvider)
          .generateReport(
            projectId: draft.projectId,
            assessmentId: draft.assessmentId,
            title: draft.title,
            type: draft.type,
            format: draft.format,
            template: draft.template,
          );
      await _loadReports();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Report “${report.title}” generated successfully.'),
          action: SnackBarAction(
            label: 'Open',
            onPressed: () => context.push(
              '/projects/${report.projectId}/reports/${report.id}',
            ),
          ),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_friendlyError(error)),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _isGenerating = false);
    }
  }

  Future<void> _deleteReport(Report report) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Report?'),
        content: Text(
          '“${report.title}” will be removed from the report index.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await ref.read(reportServiceProvider).deleteReport(report.id);
      await _loadReports();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_friendlyError(error))));
    }
  }

  String _projectName(String projectId) {
    for (final project in _projects) {
      if (project.id == projectId) return project.name;
    }
    return 'Unknown project';
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
    required this.report,
    required this.projectName,
    required this.onOpen,
    required this.onDelete,
  });

  final Report report;
  final String projectName;
  final VoidCallback onOpen;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final statusColor = _reportStatusColor(report.status);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  report.format == ReportFormat.pdf
                      ? Symbols.picture_as_pdf
                      : Symbols.description,
                  color: statusColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$projectName • ${DateFormat.yMMMd().add_Hm().format(report.createdAt)}',
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        StatusBadge(
                          label: _label(report.status.name),
                          color: statusColor,
                        ),
                        Chip(
                          label: Text(report.format.name.toUpperCase()),
                          visualDensity: VisualDensity.compact,
                        ),
                        Chip(
                          label: Text('${report.metadata.pageCount} pages'),
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'open') onOpen();
                  if (value == 'delete') onDelete();
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'open', child: Text('Open')),
                  PopupMenuDivider(),
                  PopupMenuItem(value: 'delete', child: Text('Delete')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenerateReportDialog extends ConsumerStatefulWidget {
  const _GenerateReportDialog({
    required this.projects,
    required this.initialProjectId,
  });

  final List<Project> projects;
  final String? initialProjectId;

  @override
  ConsumerState<_GenerateReportDialog> createState() =>
      _GenerateReportDialogState();
}

class _GenerateReportDialogState extends ConsumerState<_GenerateReportDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  late String _projectId;
  String? _assessmentId;
  ReportType _type = ReportType.fullPentest;
  ReportFormat _format = ReportFormat.pdf;
  ReportTemplate _template = ReportTemplate.owaspWstg;
  List<Assessment> _assessments = const [];
  bool _loadingAssessments = true;
  Object? _assessmentError;

  @override
  void initState() {
    super.initState();
    _projectId = widget.initialProjectId ?? widget.projects.first.id;
    _loadAssessments();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _loadAssessments() async {
    setState(() {
      _loadingAssessments = true;
      _assessmentError = null;
      _assessmentId = null;
    });
    try {
      final assessments = await ref
          .read(projectServiceProvider)
          .getAssessmentsByProject(_projectId);
      assessments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      if (!mounted) return;
      setState(() {
        _assessments = assessments;
        _assessmentId = assessments.isEmpty ? null : assessments.first.id;
        _loadingAssessments = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _assessmentError = error;
        _loadingAssessments = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Generate Report'),
      content: SizedBox(
        width: 480,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: _projectId,
                  decoration: const InputDecoration(labelText: 'Project'),
                  items: widget.projects
                      .map(
                        (project) => DropdownMenuItem(
                          value: project.id,
                          child: Text(project.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    _projectId = value;
                    _loadAssessments();
                  },
                ),
                const SizedBox(height: 16),
                if (_loadingAssessments)
                  const LinearProgressIndicator()
                else if (_assessmentError != null)
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Assessments could not be loaded.'),
                      ),
                      TextButton(
                        onPressed: _loadAssessments,
                        child: const Text('Retry'),
                      ),
                    ],
                  )
                else
                  DropdownButtonFormField<String>(
                    initialValue: _assessmentId,
                    decoration: const InputDecoration(labelText: 'Assessment'),
                    items: _assessments
                        .map(
                          (assessment) => DropdownMenuItem(
                            value: assessment.id,
                            child: Text(
                              '${assessment.name} — ${_label(assessment.status.name)}',
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => setState(() => _assessmentId = value),
                    validator: (value) => value == null
                        ? 'Select an assessment before continuing.'
                        : null,
                  ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Report title',
                    hintText: 'Security assessment report',
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Enter a report title.'
                      : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ReportType>(
                  initialValue: _type,
                  decoration: const InputDecoration(labelText: 'Report Type'),
                  items: ReportType.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(_label(type.name)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => _type = value ?? _type),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ReportFormat>(
                  initialValue: _format,
                  decoration: const InputDecoration(labelText: 'Format'),
                  items: ReportFormat.values
                      .map(
                        (format) => DropdownMenuItem(
                          value: format,
                          child: Text(format.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _format = value ?? _format),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ReportTemplate>(
                  initialValue: _template,
                  decoration: const InputDecoration(labelText: 'Template'),
                  items: ReportTemplate.values
                      .map(
                        (template) => DropdownMenuItem(
                          value: template,
                          child: Text(_label(template.name)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _template = value ?? _template),
                ),
                if (_assessments.isEmpty && !_loadingAssessments) ...[
                  const SizedBox(height: 16),
                  const Text(
                    'This project has no assessment. Create one before generating a report.',
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _loadingAssessments || _assessments.isEmpty
              ? null
              : () {
                  if (!_formKey.currentState!.validate()) return;
                  Navigator.pop(
                    context,
                    _ReportDraft(
                      projectId: _projectId,
                      assessmentId: _assessmentId!,
                      title: _titleController.text.trim(),
                      type: _type,
                      format: _format,
                      template: _template,
                    ),
                  );
                },
          child: const Text('Generate'),
        ),
      ],
    );
  }
}

class _ReportDraft {
  const _ReportDraft({
    required this.projectId,
    required this.assessmentId,
    required this.title,
    required this.type,
    required this.format,
    required this.template,
  });

  final String projectId;
  final String assessmentId;
  final String title;
  final ReportType type;
  final ReportFormat format;
  final ReportTemplate template;
}

class ReportViewerScreen extends ConsumerWidget {
  const ReportViewerScreen({
    super.key,
    required this.projectId,
    required this.reportId,
  });

  final String projectId;
  final String reportId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report Viewer')),
      body: FutureBuilder<Report?>(
        future: ref.read(reportServiceProvider).getReport(reportId),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return EmptyState(
              icon: Symbols.error_outline,
              title: 'Report Could Not Be Loaded',
              message: _friendlyError(snapshot.error),
            );
          }
          final report = snapshot.data;
          if (report == null || report.projectId != projectId) {
            return const EmptyState(
              icon: Symbols.description,
              title: 'Report Not Found',
              message:
                  'The requested report is unavailable or has been removed.',
            );
          }
          return _ReportViewer(report: report);
        },
      ),
    );
  }
}

class _ReportViewer extends StatelessWidget {
  const _ReportViewer({required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    final summary = report.content.executiveSummary;
    final filePath = report.customData['filePath'] as String?;
    return SelectionArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Symbols.shield,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${_label(report.type.name)} • ${DateFormat.yMMMMd().format(report.generatedAt ?? report.createdAt)}',
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: report.toJson().toString()),
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Report data copied.')),
                  );
                },
                icon: const Icon(Symbols.content_copy),
                tooltip: 'Copy report data',
              ),
              if (filePath != null) ...[
                if (report.format == ReportFormat.pdf)
                  IconButton(
                    onPressed: () => _printReport(context, filePath),
                    icon: const Icon(Symbols.print),
                    tooltip: 'Print or save PDF',
                  ),
                IconButton(
                  onPressed: () => _shareReport(context, filePath),
                  icon: const Icon(Symbols.share),
                  tooltip: 'Share report file',
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              StatusBadge(
                label: _label(report.status.name),
                color: _reportStatusColor(report.status),
              ),
              Chip(label: Text('${report.metadata.pageCount} pages')),
              Chip(label: Text('${report.metadata.wordCount} words')),
              Chip(label: Text(report.metadata.classification)),
            ],
          ),
          const SizedBox(height: 24),
          _ReportSection(
            title: 'Executive Summary',
            child: Text(summary.overview),
          ),
          _ReportSection(
            title: 'Risk Assessment',
            child: Wrap(
              spacing: 24,
              runSpacing: 12,
              children: [
                _Metric(label: 'Rating', value: summary.riskRating),
                _Metric(
                  label: 'Risk score',
                  value: summary.overallRiskScore.toStringAsFixed(1),
                ),
                _Metric(label: 'Findings', value: '${summary.totalFindings}'),
              ],
            ),
          ),
          _ReportSection(
            title: 'Technical Findings',
            child: report.content.findings.isEmpty
                ? const Text('No technical findings were recorded.')
                : Column(
                    children: report.content.findings
                        .map(
                          (finding) => Card(
                            child: ExpansionTile(
                              leading: Icon(
                                AppTheme.severityIcon(finding.severity),
                                color: AppTheme.severityColor(finding.severity),
                              ),
                              title: Text(finding.title),
                              subtitle: Text(
                                '${finding.severity.name.toUpperCase()} • ${finding.affectedComponent}',
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(finding.description),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Recommendation',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),
                                      Text(finding.recommendation),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
          _ReportSection(
            title: 'Methodology',
            child: Text(report.content.methodology.description),
          ),
          _ReportSection(
            title: 'Critical Recommendations',
            child: summary.criticalRecommendations.isEmpty
                ? const Text('No critical recommendations.')
                : Column(
                    children: summary.criticalRecommendations
                        .map(
                          (item) => ListTile(
                            leading: const Icon(Symbols.priority_high),
                            title: Text(item),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _printReport(BuildContext context, String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists())
        throw StateError('The generated PDF is missing.');
      final bytes = await file.readAsBytes();
      await Printing.layoutPdf(onLayout: (_) async => bytes);
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_friendlyError(error))));
    }
  }

  Future<void> _shareReport(BuildContext context, String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw StateError('The generated report file is missing.');
      }
      await SharePlus.instance.share(
        ShareParams(files: [XFile(filePath)], subject: report.title),
      );
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_friendlyError(error))));
    }
  }
}

class _ReportSection extends StatelessWidget {
  const _ReportSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 120),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}

String _label(String value) => value
    .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (m) => '${m[1]} ${m[2]}')
    .replaceAll('_', ' ')
    .capitalize();

String _friendlyError(Object? error) => (error ?? 'Unknown error')
    .toString()
    .replaceFirst(RegExp(r'^(Exception|Bad state):\s*'), '');

Color _reportStatusColor(ReportStatus status) => switch (status) {
  ReportStatus.draft => Colors.grey,
  ReportStatus.generating => Colors.blue,
  ReportStatus.review => Colors.orange,
  ReportStatus.finalized => Colors.green,
  ReportStatus.delivered => Colors.teal,
  ReportStatus.archived => Colors.blueGrey,
};
