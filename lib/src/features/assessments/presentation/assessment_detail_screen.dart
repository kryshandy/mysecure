import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import '../../../core/models/assessment_models.dart';
import '../../../core/models/project_models.dart';
import '../../../core/models/report_models.dart';
import '../../../core/models/wifi_models.dart';
import '../../../core/services/assessment_service.dart';
import '../../../core/services/report_service.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/extensions/extensions.dart';
import '../../../shared/widgets/main_scaffold.dart';

class AssessmentDetailScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String assessmentId;

  const AssessmentDetailScreen({
    super.key,
    required this.projectId,
    required this.assessmentId,
  });

  @override
  ConsumerState<AssessmentDetailScreen> createState() =>
      _AssessmentDetailScreenState();
}

class _AssessmentDetailScreenState extends ConsumerState<AssessmentDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Assessment? _assessment;
  StreamSubscription<AssessmentEvent>? _eventSubscription;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _loadAssessment();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _eventSubscription?.cancel();
    super.dispose();
  }

  Future<void> _loadAssessment() async {
    final service = ref.read(assessmentServiceProvider);
    final assessment = await service.getAssessment(widget.assessmentId);
    if (mounted) {
      setState(() => _assessment = assessment);
      if (assessment != null && assessment.status == AssessmentStatus.running) {
        _eventSubscription = service.eventStream.listen((event) {
          // Handle real-time events
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_assessment == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final assessment = _assessment!;
    return Scaffold(
      appBar: AppBar(
        title: Text(assessment.name),
        actions: [
          if (assessment.status == AssessmentStatus.running) ...[
            IconButton(
              icon: const Icon(Symbols.pause),
              onPressed: () => _pauseAssessment(),
              tooltip: 'Pause',
            ),
          ] else if (assessment.status == AssessmentStatus.paused) ...[
            IconButton(
              icon: const Icon(Symbols.play_arrow),
              onPressed: () => _resumeAssessment(),
              tooltip: 'Resume',
            ),
          ],
          if (assessment.status == AssessmentStatus.running ||
              assessment.status == AssessmentStatus.paused)
            IconButton(
              icon: const Icon(Symbols.stop),
              onPressed: () => _stopAssessment(),
              tooltip: 'Stop',
            ),
          PopupMenuButton<String>(
            onSelected: _handleAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'add_phase',
                child: ListTile(
                  leading: Icon(Symbols.add, size: 20),
                  title: Text('Add Phase'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'generate_report',
                child: ListTile(
                  leading: Icon(Symbols.description, size: 20),
                  title: Text('Generate Report'),
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
          isScrollable: true,
          tabs: const [
            Tab(text: 'Live View', icon: Icon(Symbols.dashboard, size: 18)),
            Tab(text: 'Phases', icon: Icon(Symbols.segment, size: 18)),
            Tab(text: 'Findings', icon: Icon(Symbols.bug_report, size: 18)),
            Tab(text: 'Evidence', icon: Icon(Symbols.folder, size: 18)),
            Tab(text: 'Events', icon: Icon(Symbols.history, size: 18)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLiveViewTab(assessment),
          _buildPhasesTab(assessment),
          _buildFindingsTab(assessment),
          _buildEvidenceTab(assessment),
          _buildEventsTab(assessment),
        ],
      ),
    );
  }

  Widget _buildLiveViewTab(Assessment assessment) {
    final statusColor = AppTheme.assessmentStatusColor(assessment.status);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getStatusIcon(assessment.status),
                      color: statusColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          assessment.name,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          assessment.type.name.capitalize().replaceAll(
                            '_',
                            ' ',
                          ),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      StatusBadge(
                        label: assessment.status.name.capitalize().replaceAll(
                          '_',
                          ' ',
                        ),
                        color: statusColor,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${(assessment.progress.overall * 100).toStringAsFixed(1)}%',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: statusColor,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Progress
          if (assessment.status == AssessmentStatus.running) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Overall Progress',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${(assessment.progress.overall * 100).toStringAsFixed(1)}%',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: statusColor,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: assessment.progress.overall,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.surfaceVariant,
                      valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      minHeight: 8,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Phase ${assessment.progress.currentPhaseIndex + 1} of ${assessment.phases.length}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...assessment.phases.asMap().entries.map((entry) {
                      final index = entry.key;
                      final phase = entry.value;
                      final isCurrent =
                          index == assessment.progress.currentPhaseIndex;
                      return _PhaseProgressItem(
                        phase: phase,
                        isCurrent: isCurrent,
                        progress:
                            assessment.progress.phaseProgress[phase.id] ?? 0.0,
                      );
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Stats
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Phases',
                  value: '${assessment.phases.length}',
                  icon: Symbols.segment,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Tasks',
                  value:
                      '${assessment.progress.completedTasks}/${assessment.progress.totalTasks}',
                  icon: Symbols.task_alt,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Findings',
                  value: '${assessment.findingIds.length}',
                  icon: Symbols.bug_report,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Evidence',
                  value: '${assessment.evidenceIds.length}',
                  icon: Symbols.save,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Current Phase Detail
          if (assessment.phases.isNotEmpty &&
              assessment.progress.currentPhaseIndex <
                  assessment.phases.length) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Current Phase',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        StatusBadge(
                          label: assessment
                              .phases[assessment.progress.currentPhaseIndex]
                              .status
                              .name
                              .capitalize(),
                          color: _getPhaseStatusColor(
                            assessment
                                .phases[assessment.progress.currentPhaseIndex]
                                .status,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...assessment
                        .phases[assessment.progress.currentPhaseIndex]
                        .tasks
                        .map(
                          (task) => _TaskListItem(
                            task: task,
                            onTap: () => _showTaskDetails(task),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPhasesTab(Assessment assessment) {
    if (assessment.phases.isEmpty) {
      return EmptyState(
        icon: Symbols.segment,
        title: 'No Phases Defined',
        message: 'Add phases to structure your assessment workflow',
        action: FilledButton.icon(
          icon: const Icon(Symbols.add),
          label: const Text('Add Phase'),
          onPressed: _addPhase,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: assessment.phases.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final phase = assessment.phases[index];
        final isCurrent = index == assessment.progress.currentPhaseIndex;
        return Card(
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: isCurrent
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceVariant,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: isCurrent
                      ? Colors.white
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              phase.name,
              style: TextStyle(
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              '${phase.tasks.length} tasks • ${phase.status.name.capitalize()}',
            ),
            trailing: StatusBadge(
              label: phase.status.name.capitalize(),
              color: _getPhaseStatusColor(phase.status),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phase.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    ...phase.tasks.map(
                      (task) => _TaskListItem(
                        task: task,
                        onTap: () => _showTaskDetails(task),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        icon: const Icon(Symbols.add),
                        label: const Text('Add Task'),
                        onPressed: () => _addTask(phase.id),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFindingsTab(Assessment assessment) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Symbols.bug_report, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text('Findings', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '${assessment.findingIds.length} findings discovered',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            icon: const Icon(Symbols.add),
            label: const Text('Add Finding'),
            onPressed: _addFinding,
          ),
        ],
      ),
    );
  }

  Widget _buildEvidenceTab(Assessment assessment) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Symbols.folder, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text('Evidence', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '${assessment.evidenceIds.length} evidence items collected',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            icon: const Icon(Symbols.upload),
            label: const Text('Upload Evidence'),
            onPressed: _uploadEvidence,
          ),
        ],
      ),
    );
  }

  Widget _buildEventsTab(Assessment assessment) {
    return StreamBuilder<List<AssessmentEvent>>(
      stream: ref.read(assessmentServiceProvider).watchEvents(assessment.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final events = snapshot.data!;
        if (events.isEmpty) {
          return EmptyState(
            icon: Symbols.history,
            title: 'No Events Yet',
            message: 'Assessment events will appear here in real-time',
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: events.length,
          separatorBuilder: (_, __) => const SizedBox(height: 4),
          itemBuilder: (context, index) {
            final event = events[index];
            return ListTile(
              dense: true,
              leading: Icon(
                _eventIcon(event.type),
                size: 20,
                color: _eventColor(event.level),
              ),
              title: Text(
                event.message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                '${event.timestamp.toShortString()} • ${event.level.name}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              trailing: event.phaseId != null || event.taskId != null
                  ? Text(
                      'Phase: ${event.phaseId ?? '-'} Task: ${event.taskId ?? '-'}',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  : null,
            );
          },
        );
      },
    );
  }

  void _handleAction(String action) {
    switch (action) {
      case 'add_phase':
        unawaited(_addPhase());
        break;
      case 'generate_report':
        unawaited(_generateReport());
        break;
      case 'export':
        unawaited(_exportData());
        break;
    }
  }

  Future<void> _pauseAssessment() async {
    await ref
        .read(assessmentServiceProvider)
        .pauseAssessment(widget.assessmentId);
    _loadAssessment();
  }

  Future<void> _resumeAssessment() async {
    await ref
        .read(assessmentServiceProvider)
        .resumeAssessment(widget.assessmentId);
    _loadAssessment();
  }

  Future<void> _stopAssessment() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stop Assessment'),
        content: const Text(
          'Are you sure you want to stop this assessment? Progress will be saved.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Stop'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref
          .read(assessmentServiceProvider)
          .completeAssessment(widget.assessmentId);
      _loadAssessment();
    }
  }

  Future<void> _addPhase() async {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final phase = await showDialog<AssessmentPhase>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Phase'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Phase Name'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter a phase name'
                    : null,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter a description'
                    : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              Navigator.pop(
                context,
                AssessmentPhase(
                  id: const Uuid().v4(),
                  name: nameController.text.trim(),
                  description: descriptionController.text.trim(),
                  status: PhaseStatus.pending,
                  startedAt: null,
                  completedAt: null,
                ),
              );
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
    nameController.dispose();
    descriptionController.dispose();
    if (phase == null || !mounted) return;

    try {
      await ref
          .read(assessmentServiceProvider)
          .addPhase(widget.assessmentId, phase);
      await _loadAssessment();
      if (!mounted) return;
      _showMessage('Phase "${phase.name}" added');
    } on Object catch (error) {
      if (!mounted) return;
      _showError('Unable to add the phase', error);
    }
  }

  Future<void> _addTask(String phaseId) async {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final pluginController = TextEditingController();
    final task = await showDialog<AssessmentTask>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Task'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Task Name'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter a task name'
                    : null,
              ),
              TextFormField(
                controller: pluginController,
                decoration: const InputDecoration(
                  labelText: 'Plugin or tool identifier',
                  hintText: 'manual',
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter the plugin or tool identifier'
                    : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              Navigator.pop(
                context,
                AssessmentTask(
                  id: const Uuid().v4(),
                  name: nameController.text.trim(),
                  pluginId: pluginController.text.trim(),
                  status: TaskStatus.pending,
                  startedAt: null,
                  completedAt: null,
                ),
              );
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
    nameController.dispose();
    pluginController.dispose();
    if (task == null || !mounted) return;

    try {
      await ref
          .read(assessmentServiceProvider)
          .addTask(widget.assessmentId, phaseId, task);
      await _loadAssessment();
      if (!mounted) return;
      _showMessage('Task "${task.name}" added');
    } on Object catch (error) {
      if (!mounted) return;
      _showError('Unable to add the task', error);
    }
  }

  Future<void> _showTaskDetails(AssessmentTask task) async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task.name),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _detailRow('Status', task.status.name.capitalize()),
                _detailRow('Plugin / tool', task.pluginId),
                _detailRow(
                  'Started',
                  task.startedAt?.toShortString() ?? 'Not started',
                ),
                _detailRow(
                  'Completed',
                  task.completedAt?.toShortString() ?? 'Not completed',
                ),
                _detailRow('Retries', task.retryCount.toString()),
                _detailRow('Evidence', task.evidenceIds.length.toString()),
                _detailRow('Findings', task.findingIds.length.toString()),
                if (task.errorMessage?.trim().isNotEmpty ?? false)
                  _detailRow('Error', task.errorMessage!),
                if (task.input.isNotEmpty)
                  _detailRow(
                    'Input',
                    const JsonEncoder.withIndent('  ').convert(task.input),
                  ),
                if (task.output.isNotEmpty)
                  _detailRow(
                    'Output',
                    const JsonEncoder.withIndent('  ').convert(task.output),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void> _addFinding() async {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final targetController = TextEditingController();
    final descriptionController = TextEditingController();
    final recommendationController = TextEditingController();
    final scoreController = TextEditingController(text: '0.0');
    final vectorController = TextEditingController();
    var type = FindingType.vulnerability;
    var severity = Severity.medium;

    final finding = await showDialog<Finding>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Finding'),
          content: SizedBox(
            width: 560,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: titleController,
                      autofocus: true,
                      decoration: const InputDecoration(labelText: 'Title'),
                      validator: _requiredText,
                    ),
                    TextFormField(
                      controller: targetController,
                      decoration: const InputDecoration(
                        labelText: 'Affected target',
                      ),
                      validator: _requiredText,
                    ),
                    DropdownButtonFormField<FindingType>(
                      initialValue: type,
                      decoration: const InputDecoration(labelText: 'Type'),
                      items: FindingType.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(
                                value.name.capitalize().replaceAll('_', ' '),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setDialogState(() => type = value);
                        }
                      },
                    ),
                    DropdownButtonFormField<Severity>(
                      initialValue: severity,
                      decoration: const InputDecoration(labelText: 'Severity'),
                      items: Severity.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value.name.capitalize()),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setDialogState(() => severity = value);
                        }
                      },
                    ),
                    TextFormField(
                      controller: scoreController,
                      decoration: const InputDecoration(
                        labelText: 'CVSS base score',
                        hintText: '0.0 - 10.0',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) {
                        final score = double.tryParse(value?.trim() ?? '');
                        if (score == null || score < 0 || score > 10) {
                          return 'Enter a score between 0 and 10';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: vectorController,
                      decoration: const InputDecoration(
                        labelText: 'CVSS vector',
                        hintText: 'CVSS:3.1/... (optional)',
                      ),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      maxLines: 3,
                      validator: _requiredText,
                    ),
                    TextFormField(
                      controller: recommendationController,
                      decoration: const InputDecoration(
                        labelText: 'Recommendation',
                      ),
                      maxLines: 3,
                      validator: _requiredText,
                    ),
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
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                final score = double.parse(scoreController.text.trim());
                Navigator.pop(
                  context,
                  Finding(
                    id: const Uuid().v4(),
                    assessmentId: widget.assessmentId,
                    type: type,
                    severity: severity,
                    title: titleController.text.trim(),
                    description: descriptionController.text.trim(),
                    recommendation: recommendationController.text.trim(),
                    affectedTarget: targetController.text.trim(),
                    cvss: CvssVector(
                      vectorString: vectorController.text.trim().isEmpty
                          ? 'Not calculated'
                          : vectorController.text.trim(),
                      baseScore: score,
                      temporalScore: score,
                      environmentalScore: score,
                    ),
                    discoveredAt: DateTime.now(),
                    verifiedAt: null,
                  ),
                );
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
    titleController.dispose();
    targetController.dispose();
    descriptionController.dispose();
    recommendationController.dispose();
    scoreController.dispose();
    vectorController.dispose();
    if (finding == null || !mounted) return;

    try {
      await ref
          .read(assessmentServiceProvider)
          .addFinding(widget.assessmentId, finding);
      await _loadAssessment();
      if (!mounted) return;
      _showMessage('Finding "${finding.title}" added');
    } on Object catch (error) {
      if (!mounted) return;
      _showError('Unable to add the finding', error);
    }
  }

  Future<void> _uploadEvidence() async {
    List<PlatformFile> selection;
    try {
      selection = await FilePicker.pickFiles();
    } on Object catch (error) {
      if (!mounted) return;
      _showError('Unable to select a file', error);
      return;
    }
    if (selection.isEmpty || !mounted) return;

    final selected = selection.single;
    final descriptionController = TextEditingController();
    var type = _evidenceTypeForExtension(selected.extension);
    final metadata =
        await showDialog<({EvidenceType type, String description})>(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setDialogState) => AlertDialog(
              title: Text('Add ${selected.name}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<EvidenceType>(
                    initialValue: type,
                    decoration: const InputDecoration(
                      labelText: 'Evidence Type',
                    ),
                    items: EvidenceType.values
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.name.capitalize()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) setDialogState(() => type = value);
                    },
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(context, (
                    type: type,
                    description: descriptionController.text.trim(),
                  )),
                  child: const Text('Import'),
                ),
              ],
            ),
          ),
        );
    descriptionController.dispose();
    if (metadata == null || !mounted) return;

    File? storedFile;
    var evidencePersisted = false;
    try {
      if (selected.path == null) {
        throw const FileSystemException('The selected file cannot be read');
      }

      final evidenceId = const Uuid().v4();
      final documents = await getApplicationDocumentsDirectory();
      final evidenceDirectory = Directory(
        path.join(documents.path, 'evidence', widget.assessmentId),
      );
      await evidenceDirectory.create(recursive: true);
      storedFile = File(
        path.join(
          evidenceDirectory.path,
          '${evidenceId}_${_safeFileName(selected.name)}',
        ),
      );
      await File(selected.path!).copy(storedFile.path);
      final digest = await sha256.bind(storedFile.openRead()).first;
      final sizeBytes = await storedFile.length();

      final evidence = Evidence(
        id: evidenceId,
        assessmentId: widget.assessmentId,
        type: metadata.type,
        name: selected.name,
        description: metadata.description,
        filePath: storedFile.path,
        hashSha256: digest.toString(),
        sizeBytes: sizeBytes,
        capturedAt: DateTime.now(),
        capturedBy: 'local-user',
        metadata: {
          if (selected.extension != null) 'extension': selected.extension,
          'originalName': selected.name,
        },
      );
      await ref
          .read(assessmentServiceProvider)
          .addEvidence(widget.assessmentId, evidence);
      evidencePersisted = true;
      await _loadAssessment();
      if (!mounted) return;
      _showMessage('Evidence "${selected.name}" imported and hashed');
    } on Object catch (error) {
      if (!evidencePersisted && storedFile != null) {
        try {
          if (await storedFile.exists()) await storedFile.delete();
        } on Object {
          // Preserve the original error; orphan cleanup is best effort.
        }
      }
      if (!mounted) return;
      _showError('Unable to import the evidence', error);
    }
  }

  Future<void> _generateReport() async {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController(
      text: '${_assessment?.name ?? 'Assessment'} Report',
    );
    var type = ReportType.fullPentest;
    var format = ReportFormat.pdf;
    var template = ReportTemplate.ptes;
    final options =
        await showDialog<
          ({
            String title,
            ReportType type,
            ReportFormat format,
            ReportTemplate template,
          })
        >(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setDialogState) => AlertDialog(
              title: const Text('Generate Report'),
              content: SizedBox(
                width: 520,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: titleController,
                        autofocus: true,
                        decoration: const InputDecoration(labelText: 'Title'),
                        validator: _requiredText,
                      ),
                      DropdownButtonFormField<ReportType>(
                        initialValue: type,
                        decoration: const InputDecoration(
                          labelText: 'Report Type',
                        ),
                        items: ReportType.values
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value.name.capitalize().replaceAll('_', ' '),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) setDialogState(() => type = value);
                        },
                      ),
                      DropdownButtonFormField<ReportFormat>(
                        initialValue: format,
                        decoration: const InputDecoration(labelText: 'Format'),
                        items: ReportFormat.values
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null)
                            setDialogState(() => format = value);
                        },
                      ),
                      DropdownButtonFormField<ReportTemplate>(
                        initialValue: template,
                        decoration: const InputDecoration(
                          labelText: 'Template',
                        ),
                        items: ReportTemplate.values
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value.name.capitalize().replaceAll('_', ' '),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setDialogState(() => template = value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;
                    Navigator.pop(context, (
                      title: titleController.text.trim(),
                      type: type,
                      format: format,
                      template: template,
                    ));
                  },
                  child: const Text('Generate'),
                ),
              ],
            ),
          ),
        );
    titleController.dispose();
    if (options == null || !mounted) return;

    try {
      _showMessage('Generating report…');
      final report = await ref
          .read(reportServiceProvider)
          .generateReport(
            projectId: widget.projectId,
            assessmentId: widget.assessmentId,
            title: options.title,
            type: options.type,
            format: options.format,
            template: options.template,
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Report "${report.title}" generated'),
          action: SnackBarAction(
            label: 'Open',
            onPressed: () => context.goNamed(
              'report-viewer',
              pathParameters: {
                'projectId': widget.projectId,
                'reportId': report.id,
              },
            ),
          ),
        ),
      );
    } on Object catch (error) {
      if (!mounted) return;
      _showError('Unable to generate the report', error);
    }
  }

  Future<void> _exportData() async {
    final assessment = _assessment;
    if (assessment == null) {
      _showMessage('Assessment data is not loaded yet');
      return;
    }

    try {
      final service = ref.read(assessmentServiceProvider);
      final findingsFuture = service.getFindings(widget.assessmentId);
      final evidenceFuture = service.getEvidence(widget.assessmentId);
      final eventsFuture = service
          .watchEvents(widget.assessmentId)
          .first
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () => <AssessmentEvent>[],
          );
      final findings = await findingsFuture;
      final evidence = await evidenceFuture;
      final events = await eventsFuture;
      final export = {
        'exportedAt': DateTime.now().toUtc().toIso8601String(),
        'schemaVersion': 1,
        'assessment': assessment.toJson(),
        'findings': findings.map((item) => item.toJson()).toList(),
        'evidence': evidence.map((item) => item.toJson()).toList(),
        'events': events.map((item) => item.toJson()).toList(),
      };

      final documents = await getApplicationDocumentsDirectory();
      final exportDirectory = Directory(path.join(documents.path, 'exports'));
      await exportDirectory.create(recursive: true);
      final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final file = File(
        path.join(
          exportDirectory.path,
          '${_safeFileName(assessment.name)}_$timestamp.json',
        ),
      );
      await file.writeAsString(
        const JsonEncoder.withIndent('  ').convert(export),
        flush: true,
      );
      if (!mounted) return;

      try {
        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(file.path, mimeType: 'application/json')],
            subject: '${assessment.name} export',
            text: 'mySecure assessment export',
          ),
        );
        if (!mounted) return;
        _showMessage('Export saved and ready to share');
      } on Object catch (shareError) {
        if (!mounted) return;
        _showError(
          'Export saved to ${file.path}, but sharing failed',
          shareError,
        );
      }
    } on Object catch (error) {
      if (!mounted) return;
      _showError('Unable to export assessment data', error);
    }
  }

  Widget _detailRow(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 2),
        SelectableText(value),
      ],
    ),
  );

  String? _requiredText(String? value) =>
      value == null || value.trim().isEmpty ? 'This field is required' : null;

  EvidenceType _evidenceTypeForExtension(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'pcap':
      case 'pcapng':
        return EvidenceType.pcap;
      case 'cap':
      case 'hccapx':
      case 'hc22000':
        return EvidenceType.handshake;
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'webp':
        return EvidenceType.screenshot;
      case 'log':
        return EvidenceType.log;
      case 'json':
      case 'yaml':
      case 'yml':
      case 'toml':
        return EvidenceType.config;
      default:
        return EvidenceType.other;
    }
  }

  String _safeFileName(String value) {
    final safe = value.trim().replaceAll(RegExp(r'[^A-Za-z0-9._-]+'), '_');
    return safe.replaceAll(RegExp(r'^\.+'), '').replaceAll(RegExp(r'_+'), '_');
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _showError(String message, Object error) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$message: $error'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
  }

  IconData _getStatusIcon(AssessmentStatus status) {
    switch (status) {
      case AssessmentStatus.draft:
        return Symbols.edit_note;
      case AssessmentStatus.queued:
        return Symbols.schedule;
      case AssessmentStatus.initializing:
        return Symbols.settings;
      case AssessmentStatus.running:
        return Symbols.play_circle;
      case AssessmentStatus.paused:
        return Symbols.pause_circle;
      case AssessmentStatus.completed:
        return Symbols.check_circle;
      case AssessmentStatus.failed:
        return Symbols.error;
      case AssessmentStatus.cancelled:
        return Symbols.cancel;
      case AssessmentStatus.archived:
        return Symbols.archive;
    }
  }

  Color _getPhaseStatusColor(PhaseStatus status) {
    switch (status) {
      case PhaseStatus.pending:
        return Colors.grey;
      case PhaseStatus.running:
        return Colors.blue;
      case PhaseStatus.completed:
        return Colors.green;
      case PhaseStatus.failed:
        return Colors.red;
      case PhaseStatus.skipped:
        return Colors.orange;
    }
  }

  IconData _eventIcon(EventType type) {
    switch (type) {
      case EventType.assessmentStarted:
        return Symbols.play_arrow;
      case EventType.assessmentCompleted:
        return Symbols.check_circle;
      case EventType.assessmentFailed:
        return Symbols.error;
      case EventType.phaseStarted:
        return Symbols.segment;
      case EventType.phaseCompleted:
        return Symbols.check_circle;
      case EventType.taskStarted:
        return Symbols.play_arrow;
      case EventType.taskCompleted:
        return Symbols.check;
      case EventType.taskFailed:
        return Symbols.error;
      case EventType.findingDiscovered:
        return Symbols.bug_report;
      case EventType.evidenceCaptured:
        return Symbols.save;
      case EventType.error:
        return Symbols.error;
      default:
        return Symbols.info;
    }
  }

  Color _eventColor(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return Colors.grey;
      case LogLevel.info:
        return Colors.blue;
      case LogLevel.warning:
        return Colors.orange;
      case LogLevel.error:
        return Colors.red;
    }
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

