import 'package:drift/drift.dart';
import 'app_database.dart' as db;
import 'database_connection.dart';
import '../models/assessment_models.dart';
import '../models/project_models.dart';
import '../models/report_models.dart';
import '../models/wifi_models.dart';

Project _projectFromDb(db.DbProject row) => Project(
  id: row.id,
  name: row.name,
  description: row.description,
  type: row.type,
  status: row.status,
  createdAt: row.createdAt,
  updatedAt: row.updatedAt,
  startedAt: row.startedAt,
  completedAt: row.completedAt,
  client: row.clientJson,
  scope: row.scopeJson,
  authorization: row.authorizationJson,
  settings: row.settingsJson,
  assessmentIds: row.assessmentIds,
  teamMembers: row.teamMembers,
  metadata: row.metadata,
);
Assessment _assessmentFromDb(db.DbAssessment row) => Assessment(
  id: row.id,
  projectId: row.projectId,
  name: row.name,
  type: row.type,
  status: row.status,
  scope: row.scopeJson,
  config: row.configJson,
  createdAt: row.createdAt,
  startedAt: row.startedAt,
  completedAt: row.completedAt,
  pausedAt: row.pausedAt,
  totalDuration: Duration(milliseconds: row.totalDurationMs),
  progress: row.progressJson,
  phases: row.phasesJson,
  findingIds: row.findingIds,
  evidenceIds: row.evidenceIds,
  metadata: row.metadata,
  assignedTo: row.assignedTo,
  parentAssessmentId: row.parentAssessmentId,
);
AccessPoint _accessPointFromDb(db.DbAccessPoint row) => AccessPoint(
  id: row.id,
  bssid: row.bssid,
  ssid: row.ssid,
  frequency: row.frequency,
  channel: row.channel,
  signalLevel: row.signalLevel,
  noiseLevel: row.noiseLevel,
  security: row.security,
  supportedProtocols: row.supportedProtocols,
  wpsEnabled: row.wpsEnabled,
  wpsManufacturer: row.wpsManufacturer,
  wpsModel: row.wpsModel,
  beaconInterval: row.beaconInterval,
  capabilityMask: row.capabilityMask,
  firstSeen: row.firstSeen,
  lastSeen: row.lastSeen,
  packetCount: row.packetCount,
  vendorIEs: row.vendorIEs,
);
ClientDevice _clientFromDb(db.DbClientDevice row) => ClientDevice(
  id: row.id,
  macAddress: row.macAddress,
  hostname: row.hostname,
  vendor: row.vendor,
  signalLevel: row.signalLevel,
  dataFrames: row.dataFrames,
  firstSeen: row.firstSeen,
  lastSeen: row.lastSeen,
  associatedBssid: row.associatedBssid,
  probeRequests: row.probeRequestsJson,
);
HandshakeCapture _handshakeFromDb(db.DbHandshakeCapture row) =>
    HandshakeCapture(
      id: row.id,
      accessPointId: row.accessPointId,
      bssid: row.bssid,
      ssid: row.ssid,
      type: row.type,
      eapolFrames: row.eapolFrames,
      capturedAt: row.capturedAt,
      frameCount: row.frameCount,
      isComplete: row.isComplete,
      metadata: row.metadata,
    );
PmkidCapture _pmkidFromDb(db.DbPmkidCapture row) => PmkidCapture(
  id: row.id,
  accessPointId: row.accessPointId,
  bssid: row.bssid,
  ssid: row.ssid,
  pmkidData: row.pmkidData,
  capturedAt: row.capturedAt,
  metadata: row.metadata,
);
WpsPin _wpsFromDb(db.DbWpsPin row) => WpsPin(
  id: row.id,
  accessPointId: row.accessPointId,
  bssid: row.bssid,
  pin: row.pin,
  method: row.method,
  recoveredAt: row.recoveredAt,
  metadata: row.metadata,
);
VulnerabilityFinding _vulnFromDb(db.DbVulnerabilityFinding row) =>
    VulnerabilityFinding(
      id: row.id,
      accessPointId: row.accessPointId ?? '',
      type: row.type,
      severity: row.severity,
      title: row.title,
      description: row.description,
      recommendation: row.recommendation,
      evidence: row.evidence,
      discoveredAt: row.discoveredAt,
      cvssVector: row.cvssVectorJson,
      verified: row.verified,
    );
