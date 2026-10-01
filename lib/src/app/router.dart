import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/projects/presentation/project_list_screen.dart';
import '../features/projects/presentation/project_detail_screen.dart';
import '../features/projects/presentation/project_create_screen.dart';
import '../features/assessments/presentation/assessment_list_screen.dart';
import '../features/assessments/presentation/assessment_detail_screen.dart';
import '../features/assessments/presentation/assessment_create_screen.dart';
import '../features/wifi/presentation/wifi_scan_screen.dart';
import '../features/wifi/presentation/wifi_detail_screen.dart';
import '../features/reports/presentation/report_list_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../shared/widgets/main_scaffold.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/projects',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: '/projects',
            name: 'projects',
            builder: (context, state) => const ProjectListScreen(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'project-create',
                builder: (context, state) => const ProjectCreateScreen(),
              ),
              GoRoute(
                path: ':projectId',
                name: 'project-detail',
                builder: (context, state) => ProjectDetailScreen(
                  projectId: state.pathParameters['projectId']!,
                ),
                routes: [
                  GoRoute(
                    path: 'assessments/create',
                    name: 'assessment-create',
                    builder: (context, state) => AssessmentCreateScreen(
                      projectId: state.pathParameters['projectId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'assessments/:assessmentId',
                    name: 'assessment-detail',
                    builder: (context, state) => AssessmentDetailScreen(
                      projectId: state.pathParameters['projectId']!,
                      assessmentId: state.pathParameters['assessmentId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'reports/:reportId',
                    name: 'report-viewer',
                    builder: (context, state) => ReportViewerScreen(
                      projectId: state.pathParameters['projectId']!,
                      reportId: state.pathParameters['reportId']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/wifi/scan',
            name: 'wifi-scan',
            builder: (context, state) => const WifiScanScreen(),
          ),
          GoRoute(
            path: '/wifi/ap/:bssid',
            name: 'wifi-detail',
            builder: (context, state) =>
                WifiDetailScreen(bssid: state.pathParameters['bssid']!),
          ),
          GoRoute(
            path: '/assessments',
            name: 'assessments',
            builder: (context, state) => const AssessmentListScreen(),
          ),
          GoRoute(
            path: '/reports',
            name: 'reports',
            builder: (context, state) => const ReportListScreen(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Symbols.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Route not found: ${state.uri}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/projects'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});
