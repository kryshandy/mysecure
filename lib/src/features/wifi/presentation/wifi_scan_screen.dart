import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/models/wifi_models.dart';
import '../../../core/models/assessment_models.dart';
import '../../../core/services/wifi_service.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/widgets/main_scaffold.dart';
import '../../../shared/extensions/extensions.dart';

class WifiScanScreen extends ConsumerStatefulWidget {
  const WifiScanScreen({super.key});

  @override
  ConsumerState<WifiScanScreen> createState() => _WifiScanScreenState();
}

class _WifiScanScreenState extends ConsumerState<WifiScanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScanSession? _currentSession;
  StreamSubscription<AccessPoint>? _scanSubscription;
  StreamSubscription<AssessmentEvent>? _eventSubscription;
  final _scanNameController = TextEditingController();
  ScanMode _selectedMode = ScanMode.passive;
  ScanConfig _config = const ScanConfig();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scanNameController.text =
        'Scan ${DateTime.now().toString().split('.')[0]}';

    // Initialize service
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wifiServiceProvider).initialize();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scanSubscription?.cancel();
    _eventSubscription?.cancel();
    _scanNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanHistoryAsync = ref.watch(scanHistoryProvider);
    final apStream = ref.watch(wifiServiceProvider.select((s) => s.scanStream));
    final eventStream = ref.watch(
      wifiServiceProvider.select((s) => s.eventStream),
    );

    // Listen to live scan results
    return Scaffold(
      appBar: AppBar(
        title: const Text('WiFi Scanner'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Live Scan', icon: Icon(Symbols.radar, size: 18)),
            Tab(text: 'History', icon: Icon(Symbols.history, size: 18)),
          ],
        ),
        actions: [
          if (_currentSession != null &&
              _currentSession!.status == ScanStatus.running)
            IconButton(
              icon: const Icon(Symbols.pause),
              onPressed: () => ref.read(wifiServiceProvider).pauseScan(),
              tooltip: 'Pause Scan',
            )
          else if (_currentSession != null &&
              _currentSession!.status == ScanStatus.paused)
            IconButton(
              icon: const Icon(Symbols.play_arrow),
              onPressed: () => ref.read(wifiServiceProvider).resumeScan(),
              tooltip: 'Resume Scan',
            ),
          if (_currentSession != null)
            IconButton(
              icon: const Icon(Symbols.stop),
              onPressed: () => ref.read(wifiServiceProvider).stopScan(),
              tooltip: 'Stop Scan',
            ),
          IconButton(
            icon: const Icon(Symbols.filter_list),
            onPressed: _showConfigDialog,
            tooltip: 'Scan Configuration',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLiveScanTab(apStream, eventStream),
          _buildHistoryTab(scanHistoryAsync),
        ],
      ),
      floatingActionButton: _currentSession == null
          ? FloatingActionButton.extended(
              onPressed: _startNewScan,
              icon: const Icon(Symbols.play_arrow),
              label: const Text('Start Scan'),
            )
          : null,
    );
  }

  Widget _buildLiveScanTab(
    Stream<AccessPoint> apStream,
    Stream<AssessmentEvent> eventStream,
  ) {
    return StreamBuilder<AccessPoint>(
      stream: apStream,
      builder: (context, snapshot) {
        return Column(
          children: [
            // Session info bar
            if (_currentSession != null)
              _SessionInfoBar(session: _currentSession!),

            // Live AP list
            Expanded(
              child: _AccessPointList(
                stream: apStream,
                onApTap: (ap) => context.push('/wifi/ap/${ap.bssid}'),
              ),
            ),

            // Event log
            if (_currentSession != null) _EventLogPanel(stream: eventStream),
          ],
        );
      },
    );
  }

  Widget _buildHistoryTab(AsyncValue<List<ScanSession>> historyAsync) {
    return historyAsync.when(
      data: (sessions) {
        if (sessions.isEmpty) {
          return EmptyState(
            icon: Symbols.history,
            title: 'No Scan History',
            message: 'Your scan sessions will appear here',
          );
        }

        sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: sessions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final session = sessions[index];
            return _SessionCard(session: session);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Future<void> _startNewScan() async {
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Scan Session'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _scanNameController,
              decoration: const InputDecoration(labelText: 'Session Name'),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<ScanMode>(
              initialValue: _selectedMode,
              decoration: const InputDecoration(labelText: 'Scan Mode'),
              items: ScanMode.values
                  .map(
                    (m) => DropdownMenuItem(
                      value: m,
                      child: Text(m.name.capitalize()),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _selectedMode = v!),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, _scanNameController.text),
            child: const Text('Start'),
          ),
        ],
      ),
    );

    if (name != null && name.isNotEmpty) {
      final service = ref.read(wifiServiceProvider);
      final session = await service.startScan(
        name: name,
        mode: _selectedMode,
        config: _config,
      );

      setState(() => _currentSession = session);

      // Subscribe to streams
      _scanSubscription?.cancel();
      _eventSubscription?.cancel();
    }
  }

  void _showConfigDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Scan Configuration'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                title: const Text('Passive Scan'),
                subtitle: const Text('Listen for beacon/probe frames only'),
                value: _config.enablePassiveScan,
                onChanged: (v) => setState(
                  () => _config = _config.copyWith(enablePassiveScan: v),
                ),
              ),
              SwitchListTile(
                title: const Text('Active Scan'),
                subtitle: const Text(
                  'Send probe requests (requires authorization)',
                ),
                value: _config.enableActiveScan,
                onChanged: (v) => setState(
                  () => _config = _config.copyWith(enableActiveScan: v),
                ),
              ),
              SwitchListTile(
                title: const Text('Enable Deauth'),
                subtitle: const Text(
                  'Send deauth frames to capture handshakes (DANGEROUS)',
                ),
                value: _config.enableDeauth,
                onChanged: (v) =>
                    setState(() => _config = _config.copyWith(enableDeauth: v)),
              ),
              SwitchListTile(
                title: const Text('PMKID Capture'),
                subtitle: const Text(
                  'Attempt PMKID capture on WPA2/WPA3 networks',
                ),
                value: _config.enablePmkid,
                onChanged: (v) =>
                    setState(() => _config = _config.copyWith(enablePmkid: v)),
              ),
              SwitchListTile(
                title: const Text('WPS Testing'),
                subtitle: const Text('Test WPS PIN vulnerabilities'),
                value: _config.enableWps,
                onChanged: (v) =>
                    setState(() => _config = _config.copyWith(enableWps: v)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _config.dwellTimeMs.toString(),
                decoration: const InputDecoration(labelText: 'Dwell Time (ms)'),
                keyboardType: TextInputType.number,
                onChanged: (v) => setState(
                  () => _config = _config.copyWith(
                    dwellTimeMs: int.tryParse(v) ?? 30,
                  ),
                ),
              ),
              TextFormField(
                initialValue: _config.scanCycles.toString(),
                decoration: const InputDecoration(labelText: 'Scan Cycles'),
                keyboardType: TextInputType.number,
                onChanged: (v) => setState(
                  () => _config = _config.copyWith(
                    scanCycles: int.tryParse(v) ?? 5,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _SessionInfoBar extends StatelessWidget {
  final ScanSession session;

  const _SessionInfoBar({required this.session});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = AppTheme.scanStatusColor(session.status);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(bottom: BorderSide(color: theme.colorScheme.outline)),
      ),
      child: Row(
        children: [
          Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(
                duration: 1000.ms,
                color: statusColor.withValues(alpha: 0.5),
              ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.name,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Mode: ${session.mode.name.capitalize()} | '
                  'APs: ${session.statistics.uniqueAps} | '
                  'Clients: ${session.statistics.uniqueClients} | '
                  'Handshakes: ${session.statistics.handshakesCaptured}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          StatusBadge(
            label: session.status.name.capitalize(),
            color: statusColor,
            icon: session.status == ScanStatus.running ? Symbols.radar : null,
          ),
        ],
      ),
    );
  }
}

class _AccessPointList extends StatefulWidget {
  final Stream<AccessPoint> stream;
  final Function(AccessPoint) onApTap;

  const _AccessPointList({required this.stream, required this.onApTap});

  @override
  State<_AccessPointList> createState() => _AccessPointListState();
}

class _AccessPointListState extends State<_AccessPointList> {
  final Map<String, AccessPoint> _accessPoints = {};
  StreamSubscription<AccessPoint>? _subscription;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  @override
  void didUpdateWidget(covariant _AccessPointList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.stream, widget.stream)) {
      _subscription?.cancel();
      _accessPoints.clear();
      _error = null;
      _subscribe();
    }
  }

  void _subscribe() {
    _subscription = widget.stream.listen(
      (accessPoint) {
        if (!mounted) return;
        setState(() {
          _accessPoints[accessPoint.bssid] = accessPoint;
          _error = null;
        });
      },
      onError: (Object error) {
        if (mounted) setState(() => _error = error);
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return EmptyState(
        icon: Symbols.error_outline,
        title: 'Scan Stream Error',
        message: _error.toString(),
      );
    }
    if (_accessPoints.isEmpty) {
      return EmptyState(
        icon: Symbols.wifi_off,
        title: 'No Networks Detected',
        message: 'Start a scan to discover nearby access points',
      );
    }

    final accessPoints = _accessPoints.values.toList()
      ..sort((a, b) => b.signalLevel.compareTo(a.signalLevel));
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: accessPoints.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final accessPoint = accessPoints[index];
        return _AccessPointCard(
          ap: accessPoint,
          onTap: () => widget.onApTap(accessPoint),
        );
      },
    );
  }
}