Finding _findingFromDb(db.DbFinding row) => Finding(
  id: row.id,
  assessmentId: row.assessmentId,
  type: row.type,
  severity: row.severity,
  title: row.title,
  description: row.description,
  recommendation: row.recommendation,
  affectedTarget: row.affectedTarget,
  evidence: row.evidence,
  evidenceIds: row.evidenceIds,
  cvss: row.cvssVectorJson,
  discoveredAt: row.discoveredAt,
  verifiedAt: row.verifiedAt,
  verified: row.verified,
  falsePositive: row.falsePositive,
  references: row.references,
  metadata: row.metadata,
);
Evidence _evidenceFromDb(db.DbEvidence row) => Evidence(
  id: row.id,
  assessmentId: row.assessmentId,
  type: row.type,
  name: row.name,
  description: row.description,
  filePath: row.filePath,
  hashSha256: row.hashSha256,
  sizeBytes: row.sizeBytes,
  capturedAt: row.capturedAt,
  capturedBy: row.capturedBy,
  metadata: row.metadata,
  tags: row.tags,
  isEncrypted: row.isEncrypted,
  encryptionKeyId: row.encryptionKeyId,
);
Report _reportFromDb(db.DbReport row) => Report(
  id: row.id,
  projectId: row.projectId,
  assessmentId: row.assessmentId,
  title: row.title,
  type: row.type,
  status: row.status,
  format: row.format,
  template: row.template,
  content: row.contentJson,
  metadata: row.metadataJson,
  createdAt: row.createdAt,
  generatedAt: row.generatedAt,
  deliveredAt: row.deliveredAt,
  attachedEvidenceIds: row.attachedEvidenceIds,
  customData: row.customData,
);
ScanSession _sessionFromDb(db.DbScanSession row) => ScanSession(
  id: row.id,
  name: row.name,
  mode: row.mode,
  status: row.status,
  startedAt: row.startedAt,
  completedAt: row.completedAt,
  config: row.configJson,
  statistics: row.statisticsJson,
  assessmentId: row.assessmentId,
  accessPointIds: row.accessPointIds,
  handshakeIds: row.handshakeIds,
  pmkidIds: row.pmkidIds,
  wpsPinIds: row.wpsPinIds,
);
AssessmentEvent _eventFromDb(db.DbAssessmentEvent row) => AssessmentEvent(
  id: row.id,
  assessmentId: row.assessmentId,
  type: row.type,
  timestamp: row.timestamp,
  message: row.message,
  data: row.data,
  level: row.level,
  phaseId: row.phaseId,
  taskId: row.taskId,
);

abstract class _DaoBase extends DatabaseAccessor<AppDatabase> {
  _DaoBase(super.db);

  db.$ProjectsTable get projects => attachedDatabase.projects;
  db.$AssessmentsTable get assessments => attachedDatabase.assessments;
  db.$AccessPointsTable get accessPoints => attachedDatabase.accessPoints;
  db.$ClientDevicesTable get clientDevices => attachedDatabase.clientDevices;
  db.$HandshakeCapturesTable get handshakeCaptures =>
      attachedDatabase.handshakeCaptures;
  db.$PmkidCapturesTable get pmkidCaptures => attachedDatabase.pmkidCaptures;
  db.$WpsPinsTable get wpsPins => attachedDatabase.wpsPins;
  db.$VulnerabilityFindingsTable get vulnerabilityFindings =>
      attachedDatabase.vulnerabilityFindings;
  db.$FindingsTable get findings => attachedDatabase.findings;
  db.$EvidenceTable get evidence => attachedDatabase.evidence;
  db.$ReportsTable get reports => attachedDatabase.reports;
  db.$ScanSessionsTable get scanSessions => attachedDatabase.scanSessions;
  db.$AssessmentEventsTable get assessmentEvents =>
      attachedDatabase.assessmentEvents;
  db.$PluginConfigsTable get pluginConfigs => attachedDatabase.pluginConfigs;
  db.$AppSettingsTable get appSettings => attachedDatabase.appSettings;
}

class ProjectDao extends _DaoBase {
  ProjectDao(super.db);

  Future<List<Project>> getAllProjects() =>
      select(projects).get().then((rows) => rows.map(_projectFromDb).toList());

