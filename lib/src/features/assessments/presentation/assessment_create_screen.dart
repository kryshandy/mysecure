import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/models/assessment_models.dart';
import '../../../core/services/project_service.dart';

class AssessmentCreateScreen extends ConsumerStatefulWidget {
  final String projectId;

  const AssessmentCreateScreen({super.key, required this.projectId});

  @override
  ConsumerState<AssessmentCreateScreen> createState() =>
      _AssessmentCreateScreenState();
}

class _AssessmentCreateScreenState
    extends ConsumerState<AssessmentCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  AssessmentType _selectedType = AssessmentType.wifiRecon;
  AssessmentScope _scope = const AssessmentScope();
  AssessmentConfig _config = const AssessmentConfig();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Assessment'),
        leading: IconButton(
          icon: const Icon(Symbols.close),
          onPressed: () => context.pop(),
        ),
        actions: [
          FilledButton(
            onPressed: _createAssessment,
            child: const Text('Create'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Configure the assessment parameters.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Assessment Name',
                  hintText: 'e.g., WiFi Reconnaissance - Building A',
                  prefixIcon: Icon(Symbols.title),
                ),
                validator: (value) =>
                    value?.isEmpty == true ? 'Required' : null,
              ),
              const SizedBox(height: 24),

              Text(
                'Assessment Type',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: AssessmentType.values
                    .map(
                      (type) => ChoiceChip(
                        label: Text(_getTypeLabel(type)),
                        selected: _selectedType == type,
                        onSelected: (selected) =>
                            setState(() => _selectedType = type),
                        avatar: Icon(_getTypeIcon(type), size: 18),
                        selectedColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        tooltip: _getTypeDescription(type),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),

              Text('Scope', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              _ScopeField(
                label: 'Target SSIDs',
                controller: TextEditingController(
                  text: _scope.targetSsids.join(', '),
                ),
                hint: 'CorporateWiFi, GuestWiFi',
                icon: Symbols.wifi,
                onChanged: (value) => setState(
                  () => _scope = _scope.copyWith(
                    targetSsids: value
                        .split(',')
                        .map((s) => s.trim())
                        .where((s) => s.isNotEmpty)
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _ScopeField(
                label: 'Target BSSIDs',
                controller: TextEditingController(
                  text: _scope.targetBssids.join(', '),
                ),
                hint: 'aa:bb:cc:dd:ee:ff',
                icon: Symbols.router,
                onChanged: (value) => setState(
                  () => _scope = _scope.copyWith(
                    targetBssids: value
                        .split(',')
                        .map((s) => s.trim())
                        .where((s) => s.isNotEmpty)
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _ScopeField(
                label: 'Target Networks (CIDR)',
                controller: TextEditingController(
                  text: _scope.targetNetworks.join(', '),
                ),
                hint: '192.168.1.0/24, 10.0.0.0/8',
                icon: Symbols.settings_ethernet,
                onChanged: (value) => setState(
                  () => _scope = _scope.copyWith(
                    targetNetworks: value
                        .split(',')
                        .map((s) => s.trim())
                        .where((s) => s.isNotEmpty)
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _ScopeField(
                label: 'Target Domains',
                controller: TextEditingController(
                  text: _scope.targetDomains.join(', '),
                ),
                hint: 'example.com, api.example.com',
                icon: Symbols.web,
                onChanged: (value) => setState(
                  () => _scope = _scope.copyWith(
                    targetDomains: value
                        .split(',')
                        .map((s) => s.trim())
                        .where((s) => s.isNotEmpty)
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _ScopeField(
                label: 'Target URLs',
                controller: TextEditingController(
                  text: _scope.targetUrls.join(', '),
                ),
                hint: 'https://example.com/app',
                icon: Symbols.link,
                onChanged: (value) => setState(
                  () => _scope = _scope.copyWith(
                    targetUrls: value
                        .split(',')
                        .map((s) => s.trim())
                        .where((s) => s.isNotEmpty)
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: const Text('Include Wireless'),
                        subtitle: const Text('Scan 802.11 networks'),
                        value: _scope.includeWireless,
                        onChanged: (v) => setState(
                          () => _scope = _scope.copyWith(includeWireless: v),
                        ),
                      ),
                      SwitchListTile(
                        title: const Text('Include Wired'),
                        subtitle: const Text(
                          'Scan wired network infrastructure',
                        ),
                        value: _scope.includeWired,
                        onChanged: (v) => setState(
                          () => _scope = _scope.copyWith(includeWired: v),
                        ),
                      ),
                      SwitchListTile(
                        title: const Text('Include Bluetooth'),
                        subtitle: const Text('Scan Bluetooth/BLE devices'),
                        value: _scope.includeBluetooth,
                        onChanged: (v) => setState(
                          () => _scope = _scope.copyWith(includeBluetooth: v),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Configuration',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _config.maxConcurrentTasks.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Max Concurrent Tasks',
                          prefixIcon: Icon(Symbols.speed),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => setState(
                          () => _config = _config.copyWith(
                            maxConcurrentTasks: int.tryParse(v) ?? 5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: _config.timeoutSeconds.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Timeout (seconds)',
                          prefixIcon: Icon(Symbols.timer),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => setState(
                          () => _config = _config.copyWith(
                            timeoutSeconds: int.tryParse(v) ?? 3600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Continue on Error'),
                        subtitle: const Text(
                          'Continue assessment if a task fails',
                        ),
                        value: _config.continueOnError,
                        onChanged: (v) => setState(
                          () => _config = _config.copyWith(continueOnError: v),
                        ),
                      ),
                      SwitchListTile(
                        title: const Text('Capture Evidence'),
                        subtitle: const Text(
                          'Automatically save PCAPs, logs, screenshots',
                        ),
                        value: _config.captureEvidence,
                        onChanged: (v) => setState(
                          () => _config = _config.copyWith(captureEvidence: v),
                        ),
                      ),
                      SwitchListTile(
                        title: const Text('Real-time Updates'),
                        subtitle: const Text('Stream findings and events live'),
                        value: _config.realTimeUpdates,
                        onChanged: (v) => setState(
                          () => _config = _config.copyWith(realTimeUpdates: v),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAssessment() async {
    if (!_formKey.currentState!.validate()) return;

    final service = ref.read(projectServiceProvider);

    try {
      await service.createAssessment(
        projectId: widget.projectId,
        name: _nameController.text,
        type: _selectedType,
        scope: _scope,
        config: _config,
      );

      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Assessment created successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  String _getTypeLabel(AssessmentType type) {
    switch (type) {
      case AssessmentType.wifiRecon:
        return 'WiFi Recon';
      case AssessmentType.wifiVulnScan:
        return 'WiFi Vuln Scan';
      case AssessmentType.wifiExploitation:
        return 'WiFi Exploitation';
      case AssessmentType.networkDiscovery:
        return 'Network Discovery';
      case AssessmentType.portScan:
        return 'Port Scan';
      case AssessmentType.serviceEnum:
        return 'Service Enum';
      case AssessmentType.vulnScan:
        return 'Vuln Scan';
      case AssessmentType.webCrawl:
        return 'Web Crawl';
      case AssessmentType.webVulnScan:
        return 'Web Vuln Scan';
      case AssessmentType.apiTest:
        return 'API Test';
      case AssessmentType.credentialTest:
        return 'Credential Test';
      case AssessmentType.postExploitation:
        return 'Post Exploitation';
      case AssessmentType.custom:
        return 'Custom';
    }
  }

  String _getTypeDescription(AssessmentType type) {
    switch (type) {
      case AssessmentType.wifiRecon:
        return 'Passive 802.11 scanning and enumeration';
      case AssessmentType.wifiVulnScan:
        return 'Identify WiFi security misconfigurations';
      case AssessmentType.wifiExploitation:
        return 'Active attacks: handshake, PMKID, WPS';
      case AssessmentType.networkDiscovery:
        return 'Discover hosts and network topology';
      case AssessmentType.portScan:
        return 'Scan open ports on target hosts';
      case AssessmentType.serviceEnum:
        return 'Enumerate services and versions';
      case AssessmentType.vulnScan:
        return 'Automated vulnerability scanning';
      case AssessmentType.webCrawl:
        return 'Crawl web applications for endpoints';
      case AssessmentType.webVulnScan:
        return 'Scan web apps for OWASP Top 10';
      case AssessmentType.apiTest:
        return 'Test API endpoints for vulnerabilities';
      case AssessmentType.credentialTest:
        return 'Test for weak/default credentials';
      case AssessmentType.postExploitation:
        return 'Post-exploitation enumeration';
      case AssessmentType.custom:
        return 'Custom assessment workflow';
    }
  }

  IconData _getTypeIcon(AssessmentType type) {
    switch (type) {
      case AssessmentType.wifiRecon:
        return Symbols.radar;
      case AssessmentType.wifiVulnScan:
        return Symbols.security;
      case AssessmentType.wifiExploitation:
        return Symbols.bug_report;
      case AssessmentType.networkDiscovery:
        return Symbols.router;
      case AssessmentType.portScan:
        return Symbols.settings_ethernet;
      case AssessmentType.serviceEnum:
        return Symbols.list_alt;
      case AssessmentType.vulnScan:
        return Symbols.bug_report;
      case AssessmentType.webCrawl:
        return Symbols.web;
      case AssessmentType.webVulnScan:
        return Symbols.shield_lock;
      case AssessmentType.apiTest:
        return Symbols.api;
      case AssessmentType.credentialTest:
        return Symbols.key;
      case AssessmentType.postExploitation:
        return Symbols.arrow_forward_ios;
      case AssessmentType.custom:
        return Symbols.settings;
    }
  }
}

class _ScopeField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const _ScopeField({
    required this.label,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        helperText: 'Comma separated',
      ),
      onChanged: onChanged,
    );
  }
}
