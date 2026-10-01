import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/models/assessment_models.dart';
import '../../../core/services/project_service.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/extensions/extensions.dart';
import '../../../shared/widgets/main_scaffold.dart';

class AssessmentListScreen extends ConsumerWidget {
  final String? projectId;

  const AssessmentListScreen({super.key, this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assessmentsAsync = projectId == null
        ? ref.watch(allAssessmentsProvider)
        : ref.watch(assessmentsByProjectProvider(projectId!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessments'),
        actions: [
          IconButton(
            icon: const Icon(Symbols.add),
            onPressed: projectId == null
                ? null
                : () => context.push('/projects/$projectId/assessments/create'),
          ),
        ],
      ),
      body: assessmentsAsync.when(
        data: (assessments) {
          if (assessments.isEmpty) {
            return EmptyState(
              icon: Symbols.assessment,
              title: 'No Assessments',
              message: 'Create your first assessment for this project',
              action: FilledButton.icon(
                icon: const Icon(Symbols.add),
                label: const Text('Create Assessment'),
                onPressed: projectId == null
                    ? null
                    : () => context.push(
                        '/projects/$projectId/assessments/create',
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
                  '/projects/${assessment.projectId}/assessments/${assessment.id}',
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
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
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