  Stream<List<Project>> watchAllProjects() =>
      select(projects).watch().map((rows) => rows.map(_projectFromDb).toList());

  Future<Project?> getProject(String id) =>
      (select(projects)..where((t) => t.id.equals(id))).getSingleOrNull().then(
        (row) => row == null ? null : _projectFromDb(row),
      );

  Stream<Project?> watchProject(String id) =>
      (select(projects)..where((t) => t.id.equals(id))).watchSingleOrNull().map(
        (row) => row == null ? null : _projectFromDb(row),
      );

  Future<int> insertProject(db.ProjectsCompanion project) =>
      into(projects).insert(project);

  Future<bool> updateProject(db.ProjectsCompanion project) async {
    if (!project.id.present) return false;
    final changed = await (update(
      projects,
    )..where((t) => t.id.equals(project.id.value))).write(project);
    return changed > 0;
  }

  Future<int> deleteProject(String id) =>
      (delete(projects)..where((t) => t.id.equals(id))).go();

  Future<List<Project>> getProjectsByStatus(ProjectStatus status) =>
      (select(projects)..where((t) => t.status.equals(status.index)))
          .get()
          .then((rows) => rows.map(_projectFromDb).toList());

  Stream<List<Project>> watchProjectsByStatus(ProjectStatus status) =>
      (select(projects)..where((t) => t.status.equals(status.index)))
          .watch()
          .map((rows) => rows.map(_projectFromDb).toList());
}

class AssessmentDao extends _DaoBase {
  AssessmentDao(super.db);

  Future<List<Assessment>> getAssessmentsByProject(String projectId) =>
      (select(assessments)..where((t) => t.projectId.equals(projectId)))
          .get()
          .then((rows) => rows.map(_assessmentFromDb).toList());
  Future<List<Assessment>> getAllAssessments() => select(
    assessments,
  ).get().then((rows) => rows.map(_assessmentFromDb).toList());

  Stream<List<Assessment>> watchAssessmentsByProject(String projectId) =>
      (select(assessments)..where((t) => t.projectId.equals(projectId)))
          .watch()
          .map((rows) => rows.map(_assessmentFromDb).toList());
  Stream<List<Assessment>> watchAllAssessments() => select(
    assessments,
  ).watch().map((rows) => rows.map(_assessmentFromDb).toList());

  Future<Assessment?> getAssessment(String id) =>
      (select(assessments)..where((t) => t.id.equals(id)))
          .getSingleOrNull()
          .then((row) => row == null ? null : _assessmentFromDb(row));

  Stream<Assessment?> watchAssessment(String id) =>
      (select(assessments)..where((t) => t.id.equals(id)))
          .watchSingleOrNull()
          .map((row) => row == null ? null : _assessmentFromDb(row));

  Future<int> insertAssessment(db.AssessmentsCompanion assessment) =>
      into(assessments).insert(assessment);

  Future<bool> updateAssessment(db.AssessmentsCompanion assessment) async {
    if (!assessment.id.present) return false;
    final changed = await (update(
      assessments,
    )..where((t) => t.id.equals(assessment.id.value))).write(assessment);
    return changed > 0;
  }

  Future<int> deleteAssessment(String id) =>
      (delete(assessments)..where((t) => t.id.equals(id))).go();

  Future<List<Assessment>> getAssessmentsByStatus(AssessmentStatus status) =>
      (select(assessments)..where((t) => t.status.equals(status.index)))
          .get()
          .then((rows) => rows.map(_assessmentFromDb).toList());
}

class AccessPointDao extends _DaoBase {
  AccessPointDao(super.db);

  Future<List<AccessPoint>> getAccessPointsByAssessment(String assessmentId) =>
      (select(accessPoints)..where((t) => t.assessmentId.equals(assessmentId)))
          .get()
          .then((rows) => rows.map(_accessPointFromDb).toList());

  Stream<List<AccessPoint>> watchAccessPointsByAssessment(
    String assessmentId,
  ) => (select(accessPoints)..where((t) => t.assessmentId.equals(assessmentId)))
      .watch()
      .map((rows) => rows.map(_accessPointFromDb).toList());

  Future<AccessPoint?> getAccessPoint(String id) =>
      (select(accessPoints)..where((t) => t.id.equals(id)))
          .getSingleOrNull()
          .then((row) => row == null ? null : _accessPointFromDb(row));

