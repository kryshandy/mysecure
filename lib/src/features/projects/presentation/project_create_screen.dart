import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';
import '../../../core/models/project_models.dart';
import '../../../core/services/project_service.dart';

class ProjectCreateScreen extends ConsumerStatefulWidget {
  const ProjectCreateScreen({super.key});

  @override
  ConsumerState<ProjectCreateScreen> createState() =>
      _ProjectCreateScreenState();
}

class _ProjectCreateScreenState extends ConsumerState<ProjectCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();
  int _currentPage = 0;

  // Basic Info
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  ProjectType _selectedType = ProjectType.wifiAudit;

  // Client Info
  final _clientNameController = TextEditingController();
  final _clientEmailController = TextEditingController();
  final _clientPhoneController = TextEditingController();
  final _clientCompanyController = TextEditingController();
  final _clientAddressController = TextEditingController();

  // Scope
  final _targetNetworksController = TextEditingController();
  final _targetDomainsController = TextEditingController();
  final _targetIpsController = TextEditingController();
  final _targetSsidsController = TextEditingController();
  final _excludedNetworksController = TextEditingController();
  bool _wirelessInScope = true;
  bool _wiredInScope = false;
  bool _socialEngInScope = false;
  bool _physicalInScope = false;

  // Authorization
  final _signedByController = TextEditingController();
  final _legalEntityController = TextEditingController();
  DateTime _validFrom = DateTime.now();
  DateTime _validUntil = DateTime.now().add(const Duration(days: 90));
  bool _authorizationConfirmed = false;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _clientNameController.dispose();
    _clientEmailController.dispose();
    _clientPhoneController.dispose();
    _clientCompanyController.dispose();
    _clientAddressController.dispose();
    _targetNetworksController.dispose();
    _targetDomainsController.dispose();
    _targetIpsController.dispose();
    _targetSsidsController.dispose();
    _excludedNetworksController.dispose();
    _signedByController.dispose();
    _legalEntityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Project'),
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Symbols.arrow_back),
                onPressed: () => _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              )
            : IconButton(
                icon: const Icon(Symbols.close),
                onPressed: () => context.pop(),
              ),
        actions: [
          if (_currentPage < 3)
            TextButton(
              onPressed: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              child: const Text('Next'),
            ),
          if (_currentPage == 3)
            FilledButton(
              onPressed: _createProject,
              child: const Text('Create'),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) => setState(() => _currentPage = page),
          children: [
            _buildBasicInfoPage(),
            _buildClientInfoPage(),
            _buildScopePage(),
            _buildAuthorizationPage(),
          ],
        ),
      ),
      bottomNavigationBar: _buildProgressIndicator(),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: Row(
        children: [
          for (int i = 0; i < 4; i++)
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: i <= _currentPage
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  if (i < 3) const SizedBox(width: 8),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoPage() {
    return SingleChildScrollView(
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
            'Enter the basic details for your security assessment project.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Project Name',
              hintText: 'e.g., Acme Corp WiFi Audit Q1 2024',
              prefixIcon: Icon(Symbols.title),
            ),
            validator: (value) => value?.isEmpty == true ? 'Required' : null,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText:
                  'Brief description of the assessment scope and objectives',
              prefixIcon: Icon(Symbols.description),
              alignLabelWithHint: true,
            ),
            maxLines: 4,
            validator: (value) => value?.isEmpty == true ? 'Required' : null,
          ),
          const SizedBox(height: 24),

          Text('Project Type', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ProjectType.values
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
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildClientInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Client Information',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Enter the client contact details.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          TextFormField(
            controller: _clientNameController,
            decoration: const InputDecoration(
              labelText: 'Client Name *',
              hintText: 'John Doe',
              prefixIcon: Icon(Symbols.person),
            ),
            validator: (value) => value?.isEmpty == true ? 'Required' : null,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _clientEmailController,
            decoration: const InputDecoration(
              labelText: 'Email *',
              hintText: 'john@company.com',
              prefixIcon: Icon(Symbols.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value?.isEmpty == true || !value!.contains('@')
                ? 'Valid email required'
                : null,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _clientPhoneController,
            decoration: const InputDecoration(
              labelText: 'Phone',
              hintText: '+1 (555) 123-4567',
              prefixIcon: Icon(Symbols.phone),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _clientCompanyController,
            decoration: const InputDecoration(
              labelText: 'Company',
              hintText: 'Acme Corporation',
              prefixIcon: Icon(Symbols.business),
            ),
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _clientAddressController,
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: '123 Main St, City, State 12345',
              prefixIcon: Icon(Symbols.location_on),
              alignLabelWithHint: true,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildScopePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Scope Definition',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Define what is in and out of scope for this assessment.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          _ScopeField(
            label: 'Target Networks (CIDR)',
            controller: _targetNetworksController,
            hint: '192.168.1.0/24, 10.0.0.0/8',
            icon: Symbols.router,
            helper: 'One per line or comma separated',
          ),
          const SizedBox(height: 16),

          _ScopeField(
            label: 'Target Domains',
            controller: _targetDomainsController,
            hint: 'example.com, api.example.com',
            icon: Symbols.web,
            helper: 'One per line or comma separated',
          ),
          const SizedBox(height: 16),

          _ScopeField(
            label: 'Target IP Ranges',
            controller: _targetIpsController,
            hint: '192.168.1.1-192.168.1.254',
            icon: Symbols.settings_ethernet,
            helper: 'One per line or comma separated',
          ),
          const SizedBox(height: 16),

          _ScopeField(
            label: 'Target SSIDs',
            controller: _targetSsidsController,
            hint: 'CorporateWiFi, GuestWiFi',
            icon: Symbols.wifi,
            helper: 'One per line or comma separated',
          ),
          const SizedBox(height: 16),

          _ScopeField(
            label: 'Excluded Networks',
            controller: _excludedNetworksController,
            hint: '192.168.100.0/24',
            icon: Symbols.block,
            helper: 'Networks explicitly excluded from testing',
          ),
          const SizedBox(height: 24),

          Text(
            'Scope Categories',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Wireless Networks'),
                    subtitle: const Text(
                      'Include WiFi/802.11 networks in assessment',
                    ),
                    value: _wirelessInScope,
                    onChanged: (v) => setState(() => _wirelessInScope = v),
                  ),
                  SwitchListTile(
                    title: const Text('Wired Networks'),
                    subtitle: const Text(
                      'Include Ethernet/wired infrastructure',
                    ),
                    value: _wiredInScope,
                    onChanged: (v) => setState(() => _wiredInScope = v),
                  ),
                  SwitchListTile(
                    title: const Text('Social Engineering'),
                    subtitle: const Text(
                      'Include phishing, vishing, physical tests',
                    ),
                    value: _socialEngInScope,
                    onChanged: (v) => setState(() => _socialEngInScope = v),
                  ),
                  SwitchListTile(
                    title: const Text('Physical Security'),
                    subtitle: const Text(
                      'Include physical access and facility tests',
                    ),
                    value: _physicalInScope,
                    onChanged: (v) => setState(() => _physicalInScope = v),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: _authorizationConfirmed,
            onChanged: (value) =>
                setState(() => _authorizationConfirmed = value ?? false),
            title: const Text('Authorization verified'),
            subtitle: const Text(
              'I confirm that the authorization document is valid and covers the declared scope.',
            ),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorizationPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Authorization',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Legal authorization details (required for compliance).',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          TextFormField(
            controller: _signedByController,
            decoration: const InputDecoration(
              labelText: 'Signed By *',
              hintText: 'Authorized signatory name',
              prefixIcon: Icon(Symbols.badge),
            ),
            validator: (value) => value?.isEmpty == true ? 'Required' : null,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _legalEntityController,
            decoration: const InputDecoration(
              labelText: 'Legal Entity ID',
              hintText: 'Contract/MOU reference number',
              prefixIcon: Icon(Symbols.description),
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _DatePickerField(
                  label: 'Valid From *',
                  initialDate: _validFrom,
                  onDateSelected: (date) => setState(() => _validFrom = date),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _DatePickerField(
                  label: 'Valid Until *',
                  initialDate: _validUntil,
                  onDateSelected: (date) => setState(() => _validUntil = date),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Default Technique Authorizations',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'These can be overridden per-assessment.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _TechniqueAuthChip(
                    label: 'Passive WiFi Scan',
                    defaultAllow: true,
                  ),
                  _TechniqueAuthChip(
                    label: 'Active WiFi Scan',
                    defaultAllow: false,
                  ),
                  _TechniqueAuthChip(
                    label: 'Handshake Capture',
                    defaultAllow: false,
                  ),
                  _TechniqueAuthChip(
                    label: 'PMKID Attack',
                    defaultAllow: false,
                  ),
                  _TechniqueAuthChip(label: 'WPS Testing', defaultAllow: false),
                  _TechniqueAuthChip(
                    label: 'Deauthentication',
                    defaultAllow: false,
                  ),
                  _TechniqueAuthChip(
                    label: 'Network Discovery',
                    defaultAllow: true,
                  ),
                  _TechniqueAuthChip(
                    label: 'Port Scanning',
                    defaultAllow: false,
                  ),
                  _TechniqueAuthChip(
                    label: 'Vulnerability Scanning',
                    defaultAllow: false,
                  ),
                  _TechniqueAuthChip(
                    label: 'Web Application Testing',
                    defaultAllow: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _createProject() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_authorizationConfirmed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Confirm the authorization before creating the project.',
          ),
        ),
      );
      return;
    }
    if (_validUntil.isBefore(_validFrom)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'The authorization end date must follow its start date.',
          ),
        ),
      );
      return;
    }

    final service = ref.read(projectServiceProvider);

    try {
      await service.createProject(
        name: _nameController.text,
        description: _descriptionController.text,
        type: _selectedType,
        client: ClientInfo(
          name: _clientNameController.text,
          contactEmail: _clientEmailController.text,
          contactPhone: _clientPhoneController.text.isEmpty
              ? null
              : _clientPhoneController.text,
          company: _clientCompanyController.text.isEmpty
              ? null
              : _clientCompanyController.text,
          address: _clientAddressController.text.isEmpty
              ? null
              : _clientAddressController.text,
        ),
        scope: ScopeDefinition(
          targetNetworks: _parseList(_targetNetworksController.text),
          targetDomains: _parseList(_targetDomainsController.text),
          targetIps: _parseList(_targetIpsController.text),
          targetSsids: _parseList(_targetSsidsController.text),
          excludedNetworks: _parseList(_excludedNetworksController.text),
          wirelessInScope: _wirelessInScope,
          wiredInScope: _wiredInScope,
          socialEngineeringInScope: _socialEngInScope,
          physicalInScope: _physicalInScope,
        ),
        authorization: Authorization(
          documentId: 'DOC-${DateTime.now().millisecondsSinceEpoch}',
          signedBy: _signedByController.text,
          signedAt: DateTime.now(),
          validFrom: _validFrom,
          validUntil: _validUntil,
          techniques: const [
            TechniqueAuthorization(
              techniqueId: 'passive_wifi_scan',
              action: TechniqueAction.allow,
            ),
            TechniqueAuthorization(
              techniqueId: 'active_wifi_scan',
              action: TechniqueAction.requireApproval,
            ),
            TechniqueAuthorization(
              techniqueId: 'handshake_capture',
              action: TechniqueAction.requireApproval,
            ),
            TechniqueAuthorization(
              techniqueId: 'pmkid',
              action: TechniqueAction.requireApproval,
            ),
            TechniqueAuthorization(
              techniqueId: 'wps_testing',
              action: TechniqueAction.requireApproval,
            ),
            TechniqueAuthorization(
              techniqueId: 'deauthentication',
              action: TechniqueAction.requireApproval,
            ),
            TechniqueAuthorization(
              techniqueId: 'network_discovery',
              action: TechniqueAction.allow,
            ),
            TechniqueAuthorization(
              techniqueId: 'port_scanning',
              action: TechniqueAction.requireApproval,
            ),
            TechniqueAuthorization(
              techniqueId: 'vulnerability_scanning',
              action: TechniqueAction.requireApproval,
            ),
            TechniqueAuthorization(
              techniqueId: 'web_application_testing',
              action: TechniqueAction.requireApproval,
            ),
          ],
          dataPolicy: const DataHandlingPolicy(
            retentionDays: 365,
            encryptAtRest: true,
            encryptInTransit: true,
            autoDeleteEvidence: false,
            allowedExportFormats: ['pdf', 'html', 'json'],
          ),
          legalEntityId: _legalEntityController.text.isEmpty
              ? null
              : _legalEntityController.text,
          isVerified: true,
        ),
      );

      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Project created successfully')),
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

  List<String> _parseList(String text) {
    return text
        .split(RegExp(r'[,\n]'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  String _getTypeLabel(ProjectType type) {
    switch (type) {
      case ProjectType.wifiAudit:
        return 'WiFi Audit';
      case ProjectType.networkPentest:
        return 'Network Pentest';
      case ProjectType.webAppPentest:
        return 'Web App Pentest';
      case ProjectType.mobilePentest:
        return 'Mobile Pentest';
      case ProjectType.cloudAudit:
        return 'Cloud Audit';
      case ProjectType.redTeam:
        return 'Red Team';
      case ProjectType.compliance:
        return 'Compliance';
      case ProjectType.custom:
        return 'Custom';
    }
  }

  IconData _getTypeIcon(ProjectType type) {
    switch (type) {
      case ProjectType.wifiAudit:
        return Symbols.wifi;
      case ProjectType.networkPentest:
        return Symbols.router;
      case ProjectType.webAppPentest:
        return Symbols.web;
      case ProjectType.mobilePentest:
        return Symbols.phone_android;
      case ProjectType.cloudAudit:
        return Symbols.cloud;
      case ProjectType.redTeam:
        return Symbols.shield_person;
      case ProjectType.compliance:
        return Symbols.gavel;
      case ProjectType.custom:
        return Symbols.settings;
    }
  }
}

class _ScopeField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final String helper;

  const _ScopeField({
    required this.label,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.helper,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        helperText: helper,
        alignLabelWithHint: true,
      ),
      maxLines: 3,
    );
  }
}

class _DatePickerField extends StatelessWidget {
  final String label;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const _DatePickerField({
    required this.label,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
        );
        if (date != null) onDateSelected(date);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Symbols.calendar_today),
        ),
        child: Text(DateFormat('MMM d, yyyy').format(initialDate)),
      ),
    );
  }
}

class _TechniqueAuthChip extends StatelessWidget {
  final String label;
  final bool defaultAllow;

  const _TechniqueAuthChip({required this.label, required this.defaultAllow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: defaultAllow
                  ? Colors.green.withValues(alpha: 0.15)
                  : Colors.orange.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: defaultAllow ? Colors.green : Colors.orange,
              ),
            ),
            child: Text(
              defaultAllow ? 'ALLOW' : 'REQUIRE APPROVAL',
              style: TextStyle(
                color: defaultAllow ? Colors.green : Colors.orange,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
