import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import '../database/database_connection.dart';
import '../database/app_database.dart' as db;
import '../database/daos.dart';
import '../models/assessment_models.dart';

final assessmentServiceProvider = Provider<AssessmentService>((ref) {
  final db = ref.watch(databaseProvider);
  return AssessmentService(
    assessmentDao: db.assessmentDao,
    findingDao: db.findingDao,
    evidenceDao: db.evidenceDao,
    assessmentEventDao: db.assessmentEventDao,
  );
});

class AssessmentService {
  final AssessmentDao _assessmentDao;
  final FindingDao _findingDao;
  final EvidenceDao _evidenceDao;
  final AssessmentEventDao _eventDao;

  final _logger = Logger();

  Assessment? _currentAssessment;
  StreamController<AssessmentEvent>? _eventController;
  Timer? _durationTimer;
  DateTime? _startTime;

  AssessmentService({
    required AssessmentDao assessmentDao,
    required FindingDao findingDao,
    required EvidenceDao evidenceDao,
    required AssessmentEventDao assessmentEventDao,
  }) : _assessmentDao = assessmentDao,
       _findingDao = findingDao,
       _evidenceDao = evidenceDao,
       _eventDao = assessmentEventDao;

  Stream<AssessmentEvent> get eventStream =>
      _eventController?.stream ?? const Stream.empty();

  Future<Assessment?> getAssessment(String assessmentId) =>
      _assessmentDao.getAssessment(assessmentId);

  Future<Assessment> startAssessment(String assessmentId) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');
    if (assessment.status == AssessmentStatus.running) return assessment;
    if (assessment.status != AssessmentStatus.draft &&
        assessment.status != AssessmentStatus.queued) {
      throw StateError('Only draft or queued assessments can be started');
    }

    _currentAssessment = assessment.copyWith(
      status: AssessmentStatus.running,
      startedAt: DateTime.now(),
      pausedAt: null,
    );

    _eventController = StreamController.broadcast();
    _startTime = DateTime.now();