  Future<AccessPoint?> getAccessPointByBssid(String bssid) =>
      (select(accessPoints)
            ..where((t) => t.bssid.equals(bssid))
            ..orderBy([(t) => OrderingTerm.desc(t.lastSeen)])
            ..limit(1))
          .getSingleOrNull()
          .then((row) => row == null ? null : _accessPointFromDb(row));

  Future<int> insertAccessPoint(db.AccessPointsCompanion ap) =>
      into(accessPoints).insert(ap);

  Future<void> insertAccessPoints(List<db.AccessPointsCompanion> aps) =>
      batch((b) => b.insertAll(accessPoints, aps));

  Future<bool> updateAccessPoint(db.AccessPointsCompanion ap) async {
    if (!ap.id.present) return false;
    final changed = await (update(
      accessPoints,
    )..where((t) => t.id.equals(ap.id.value))).write(ap);
    return changed > 0;
  }

  Future<int> deleteAccessPointsByAssessment(String assessmentId) => (delete(
    accessPoints,
  )..where((t) => t.assessmentId.equals(assessmentId))).go();

  Future<List<AccessPoint>> getAccessPointsBySecurity(
    SecurityProtocol security,
  ) => (select(accessPoints)..where((t) => t.security.equals(security.index)))
      .get()
      .then((rows) => rows.map(_accessPointFromDb).toList());

  Future<List<AccessPoint>> getAccessPointsWithWps() =>
      (select(accessPoints)..where((t) => t.wpsEnabled.equals(true)))
          .get()
          .then((rows) => rows.map(_accessPointFromDb).toList());
}

class ClientDeviceDao extends _DaoBase {
  ClientDeviceDao(super.db);

  Future<List<ClientDevice>> getClientsByAccessPoint(String accessPointId) =>
      (select(clientDevices)
            ..where((t) => t.accessPointId.equals(accessPointId)))
          .get()
          .then((rows) => rows.map(_clientFromDb).toList());

  Future<int> insertClientDevice(db.ClientDevicesCompanion client) =>
      into(clientDevices).insert(client);

  Future<int> deleteClientsByAccessPoint(String accessPointId) => (delete(
    clientDevices,
  )..where((t) => t.accessPointId.equals(accessPointId))).go();
}

class HandshakeCaptureDao extends _DaoBase {
  HandshakeCaptureDao(super.db);

  Future<List<HandshakeCapture>> getHandshakesByAssessment(
    String assessmentId,
  ) =>
      (select(handshakeCaptures)
            ..where((t) => t.assessmentId.equals(assessmentId)))
          .get()
          .then((rows) => rows.map(_handshakeFromDb).toList());

  Future<HandshakeCapture?> getHandshake(String id) =>
      (select(handshakeCaptures)..where((t) => t.id.equals(id)))
          .getSingleOrNull()
          .then((row) => row == null ? null : _handshakeFromDb(row));

  Future<List<HandshakeCapture>> getHandshakesByAccessPoint(
    String accessPointId,
  ) =>
      (select(handshakeCaptures)
            ..where((t) => t.accessPointId.equals(accessPointId)))
          .get()
          .then((rows) => rows.map(_handshakeFromDb).toList());

  Future<int> insertHandshake(db.HandshakeCapturesCompanion hs) =>
      into(handshakeCaptures).insert(hs);

  Future<int> deleteHandshakesByAssessment(String assessmentId) => (delete(
    handshakeCaptures,
  )..where((t) => t.assessmentId.equals(assessmentId))).go();
}

class PmkidCaptureDao extends _DaoBase {
  PmkidCaptureDao(super.db);

  Future<List<PmkidCapture>> getPmkidsByAssessment(String assessmentId) =>
      (select(pmkidCaptures)..where((t) => t.assessmentId.equals(assessmentId)))
          .get()
          .then((rows) => rows.map(_pmkidFromDb).toList());

  Future<List<PmkidCapture>> getPmkidsByAccessPoint(String accessPointId) =>
      (select(pmkidCaptures)
            ..where((t) => t.accessPointId.equals(accessPointId)))
          .get()
          .then((rows) => rows.map(_pmkidFromDb).toList());

  Future<int> insertPmkid(db.PmkidCapturesCompanion pmkid) =>
      into(pmkidCaptures).insert(pmkid);

