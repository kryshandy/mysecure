import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mysecure/src/core/database/app_database.dart' as db;
import 'package:mysecure/src/core/database/database_connection.dart';
import 'package:mysecure/src/core/models/wifi_models.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('partial scan-session updates preserve required fields', () async {
    final startedAt = DateTime.utc(2026, 10, 1, 8);
    await database.scanSessionDao.insertSession(
      db.ScanSessionsCompanion(
        id: const Value('scan-1'),
        assessmentId: const Value('assessment-1'),
        name: const Value('Office discovery'),
        mode: const Value(ScanMode.passive),
        status: const Value(ScanStatus.running),
        startedAt: Value(startedAt),
        configJson: const Value(ScanConfig(targetChannels: [1, 6, 11])),
        statisticsJson: const Value(ScanStatistics(uniqueAps: 2)),
        accessPointIds: const Value(['ap-1', 'ap-2']),
        handshakeIds: const Value([]),
        pmkidIds: const Value([]),
        wpsPinIds: const Value([]),
      ),
    );

    final updated = await database.scanSessionDao.updateSession(
      const db.ScanSessionsCompanion(
        id: Value('scan-1'),
        status: Value(ScanStatus.paused),
      ),
    );

    final restored = await database.scanSessionDao.getSession('scan-1');
    expect(updated, isTrue);
    expect(restored, isNotNull);
    expect(restored!.status, ScanStatus.paused);
    expect(restored.name, 'Office discovery');
    expect(restored.assessmentId, 'assessment-1');
    expect(restored.config.targetChannels, [1, 6, 11]);
    expect(restored.statistics.uniqueAps, 2);
    expect(restored.accessPointIds, ['ap-1', 'ap-2']);
  });

  test(
    'BSSID lookup returns the most recently observed access point',
    () async {
      final firstSeen = DateTime.utc(2026, 10, 1, 8);
      for (final entry in [('old', 1), ('new', 2)]) {
        await database.accessPointDao.insertAccessPoint(
          db.AccessPointsCompanion(
            id: Value(entry.$1),
            assessmentId: const Value('assessment-1'),
            bssid: const Value('AA:BB:CC:DD:EE:FF'),
            ssid: const Value('Authorized WiFi'),
            frequency: const Value(2412),
            channel: const Value(1),
            signalLevel: Value(-60 + entry.$2),
            noiseLevel: const Value(-95),
            security: const Value(SecurityProtocol.wpa3),
            supportedProtocols: const Value([SecurityProtocol.wpa3]),
            wpsEnabled: const Value(false),
            beaconInterval: const Value(100),
            capabilityMask: const Value(0),
            firstSeen: Value(firstSeen),
            lastSeen: Value(firstSeen.add(Duration(minutes: entry.$2))),
            packetCount: Value(entry.$2),
            vendorIEs: const Value({}),
            clientIds: const Value([]),
          ),
        );
      }

      final accessPoint = await database.accessPointDao.getAccessPointByBssid(
        'AA:BB:CC:DD:EE:FF',
      );

      expect(accessPoint, isNotNull);
      expect(accessPoint!.id, 'new');
      expect(accessPoint.packetCount, 2);
    },
  );
}
