import 'package:flutter_test/flutter_test.dart';
import 'package:mysecure/src/core/models/assessment_models.dart';
import 'package:mysecure/src/core/models/report_models.dart';
import 'package:mysecure/src/core/models/wifi_models.dart';

void main() {
  group('model defaults', () {
    test('ScanConfig uses conservative scanning defaults', () {
      const config = ScanConfig();

      expect(config.enablePassiveScan, isTrue);
      expect(config.enableActiveScan, isFalse);
      expect(config.enableDeauth, isFalse);
      expect(config.enablePmkid, isFalse);
      expect(config.enableWps, isFalse);
      expect(config.dwellTimeMs, 30);
      expect(config.scanCycles, 5);
      expect(config.hopChannels, isTrue);
    });

    test('AssessmentConfig keeps evidence and recovery enabled by default', () {
      const config = AssessmentConfig();

      expect(config.continueOnError, isTrue);
      expect(config.captureEvidence, isTrue);
      expect(config.realTimeUpdates, isTrue);
      expect(config.maxConcurrentTasks, 5);
      expect(config.timeoutSeconds, 3600);
    });
  });

  group('JSON round trips', () {
    test(
      'ScanSession preserves its assessment relationship and statistics',
      () {
        final startedAt = DateTime.utc(2026, 9, 30, 10, 15);
        final session = ScanSession(
          id: 'scan-1',
          assessmentId: 'assessment-1',
          name: 'Authorized office scan',
          mode: ScanMode.passive,
          status: ScanStatus.running,
          startedAt: startedAt,
          completedAt: null,
          config: const ScanConfig(targetChannels: [1, 6, 11]),
          statistics: const ScanStatistics(
            totalPackets: 42,
            uniqueAps: 3,
            uniqueClients: 7,
          ),
          accessPointIds: const ['ap-1', 'ap-2'],
        );

        final restored = ScanSession.fromJson(session.toJson());

        expect(restored, session);
        expect(restored.assessmentId, 'assessment-1');
        expect(restored.statistics.totalPackets, 42);
      },
    );

    test('Assessment preserves durations, scope and progress', () {
      final createdAt = DateTime.utc(2026, 9, 30, 9);
      final assessment = Assessment(
        id: 'assessment-1',
        projectId: 'project-1',
        name: 'Wi-Fi validation',
        type: AssessmentType.wifiVulnScan,
        status: AssessmentStatus.paused,
        scope: const AssessmentScope(
          targetSsids: ['CorpWiFi'],
          targetPorts: [80, 443],
        ),
        config: const AssessmentConfig(maxConcurrentTasks: 2),
        createdAt: createdAt,
        startedAt: createdAt.add(const Duration(minutes: 1)),
        completedAt: null,
        pausedAt: createdAt.add(const Duration(minutes: 6)),
        totalDuration: const Duration(minutes: 5, seconds: 12),
        progress: const AssessmentProgress(
          overall: 0.5,
          completedTasks: 2,
          totalTasks: 4,
        ),
      );

      final restored = Assessment.fromJson(assessment.toJson());

      expect(restored, assessment);
      expect(restored.totalDuration, const Duration(minutes: 5, seconds: 12));
      expect(restored.scope.targetPorts, [80, 443]);
    });

    test('ExecutiveSummary serializes enum map keys without losing counts', () {
      const summary = ExecutiveSummary(
        overview: 'Controlled assessment',
        totalFindings: 4,
        findingsBySeverity: {
          Severity.critical: 1,
          Severity.high: 2,
          Severity.info: 1,
        },
        overallRiskScore: 8.1,
        riskRating: 'High',
        keyMetrics: [],
        criticalRecommendations: ['Rotate the affected credentials'],
      );

      final json = summary.toJson();
      final restored = ExecutiveSummary.fromJson(json);

      expect(json['findingsBySeverity'], {'critical': 1, 'high': 2, 'info': 1});
      expect(restored, summary);
    });
  });

  group('security classification helpers', () {
    test('orders finding severity from informational to critical', () {
      expect(Severity.info.weight, lessThan(Severity.low.weight));
      expect(Severity.low.weight, lessThan(Severity.medium.weight));
      expect(Severity.medium.weight, lessThan(Severity.high.weight));
      expect(Severity.high.weight, lessThan(Severity.critical.weight));
    });

    test('classifies legacy Wi-Fi protection as riskier than modern modes', () {
      expect(
        SecurityProtocol.wep.severity,
        greaterThan(SecurityProtocol.wpa2.severity),
      );
      expect(
        SecurityProtocol.wpa.severity,
        greaterThan(SecurityProtocol.wpa3.severity),
      );
      expect(SecurityProtocol.wpa2_wpa3.displayName, 'WPA2/WPA3');
    });
  });
}