class _PhaseProgressItem extends StatelessWidget {
  final AssessmentPhase phase;
  final bool isCurrent;
  final double progress;

  const _PhaseProgressItem({
    required this.phase,
    required this.isCurrent,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              '${phase.tasks.length}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                color: isCurrent ? Theme.of(context).colorScheme.primary : null,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phase.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isCurrent
                        ? Theme.of(context).colorScheme.primary
                        : Colors.green,
                  ),
                  minHeight: 4,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${(progress * 100).toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskListItem extends StatelessWidget {
  final AssessmentTask task;
  final VoidCallback onTap;

  const _TaskListItem({required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _getTaskStatusColor(task.status);

    return ListTile(
      dense: true,
      onTap: onTap,
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: statusColor.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          _getTaskStatusIcon(task.status),
          color: statusColor,
          size: 16,
        ),
      ),
      title: Text(task.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${task.pluginId} • ${task.duration.toShortString()}'),
      trailing: StatusBadge(
        label: task.status.name.capitalize(),
        color: statusColor,
      ),
    );
  }

  Color _getTaskStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return Colors.grey;
      case TaskStatus.running:
        return Colors.blue;
      case TaskStatus.completed:
        return Colors.green;
      case TaskStatus.failed:
        return Colors.red;
      case TaskStatus.cancelled:
        return Colors.orange;
      case TaskStatus.retrying:
        return Colors.purple;
    }
  }

  IconData _getTaskStatusIcon(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return Symbols.schedule;
      case TaskStatus.running:
        return Symbols.play_arrow;
      case TaskStatus.completed:
        return Symbols.check;
      case TaskStatus.failed:
        return Symbols.close;
      case TaskStatus.cancelled:
        return Symbols.cancel;
      case TaskStatus.retrying:
        return Symbols.refresh;
    }
  }
}
