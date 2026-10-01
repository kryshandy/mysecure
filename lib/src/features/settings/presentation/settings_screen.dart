import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../../core/ffi/native_bindings.dart';
import '../../../core/services/project_service.dart';
import '../../../core/services/settings_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _appVersion = '1.0.0';
  bool _darkMode = true;
  bool _realTimeUpdates = true;
  bool _autoSaveEvidence = true;
  bool _confirmDangerousActions = true;
  String _defaultInterface = '';
  String _dataRetention = '365';
  String _exportPath = '';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final info = await PackageInfo.fromPlatform();
    final service = ref.read(settingsServiceProvider);
    final values = await Future.wait<Object?>([
      service.getValue<bool>('darkMode'),
      service.getValue<bool>('realTimeUpdates'),
      service.getValue<bool>('autoSaveEvidence'),
      service.getValue<bool>('confirmDangerousActions'),
      service.getValue<String>('defaultInterface'),
      service.getValue<String>('dataRetention'),
      service.getValue<String>('exportPath'),
    ]);
    if (!mounted) return;
    setState(() {
      _appVersion = '${info.version}+${info.buildNumber}';
      _darkMode = values[0] as bool? ?? _darkMode;
      _realTimeUpdates = values[1] as bool? ?? _realTimeUpdates;
      _autoSaveEvidence = values[2] as bool? ?? _autoSaveEvidence;
      _confirmDangerousActions = values[3] as bool? ?? _confirmDangerousActions;
      _defaultInterface = values[4] as String? ?? _defaultInterface;
      _dataRetention = values[5] as String? ?? _dataRetention;
      _exportPath = values[6] as String? ?? _exportPath;
    });
  }

  Future<void> _saveSetting(String key, Object? value) async {
    await ref.read(settingsServiceProvider).setValue(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Appearance
          _SectionHeader(title: 'Appearance', icon: Symbols.palette),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Use dark theme (recommended for field work)'),
            value: _darkMode,
            onChanged: (v) async {
              setState(() => _darkMode = v);
              await _saveSetting('darkMode', v);
              ref.invalidate(themeModeProvider);
            },
            secondary: const Icon(Symbols.dark_mode),
          ),
          const Divider(),

          // Scan Settings
          _SectionHeader(title: 'Scan Settings', icon: Symbols.radar),
          SwitchListTile(
            title: const Text('Real-time Updates'),
            subtitle: const Text(
              'Stream findings and events live during scans',
            ),
            value: _realTimeUpdates,
            onChanged: (v) async {
              setState(() => _realTimeUpdates = v);
              await _saveSetting('realTimeUpdates', v);
            },
            secondary: const Icon(Symbols.sync),
          ),
          SwitchListTile(
            title: const Text('Auto-save Evidence'),
            subtitle: const Text(
              'Automatically save PCAPs, handshakes, and logs',
            ),
            value: _autoSaveEvidence,
            onChanged: (v) async {
              setState(() => _autoSaveEvidence = v);
              await _saveSetting('autoSaveEvidence', v);
            },
            secondary: const Icon(Symbols.save),
          ),
          SwitchListTile(
            title: const Text('Confirm Dangerous Actions'),
            subtitle: const Text(
              'Require confirmation for deauth, exploitation, etc.',
            ),
            value: _confirmDangerousActions,
            onChanged: (v) async {
              setState(() => _confirmDangerousActions = v);
              await _saveSetting('confirmDangerousActions', v);
            },
            secondary: const Icon(Symbols.warning),
          ),
          ListTile(
            title: const Text('Default Wireless Interface'),
            subtitle: Text(
              _defaultInterface.isEmpty ? 'Auto-detect' : _defaultInterface,
            ),
            leading: const Icon(Symbols.settings_ethernet),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _selectInterface,
          ),
          const Divider(),

          // Data & Storage
          _SectionHeader(title: 'Data & Storage', icon: Symbols.storage),
          ListTile(
            title: const Text('Data Retention Period'),
            subtitle: Text('$_dataRetention days'),
            leading: const Icon(Symbols.schedule),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _selectRetentionPeriod,
          ),
          ListTile(
            title: const Text('Export Directory'),
            subtitle: Text(
              _exportPath.isEmpty
                  ? 'Default (Documents/mySecure/exports)'
                  : _exportPath,
            ),
            leading: const Icon(Symbols.folder),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _selectExportPath,
          ),
          ListTile(
            title: const Text('Clear Scan History'),
            subtitle: const Text('Remove all scan sessions and cached data'),
            leading: Icon(
              Symbols.delete_sweep,
              color: Theme.of(context).colorScheme.error,
            ),
            onTap: _clearHistory,
          ),
          ListTile(
            title: const Text('Clear All Data'),
            subtitle: const Text(
              'WARNING: Delete all projects, assessments, and reports',
            ),
            leading: Icon(
              Symbols.delete_forever,
              color: Theme.of(context).colorScheme.error,
            ),
            onTap: _clearAllData,
          ),
          const Divider(),

          // Advanced
          _SectionHeader(title: 'Advanced', icon: Symbols.tune),
          ListTile(
            title: const Text('Native Library Status'),
            subtitle: const Text('Check FFI bindings for WiFi hardware access'),
            leading: const Icon(Symbols.memory),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _checkNativeLibs,
          ),
          ListTile(
            title: const Text('Plugin Management'),
            subtitle: const Text('Manage installed security plugins'),
            leading: const Icon(Symbols.extension),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _managePlugins,
          ),
          ListTile(
            title: const Text('Backup & Restore'),
            subtitle: const Text('Export/import configuration and data'),
            leading: const Icon(Symbols.backup),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _backupRestore,
          ),
          const Divider(),

          // About
          _SectionHeader(title: 'About', icon: Symbols.info),
          ListTile(
            title: const Text('Version'),
            subtitle: Text(_appVersion),
            leading: const Icon(Symbols.tag),
          ),
          ListTile(
            title: const Text('Licenses'),
            subtitle: const Text('Open source licenses used in this app'),
            leading: const Icon(Symbols.gavel),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _showLicenses,
          ),
          ListTile(
            title: const Text('Documentation'),
            subtitle: const Text('View user guide and API documentation'),
            leading: const Icon(Symbols.menu_book),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _openDocs,
          ),
          ListTile(
            title: const Text('Report Issue'),
            subtitle: const Text('Report bugs or request features'),
            leading: const Icon(Symbols.bug_report),
            trailing: const Icon(Symbols.chevron_right),
            onTap: _reportIssue,
          ),
        ],
      ),
    );
  }

  void _selectInterface() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Wireless Interface'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Auto-detect'),
              leading: Radio<String>(
                value: '',
                groupValue: _defaultInterface,
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _defaultInterface = v);
                  _saveSetting('defaultInterface', v);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('wlan0'),
              leading: Radio<String>(
                value: 'wlan0',
                groupValue: _defaultInterface,
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _defaultInterface = v);
                  _saveSetting('defaultInterface', v);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('wlan1'),
              leading: Radio<String>(
                value: 'wlan1',
                groupValue: _defaultInterface,
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _defaultInterface = v);
                  _saveSetting('defaultInterface', v);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _selectRetentionPeriod() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Data Retention Period'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final days in ['30', '90', '180', '365', '730'])
              ListTile(
                title: Text('$days days'),
                leading: Radio<String>(
                  value: days,
                  groupValue: _dataRetention,
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _dataRetention = v);
                    _saveSetting('dataRetention', v);
                    Navigator.pop(context);
                  },
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectExportPath() async {
    final path = await FilePicker.getDirectoryPath(
      dialogTitle: 'Select export directory',
    );
    if (path == null || !mounted) return;
    setState(() => _exportPath = path);
    await _saveSetting('exportPath', path);
  }

  Future<bool> _confirm(String title, String message) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Confirm'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> _clearHistory() async {
    if (!await _confirm(
      'Clear scan history?',
      'This permanently removes scan sessions, discovered devices, captures, and scan vulnerabilities.',
    )) {
      return;
    }
    await ref.read(settingsServiceProvider).clearScanHistory();
    if (mounted) _showMessage('Scan history cleared');
  }

  Future<void> _clearAllData() async {
    if (!await _confirm(
      'Clear all user data?',
      'This permanently removes every project, assessment, report, finding, capture, and plugin configuration.',
    )) {
      return;
    }
    await ref.read(settingsServiceProvider).clearAllUserData();
    ref.invalidate(projectsProvider);
    if (mounted) _showMessage('All user data cleared');
  }

  Future<void> _checkNativeLibs() async {
    await NativeLibraryLoader.initialize();
    if (!mounted) return;
    final available = NativeLibraryLoader.isInitialized;
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Native Library Status'),
        content: Text(
          available
              ? 'Native Wi-Fi acceleration is available.'
              : 'Native Wi-Fi acceleration is unavailable. Safe platform scanning remains active.',
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

  Future<void> _managePlugins() => showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Plugin Management'),
      content: const Text(
        'No external security plugin runtime is configured. Built-in scanning and reporting modules are active.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );

  Future<void> _backupRestore() async {
    final action = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Backup & Restore Settings'),
        content: const Text(
          'Export or restore the local application preferences. Assessment evidence and reports remain in their original storage.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context, 'restore'),
            child: const Text('Restore'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, 'backup'),
            child: const Text('Backup'),
          ),
        ],
      ),
    );
    if (action == 'backup') await _backupSettings();
    if (action == 'restore') await _restoreSettings();
  }

  Future<void> _backupSettings() async {
    final directory = _exportPath.isNotEmpty
        ? Directory(_exportPath)
        : await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);
    final file = File(
      p.join(
        directory.path,
        'mysecure_settings_${DateTime.now().millisecondsSinceEpoch}.json',
      ),
    );
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert({
        'version': 1,
        'darkMode': _darkMode,
        'realTimeUpdates': _realTimeUpdates,
        'autoSaveEvidence': _autoSaveEvidence,
        'confirmDangerousActions': _confirmDangerousActions,
        'defaultInterface': _defaultInterface,
        'dataRetention': _dataRetention,
        'exportPath': _exportPath,
      }),
      flush: true,
    );
    if (mounted) _showMessage('Settings backed up to ${file.path}');
  }

  Future<void> _restoreSettings() async {
    final result = await FilePicker.pickFiles(
      dialogTitle: 'Select a mySecure settings backup',
      type: FileType.custom,
      allowedExtensions: const ['json'],
    );
    final path = result.isEmpty ? null : result.single.path;
    if (path == null) return;
    try {
      final decoded = jsonDecode(await File(path).readAsString());
      if (decoded is! Map<String, dynamic> || decoded['version'] != 1) {
        throw const FormatException('Unsupported settings backup');
      }
      final service = ref.read(settingsServiceProvider);
      for (final key in [
        'darkMode',
        'realTimeUpdates',
        'autoSaveEvidence',
        'confirmDangerousActions',
        'defaultInterface',
        'dataRetention',
        'exportPath',
      ]) {
        if (decoded.containsKey(key)) await service.setValue(key, decoded[key]);
      }
      ref.invalidate(themeModeProvider);
      await _loadSettings();
      if (mounted) _showMessage('Settings restored');
    } on Object catch (error) {
      if (mounted) _showMessage('Restore failed: $error', isError: true);
    }
  }

  void _showLicenses() => showLicensePage(
    context: context,
    applicationName: 'mySecure',
    applicationVersion: _appVersion,
  );

  Future<void> _openDocs() => showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Quick Guide'),
      content: const SingleChildScrollView(
        child: Text(
          '1. Create a project and record the written authorization.\n'
          '2. Create an assessment with an explicit scope.\n'
          '3. Start passive discovery before enabling authorized active actions.\n'
          '4. Review findings and evidence, then generate a report.\n\n'
          'Use active Wi-Fi tests only on systems you own or are explicitly authorized to assess.',
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

  Future<void> _reportIssue() async {
    final diagnostics =
        'mySecure $_appVersion\nPlatform: ${Platform.operatingSystem} '
        '${Platform.operatingSystemVersion}';
    await Clipboard.setData(ClipboardData(text: diagnostics));
    if (mounted) {
      _showMessage('Diagnostic information copied to the clipboard');
    }
  }

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Theme.of(context).colorScheme.error : null,
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
