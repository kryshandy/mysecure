import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/models/project_models.dart';
import '../../../core/models/assessment_models.dart';
import '../../../core/services/project_service.dart';
import '../../../core/services/report_service.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/widgets/main_scaffold.dart';
import '../../../shared/extensions/extensions.dart';

class ProjectDetailScreen extends ConsumerStatefulWidget {
  final String projectId;

  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  ConsumerState<ProjectDetailScreen> createState() =>
      _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectAsync = ref.watch(projectProvider(widget.projectId));
    final assessmentsAsync = ref.watch(
      assessmentsByProjectProvider(widget.projectId),
    );

    return projectAsync.when(
      data: (project) {
        if (project == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Project Not Found')),
            body: const Center(child: Text('Project not found')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(project.name),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) =>
                    _handleAction(context, ref, value, project),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Symbols.edit, size: 20),
                      title: Text('Edit Project'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  if (project.status != ProjectStatus.active)
                    const PopupMenuItem(
                      value: 'start',
                      child: ListTile(
                        leading: Icon(Symbols.play_arrow, size: 20),
                        title: Text('Start Project'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  if (project.status == ProjectStatus.active)
                    const PopupMenuItem(
                      value: 'complete',
                      child: ListTile(
                        leading: Icon(Symbols.check_circle, size: 20),
                        title: Text('Complete Project'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 'export',
                    child: ListTile(
                      leading: Icon(Symbols.download, size: 20),
                      title: Text('Export Data'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Overview', icon: Icon(Symbols.dashboard, size: 18)),
                Tab(
                  text: 'Assessments',
                  icon: Icon(Symbols.assessment, size: 18),
                ),
                Tab(text: 'Reports', icon: Icon(Symbols.description, size: 18)),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildOverviewTab(project),
              _buildAssessmentsTab(assessmentsAsync),
              _buildReportsTab(project),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () =>
                context.push('/projects/${project.id}/assessments/create'),
            icon: const Icon(Symbols.add),
            label: const Text('New Assessment'),
          ),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildOverviewTab(Project project) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status & Type
          Row(
            children: [
              _StatusTypeCard(project: project),
              const SizedBox(width: 16),
              Expanded(child: _ProgressCard(project: project)),
            ],
          ),
          const SizedBox(height: 16),

          // Key Stats
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Assessments',
                  value: project.assessmentIds.length.toString(),
                  icon: Symbols.assessment,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Team Members',
                  value: project.teamMembers.length.toString(),
                  icon: Symbols.group,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Duration',
                  value: project.startedAt != null
                      ? (project.completedAt ?? DateTime.now())
                            .difference(project.startedAt!)
                            .inDays
                            .toString()
                      : 'Not started',
                  icon: Symbols.schedule,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Client Info
          _SectionCard(
            title: 'Client Information',
            icon: Symbols.person,
            child: Column(
              children: [
                _InfoRow(label: 'Name', value: project.client.name),
                _InfoRow(label: 'Email', value: project.client.contactEmail),
                if (project.client.contactPhone != null)
                  _InfoRow(label: 'Phone', value: project.client.contactPhone!),
                if (project.client.company != null)
                  _InfoRow(label: 'Company', value: project.client.company!),
                if (project.client.address != null)
                  _InfoRow(label: 'Address', value: project.client.address!),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Scope
          _SectionCard(
            title: 'Scope Definition',
            icon: Symbols.my_location,
            child: Column(
              children: [
                if (project.scope.targetNetworks.isNotEmpty)
                  _InfoRow(
                    label: 'Networks',
                    value: project.scope.targetNetworks.join(', '),
                  ),
                if (project.scope.targetDomains.isNotEmpty)
                  _InfoRow(
                    label: 'Domains',
                    value: project.scope.targetDomains.join(', '),
                  ),
                if (project.scope.targetIps.isNotEmpty)
                  _InfoRow(
                    label: 'IP Ranges',
                    value: project.scope.targetIps.join(', '),
                  ),
                if (project.scope.targetSsids.isNotEmpty)
                  _InfoRow(
                    label: 'SSIDs',
                    value: project.scope.targetSsids.join(', '),
                  ),
                if (project.scope.excludedNetworks.isNotEmpty)
                  _InfoRow(
                    label: 'Excluded',
                    value: project.scope.excludedNetworks.join(', '),
                    isWarning: true,
                  ),
                _InfoRow(
                  label: 'Wireless',
                  value: project.scope.wirelessInScope
                      ? 'In Scope'
                      : 'Out of Scope',
                  valueColor: project.scope.wirelessInScope
                      ? Colors.green
                      : Colors.orange,
                ),
                _InfoRow(
                  label: 'Wired',
                  value: project.scope.wiredInScope
                      ? 'In Scope'
                      : 'Out of Scope',
                  valueColor: project.scope.wiredInScope
                      ? Colors.green
                      : Colors.orange,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Authorization
          _SectionCard(
            title: 'Authorization',
            icon: Symbols.verified,
            child: Column(
              children: [
                _InfoRow(
                  label: 'Signed By',
                  value: project.authorization.signedBy,
                ),
                _InfoRow(
                  label: 'Valid From',
                  value: DateFormat(
                    'MMM d, yyyy',
                  ).format(project.authorization.validFrom),
                ),
                _InfoRow(
                  label: 'Valid Until',
                  value: DateFormat(
                    'MMM d, yyyy',
                  ).format(project.authorization.validUntil),
                ),
                _InfoRow(
                  label: 'Status',
                  value: project.authorization.isVerified
                      ? 'Verified'
                      : 'Pending Verification',
                  valueColor: project.authorization.isVerified
                      ? Colors.green
                      : Colors.orange,
                ),
                if (project.authorization.legalEntityId != null)
                  _InfoRow(
                    label: 'Legal Entity',
                    value: project.authorization.legalEntityId!,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Settings
          _SectionCard(
            title: 'Project Settings',
            icon: Symbols.settings,
            child: Column(
              children: [
                _InfoRow(
                  label: 'Default Report Format',
                  value: project.settings.defaultReportFormat.name
                      .toUpperCase(),
                ),
                _InfoRow(label: 'Language', value: project.settings.language),
                _InfoRow(label: 'Timezone', value: project.settings.timezone),
                _InfoRow(
                  label: 'Auto Generate Reports',
                  value: project.settings.autoGenerateReports
                      ? 'Enabled'
                      : 'Disabled',
                  valueColor: project.settings.autoGenerateReports
                      ? Colors.green
                      : Colors.orange,
                ),
                _InfoRow(
                  label: 'Enabled Plugins',
                  value: project.settings.enabledPlugins.join(', '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssessmentsTab(AsyncValue<List<Assessment>> assessmentsAsync) {
    return assessmentsAsync.when(
      data: (assessments) {
        if (assessments.isEmpty) {
          return EmptyState(
            icon: Symbols.assessment,
            title: 'No Assessments',
            message: 'Create your first assessment for this project',
            action: FilledButton.icon(
              icon: const Icon(Symbols.add),
              label: const Text('Create Assessment'),
              onPressed: () => context.push(
                '/projects/${widget.projectId}/assessments/create',
              ),
            ),
          );
        }

        assessments.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: assessments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final assessment = assessments[index];
            return _AssessmentCard(
              assessment: assessment,
              onTap: () => context.push(
                '/projects/${widget.projectId}/assessments/${assessment.id}',
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildReportsTab(Project project) {
    final reportsAsync = ref.watch(reportsProvider);
    return reportsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => EmptyState(
        icon: Symbols.error_outline,
        title: 'Reports Could Not Be Loaded',
        message: error.toString(),
      ),
      data: (allReports) {
        final reports = allReports
            .where((report) => report.projectId == project.id)
            .toList();
        if (reports.isEmpty) {
          return EmptyState(
            icon: Symbols.description,
            title: 'No Reports Yet',
            message: 'Generate a report after creating an assessment.',
            action: FilledButton.icon(
              onPressed: () => context.push('/reports'),
              icon: const Icon(Symbols.add),
              label: const Text('Generate Report'),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: reports.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final report = reports[index];
            return Card(
              child: ListTile(
                leading: Icon(
                  report.format == ReportFormat.pdf
                      ? Symbols.picture_as_pdf
                      : Symbols.description,
                ),
                title: Text(report.title),
                subtitle: Text(
                  '${report.format.name.toUpperCase()} • '
                  '${DateFormat.yMMMd().add_Hm().format(report.createdAt)}',
                ),
                trailing: const Icon(Symbols.chevron_right),
                onTap: () => context.push(
                  '/projects/${project.id}/reports/${report.id}',
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _handleAction(
    BuildContext context,
    WidgetRef ref,
    String action,
    Project project,
  ) async {
    final service = ref.read(projectServiceProvider);

    switch (action) {
      case 'start':
        await service.startProject(project.id);
        break;
      case 'complete':
        await service.completeProject(project.id);
        break;
      case 'export':
        try {
          final assessments = await service.getAssessmentsByProject(project.id);
          final reports = await ref
              .read(reportServiceProvider)
              .getReportsByProject(project.id);
          final directory = Directory(
            p.join((await getApplicationDocumentsDirectory()).path, 'exports'),
          );
          await directory.create(recursive: true);
          final safeName = project.name
              .replaceAll(RegExp(r'[^A-Za-z0-9._-]+'), '_')
              .replaceAll(RegExp(r'^\.+'), '');
          final file = File(
            p.join(
              directory.path,
              '${safeName.isEmpty ? 'project' : safeName}_${DateTime.now().millisecondsSinceEpoch}.json',
            ),
          );
          await file.writeAsString(
            const JsonEncoder.withIndent('  ').convert({
              'schemaVersion': 1,
              'exportedAt': DateTime.now().toIso8601String(),
              'project': project.toJson(),
              'assessments': assessments.map((item) => item.toJson()).toList(),
              'reports': reports.map((item) => item.toJson()).toList(),
            }),
            flush: true,
          );
          await SharePlus.instance.share(
            ShareParams(
              files: [XFile(file.path)],
              subject: 'mySecure project export: ${project.name}',
            ),
          );
        } on Object catch (error) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Project export failed: $error'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
        break;
    }
  }
}

class _StatusTypeCard extends StatelessWidget {
  final Project project;

  const _StatusTypeCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = AppTheme.projectStatusColor(project.status);
    final typeColor = _getTypeColor(project.type);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: typeColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getTypeIcon(project.type),
                    color: typeColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.type.name.capitalize().replaceAll('_', ' '),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: typeColor,
                        ),
                      ),
                      Text(
                        project.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: statusColor.withValues(alpha: 0.5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getStatusIcon(project.status),
                    size: 16,
                    color: statusColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    project.status.name.capitalize().replaceAll('_', ' '),
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(ProjectType type) {
    switch (type) {
      case ProjectType.wifiAudit:
        return Colors.blue;
      case ProjectType.networkPentest:
        return Colors.purple;
      case ProjectType.webAppPentest:
        return Colors.green;
      case ProjectType.mobilePentest:
        return Colors.orange;
      case ProjectType.cloudAudit:
        return Colors.cyan;
      case ProjectType.redTeam:
        return Colors.red;
      case ProjectType.compliance:
        return Colors.indigo;
      case ProjectType.custom:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(ProjectType type) {
    switch (type) {
      case ProjectType.wifiAudit:
        return Symbols.wifi;
      case ProjectType.networkPentest:
        return Symbols.router;
      case ProjectType.webAppPentest:
        return Symbols.web;
      case ProjectType.mobilePentest:
        return Symbols.phone_android;
      case ProjectType.cloudAudit:
        return Symbols.cloud;
      case ProjectType.redTeam:
        return Symbols.shield_person;
      case ProjectType.compliance:
        return Symbols.gavel;
      case ProjectType.custom:
        return Symbols.settings;
    }
  }

  IconData _getStatusIcon(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.draft:
        return Symbols.edit_note;
      case ProjectStatus.planning:
        return Symbols.schedule;
      case ProjectStatus.active:
        return Symbols.play_circle;
      case ProjectStatus.onHold:
        return Symbols.pause_circle;
      case ProjectStatus.completed:
        return Symbols.check_circle;
      case ProjectStatus.archived:
        return Symbols.archive;
    }
  }
}

class _ProgressCard extends StatelessWidget {
  final Project project;

  const _ProgressCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Timeline',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _TimelineItem(
              label: 'Created',
              time: project.createdAt,
              icon: Symbols.add_circle,
              color: theme.colorScheme.primary,
              isFirst: true,
            ),
            if (project.startedAt != null)
              _TimelineItem(
                label: 'Started',
                time: project.startedAt!,
                icon: Symbols.play_circle,
                color: Colors.green,
              ),
            if (project.completedAt != null)
              _TimelineItem(
                label: 'Completed',
                time: project.completedAt!,
                icon: Symbols.check_circle,
                color: Colors.blue,
                isLast: true,
              )
            else if (project.startedAt != null)
              _TimelineItem(
                label: 'In Progress',
                time: DateTime.now(),
                icon: Symbols.timelapse,
                color: Colors.orange,
                isLast: true,
                isCurrent: true,
              )
            else
              _TimelineItem(
                label: 'Pending Start',
                time: DateTime.now(),
                icon: Symbols.schedule,
                color: theme.colorScheme.onSurfaceVariant,
                isLast: true,
              ),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String label;
  final DateTime time;
  final IconData icon;
  final Color color;
  final bool isFirst;
  final bool isLast;
  final bool isCurrent;

  const _TimelineItem({
    required this.label,
    required this.time,
    required this.icon,
    required this.color,
    this.isFirst = false,
    this.isLast = false,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (!isFirst)
              Container(
                width: 2,
                height: 16,
                color: Theme.of(context).colorScheme.outline,
              ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isCurrent
                    ? Theme.of(context).colorScheme.surface
                    : color,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
              ),
            ),
            if (!isLast)
              Expanded(
                child: Container(
                  width: 2,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    color: isCurrent
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
                Text(
                  time.toShortString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool isWarning;

  const _InfoRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color:
                    valueColor ??
                    (isWarning ? Colors.orange : theme.colorScheme.onSurface),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AssessmentCard extends StatelessWidget {
  final Assessment assessment;
  final VoidCallback onTap;

  const _AssessmentCard({required this.assessment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = AppTheme.assessmentStatusColor(assessment.status);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _getTypeColor(
                        assessment.type,
                      ).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getTypeIcon(assessment.type),
                      color: _getTypeColor(assessment.type),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          assessment.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          assessment.type.name.capitalize().replaceAll(
                            '_',
                            ' ',
                          ),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusBadge(
                    label: assessment.status.name.capitalize().replaceAll(
                      '_',
                      ' ',
                    ),
                    color: statusColor,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _InfoChip(
                    icon: Symbols.calendar_today,
                    label: 'Created ${assessment.createdAt.toRelativeString()}',
                  ),
                  const SizedBox(width: 8),
                  if (assessment.startedAt != null)
                    _InfoChip(
                      icon: Symbols.play_arrow,
                      label:
                          'Started ${assessment.startedAt!.toRelativeString()}',
                    ),
                  const SizedBox(width: 8),
                  if (assessment.completedAt != null)
                    _InfoChip(
                      icon: Symbols.check_circle,
                      label:
                          'Completed ${assessment.completedAt!.toRelativeString()}',
                    ),
                  if (assessment.totalDuration.inMinutes > 0)
                    _InfoChip(
                      icon: Symbols.timer,
                      label: '${assessment.totalDuration.inMinutes} min',
                    ),
                ],
              ),
              if (assessment.progress.overall > 0) ...[
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: assessment.progress.overall,
                  backgroundColor: theme.colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                ),
                const SizedBox(height: 4),
                Text(
                  '${(assessment.progress.overall * 100).toStringAsFixed(0)}% complete',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(AssessmentType type) {
    switch (type) {
      case AssessmentType.wifiRecon:
        return Colors.blue;
      case AssessmentType.wifiVulnScan:
        return Colors.purple;
      case AssessmentType.wifiExploitation:
        return Colors.red;
      case AssessmentType.networkDiscovery:
        return Colors.cyan;
      case AssessmentType.portScan:
        return Colors.teal;
      case AssessmentType.serviceEnum:
        return Colors.indigo;
      case AssessmentType.vulnScan:
        return Colors.orange;
      case AssessmentType.webCrawl:
        return Colors.green;
      case AssessmentType.webVulnScan:
        return Colors.lightGreen;
      case AssessmentType.apiTest:
        return Colors.deepPurple;
      case AssessmentType.credentialTest:
        return Colors.amber;
      case AssessmentType.postExploitation:
        return Colors.deepOrange;
      case AssessmentType.custom:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(AssessmentType type) {
    switch (type) {
      case AssessmentType.wifiRecon:
        return Symbols.radar;
      case AssessmentType.wifiVulnScan:
        return Symbols.security;
      case AssessmentType.wifiExploitation:
        return Symbols.bug_report;
      case AssessmentType.networkDiscovery:
        return Symbols.router;
      case AssessmentType.portScan:
        return Symbols.settings_ethernet;
      case AssessmentType.serviceEnum:
        return Symbols.list_alt;
      case AssessmentType.vulnScan:
        return Symbols.bug_report;
      case AssessmentType.webCrawl:
        return Symbols.web;
      case AssessmentType.webVulnScan:
        return Symbols.shield_lock;
      case AssessmentType.apiTest:
        return Symbols.api;
      case AssessmentType.credentialTest:
        return Symbols.key;
      case AssessmentType.postExploitation:
        return Symbols.arrow_forward_ios;
      case AssessmentType.custom:
        return Symbols.settings;
    }
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: colors.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