class _AccessPointCard extends StatelessWidget {
  final AccessPoint ap;
  final VoidCallback onTap;

  const _AccessPointCard({required this.ap, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final securityColor = _getSecurityColor(ap.security);

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
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: securityColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      ap.security == SecurityProtocol.open
                          ? Symbols.wifi_off
                          : Symbols.wifi,
                      color: securityColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                ap.ssid,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SeverityBadge(
                              severity: _securityToSeverity(ap.security),
                            ),
                          ],
                        ),
                        Text(
                          ap.bssid,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontFamily: 'JetBrainsMono',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${ap.signalLevel} dBm',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _signalColor(ap.signalLevel),
                          fontFamily: 'JetBrainsMono',
                        ),
                      ),
                      Text(
                        'Ch ${ap.channel} (${ap.frequency} MHz)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  _InfoChip(
                    icon: Symbols.shield,
                    label: ap.security.displayName,
                    color: securityColor,
                  ),
                  if (ap.wpsEnabled)
                    _InfoChip(
                      icon: Symbols.key,
                      label: 'WPS Enabled',
                      color: Colors.orange,
                    ),
                  _InfoChip(
                    icon: Symbols.devices,
                    label: '${ap.associatedClients.length} clients',
                    color: theme.colorScheme.primary,
                  ),
                  _InfoChip(
                    icon: Symbols.speed,
                    label: '${ap.packetCount} pkts',
                    color: theme.colorScheme.secondary,
                  ),
                ],
              ),
              if (ap.associatedClients.isNotEmpty) ...[
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 8),
                Text(
                  'Associated Clients',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                ...ap.associatedClients
                    .take(3)
                    .map((client) => _ClientRow(client: client)),
                if (ap.associatedClients.length > 3)
                  Text(
                    '... and ${ap.associatedClients.length - 3} more',
                    style: theme.textTheme.bodySmall?.copyWith(
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

  Color _getSecurityColor(SecurityProtocol protocol) {
    switch (protocol) {
      case SecurityProtocol.open:
        return Colors.red;
      case SecurityProtocol.wep:
        return Colors.deepOrange;
      case SecurityProtocol.wpa:
        return Colors.orange;
      case SecurityProtocol.wpa2:
        return Colors.blue;
      case SecurityProtocol.wpa3:
        return Colors.green;
      case SecurityProtocol.wpa2_wpa3:
        return Colors.teal;
      case SecurityProtocol.owe:
        return Colors.cyan;
      case SecurityProtocol.unknown:
        return Colors.grey;
    }
  }

  Severity _securityToSeverity(SecurityProtocol protocol) {
    switch (protocol) {
      case SecurityProtocol.open:
        return Severity.critical;
      case SecurityProtocol.wep:
        return Severity.high;
      case SecurityProtocol.wpa:
        return Severity.medium;
      case SecurityProtocol.wpa2:
        return Severity.low;
      case SecurityProtocol.wpa3:
        return Severity.info;
      case SecurityProtocol.wpa2_wpa3:
        return Severity.low;
      case SecurityProtocol.owe:
        return Severity.info;
      case SecurityProtocol.unknown:
        return Severity.medium;
    }
  }

  Color _signalColor(int signal) {
    if (signal >= -50) return Colors.green;
    if (signal >= -60) return Colors.lightGreen;
    if (signal >= -70) return Colors.yellow;
    if (signal >= -80) return Colors.orange;
    return Colors.red;
  }
}

class _ClientRow extends StatelessWidget {
  final ClientDevice client;

  const _ClientRow({required this.client});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Symbols.devices_other,
            size: 16,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Text(
            client.macAddress,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'JetBrainsMono',
            ),
          ),
          const SizedBox(width: 8),
          if (client.vendor != null)
            Text(
              client.vendor!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          const Spacer(),
          Text(
            '${client.signalLevel} dBm',
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'JetBrainsMono',
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _InfoChip({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: chipColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: chipColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: chipColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _EventLogPanel extends StatelessWidget {
  final Stream<AssessmentEvent> stream;

  const _EventLogPanel({required this.stream});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Event Log',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: StreamBuilder<AssessmentEvent>(
                stream: stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox();
                  final event = snapshot.data!;
                  return ListTile(
                    dense: true,
                    leading: Icon(
                      _eventIcon(event.type),
                      size: 16,
                      color: _eventColor(event.level),
                    ),
                    title: Text(
                      event.message,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text(
                      event.timestamp.toShortString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _eventIcon(EventType type) {
    switch (type) {
      case EventType.assessmentStarted:
        return Symbols.play_arrow;
      case EventType.assessmentCompleted:
        return Symbols.check_circle;
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

class _SessionCard extends StatelessWidget {
  final ScanSession session;

  const _SessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = AppTheme.scanStatusColor(session.status);

    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Symbols.radar, color: statusColor),
        ),
        title: Text(session.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${session.mode.name.capitalize()} • ${session.statistics.uniqueAps} APs • ${session.statistics.uniqueClients} clients',
            ),
            Text(
              'Started: ${session.startedAt.toShortString()}${session.completedAt != null ? ' • Ended: ${session.completedAt!.toShortString()}' : ''}',
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatusBadge(
              label: session.status.name.capitalize(),
              color: statusColor,
            ),
            if (session.statistics.handshakesCaptured > 0)
              Text(
                '${session.statistics.handshakesCaptured} handshakes',
                style: theme.textTheme.labelSmall,
              ),
          ],
        ),
        onTap: () {
          // Navigate to session detail
        },
      ),
    );
  }
}