  Future<int> deletePmkidsByAssessment(String assessmentId) => (delete(
    pmkidCaptures,
  )..where((t) => t.assessmentId.equals(assessmentId))).go();
}

class WpsPinDao extends _DaoBase {
  WpsPinDao(super.db);

  Future<List<WpsPin>> getWpsPinsByAssessment(String assessmentId) =>
      (select(wpsPins)..where((t) => t.assessmentId.equals(assessmentId)))
          .get()
          .then((rows) => rows.map(_wpsFromDb).toList());

  Future<List<WpsPin>> getWpsPinsByAccessPoint(String accessPointId) =>
      (select(wpsPins)..where((t) => t.accessPointId.equals(accessPointId)))
          .get()
          .then((rows) => rows.map(_wpsFromDb).toList());

  Future<int> insertWpsPin(db.WpsPinsCompanion pin) =>
      into(wpsPins).insert(pin);

  Future<int> deleteWpsPinsByAssessment(String assessmentId) =>
      (delete(wpsPins)..where((t) => t.assessmentId.equals(assessmentId))).go();
}

class VulnerabilityFindingDao extends _DaoBase {
  VulnerabilityFindingDao(super.db);

  Future<List<VulnerabilityFinding>> getVulnsByAssessment(
    String assessmentId,
  ) =>
      (select(vulnerabilityFindings)
            ..where((t) => t.assessmentId.equals(assessmentId)))
          .get()
          .then((rows) => rows.map(_vulnFromDb).toList());

  Future<List<VulnerabilityFinding>> getVulnsByAccessPoint(
    String accessPointId,
  ) =>
      (select(vulnerabilityFindings)
            ..where((t) => t.accessPointId.equals(accessPointId)))
          .get()
          .then((rows) => rows.map(_vulnFromDb).toList());

  Future<int> insertVulnerability(db.VulnerabilityFindingsCompanion vuln) =>
      into(vulnerabilityFindings).insert(vuln);

  Future<int> deleteVulnsByAssessment(String assessmentId) => (delete(
    vulnerabilityFindings,
  )..where((t) => t.assessmentId.equals(assessmentId))).go();
}

class FindingDao extends _DaoBase {
  FindingDao(super.db);

  Future<List<Finding>> getFindingsByAssessment(String assessmentId) =>
      (select(findings)..where((t) => t.assessmentId.equals(assessmentId)))
          .get()
          .then((rows) => rows.map(_findingFromDb).toList());

  Stream<List<Finding>> watchFindingsByAssessment(String assessmentId) =>
      (select(findings)..where((t) => t.assessmentId.equals(assessmentId)))
          .watch()
          .map((rows) => rows.map(_findingFromDb).toList());

  Future<int> insertFinding(db.FindingsCompanion finding) =>
      into(findings).insert(finding);

  Future<int> deleteFindingsByAssessment(String assessmentId) => (delete(
    findings,
  )..where((t) => t.assessmentId.equals(assessmentId))).go();
}

class EvidenceDao extends _DaoBase {
  EvidenceDao(super.db);

  Future<List<Evidence>> getEvidenceByAssessment(String assessmentId) =>
      (select(evidence)..where((t) => t.assessmentId.equals(assessmentId)))
          .get()
          .then((rows) => rows.map(_evidenceFromDb).toList());

  Future<Evidence?> getEvidence(String id) =>
      (select(evidence)..where((t) => t.id.equals(id))).getSingleOrNull().then(
        (row) => row == null ? null : _evidenceFromDb(row),
      );

  Future<int> insertEvidence(db.EvidenceCompanion ev) =>
      into(evidence).insert(ev);

  Future<int> deleteEvidenceByAssessment(String assessmentId) => (delete(
    evidence,
  )..where((t) => t.assessmentId.equals(assessmentId))).go();
}

class ReportDao extends _DaoBase {
  ReportDao(super.db);

  Future<List<Report>> getReportsByProject(String projectId) =>
      (select(reports)..where((t) => t.projectId.equals(projectId))).get().then(
        (rows) => rows.map(_reportFromDb).toList(),
      );

