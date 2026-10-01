import 'dart:io' show File, Platform;
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'app_database.dart';
import 'daos.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

class AppDatabase extends AppDatabaseSchema {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(QueryExecutor executor) : super(executor);

  late final ProjectDao projectDao = ProjectDao(this);
  late final AssessmentDao assessmentDao = AssessmentDao(this);
  late final AccessPointDao accessPointDao = AccessPointDao(this);
  late final ClientDeviceDao clientDeviceDao = ClientDeviceDao(this);
  late final HandshakeCaptureDao handshakeCaptureDao = HandshakeCaptureDao(
    this,
  );
  late final PmkidCaptureDao pmkidCaptureDao = PmkidCaptureDao(this);
  late final WpsPinDao wpsPinDao = WpsPinDao(this);
  late final VulnerabilityFindingDao vulnerabilityFindingDao =
      VulnerabilityFindingDao(this);
  late final FindingDao findingDao = FindingDao(this);
  late final EvidenceDao evidenceDao = EvidenceDao(this);
  late final ReportDao reportDao = ReportDao(this);
  late final ScanSessionDao scanSessionDao = ScanSessionDao(this);
  late final AssessmentEventDao assessmentEventDao = AssessmentEventDao(this);
  late final PluginConfigDao pluginConfigDao = PluginConfigDao(this);
  late final AppSettingsDao appSettingsDao = AppSettingsDao(this);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.addColumn(scanSessions, scanSessions.assessmentId);
      }
    },
  );

  Future<void> clearScanHistory() => transaction(() async {
    await delete(assessmentEvents).go();
    await delete(vulnerabilityFindings).go();
    await delete(wpsPins).go();
    await delete(pmkidCaptures).go();
    await delete(handshakeCaptures).go();
    await delete(clientDevices).go();
    await delete(accessPoints).go();
    await delete(scanSessions).go();
  });

  Future<void> clearAllUserData() => transaction(() async {
    await delete(assessmentEvents).go();
    await delete(reports).go();
    await delete(evidence).go();
    await delete(findings).go();
    await delete(vulnerabilityFindings).go();
    await delete(wpsPins).go();
    await delete(pmkidCaptures).go();
    await delete(handshakeCaptures).go();
    await delete(clientDevices).go();
    await delete(accessPoints).go();
    await delete(scanSessions).go();
    await delete(assessments).go();
    await delete(projects).go();
    await delete(pluginConfigs).go();
  });

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'mysecure.db'));

      // Enable WAL mode for better concurrency
      if (Platform.isAndroid || Platform.isIOS) {
        return NativeDatabase.createInBackground(file);
      }

      return NativeDatabase(file);
    });
  }
}
