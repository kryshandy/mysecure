import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/models/project_models.dart';
import '../../../core/services/project_service.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/widgets/main_scaffold.dart';
import '../../../shared/extensions/extensions.dart';

class ProjectListScreen extends ConsumerStatefulWidget {
  const ProjectListScreen({super.key});

  @override
  ConsumerState<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends ConsumerState<ProjectListScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  ProjectStatus? _statusFilter;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
            icon: const Icon(Symbols.add),
            onPressed: () => context.push('/projects/create'),
            tooltip: 'New Project',
          ),
          PopupMenuButton<ProjectStatus?>(
            initialValue: _statusFilter,
            onSelected: (value) => setState(() => _statusFilter = value),
            itemBuilder: (context) => [
              const PopupMenuItem(value: null, child: Text('All Status')),
              ...ProjectStatus.values.map(
                (s) =>
                    PopupMenuItem(value: s, child: Text(s.name.capitalize())),
              ),
            ],
            icon: _statusFilter != null
                ? Stack(
                    children: [
                      const Icon(Symbols.filter_list),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  )
                : const Icon(Symbols.filter_list),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search projects...',
                prefixIcon: const Icon(Symbols.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Symbols.close),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          // Projects list
          Expanded(
            child: projectsAsync.when(
              data: (projects) {
                var filtered = projects.where((p) {
                  final matchesSearch =
                      _searchQuery.isEmpty ||
                      p.name.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ) ||
                      p.description.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ) ||
                      p.client.name.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      );
                  final matchesStatus =
                      _statusFilter == null || p.status == _statusFilter;
                  return matchesSearch && matchesStatus;
                }).toList();

                filtered.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

                if (filtered.isEmpty) {
                  return EmptyState(
                    icon: Symbols.folder_off,
                    title: _searchQuery.isNotEmpty
                        ? 'No projects found'
                        : 'No projects yet',
                    message: _searchQuery.isNotEmpty
                        ? 'Try adjusting your search or filters'
                        : 'Create your first security assessment project',
                    action: FilledButton.icon(
                      icon: const Icon(Symbols.add),
                      label: const Text('Create Project'),
                      onPressed: () => context.push('/projects/create'),
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final project = filtered[index];
                    return _ProjectCard(project: project);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Symbols.error, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error loading projects: $error'),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => ref.invalidate(projectsProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends ConsumerWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statusColor = AppTheme.projectStatusColor(project.status);

    return Card(
      child: InkWell(
        onTap: () => context.push('/projects/${project.id}'),
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
                        project.type,
                      ).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getTypeIcon(project.type),
                      color: _getTypeColor(project.type),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          project.client.name,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusBadge(
                    label: project.status.name.capitalize(),
                    color: statusColor,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                project.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _InfoChip(
                    icon: Symbols.assignment,
                    label: '${project.assessmentIds.length} assessments',
                  ),
                  const SizedBox(width: 8),
                  _InfoChip(
                    icon: Symbols.calendar_today,
                    label: 'Updated ${project.updatedAt.toRelativeString()}',
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    onSelected: (value) =>
                        _handleAction(context, ref, value, project),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: ListTile(
                          leading: Icon(Symbols.edit, size: 20),
                          title: Text('Edit'),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'duplicate',
                        child: ListTile(
                          leading: Icon(Symbols.content_copy, size: 20),
                          title: Text('Duplicate'),
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
                            title: Text('Mark Complete'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        value: 'delete',
                        child: ListTile(
                          leading: Icon(
                            Symbols.delete,
                            size: 20,
                            color: theme.colorScheme.error,
                          ),
                          title: Text(
                            'Delete',
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                    child: Icon(
                      Symbols.more_vert,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleAction(
    BuildContext context,
    WidgetRef ref,
    String action,
    Project project,
  ) async {
    final service = ref.read(projectServiceProvider);
    final theme = Theme.of(context);

    switch (action) {
      case 'start':
        await service.startProject(project.id);
        break;
      case 'complete':
        await service.completeProject(project.id);
        break;
      case 'delete':
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Project'),
            content: Text(
              'Are you sure you want to delete "${project.name}"? This action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                style: FilledButton.styleFrom(
                  backgroundColor: theme.colorScheme.error,
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
        );
        if (confirmed == true) {
          await service.deleteProject(project.id);
        }
        break;
    }
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