  Future<List<Report>> getAllReports() =>
      (select(reports)..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .get()
          .then((rows) => rows.map(_reportFromDb).toList());

  Stream<List<Report>> watchAllReports() =>
      (select(reports)..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch()
          .map((rows) => rows.map(_reportFromDb).toList());

  Future<Report?> getReport(String id) =>
      (select(reports)..where((t) => t.id.equals(id))).getSingleOrNull().then(
        (row) => row == null ? null : _reportFromDb(row),
      );

  Future<int> insertReport(db.ReportsCompanion report) =>
      into(reports).insert(report);

  Future<bool> updateReport(db.ReportsCompanion report) async {
    if (!report.id.present) return false;
    final changed = await (update(
      reports,
    )..where((t) => t.id.equals(report.id.value))).write(report);
    return changed > 0;
  }

  Future<int> deleteReport(String id) =>
      (delete(reports)..where((t) => t.id.equals(id))).go();
}

class ScanSessionDao extends _DaoBase {
  ScanSessionDao(super.db);

  Future<List<ScanSession>> getAllSessions() => select(
    scanSessions,
  ).get().then((rows) => rows.map(_sessionFromDb).toList());

  Stream<List<ScanSession>> watchAllSessions() => select(
    scanSessions,
  ).watch().map((rows) => rows.map(_sessionFromDb).toList());

  Future<ScanSession?> getSession(String id) =>
      (select(scanSessions)..where((t) => t.id.equals(id)))
          .getSingleOrNull()
          .then((row) => row == null ? null : _sessionFromDb(row));

  Future<int> insertSession(db.ScanSessionsCompanion session) =>
      into(scanSessions).insert(session);

  Future<bool> updateSession(db.ScanSessionsCompanion session) async {
    if (!session.id.present) return false;
    final changed = await (update(
      scanSessions,
    )..where((t) => t.id.equals(session.id.value))).write(session);
    return changed > 0;
  }

  Future<int> deleteSession(String id) =>
      (delete(scanSessions)..where((t) => t.id.equals(id))).go();
}

class AssessmentEventDao extends _DaoBase {
  AssessmentEventDao(super.db);

  Future<List<AssessmentEvent>> getEventsByAssessment(
    String assessmentId, {
    int limit = 1000,
  }) =>
      (select(assessmentEvents)
            ..where((t) => t.assessmentId.equals(assessmentId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
            ..limit(limit))
          .get()
          .then((rows) => rows.map(_eventFromDb).toList());

  Stream<List<AssessmentEvent>> watchEventsByAssessment(
    String assessmentId, {
    int limit = 100,
  }) =>
      (select(assessmentEvents)
            ..where((t) => t.assessmentId.equals(assessmentId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
            ..limit(limit))
          .watch()
          .map((rows) => rows.map(_eventFromDb).toList());

  Future<int> insertEvent(db.AssessmentEventsCompanion event) =>
      into(assessmentEvents).insert(event);

  Future<void> insertEvents(List<db.AssessmentEventsCompanion> events) =>
      batch((b) => b.insertAll(assessmentEvents, events));

  Future<int> deleteEventsByAssessment(String assessmentId) => (delete(
    assessmentEvents,
  )..where((t) => t.assessmentId.equals(assessmentId))).go();
}

class PluginConfigDao extends _DaoBase {
  PluginConfigDao(super.db);

  Future<Map<String, dynamic>?> getConfig(String pluginId) =>
      (select(pluginConfigs)..where((t) => t.pluginId.equals(pluginId)))
          .getSingleOrNull()
          .then((row) => row?.configJson);

  Future<int> setConfig(String pluginId, Map<String, dynamic> config) =>
      into(pluginConfigs).insertOnConflictUpdate(
        db.PluginConfigsCompanion(
          pluginId: Value(pluginId),
          configJson: Value(config),
          updatedAt: Value(DateTime.now()),
        ),
      );
}

class AppSettingsDao extends _DaoBase {
  AppSettingsDao(super.db);

  Future<Map<String, dynamic>?> getSetting(String key) =>
      (select(appSettings)..where((t) => t.key.equals(key)))
          .getSingleOrNull()
          .then((row) => row?.value);

  Future<int> setSetting(String key, Map<String, dynamic> value) =>
      into(appSettings).insertOnConflictUpdate(
        db.AppSettingsCompanion(
          key: Value(key),
          value: Value(value),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<int> deleteSetting(String key) =>
      (delete(appSettings)..where((t) => t.key.equals(key))).go();
}
