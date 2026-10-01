import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import 'package:uuid/uuid.dart';
import '../database/database_connection.dart';
import '../database/app_database.dart' as db;
import '../database/daos.dart';
import '../models/project_models.dart';
import '../models/assessment_models.dart';

final projectServiceProvider = Provider<ProjectService>((ref) {
  final db = ref.watch(databaseProvider);
  return ProjectService(
    projectDao: db.projectDao,
    assessmentDao: db.assessmentDao,
  );
});

final projectsProvider = FutureProvider<List<Project>>(
  (ref) => ref.watch(projectServiceProvider).getAllProjects(),
);

final projectProvider = StreamProvider.family<Project?, String>(
  (ref, id) => ref.watch(projectServiceProvider).watchProject(id),
);

final assessmentsByProjectProvider =
    StreamProvider.family<List<Assessment>, String>(
      (ref, projectId) => ref
          .watch(projectServiceProvider)
          .watchAssessmentsByProject(projectId),
    );

final allAssessmentsProvider = StreamProvider<List<Assessment>>(
  (ref) => ref.watch(projectServiceProvider).watchAllAssessments(),
);

class ProjectService {
  final ProjectDao _projectDao;
  final AssessmentDao _assessmentDao;
  ProjectService({
    required ProjectDao projectDao,
    required AssessmentDao assessmentDao,
  }) : _projectDao = projectDao,
       _assessmentDao = assessmentDao;

  // Project CRUD
  Future<Project> createProject({
    required String name,
    required String description,
    required ProjectType type,
    required ClientInfo client,
    required ScopeDefinition scope,
    required Authorization authorization,
    ProjectSettings? settings,
  }) async {
    final project = Project(
      id: const Uuid().v4(),
      name: name,
      description: description,
      type: type,
      status: ProjectStatus.draft,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      startedAt: null,
      completedAt: null,
      client: client,
      scope: scope,
      authorization: authorization,
      settings: settings ?? const ProjectSettings(),
    );

    await _projectDao.insertProject(
      db.ProjectsCompanion(
        id: Value(project.id),
        name: Value(project.name),
        description: Value(project.description),
        type: Value(project.type),
        status: Value(project.status),
        createdAt: Value(project.createdAt),
        updatedAt: Value(project.updatedAt),
        clientJson: Value(project.client),
        scopeJson: Value(project.scope),
        authorizationJson: Value(project.authorization),
        settingsJson: Value(project.settings),
        assessmentIds: Value(project.assessmentIds),
        teamMembers: Value(project.teamMembers),
        metadata: Value(project.metadata),
      ),
    );

    return project;
  }

  Future<List<Project>> getAllProjects() => _projectDao.getAllProjects();
  Stream<List<Project>> watchAllProjects() => _projectDao.watchAllProjects();
  Future<Project?> getProject(String id) => _projectDao.getProject(id);
  Stream<Project?> watchProject(String id) => _projectDao.watchProject(id);

  Future<Project> updateProject(Project project) async {
    final updated = project.copyWith(updatedAt: DateTime.now());
    await _projectDao.updateProject(
      db.ProjectsCompanion(
        id: Value(updated.id),
        name: Value(updated.name),
        description: Value(updated.description),
        type: Value(updated.type),
        status: Value(updated.status),
        createdAt: Value(updated.createdAt),
        updatedAt: Value(updated.updatedAt),
        startedAt: Value(updated.startedAt),
        completedAt: Value(updated.completedAt),
        clientJson: Value(updated.client),
        scopeJson: Value(updated.scope),
        authorizationJson: Value(updated.authorization),
        settingsJson: Value(updated.settings),
        assessmentIds: Value(updated.assessmentIds),
        teamMembers: Value(updated.teamMembers),
        metadata: Value(updated.metadata),
      ),
    );
    return updated;
  }

  Future<void> deleteProject(String id) async {
    // Delete associated assessments first
    final assessments = await _assessmentDao.getAssessmentsByProject(id);
    for (final assessment in assessments) {
      await _assessmentDao.deleteAssessment(assessment.id);
    }
    await _projectDao.deleteProject(id);
  }

  Future<Project> startProject(String id) async {
    final project = await _projectDao.getProject(id);
    if (project == null) throw Exception('Project not found');

    final updated = project.copyWith(
      status: ProjectStatus.active,
      startedAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return updateProject(updated);
  }

  Future<Project> completeProject(String id) async {
    final project = await _projectDao.getProject(id);
    if (project == null) throw Exception('Project not found');

    final updated = project.copyWith(
      status: ProjectStatus.completed,
      completedAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return updateProject(updated);
  }

  // Assessment management within project
  Future<Assessment> createAssessment({
    required String projectId,
    required String name,
    required AssessmentType type,
    required AssessmentScope scope,
    AssessmentConfig? config,
  }) async {
    final project = await _projectDao.getProject(projectId);
    if (project == null) throw Exception('Project not found');

    final assessment = Assessment(
      id: const Uuid().v4(),
      projectId: projectId,
      name: name,
      type: type,
      status: AssessmentStatus.draft,
      scope: scope,
      config: config ?? const AssessmentConfig(),
      createdAt: DateTime.now(),
      startedAt: null,
      completedAt: null,
      pausedAt: null,
      totalDuration: Duration.zero,
    );

    await _assessmentDao.insertAssessment(
      db.AssessmentsCompanion(
        id: Value(assessment.id),
        projectId: Value(assessment.projectId),
        name: Value(assessment.name),
        type: Value(assessment.type),
        status: Value(assessment.status),
        scopeJson: Value(assessment.scope),
        configJson: Value(assessment.config),
        createdAt: Value(assessment.createdAt),
        totalDurationMs: const Value(0),
        progressJson: Value(assessment.progress),
        phasesJson: Value(assessment.phases),
        findingIds: Value(assessment.findingIds),
        evidenceIds: Value(assessment.evidenceIds),
        metadata: Value(assessment.metadata),
      ),
    );

    // Update project with new assessment ID
    final updatedProject = project.copyWith(
      assessmentIds: [...project.assessmentIds, assessment.id],
      updatedAt: DateTime.now(),
    );
    await updateProject(updatedProject);

    return assessment;
  }

  Future<List<Assessment>> getAssessmentsByProject(String projectId) {
    return _assessmentDao.getAssessmentsByProject(projectId);
  }

  Stream<List<Assessment>> watchAssessmentsByProject(String projectId) {
    return _assessmentDao.watchAssessmentsByProject(projectId);
  }

  Stream<List<Assessment>> watchAllAssessments() =>
      _assessmentDao.watchAllAssessments();

  Future<Assessment?> getAssessment(String id) =>
      _assessmentDao.getAssessment(id);
  Stream<Assessment?> watchAssessment(String id) =>
      _assessmentDao.watchAssessment(id);

  Future<Assessment> updateAssessment(Assessment assessment) async {
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
    return assessment;
  }

  Future<void> deleteAssessment(String id) async {
    await _assessmentDao.deleteAssessment(id);
  }

  // Statistics
  Future<Map<String, int>> getProjectStats(String projectId) async {
    final project = await _projectDao.getProject(projectId);
    if (project == null) return {};

    final assessments = await _assessmentDao.getAssessmentsByProject(projectId);
    return {
      'totalAssessments': assessments.length,
      'completed': assessments
          .where((a) => a.status == AssessmentStatus.completed)
          .length,
      'running': assessments
          .where((a) => a.status == AssessmentStatus.running)
          .length,
      'failed': assessments
          .where((a) => a.status == AssessmentStatus.failed)
          .length,
    };
  }
}