    _durationTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_currentAssessment != null && _startTime != null) {
        _currentAssessment = _currentAssessment!.copyWith(
          totalDuration: DateTime.now().difference(_startTime!),
        );
      }
    });

    await _updateAssessment(_currentAssessment!);
    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.assessmentStarted,
        timestamp: DateTime.now(),
        message: 'Assessment started: ${assessment.name}',
        level: LogLevel.info,
      ),
    );

    return _currentAssessment!;
  }

  Future<Assessment> pauseAssessment(String assessmentId) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');
    if (assessment.status != AssessmentStatus.running) {
      throw StateError('Only a running assessment can be paused');
    }

    _durationTimer?.cancel();

    final liveAssessment = _currentAssessment?.id == assessmentId
        ? _currentAssessment!
        : assessment;
    final elapsed = _startTime == null
        ? liveAssessment.totalDuration
        : DateTime.now().difference(_startTime!);

    _currentAssessment = liveAssessment.copyWith(
      status: AssessmentStatus.paused,
      pausedAt: DateTime.now(),
      totalDuration: elapsed,
    );

    await _updateAssessment(_currentAssessment!);
    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.assessmentPaused,
        timestamp: DateTime.now(),
        message: 'Assessment paused',
        level: LogLevel.info,
      ),
    );

    return _currentAssessment!;
  }

  Future<Assessment> resumeAssessment(String assessmentId) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');
    if (assessment.status != AssessmentStatus.paused) {
      throw StateError('Only a paused assessment can be resumed');
    }

    _currentAssessment = assessment.copyWith(
      status: AssessmentStatus.running,
      pausedAt: null,
    );
    _startTime = DateTime.now().subtract(assessment.totalDuration);

    _durationTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_currentAssessment != null && _startTime != null) {
        _currentAssessment = _currentAssessment!.copyWith(
          totalDuration: DateTime.now().difference(_startTime!),
        );
      }
    });

    await _updateAssessment(_currentAssessment!);
    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.assessmentResumed,
        timestamp: DateTime.now(),
        message: 'Assessment resumed',
        level: LogLevel.info,
      ),
    );

    return _currentAssessment!;
  }

  Future<Assessment> completeAssessment(String assessmentId) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');
    if (assessment.status != AssessmentStatus.running &&
        assessment.status != AssessmentStatus.paused) {
      throw StateError('Only an active assessment can be completed');
    }

    _durationTimer?.cancel();

    final liveAssessment = _currentAssessment?.id == assessmentId
        ? _currentAssessment!
        : assessment;
    final elapsed =
        assessment.status == AssessmentStatus.running && _startTime != null
        ? DateTime.now().difference(_startTime!)
        : liveAssessment.totalDuration;

    final completed = liveAssessment.copyWith(
      status: AssessmentStatus.completed,
      completedAt: DateTime.now(),
      totalDuration: elapsed,
    );

    await _updateAssessment(completed);
    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.assessmentCompleted,
        timestamp: DateTime.now(),
        message: 'Assessment completed',
        level: LogLevel.info,
      ),
    );

    _eventController?.close();
    _currentAssessment = null;
    _startTime = null;

    return completed;
  }

  Future<Assessment> failAssessment(String assessmentId, String error) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');

    _durationTimer?.cancel();

    final failed = assessment.copyWith(
      status: AssessmentStatus.failed,
      completedAt: DateTime.now(),
    );

    await _updateAssessment(failed);
    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.assessmentFailed,
        timestamp: DateTime.now(),
        message: 'Assessment failed: $error',
        level: LogLevel.error,
      ),
    );

    _eventController?.close();
    _currentAssessment = null;

    return failed;
  }

  Future<void> addPhase(String assessmentId, AssessmentPhase phase) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');

    final updated = assessment.copyWith(phases: [...assessment.phases, phase]);
    await _updateAssessment(updated);

    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.phaseStarted,
        timestamp: DateTime.now(),
        message: 'Phase started: ${phase.name}',
        level: LogLevel.info,
        phaseId: phase.id,
      ),
    );
  }

  Future<void> updatePhase(
    String assessmentId,
    String phaseId,
    PhaseStatus status, {
    Map<String, dynamic>? output,
  }) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');

    final phases = assessment.phases.map((p) {
      if (p.id == phaseId) {
        return p.copyWith(
          status: status,
          startedAt: status == PhaseStatus.running
              ? DateTime.now()
              : p.startedAt,
          completedAt:
              status == PhaseStatus.completed || status == PhaseStatus.failed
              ? DateTime.now()
              : p.completedAt,
          output: output ?? p.output,
        );
      }
      return p;
    }).toList();

    final updated = assessment.copyWith(phases: phases);
    await _updateAssessment(updated);

    if (status == PhaseStatus.completed) {
      _emitEvent(
        AssessmentEvent(
          id: const Uuid().v4(),
          assessmentId: assessmentId,
          type: EventType.phaseCompleted,
          timestamp: DateTime.now(),
          message: 'Phase completed',
          level: LogLevel.info,
          phaseId: phaseId,
        ),
      );
    } else if (status == PhaseStatus.failed) {
      _emitEvent(
        AssessmentEvent(
          id: const Uuid().v4(),
          assessmentId: assessmentId,
          type: EventType.error,
          timestamp: DateTime.now(),
          message: 'Phase failed',
          level: LogLevel.error,
          phaseId: phaseId,
        ),
      );
    }
  }

  Future<void> addTask(
    String assessmentId,
    String phaseId,
    AssessmentTask task,
  ) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');

    final phases = assessment.phases.map((p) {
      if (p.id == phaseId) {
        return p.copyWith(tasks: [...p.tasks, task]);
      }
      return p;
    }).toList();

    final updated = assessment.copyWith(phases: phases);
    await _updateAssessment(updated);

    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.taskStarted,
        timestamp: DateTime.now(),
        message: 'Task started: ${task.name}',
        level: LogLevel.info,
        phaseId: phaseId,
        taskId: task.id,
      ),
    );
  }

  Future<void> updateTask(
    String assessmentId,
    String phaseId,
    String taskId,
    TaskStatus status, {
    Map<String, dynamic>? output,
    List<String>? evidenceIds,
    List<String>? findingIds,
    String? errorMessage,
  }) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) throw Exception('Assessment not found');

    final phases = assessment.phases.map((p) {
      if (p.id == phaseId) {
        return p.copyWith(
          tasks: p.tasks.map((t) {
            if (t.id == taskId) {
              return t.copyWith(
                status: status,
                output: output ?? t.output,
                evidenceIds: evidenceIds ?? t.evidenceIds,
                findingIds: findingIds ?? t.findingIds,
                errorMessage: errorMessage ?? t.errorMessage,
                completedAt:
                    status == TaskStatus.completed ||
                        status == TaskStatus.failed
                    ? DateTime.now()
                    : t.completedAt,
              );
            }
            return t;
          }).toList(),
        );
      }
      return p;
    }).toList();

    final updated = assessment.copyWith(phases: phases);
    await _updateAssessment(updated);

    if (status == TaskStatus.completed) {
      _emitEvent(
        AssessmentEvent(
          id: const Uuid().v4(),
          assessmentId: assessmentId,
          type: EventType.taskCompleted,
          timestamp: DateTime.now(),
          message: 'Task completed',
          level: LogLevel.info,
          phaseId: phaseId,
          taskId: taskId,
        ),
      );
    } else if (status == TaskStatus.failed) {
      _emitEvent(
        AssessmentEvent(
          id: const Uuid().v4(),
          assessmentId: assessmentId,
          type: EventType.taskFailed,
          timestamp: DateTime.now(),
          message: 'Task failed: ${errorMessage ?? 'Unknown error'}',
          level: LogLevel.error,
          phaseId: phaseId,
          taskId: taskId,
        ),
      );
    }
  }

  Future<void> addFinding(String assessmentId, Finding finding) async {
    await _findingDao.insertFinding(
      db.FindingsCompanion(
        id: Value(finding.id),
        assessmentId: Value(finding.assessmentId),
        type: Value(finding.type),
        severity: Value(finding.severity),
        title: Value(finding.title),
        description: Value(finding.description),
        recommendation: Value(finding.recommendation),
        affectedTarget: Value(finding.affectedTarget),
        evidence: Value(finding.evidence),
        evidenceIds: Value(finding.evidenceIds),
        cvssVectorJson: Value(finding.cvss),
        discoveredAt: Value(finding.discoveredAt),
        verifiedAt: Value(finding.verifiedAt),
        verified: Value(finding.verified),
        falsePositive: Value(finding.falsePositive),
        references: Value(finding.references),
        metadata: Value(finding.metadata),
      ),
    );

    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment != null) {
      final updated = assessment.copyWith(
        findingIds: [...assessment.findingIds, finding.id],
      );
      await _updateAssessment(updated);
    }

    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.findingDiscovered,
        timestamp: DateTime.now(),
        message: 'Finding: ${finding.title} (${finding.severity.name})',
        level: LogLevel.info,
        data: {'findingId': finding.id, 'severity': finding.severity.name},
      ),
    );
  }

  Future<void> addEvidence(String assessmentId, Evidence evidence) async {
    await _evidenceDao.insertEvidence(
      db.EvidenceCompanion(
        id: Value(evidence.id),
        assessmentId: Value(evidence.assessmentId),
        type: Value(evidence.type),
        name: Value(evidence.name),
        description: Value(evidence.description),
        filePath: Value(evidence.filePath),
        hashSha256: Value(evidence.hashSha256),
        sizeBytes: Value(evidence.sizeBytes),
        capturedAt: Value(evidence.capturedAt),
        capturedBy: Value(evidence.capturedBy),
        metadata: Value(evidence.metadata),
        tags: Value(evidence.tags),
        isEncrypted: Value(evidence.isEncrypted),
        encryptionKeyId: Value(evidence.encryptionKeyId),
      ),
    );

    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment != null) {
      final updated = assessment.copyWith(
        evidenceIds: [...assessment.evidenceIds, evidence.id],
      );
      await _updateAssessment(updated);
    }

    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.evidenceCaptured,
        timestamp: DateTime.now(),
        message: 'Evidence captured: ${evidence.name}',
        level: LogLevel.info,
        data: {'evidenceId': evidence.id, 'type': evidence.type.name},
      ),
    );
  }

  Future<void> updateProgress(
    String assessmentId,
    AssessmentProgress progress,
  ) async {
    final assessment = await _assessmentDao.getAssessment(assessmentId);
    if (assessment == null) return;

    final updated = assessment.copyWith(progress: progress);
    await _updateAssessment(updated);

    _emitEvent(
      AssessmentEvent(
        id: const Uuid().v4(),
        assessmentId: assessmentId,
        type: EventType.progressUpdate,
        timestamp: DateTime.now(),
        message: 'Progress: ${(progress.overall * 100).toStringAsFixed(1)}%',
        level: LogLevel.info,
        data: progress.toJson(),
      ),
    );
  }

  Future<List<Finding>> getFindings(String assessmentId) {
    return _findingDao.getFindingsByAssessment(assessmentId);
  }

  Stream<List<Finding>> watchFindings(String assessmentId) {
    return _findingDao.watchFindingsByAssessment(assessmentId);
  }

  Future<List<Evidence>> getEvidence(String assessmentId) {
    return _evidenceDao.getEvidenceByAssessment(assessmentId);
  }

  Stream<List<AssessmentEvent>> watchEvents(String assessmentId) =>
      _eventDao.watchEventsByAssessment(assessmentId);

  Future<Assessment?> getCurrentAssessment() async {
    return _currentAssessment;
  }

  Future<void> _updateAssessment(Assessment assessment) async {
    await _assessmentDao.updateAssessment(
      db.AssessmentsCompanion(
        id: Value(assessment.id),
        projectId: Value(assessment.projectId),
        name: Value(assessment.name),
        type: Value(assessment.type),
        status: Value(assessment.status),
        scopeJson: Value(assessment.scope),
        configJson: Value(assessment.config),
        createdAt: Value(assessment.createdAt),
        startedAt: Value(assessment.startedAt),
        completedAt: Value(assessment.completedAt),
        pausedAt: Value(assessment.pausedAt),
        totalDurationMs: Value(assessment.totalDuration.inMilliseconds),
        progressJson: Value(assessment.progress),
        phasesJson: Value(assessment.phases),
        findingIds: Value(assessment.findingIds),
        evidenceIds: Value(assessment.evidenceIds),
        metadata: Value(assessment.metadata),
        assignedTo: Value(assessment.assignedTo),
        parentAssessmentId: Value(assessment.parentAssessmentId),
      ),
    );

    _currentAssessment = assessment;
  }

  void _emitEvent(AssessmentEvent event) {
    _eventController?.add(event);
    unawaited(
      _eventDao
          .insertEvent(
            db.AssessmentEventsCompanion(
              id: Value(event.id),
              assessmentId: Value(event.assessmentId),
              type: Value(event.type),
              timestamp: Value(event.timestamp),
              message: Value(event.message),
              data: Value(event.data),
              level: Value(event.level),
              phaseId: Value(event.phaseId),
              taskId: Value(event.taskId),
            ),
          )
          .catchError((Object error, StackTrace stackTrace) {
            _logger.e(
              'Failed to persist assessment event',
              error: error,
              stackTrace: stackTrace,
            );
            return 0;
          }),
    );
  }

  void dispose() {
    _durationTimer?.cancel();
    _eventController?.close();
  }
}
