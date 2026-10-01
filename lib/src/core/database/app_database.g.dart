// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProjectsTable extends Projects
    with TableInfo<$ProjectsTable, DbProject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ProjectType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ProjectType>($ProjectsTable.$convertertype);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<ProjectStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ProjectStatus>($ProjectsTable.$converterstatus);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _clientJsonMeta =
      const VerificationMeta('clientJson');
  @override
  late final GeneratedColumnWithTypeConverter<ClientInfo, String> clientJson =
      GeneratedColumn<String>('client_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ClientInfo>($ProjectsTable.$converterclientJson);
  static const VerificationMeta _scopeJsonMeta =
      const VerificationMeta('scopeJson');
  @override
  late final GeneratedColumnWithTypeConverter<ScopeDefinition, String>
      scopeJson = GeneratedColumn<String>('scope_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ScopeDefinition>($ProjectsTable.$converterscopeJson);
  static const VerificationMeta _authorizationJsonMeta =
      const VerificationMeta('authorizationJson');
  @override
  late final GeneratedColumnWithTypeConverter<Authorization, String>
      authorizationJson = GeneratedColumn<String>(
              'authorization_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Authorization>(
              $ProjectsTable.$converterauthorizationJson);
  static const VerificationMeta _settingsJsonMeta =
      const VerificationMeta('settingsJson');
  @override
  late final GeneratedColumnWithTypeConverter<ProjectSettings, String>
      settingsJson = GeneratedColumn<String>(
              'settings_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProjectSettings>(
              $ProjectsTable.$convertersettingsJson);
  static const VerificationMeta _assessmentIdsMeta =
      const VerificationMeta('assessmentIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      assessmentIds = GeneratedColumn<String>(
              'assessment_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($ProjectsTable.$converterassessmentIds);
  static const VerificationMeta _teamMembersMeta =
      const VerificationMeta('teamMembers');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      teamMembers = GeneratedColumn<String>('team_members', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($ProjectsTable.$converterteamMembers);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $ProjectsTable.$convertermetadata);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        type,
        status,
        createdAt,
        updatedAt,
        startedAt,
        completedAt,
        clientJson,
        scopeJson,
        authorizationJson,
        settingsJson,
        assessmentIds,
        teamMembers,
        metadata
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(Insertable<DbProject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    context.handle(_clientJsonMeta, const VerificationResult.success());
    context.handle(_scopeJsonMeta, const VerificationResult.success());
    context.handle(_authorizationJsonMeta, const VerificationResult.success());
    context.handle(_settingsJsonMeta, const VerificationResult.success());
    context.handle(_assessmentIdsMeta, const VerificationResult.success());
    context.handle(_teamMembersMeta, const VerificationResult.success());
    context.handle(_metadataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbProject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      type: $ProjectsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      status: $ProjectsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      clientJson: $ProjectsTable.$converterclientJson.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_json'])!),
      scopeJson: $ProjectsTable.$converterscopeJson.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scope_json'])!),
      authorizationJson: $ProjectsTable.$converterauthorizationJson.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}authorization_json'])!),
      settingsJson: $ProjectsTable.$convertersettingsJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}settings_json'])!),
      assessmentIds: $ProjectsTable.$converterassessmentIds.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}assessment_ids'])!),
      teamMembers: $ProjectsTable.$converterteamMembers.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}team_members'])!),
      metadata: $ProjectsTable.$convertermetadata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!),
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ProjectType, int, int> $convertertype =
      const EnumIndexConverter<ProjectType>(ProjectType.values);
  static JsonTypeConverter2<ProjectStatus, int, int> $converterstatus =
      const EnumIndexConverter<ProjectStatus>(ProjectStatus.values);
  static TypeConverter<ClientInfo, String> $converterclientJson =
      const ClientInfoConverter();
  static TypeConverter<ScopeDefinition, String> $converterscopeJson =
      const ScopeDefinitionConverter();
  static TypeConverter<Authorization, String> $converterauthorizationJson =
      const AuthorizationConverter();
  static TypeConverter<ProjectSettings, String> $convertersettingsJson =
      const ProjectSettingsConverter();
  static TypeConverter<List<String>, String> $converterassessmentIds =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterteamMembers =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
}

class DbProject extends DataClass implements Insertable<DbProject> {
  final String id;
  final String name;
  final String description;
  final ProjectType type;
  final ProjectStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final ClientInfo clientJson;
  final ScopeDefinition scopeJson;
  final Authorization authorizationJson;
  final ProjectSettings settingsJson;
  final List<String> assessmentIds;
  final List<String> teamMembers;
  final Map<String, dynamic> metadata;
  const DbProject(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.startedAt,
      this.completedAt,
      required this.clientJson,
      required this.scopeJson,
      required this.authorizationJson,
      required this.settingsJson,
      required this.assessmentIds,
      required this.teamMembers,
      required this.metadata});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    {
      map['type'] = Variable<int>($ProjectsTable.$convertertype.toSql(type));
    }
    {
      map['status'] =
          Variable<int>($ProjectsTable.$converterstatus.toSql(status));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    {
      map['client_json'] = Variable<String>(
          $ProjectsTable.$converterclientJson.toSql(clientJson));
    }
    {
      map['scope_json'] =
          Variable<String>($ProjectsTable.$converterscopeJson.toSql(scopeJson));
    }
    {
      map['authorization_json'] = Variable<String>(
          $ProjectsTable.$converterauthorizationJson.toSql(authorizationJson));
    }
    {
      map['settings_json'] = Variable<String>(
          $ProjectsTable.$convertersettingsJson.toSql(settingsJson));
    }
    {
      map['assessment_ids'] = Variable<String>(
          $ProjectsTable.$converterassessmentIds.toSql(assessmentIds));
    }
    {
      map['team_members'] = Variable<String>(
          $ProjectsTable.$converterteamMembers.toSql(teamMembers));
    }
    {
      map['metadata'] =
          Variable<String>($ProjectsTable.$convertermetadata.toSql(metadata));
    }
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      type: Value(type),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      clientJson: Value(clientJson),
      scopeJson: Value(scopeJson),
      authorizationJson: Value(authorizationJson),
      settingsJson: Value(settingsJson),
      assessmentIds: Value(assessmentIds),
      teamMembers: Value(teamMembers),
      metadata: Value(metadata),
    );
  }

  factory DbProject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProject(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      type: $ProjectsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      status: $ProjectsTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      clientJson: serializer.fromJson<ClientInfo>(json['clientJson']),
      scopeJson: serializer.fromJson<ScopeDefinition>(json['scopeJson']),
      authorizationJson:
          serializer.fromJson<Authorization>(json['authorizationJson']),
      settingsJson: serializer.fromJson<ProjectSettings>(json['settingsJson']),
      assessmentIds: serializer.fromJson<List<String>>(json['assessmentIds']),
      teamMembers: serializer.fromJson<List<String>>(json['teamMembers']),
      metadata: serializer.fromJson<Map<String, dynamic>>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'type':
          serializer.toJson<int>($ProjectsTable.$convertertype.toJson(type)),
      'status': serializer
          .toJson<int>($ProjectsTable.$converterstatus.toJson(status)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'clientJson': serializer.toJson<ClientInfo>(clientJson),
      'scopeJson': serializer.toJson<ScopeDefinition>(scopeJson),
      'authorizationJson': serializer.toJson<Authorization>(authorizationJson),
      'settingsJson': serializer.toJson<ProjectSettings>(settingsJson),
      'assessmentIds': serializer.toJson<List<String>>(assessmentIds),
      'teamMembers': serializer.toJson<List<String>>(teamMembers),
      'metadata': serializer.toJson<Map<String, dynamic>>(metadata),
    };
  }

  DbProject copyWith(
          {String? id,
          String? name,
          String? description,
          ProjectType? type,
          ProjectStatus? status,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> startedAt = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          ClientInfo? clientJson,
          ScopeDefinition? scopeJson,
          Authorization? authorizationJson,
          ProjectSettings? settingsJson,
          List<String>? assessmentIds,
          List<String>? teamMembers,
          Map<String, dynamic>? metadata}) =>
      DbProject(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        type: type ?? this.type,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        clientJson: clientJson ?? this.clientJson,
        scopeJson: scopeJson ?? this.scopeJson,
        authorizationJson: authorizationJson ?? this.authorizationJson,
        settingsJson: settingsJson ?? this.settingsJson,
        assessmentIds: assessmentIds ?? this.assessmentIds,
        teamMembers: teamMembers ?? this.teamMembers,
        metadata: metadata ?? this.metadata,
      );
  DbProject copyWithCompanion(ProjectsCompanion data) {
    return DbProject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      clientJson:
          data.clientJson.present ? data.clientJson.value : this.clientJson,
      scopeJson: data.scopeJson.present ? data.scopeJson.value : this.scopeJson,
      authorizationJson: data.authorizationJson.present
          ? data.authorizationJson.value
          : this.authorizationJson,
      settingsJson: data.settingsJson.present
          ? data.settingsJson.value
          : this.settingsJson,
      assessmentIds: data.assessmentIds.present
          ? data.assessmentIds.value
          : this.assessmentIds,
      teamMembers:
          data.teamMembers.present ? data.teamMembers.value : this.teamMembers,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbProject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('clientJson: $clientJson, ')
          ..write('scopeJson: $scopeJson, ')
          ..write('authorizationJson: $authorizationJson, ')
          ..write('settingsJson: $settingsJson, ')
          ..write('assessmentIds: $assessmentIds, ')
          ..write('teamMembers: $teamMembers, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      type,
      status,
      createdAt,
      updatedAt,
      startedAt,
      completedAt,
      clientJson,
      scopeJson,
      authorizationJson,
      settingsJson,
      assessmentIds,
      teamMembers,
      metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProject &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.clientJson == this.clientJson &&
          other.scopeJson == this.scopeJson &&
          other.authorizationJson == this.authorizationJson &&
          other.settingsJson == this.settingsJson &&
          other.assessmentIds == this.assessmentIds &&
          other.teamMembers == this.teamMembers &&
          other.metadata == this.metadata);
}

class ProjectsCompanion extends UpdateCompanion<DbProject> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<ProjectType> type;
  final Value<ProjectStatus> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<ClientInfo> clientJson;
  final Value<ScopeDefinition> scopeJson;
  final Value<Authorization> authorizationJson;
  final Value<ProjectSettings> settingsJson;
  final Value<List<String>> assessmentIds;
  final Value<List<String>> teamMembers;
  final Value<Map<String, dynamic>> metadata;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.clientJson = const Value.absent(),
    this.scopeJson = const Value.absent(),
    this.authorizationJson = const Value.absent(),
    this.settingsJson = const Value.absent(),
    this.assessmentIds = const Value.absent(),
    this.teamMembers = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String name,
    required String description,
    required ProjectType type,
    required ProjectStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    required ClientInfo clientJson,
    required ScopeDefinition scopeJson,
    required Authorization authorizationJson,
    required ProjectSettings settingsJson,
    required List<String> assessmentIds,
    required List<String> teamMembers,
    required Map<String, dynamic> metadata,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        type = Value(type),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        clientJson = Value(clientJson),
        scopeJson = Value(scopeJson),
        authorizationJson = Value(authorizationJson),
        settingsJson = Value(settingsJson),
        assessmentIds = Value(assessmentIds),
        teamMembers = Value(teamMembers),
        metadata = Value(metadata);
  static Insertable<DbProject> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? type,
    Expression<int>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? clientJson,
    Expression<String>? scopeJson,
    Expression<String>? authorizationJson,
    Expression<String>? settingsJson,
    Expression<String>? assessmentIds,
    Expression<String>? teamMembers,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (clientJson != null) 'client_json': clientJson,
      if (scopeJson != null) 'scope_json': scopeJson,
      if (authorizationJson != null) 'authorization_json': authorizationJson,
      if (settingsJson != null) 'settings_json': settingsJson,
      if (assessmentIds != null) 'assessment_ids': assessmentIds,
      if (teamMembers != null) 'team_members': teamMembers,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<ProjectType>? type,
      Value<ProjectStatus>? status,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? startedAt,
      Value<DateTime?>? completedAt,
      Value<ClientInfo>? clientJson,
      Value<ScopeDefinition>? scopeJson,
      Value<Authorization>? authorizationJson,
      Value<ProjectSettings>? settingsJson,
      Value<List<String>>? assessmentIds,
      Value<List<String>>? teamMembers,
      Value<Map<String, dynamic>>? metadata,
      Value<int>? rowid}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      clientJson: clientJson ?? this.clientJson,
      scopeJson: scopeJson ?? this.scopeJson,
      authorizationJson: authorizationJson ?? this.authorizationJson,
      settingsJson: settingsJson ?? this.settingsJson,
      assessmentIds: assessmentIds ?? this.assessmentIds,
      teamMembers: teamMembers ?? this.teamMembers,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($ProjectsTable.$convertertype.toSql(type.value));
    }
    if (status.present) {
      map['status'] =
          Variable<int>($ProjectsTable.$converterstatus.toSql(status.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (clientJson.present) {
      map['client_json'] = Variable<String>(
          $ProjectsTable.$converterclientJson.toSql(clientJson.value));
    }
    if (scopeJson.present) {
      map['scope_json'] = Variable<String>(
          $ProjectsTable.$converterscopeJson.toSql(scopeJson.value));
    }
    if (authorizationJson.present) {
      map['authorization_json'] = Variable<String>($ProjectsTable
          .$converterauthorizationJson
          .toSql(authorizationJson.value));
    }
    if (settingsJson.present) {
      map['settings_json'] = Variable<String>(
          $ProjectsTable.$convertersettingsJson.toSql(settingsJson.value));
    }
    if (assessmentIds.present) {
      map['assessment_ids'] = Variable<String>(
          $ProjectsTable.$converterassessmentIds.toSql(assessmentIds.value));
    }
    if (teamMembers.present) {
      map['team_members'] = Variable<String>(
          $ProjectsTable.$converterteamMembers.toSql(teamMembers.value));
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $ProjectsTable.$convertermetadata.toSql(metadata.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('clientJson: $clientJson, ')
          ..write('scopeJson: $scopeJson, ')
          ..write('authorizationJson: $authorizationJson, ')
          ..write('settingsJson: $settingsJson, ')
          ..write('assessmentIds: $assessmentIds, ')
          ..write('teamMembers: $teamMembers, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssessmentsTable extends Assessments
    with TableInfo<$AssessmentsTable, DbAssessment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<AssessmentType>($AssessmentsTable.$convertertype);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<AssessmentStatus>($AssessmentsTable.$converterstatus);
  static const VerificationMeta _scopeJsonMeta =
      const VerificationMeta('scopeJson');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentScope, String>
      scopeJson = GeneratedColumn<String>('scope_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<AssessmentScope>(
              $AssessmentsTable.$converterscopeJson);
  static const VerificationMeta _configJsonMeta =
      const VerificationMeta('configJson');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentConfig, String>
      configJson = GeneratedColumn<String>('config_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<AssessmentConfig>(
              $AssessmentsTable.$converterconfigJson);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _pausedAtMeta =
      const VerificationMeta('pausedAt');
  @override
  late final GeneratedColumn<DateTime> pausedAt = GeneratedColumn<DateTime>(
      'paused_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _totalDurationMsMeta =
      const VerificationMeta('totalDurationMs');
  @override
  late final GeneratedColumn<int> totalDurationMs = GeneratedColumn<int>(
      'total_duration_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _progressJsonMeta =
      const VerificationMeta('progressJson');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentProgress, String>
      progressJson = GeneratedColumn<String>(
              'progress_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<AssessmentProgress>(
              $AssessmentsTable.$converterprogressJson);
  static const VerificationMeta _phasesJsonMeta =
      const VerificationMeta('phasesJson');
  @override
  late final GeneratedColumnWithTypeConverter<List<AssessmentPhase>, String>
      phasesJson = GeneratedColumn<String>('phases_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<AssessmentPhase>>(
              $AssessmentsTable.$converterphasesJson);
  static const VerificationMeta _findingIdsMeta =
      const VerificationMeta('findingIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> findingIds =
      GeneratedColumn<String>('finding_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($AssessmentsTable.$converterfindingIds);
  static const VerificationMeta _evidenceIdsMeta =
      const VerificationMeta('evidenceIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      evidenceIds = GeneratedColumn<String>('evidence_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($AssessmentsTable.$converterevidenceIds);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $AssessmentsTable.$convertermetadata);
  static const VerificationMeta _assignedToMeta =
      const VerificationMeta('assignedTo');
  @override
  late final GeneratedColumn<String> assignedTo = GeneratedColumn<String>(
      'assigned_to', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parentAssessmentIdMeta =
      const VerificationMeta('parentAssessmentId');
  @override
  late final GeneratedColumn<String> parentAssessmentId =
      GeneratedColumn<String>('parent_assessment_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        name,
        type,
        status,
        scopeJson,
        configJson,
        createdAt,
        startedAt,
        completedAt,
        pausedAt,
        totalDurationMs,
        progressJson,
        phasesJson,
        findingIds,
        evidenceIds,
        metadata,
        assignedTo,
        parentAssessmentId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessments';
  @override
  VerificationContext validateIntegrity(Insertable<DbAssessment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    context.handle(_scopeJsonMeta, const VerificationResult.success());
    context.handle(_configJsonMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('paused_at')) {
      context.handle(_pausedAtMeta,
          pausedAt.isAcceptableOrUnknown(data['paused_at']!, _pausedAtMeta));
    }
    if (data.containsKey('total_duration_ms')) {
      context.handle(
          _totalDurationMsMeta,
          totalDurationMs.isAcceptableOrUnknown(
              data['total_duration_ms']!, _totalDurationMsMeta));
    } else if (isInserting) {
      context.missing(_totalDurationMsMeta);
    }
    context.handle(_progressJsonMeta, const VerificationResult.success());
    context.handle(_phasesJsonMeta, const VerificationResult.success());
    context.handle(_findingIdsMeta, const VerificationResult.success());
    context.handle(_evidenceIdsMeta, const VerificationResult.success());
    context.handle(_metadataMeta, const VerificationResult.success());
    if (data.containsKey('assigned_to')) {
      context.handle(
          _assignedToMeta,
          assignedTo.isAcceptableOrUnknown(
              data['assigned_to']!, _assignedToMeta));
    }
    if (data.containsKey('parent_assessment_id')) {
      context.handle(
          _parentAssessmentIdMeta,
          parentAssessmentId.isAcceptableOrUnknown(
              data['parent_assessment_id']!, _parentAssessmentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAssessment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAssessment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $AssessmentsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      status: $AssessmentsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      scopeJson: $AssessmentsTable.$converterscopeJson.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scope_json'])!),
      configJson: $AssessmentsTable.$converterconfigJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}config_json'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      pausedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}paused_at']),
      totalDurationMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_duration_ms'])!,
      progressJson: $AssessmentsTable.$converterprogressJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}progress_json'])!),
      phasesJson: $AssessmentsTable.$converterphasesJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}phases_json'])!),
      findingIds: $AssessmentsTable.$converterfindingIds.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}finding_ids'])!),
      evidenceIds: $AssessmentsTable.$converterevidenceIds.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}evidence_ids'])!),
      metadata: $AssessmentsTable.$convertermetadata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!),
      assignedTo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assigned_to']),
      parentAssessmentId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}parent_assessment_id']),
    );
  }

  @override
  $AssessmentsTable createAlias(String alias) {
    return $AssessmentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AssessmentType, int, int> $convertertype =
      const EnumIndexConverter<AssessmentType>(AssessmentType.values);
  static JsonTypeConverter2<AssessmentStatus, int, int> $converterstatus =
      const EnumIndexConverter<AssessmentStatus>(AssessmentStatus.values);
  static TypeConverter<AssessmentScope, String> $converterscopeJson =
      const AssessmentScopeConverter();
  static TypeConverter<AssessmentConfig, String> $converterconfigJson =
      const AssessmentConfigConverter();
  static TypeConverter<AssessmentProgress, String> $converterprogressJson =
      const AssessmentProgressConverter();
  static TypeConverter<List<AssessmentPhase>, String> $converterphasesJson =
      const AssessmentPhasesConverter();
  static TypeConverter<List<String>, String> $converterfindingIds =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterevidenceIds =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
}

class DbAssessment extends DataClass implements Insertable<DbAssessment> {
  final String id;
  final String projectId;
  final String name;
  final AssessmentType type;
  final AssessmentStatus status;
  final AssessmentScope scopeJson;
  final AssessmentConfig configJson;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? pausedAt;
  final int totalDurationMs;
  final AssessmentProgress progressJson;
  final List<AssessmentPhase> phasesJson;
  final List<String> findingIds;
  final List<String> evidenceIds;
  final Map<String, dynamic> metadata;
  final String? assignedTo;
  final String? parentAssessmentId;
  const DbAssessment(
      {required this.id,
      required this.projectId,
      required this.name,
      required this.type,
      required this.status,
      required this.scopeJson,
      required this.configJson,
      required this.createdAt,
      this.startedAt,
      this.completedAt,
      this.pausedAt,
      required this.totalDurationMs,
      required this.progressJson,
      required this.phasesJson,
      required this.findingIds,
      required this.evidenceIds,
      required this.metadata,
      this.assignedTo,
      this.parentAssessmentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<int>($AssessmentsTable.$convertertype.toSql(type));
    }
    {
      map['status'] =
          Variable<int>($AssessmentsTable.$converterstatus.toSql(status));
    }
    {
      map['scope_json'] = Variable<String>(
          $AssessmentsTable.$converterscopeJson.toSql(scopeJson));
    }
    {
      map['config_json'] = Variable<String>(
          $AssessmentsTable.$converterconfigJson.toSql(configJson));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || pausedAt != null) {
      map['paused_at'] = Variable<DateTime>(pausedAt);
    }
    map['total_duration_ms'] = Variable<int>(totalDurationMs);
    {
      map['progress_json'] = Variable<String>(
          $AssessmentsTable.$converterprogressJson.toSql(progressJson));
    }
    {
      map['phases_json'] = Variable<String>(
          $AssessmentsTable.$converterphasesJson.toSql(phasesJson));
    }
    {
      map['finding_ids'] = Variable<String>(
          $AssessmentsTable.$converterfindingIds.toSql(findingIds));
    }
    {
      map['evidence_ids'] = Variable<String>(
          $AssessmentsTable.$converterevidenceIds.toSql(evidenceIds));
    }
    {
      map['metadata'] = Variable<String>(
          $AssessmentsTable.$convertermetadata.toSql(metadata));
    }
    if (!nullToAbsent || assignedTo != null) {
      map['assigned_to'] = Variable<String>(assignedTo);
    }
    if (!nullToAbsent || parentAssessmentId != null) {
      map['parent_assessment_id'] = Variable<String>(parentAssessmentId);
    }
    return map;
  }

  AssessmentsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      type: Value(type),
      status: Value(status),
      scopeJson: Value(scopeJson),
      configJson: Value(configJson),
      createdAt: Value(createdAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      pausedAt: pausedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(pausedAt),
      totalDurationMs: Value(totalDurationMs),
      progressJson: Value(progressJson),
      phasesJson: Value(phasesJson),
      findingIds: Value(findingIds),
      evidenceIds: Value(evidenceIds),
      metadata: Value(metadata),
      assignedTo: assignedTo == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedTo),
      parentAssessmentId: parentAssessmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentAssessmentId),
    );
  }

  factory DbAssessment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAssessment(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      type: $AssessmentsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      status: $AssessmentsTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      scopeJson: serializer.fromJson<AssessmentScope>(json['scopeJson']),
      configJson: serializer.fromJson<AssessmentConfig>(json['configJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      pausedAt: serializer.fromJson<DateTime?>(json['pausedAt']),
      totalDurationMs: serializer.fromJson<int>(json['totalDurationMs']),
      progressJson:
          serializer.fromJson<AssessmentProgress>(json['progressJson']),
      phasesJson:
          serializer.fromJson<List<AssessmentPhase>>(json['phasesJson']),
      findingIds: serializer.fromJson<List<String>>(json['findingIds']),
      evidenceIds: serializer.fromJson<List<String>>(json['evidenceIds']),
      metadata: serializer.fromJson<Map<String, dynamic>>(json['metadata']),
      assignedTo: serializer.fromJson<String?>(json['assignedTo']),
      parentAssessmentId:
          serializer.fromJson<String?>(json['parentAssessmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'type':
          serializer.toJson<int>($AssessmentsTable.$convertertype.toJson(type)),
      'status': serializer
          .toJson<int>($AssessmentsTable.$converterstatus.toJson(status)),
      'scopeJson': serializer.toJson<AssessmentScope>(scopeJson),
      'configJson': serializer.toJson<AssessmentConfig>(configJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'pausedAt': serializer.toJson<DateTime?>(pausedAt),
      'totalDurationMs': serializer.toJson<int>(totalDurationMs),
      'progressJson': serializer.toJson<AssessmentProgress>(progressJson),
      'phasesJson': serializer.toJson<List<AssessmentPhase>>(phasesJson),
      'findingIds': serializer.toJson<List<String>>(findingIds),
      'evidenceIds': serializer.toJson<List<String>>(evidenceIds),
      'metadata': serializer.toJson<Map<String, dynamic>>(metadata),
      'assignedTo': serializer.toJson<String?>(assignedTo),
      'parentAssessmentId': serializer.toJson<String?>(parentAssessmentId),
    };
  }

  DbAssessment copyWith(
          {String? id,
          String? projectId,
          String? name,
          AssessmentType? type,
          AssessmentStatus? status,
          AssessmentScope? scopeJson,
          AssessmentConfig? configJson,
          DateTime? createdAt,
          Value<DateTime?> startedAt = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          Value<DateTime?> pausedAt = const Value.absent(),
          int? totalDurationMs,
          AssessmentProgress? progressJson,
          List<AssessmentPhase>? phasesJson,
          List<String>? findingIds,
          List<String>? evidenceIds,
          Map<String, dynamic>? metadata,
          Value<String?> assignedTo = const Value.absent(),
          Value<String?> parentAssessmentId = const Value.absent()}) =>
      DbAssessment(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        name: name ?? this.name,
        type: type ?? this.type,
        status: status ?? this.status,
        scopeJson: scopeJson ?? this.scopeJson,
        configJson: configJson ?? this.configJson,
        createdAt: createdAt ?? this.createdAt,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        pausedAt: pausedAt.present ? pausedAt.value : this.pausedAt,
        totalDurationMs: totalDurationMs ?? this.totalDurationMs,
        progressJson: progressJson ?? this.progressJson,
        phasesJson: phasesJson ?? this.phasesJson,
        findingIds: findingIds ?? this.findingIds,
        evidenceIds: evidenceIds ?? this.evidenceIds,
        metadata: metadata ?? this.metadata,
        assignedTo: assignedTo.present ? assignedTo.value : this.assignedTo,
        parentAssessmentId: parentAssessmentId.present
            ? parentAssessmentId.value
            : this.parentAssessmentId,
      );
  DbAssessment copyWithCompanion(AssessmentsCompanion data) {
    return DbAssessment(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      scopeJson: data.scopeJson.present ? data.scopeJson.value : this.scopeJson,
      configJson:
          data.configJson.present ? data.configJson.value : this.configJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      pausedAt: data.pausedAt.present ? data.pausedAt.value : this.pausedAt,
      totalDurationMs: data.totalDurationMs.present
          ? data.totalDurationMs.value
          : this.totalDurationMs,
      progressJson: data.progressJson.present
          ? data.progressJson.value
          : this.progressJson,
      phasesJson:
          data.phasesJson.present ? data.phasesJson.value : this.phasesJson,
      findingIds:
          data.findingIds.present ? data.findingIds.value : this.findingIds,
      evidenceIds:
          data.evidenceIds.present ? data.evidenceIds.value : this.evidenceIds,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      assignedTo:
          data.assignedTo.present ? data.assignedTo.value : this.assignedTo,
      parentAssessmentId: data.parentAssessmentId.present
          ? data.parentAssessmentId.value
          : this.parentAssessmentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAssessment(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('scopeJson: $scopeJson, ')
          ..write('configJson: $configJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('pausedAt: $pausedAt, ')
          ..write('totalDurationMs: $totalDurationMs, ')
          ..write('progressJson: $progressJson, ')
          ..write('phasesJson: $phasesJson, ')
          ..write('findingIds: $findingIds, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('metadata: $metadata, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('parentAssessmentId: $parentAssessmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      projectId,
      name,
      type,
      status,
      scopeJson,
      configJson,
      createdAt,
      startedAt,
      completedAt,
      pausedAt,
      totalDurationMs,
      progressJson,
      phasesJson,
      findingIds,
      evidenceIds,
      metadata,
      assignedTo,
      parentAssessmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAssessment &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.type == this.type &&
          other.status == this.status &&
          other.scopeJson == this.scopeJson &&
          other.configJson == this.configJson &&
          other.createdAt == this.createdAt &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.pausedAt == this.pausedAt &&
          other.totalDurationMs == this.totalDurationMs &&
          other.progressJson == this.progressJson &&
          other.phasesJson == this.phasesJson &&
          other.findingIds == this.findingIds &&
          other.evidenceIds == this.evidenceIds &&
          other.metadata == this.metadata &&
          other.assignedTo == this.assignedTo &&
          other.parentAssessmentId == this.parentAssessmentId);
}

class AssessmentsCompanion extends UpdateCompanion<DbAssessment> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<AssessmentType> type;
  final Value<AssessmentStatus> status;
  final Value<AssessmentScope> scopeJson;
  final Value<AssessmentConfig> configJson;
  final Value<DateTime> createdAt;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<DateTime?> pausedAt;
  final Value<int> totalDurationMs;
  final Value<AssessmentProgress> progressJson;
  final Value<List<AssessmentPhase>> phasesJson;
  final Value<List<String>> findingIds;
  final Value<List<String>> evidenceIds;
  final Value<Map<String, dynamic>> metadata;
  final Value<String?> assignedTo;
  final Value<String?> parentAssessmentId;
  final Value<int> rowid;
  const AssessmentsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.scopeJson = const Value.absent(),
    this.configJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.pausedAt = const Value.absent(),
    this.totalDurationMs = const Value.absent(),
    this.progressJson = const Value.absent(),
    this.phasesJson = const Value.absent(),
    this.findingIds = const Value.absent(),
    this.evidenceIds = const Value.absent(),
    this.metadata = const Value.absent(),
    this.assignedTo = const Value.absent(),
    this.parentAssessmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentsCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    required AssessmentType type,
    required AssessmentStatus status,
    required AssessmentScope scopeJson,
    required AssessmentConfig configJson,
    required DateTime createdAt,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.pausedAt = const Value.absent(),
    required int totalDurationMs,
    required AssessmentProgress progressJson,
    required List<AssessmentPhase> phasesJson,
    required List<String> findingIds,
    required List<String> evidenceIds,
    required Map<String, dynamic> metadata,
    this.assignedTo = const Value.absent(),
    this.parentAssessmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        projectId = Value(projectId),
        name = Value(name),
        type = Value(type),
        status = Value(status),
        scopeJson = Value(scopeJson),
        configJson = Value(configJson),
        createdAt = Value(createdAt),
        totalDurationMs = Value(totalDurationMs),
        progressJson = Value(progressJson),
        phasesJson = Value(phasesJson),
        findingIds = Value(findingIds),
        evidenceIds = Value(evidenceIds),
        metadata = Value(metadata);
  static Insertable<DbAssessment> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<int>? type,
    Expression<int>? status,
    Expression<String>? scopeJson,
    Expression<String>? configJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? pausedAt,
    Expression<int>? totalDurationMs,
    Expression<String>? progressJson,
    Expression<String>? phasesJson,
    Expression<String>? findingIds,
    Expression<String>? evidenceIds,
    Expression<String>? metadata,
    Expression<String>? assignedTo,
    Expression<String>? parentAssessmentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (scopeJson != null) 'scope_json': scopeJson,
      if (configJson != null) 'config_json': configJson,
      if (createdAt != null) 'created_at': createdAt,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (pausedAt != null) 'paused_at': pausedAt,
      if (totalDurationMs != null) 'total_duration_ms': totalDurationMs,
      if (progressJson != null) 'progress_json': progressJson,
      if (phasesJson != null) 'phases_json': phasesJson,
      if (findingIds != null) 'finding_ids': findingIds,
      if (evidenceIds != null) 'evidence_ids': evidenceIds,
      if (metadata != null) 'metadata': metadata,
      if (assignedTo != null) 'assigned_to': assignedTo,
      if (parentAssessmentId != null)
        'parent_assessment_id': parentAssessmentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? projectId,
      Value<String>? name,
      Value<AssessmentType>? type,
      Value<AssessmentStatus>? status,
      Value<AssessmentScope>? scopeJson,
      Value<AssessmentConfig>? configJson,
      Value<DateTime>? createdAt,
      Value<DateTime?>? startedAt,
      Value<DateTime?>? completedAt,
      Value<DateTime?>? pausedAt,
      Value<int>? totalDurationMs,
      Value<AssessmentProgress>? progressJson,
      Value<List<AssessmentPhase>>? phasesJson,
      Value<List<String>>? findingIds,
      Value<List<String>>? evidenceIds,
      Value<Map<String, dynamic>>? metadata,
      Value<String?>? assignedTo,
      Value<String?>? parentAssessmentId,
      Value<int>? rowid}) {
    return AssessmentsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      type: type ?? this.type,
      status: status ?? this.status,
      scopeJson: scopeJson ?? this.scopeJson,
      configJson: configJson ?? this.configJson,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      pausedAt: pausedAt ?? this.pausedAt,
      totalDurationMs: totalDurationMs ?? this.totalDurationMs,
      progressJson: progressJson ?? this.progressJson,
      phasesJson: phasesJson ?? this.phasesJson,
      findingIds: findingIds ?? this.findingIds,
      evidenceIds: evidenceIds ?? this.evidenceIds,
      metadata: metadata ?? this.metadata,
      assignedTo: assignedTo ?? this.assignedTo,
      parentAssessmentId: parentAssessmentId ?? this.parentAssessmentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($AssessmentsTable.$convertertype.toSql(type.value));
    }
    if (status.present) {
      map['status'] =
          Variable<int>($AssessmentsTable.$converterstatus.toSql(status.value));
    }
    if (scopeJson.present) {
      map['scope_json'] = Variable<String>(
          $AssessmentsTable.$converterscopeJson.toSql(scopeJson.value));
    }
    if (configJson.present) {
      map['config_json'] = Variable<String>(
          $AssessmentsTable.$converterconfigJson.toSql(configJson.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (pausedAt.present) {
      map['paused_at'] = Variable<DateTime>(pausedAt.value);
    }
    if (totalDurationMs.present) {
      map['total_duration_ms'] = Variable<int>(totalDurationMs.value);
    }
    if (progressJson.present) {
      map['progress_json'] = Variable<String>(
          $AssessmentsTable.$converterprogressJson.toSql(progressJson.value));
    }
    if (phasesJson.present) {
      map['phases_json'] = Variable<String>(
          $AssessmentsTable.$converterphasesJson.toSql(phasesJson.value));
    }
    if (findingIds.present) {
      map['finding_ids'] = Variable<String>(
          $AssessmentsTable.$converterfindingIds.toSql(findingIds.value));
    }
    if (evidenceIds.present) {
      map['evidence_ids'] = Variable<String>(
          $AssessmentsTable.$converterevidenceIds.toSql(evidenceIds.value));
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $AssessmentsTable.$convertermetadata.toSql(metadata.value));
    }
    if (assignedTo.present) {
      map['assigned_to'] = Variable<String>(assignedTo.value);
    }
    if (parentAssessmentId.present) {
      map['parent_assessment_id'] = Variable<String>(parentAssessmentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('scopeJson: $scopeJson, ')
          ..write('configJson: $configJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('pausedAt: $pausedAt, ')
          ..write('totalDurationMs: $totalDurationMs, ')
          ..write('progressJson: $progressJson, ')
          ..write('phasesJson: $phasesJson, ')
          ..write('findingIds: $findingIds, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('metadata: $metadata, ')
          ..write('assignedTo: $assignedTo, ')
          ..write('parentAssessmentId: $parentAssessmentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccessPointsTable extends AccessPoints
    with TableInfo<$AccessPointsTable, DbAccessPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccessPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bssidMeta = const VerificationMeta('bssid');
  @override
  late final GeneratedColumn<String> bssid = GeneratedColumn<String>(
      'bssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ssidMeta = const VerificationMeta('ssid');
  @override
  late final GeneratedColumn<String> ssid = GeneratedColumn<String>(
      'ssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _channelMeta =
      const VerificationMeta('channel');
  @override
  late final GeneratedColumn<int> channel = GeneratedColumn<int>(
      'channel', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _signalLevelMeta =
      const VerificationMeta('signalLevel');
  @override
  late final GeneratedColumn<int> signalLevel = GeneratedColumn<int>(
      'signal_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noiseLevelMeta =
      const VerificationMeta('noiseLevel');
  @override
  late final GeneratedColumn<int> noiseLevel = GeneratedColumn<int>(
      'noise_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _securityMeta =
      const VerificationMeta('security');
  @override
  late final GeneratedColumnWithTypeConverter<SecurityProtocol, int> security =
      GeneratedColumn<int>('security', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<SecurityProtocol>(
              $AccessPointsTable.$convertersecurity);
  static const VerificationMeta _supportedProtocolsMeta =
      const VerificationMeta('supportedProtocols');
  @override
  late final GeneratedColumnWithTypeConverter<List<SecurityProtocol>, String>
      supportedProtocols = GeneratedColumn<String>(
              'supported_protocols', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<SecurityProtocol>>(
              $AccessPointsTable.$convertersupportedProtocols);
  static const VerificationMeta _wpsEnabledMeta =
      const VerificationMeta('wpsEnabled');
  @override
  late final GeneratedColumn<bool> wpsEnabled = GeneratedColumn<bool>(
      'wps_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("wps_enabled" IN (0, 1))'));
  static const VerificationMeta _wpsManufacturerMeta =
      const VerificationMeta('wpsManufacturer');
  @override
  late final GeneratedColumn<String> wpsManufacturer = GeneratedColumn<String>(
      'wps_manufacturer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _wpsModelMeta =
      const VerificationMeta('wpsModel');
  @override
  late final GeneratedColumn<String> wpsModel = GeneratedColumn<String>(
      'wps_model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _beaconIntervalMeta =
      const VerificationMeta('beaconInterval');
  @override
  late final GeneratedColumn<int> beaconInterval = GeneratedColumn<int>(
      'beacon_interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _capabilityMaskMeta =
      const VerificationMeta('capabilityMask');
  @override
  late final GeneratedColumn<int> capabilityMask = GeneratedColumn<int>(
      'capability_mask', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _firstSeenMeta =
      const VerificationMeta('firstSeen');
  @override
  late final GeneratedColumn<DateTime> firstSeen = GeneratedColumn<DateTime>(
      'first_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastSeenMeta =
      const VerificationMeta('lastSeen');
  @override
  late final GeneratedColumn<DateTime> lastSeen = GeneratedColumn<DateTime>(
      'last_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _packetCountMeta =
      const VerificationMeta('packetCount');
  @override
  late final GeneratedColumn<int> packetCount = GeneratedColumn<int>(
      'packet_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _vendorIEsMeta =
      const VerificationMeta('vendorIEs');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      vendorIEs = GeneratedColumn<String>('vendor_i_es', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $AccessPointsTable.$convertervendorIEs);
  static const VerificationMeta _clientIdsMeta =
      const VerificationMeta('clientIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> clientIds =
      GeneratedColumn<String>('client_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($AccessPointsTable.$converterclientIds);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        bssid,
        ssid,
        frequency,
        channel,
        signalLevel,
        noiseLevel,
        security,
        supportedProtocols,
        wpsEnabled,
        wpsManufacturer,
        wpsModel,
        beaconInterval,
        capabilityMask,
        firstSeen,
        lastSeen,
        packetCount,
        vendorIEs,
        clientIds
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'access_points';
  @override
  VerificationContext validateIntegrity(Insertable<DbAccessPoint> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('bssid')) {
      context.handle(
          _bssidMeta, bssid.isAcceptableOrUnknown(data['bssid']!, _bssidMeta));
    } else if (isInserting) {
      context.missing(_bssidMeta);
    }
    if (data.containsKey('ssid')) {
      context.handle(
          _ssidMeta, ssid.isAcceptableOrUnknown(data['ssid']!, _ssidMeta));
    } else if (isInserting) {
      context.missing(_ssidMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(_channelMeta,
          channel.isAcceptableOrUnknown(data['channel']!, _channelMeta));
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('signal_level')) {
      context.handle(
          _signalLevelMeta,
          signalLevel.isAcceptableOrUnknown(
              data['signal_level']!, _signalLevelMeta));
    } else if (isInserting) {
      context.missing(_signalLevelMeta);
    }
    if (data.containsKey('noise_level')) {
      context.handle(
          _noiseLevelMeta,
          noiseLevel.isAcceptableOrUnknown(
              data['noise_level']!, _noiseLevelMeta));
    } else if (isInserting) {
      context.missing(_noiseLevelMeta);
    }
    context.handle(_securityMeta, const VerificationResult.success());
    context.handle(_supportedProtocolsMeta, const VerificationResult.success());
    if (data.containsKey('wps_enabled')) {
      context.handle(
          _wpsEnabledMeta,
          wpsEnabled.isAcceptableOrUnknown(
              data['wps_enabled']!, _wpsEnabledMeta));
    } else if (isInserting) {
      context.missing(_wpsEnabledMeta);
    }
    if (data.containsKey('wps_manufacturer')) {
      context.handle(
          _wpsManufacturerMeta,
          wpsManufacturer.isAcceptableOrUnknown(
              data['wps_manufacturer']!, _wpsManufacturerMeta));
    }
    if (data.containsKey('wps_model')) {
      context.handle(_wpsModelMeta,
          wpsModel.isAcceptableOrUnknown(data['wps_model']!, _wpsModelMeta));
    }
    if (data.containsKey('beacon_interval')) {
      context.handle(
          _beaconIntervalMeta,
          beaconInterval.isAcceptableOrUnknown(
              data['beacon_interval']!, _beaconIntervalMeta));
    } else if (isInserting) {
      context.missing(_beaconIntervalMeta);
    }
    if (data.containsKey('capability_mask')) {
      context.handle(
          _capabilityMaskMeta,
          capabilityMask.isAcceptableOrUnknown(
              data['capability_mask']!, _capabilityMaskMeta));
    } else if (isInserting) {
      context.missing(_capabilityMaskMeta);
    }
    if (data.containsKey('first_seen')) {
      context.handle(_firstSeenMeta,
          firstSeen.isAcceptableOrUnknown(data['first_seen']!, _firstSeenMeta));
    } else if (isInserting) {
      context.missing(_firstSeenMeta);
    }
    if (data.containsKey('last_seen')) {
      context.handle(_lastSeenMeta,
          lastSeen.isAcceptableOrUnknown(data['last_seen']!, _lastSeenMeta));
    } else if (isInserting) {
      context.missing(_lastSeenMeta);
    }
    if (data.containsKey('packet_count')) {
      context.handle(
          _packetCountMeta,
          packetCount.isAcceptableOrUnknown(
              data['packet_count']!, _packetCountMeta));
    } else if (isInserting) {
      context.missing(_packetCountMeta);
    }
    context.handle(_vendorIEsMeta, const VerificationResult.success());
    context.handle(_clientIdsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAccessPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAccessPoint(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      bssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bssid'])!,
      ssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ssid'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency'])!,
      channel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}channel'])!,
      signalLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}signal_level'])!,
      noiseLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}noise_level'])!,
      security: $AccessPointsTable.$convertersecurity.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}security'])!),
      supportedProtocols: $AccessPointsTable.$convertersupportedProtocols
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}supported_protocols'])!),
      wpsEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}wps_enabled'])!,
      wpsManufacturer: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}wps_manufacturer']),
      wpsModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wps_model']),
      beaconInterval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}beacon_interval'])!,
      capabilityMask: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}capability_mask'])!,
      firstSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}first_seen'])!,
      lastSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_seen'])!,
      packetCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}packet_count'])!,
      vendorIEs: $AccessPointsTable.$convertervendorIEs.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vendor_i_es'])!),
      clientIds: $AccessPointsTable.$converterclientIds.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_ids'])!),
    );
  }

  @override
  $AccessPointsTable createAlias(String alias) {
    return $AccessPointsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SecurityProtocol, int, int> $convertersecurity =
      const EnumIndexConverter<SecurityProtocol>(SecurityProtocol.values);
  static TypeConverter<List<SecurityProtocol>, String>
      $convertersupportedProtocols = const SecurityProtocolListConverter();
  static TypeConverter<Map<String, dynamic>, String> $convertervendorIEs =
      const JsonMapConverter();
  static TypeConverter<List<String>, String> $converterclientIds =
      const StringListConverter();
}

class DbAccessPoint extends DataClass implements Insertable<DbAccessPoint> {
  final String id;
  final String assessmentId;
  final String bssid;
  final String ssid;
  final int frequency;
  final int channel;
  final int signalLevel;
  final int noiseLevel;
  final SecurityProtocol security;
  final List<SecurityProtocol> supportedProtocols;
  final bool wpsEnabled;
  final String? wpsManufacturer;
  final String? wpsModel;
  final int beaconInterval;
  final int capabilityMask;
  final DateTime firstSeen;
  final DateTime lastSeen;
  final int packetCount;
  final Map<String, dynamic> vendorIEs;
  final List<String> clientIds;
  const DbAccessPoint(
      {required this.id,
      required this.assessmentId,
      required this.bssid,
      required this.ssid,
      required this.frequency,
      required this.channel,
      required this.signalLevel,
      required this.noiseLevel,
      required this.security,
      required this.supportedProtocols,
      required this.wpsEnabled,
      this.wpsManufacturer,
      this.wpsModel,
      required this.beaconInterval,
      required this.capabilityMask,
      required this.firstSeen,
      required this.lastSeen,
      required this.packetCount,
      required this.vendorIEs,
      required this.clientIds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    map['bssid'] = Variable<String>(bssid);
    map['ssid'] = Variable<String>(ssid);
    map['frequency'] = Variable<int>(frequency);
    map['channel'] = Variable<int>(channel);
    map['signal_level'] = Variable<int>(signalLevel);
    map['noise_level'] = Variable<int>(noiseLevel);
    {
      map['security'] =
          Variable<int>($AccessPointsTable.$convertersecurity.toSql(security));
    }
    {
      map['supported_protocols'] = Variable<String>($AccessPointsTable
          .$convertersupportedProtocols
          .toSql(supportedProtocols));
    }
    map['wps_enabled'] = Variable<bool>(wpsEnabled);
    if (!nullToAbsent || wpsManufacturer != null) {
      map['wps_manufacturer'] = Variable<String>(wpsManufacturer);
    }
    if (!nullToAbsent || wpsModel != null) {
      map['wps_model'] = Variable<String>(wpsModel);
    }
    map['beacon_interval'] = Variable<int>(beaconInterval);
    map['capability_mask'] = Variable<int>(capabilityMask);
    map['first_seen'] = Variable<DateTime>(firstSeen);
    map['last_seen'] = Variable<DateTime>(lastSeen);
    map['packet_count'] = Variable<int>(packetCount);
    {
      map['vendor_i_es'] = Variable<String>(
          $AccessPointsTable.$convertervendorIEs.toSql(vendorIEs));
    }
    {
      map['client_ids'] = Variable<String>(
          $AccessPointsTable.$converterclientIds.toSql(clientIds));
    }
    return map;
  }

  AccessPointsCompanion toCompanion(bool nullToAbsent) {
    return AccessPointsCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      bssid: Value(bssid),
      ssid: Value(ssid),
      frequency: Value(frequency),
      channel: Value(channel),
      signalLevel: Value(signalLevel),
      noiseLevel: Value(noiseLevel),
      security: Value(security),
      supportedProtocols: Value(supportedProtocols),
      wpsEnabled: Value(wpsEnabled),
      wpsManufacturer: wpsManufacturer == null && nullToAbsent
          ? const Value.absent()
          : Value(wpsManufacturer),
      wpsModel: wpsModel == null && nullToAbsent
          ? const Value.absent()
          : Value(wpsModel),
      beaconInterval: Value(beaconInterval),
      capabilityMask: Value(capabilityMask),
      firstSeen: Value(firstSeen),
      lastSeen: Value(lastSeen),
      packetCount: Value(packetCount),
      vendorIEs: Value(vendorIEs),
      clientIds: Value(clientIds),
    );
  }

  factory DbAccessPoint.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAccessPoint(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      bssid: serializer.fromJson<String>(json['bssid']),
      ssid: serializer.fromJson<String>(json['ssid']),
      frequency: serializer.fromJson<int>(json['frequency']),
      channel: serializer.fromJson<int>(json['channel']),
      signalLevel: serializer.fromJson<int>(json['signalLevel']),
      noiseLevel: serializer.fromJson<int>(json['noiseLevel']),
      security: $AccessPointsTable.$convertersecurity
          .fromJson(serializer.fromJson<int>(json['security'])),
      supportedProtocols: serializer
          .fromJson<List<SecurityProtocol>>(json['supportedProtocols']),
      wpsEnabled: serializer.fromJson<bool>(json['wpsEnabled']),
      wpsManufacturer: serializer.fromJson<String?>(json['wpsManufacturer']),
      wpsModel: serializer.fromJson<String?>(json['wpsModel']),
      beaconInterval: serializer.fromJson<int>(json['beaconInterval']),
      capabilityMask: serializer.fromJson<int>(json['capabilityMask']),
      firstSeen: serializer.fromJson<DateTime>(json['firstSeen']),
      lastSeen: serializer.fromJson<DateTime>(json['lastSeen']),
      packetCount: serializer.fromJson<int>(json['packetCount']),
      vendorIEs: serializer.fromJson<Map<String, dynamic>>(json['vendorIEs']),
      clientIds: serializer.fromJson<List<String>>(json['clientIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'bssid': serializer.toJson<String>(bssid),
      'ssid': serializer.toJson<String>(ssid),
      'frequency': serializer.toJson<int>(frequency),
      'channel': serializer.toJson<int>(channel),
      'signalLevel': serializer.toJson<int>(signalLevel),
      'noiseLevel': serializer.toJson<int>(noiseLevel),
      'security': serializer
          .toJson<int>($AccessPointsTable.$convertersecurity.toJson(security)),
      'supportedProtocols':
          serializer.toJson<List<SecurityProtocol>>(supportedProtocols),
      'wpsEnabled': serializer.toJson<bool>(wpsEnabled),
      'wpsManufacturer': serializer.toJson<String?>(wpsManufacturer),
      'wpsModel': serializer.toJson<String?>(wpsModel),
      'beaconInterval': serializer.toJson<int>(beaconInterval),
      'capabilityMask': serializer.toJson<int>(capabilityMask),
      'firstSeen': serializer.toJson<DateTime>(firstSeen),
      'lastSeen': serializer.toJson<DateTime>(lastSeen),
      'packetCount': serializer.toJson<int>(packetCount),
      'vendorIEs': serializer.toJson<Map<String, dynamic>>(vendorIEs),
      'clientIds': serializer.toJson<List<String>>(clientIds),
    };
  }

  DbAccessPoint copyWith(
          {String? id,
          String? assessmentId,
          String? bssid,
          String? ssid,
          int? frequency,
          int? channel,
          int? signalLevel,
          int? noiseLevel,
          SecurityProtocol? security,
          List<SecurityProtocol>? supportedProtocols,
          bool? wpsEnabled,
          Value<String?> wpsManufacturer = const Value.absent(),
          Value<String?> wpsModel = const Value.absent(),
          int? beaconInterval,
          int? capabilityMask,
          DateTime? firstSeen,
          DateTime? lastSeen,
          int? packetCount,
          Map<String, dynamic>? vendorIEs,
          List<String>? clientIds}) =>
      DbAccessPoint(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        bssid: bssid ?? this.bssid,
        ssid: ssid ?? this.ssid,
        frequency: frequency ?? this.frequency,
        channel: channel ?? this.channel,
        signalLevel: signalLevel ?? this.signalLevel,
        noiseLevel: noiseLevel ?? this.noiseLevel,
        security: security ?? this.security,
        supportedProtocols: supportedProtocols ?? this.supportedProtocols,
        wpsEnabled: wpsEnabled ?? this.wpsEnabled,
        wpsManufacturer: wpsManufacturer.present
            ? wpsManufacturer.value
            : this.wpsManufacturer,
        wpsModel: wpsModel.present ? wpsModel.value : this.wpsModel,
        beaconInterval: beaconInterval ?? this.beaconInterval,
        capabilityMask: capabilityMask ?? this.capabilityMask,
        firstSeen: firstSeen ?? this.firstSeen,
        lastSeen: lastSeen ?? this.lastSeen,
        packetCount: packetCount ?? this.packetCount,
        vendorIEs: vendorIEs ?? this.vendorIEs,
        clientIds: clientIds ?? this.clientIds,
      );
  DbAccessPoint copyWithCompanion(AccessPointsCompanion data) {
    return DbAccessPoint(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      bssid: data.bssid.present ? data.bssid.value : this.bssid,
      ssid: data.ssid.present ? data.ssid.value : this.ssid,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      channel: data.channel.present ? data.channel.value : this.channel,
      signalLevel:
          data.signalLevel.present ? data.signalLevel.value : this.signalLevel,
      noiseLevel:
          data.noiseLevel.present ? data.noiseLevel.value : this.noiseLevel,
      security: data.security.present ? data.security.value : this.security,
      supportedProtocols: data.supportedProtocols.present
          ? data.supportedProtocols.value
          : this.supportedProtocols,
      wpsEnabled:
          data.wpsEnabled.present ? data.wpsEnabled.value : this.wpsEnabled,
      wpsManufacturer: data.wpsManufacturer.present
          ? data.wpsManufacturer.value
          : this.wpsManufacturer,
      wpsModel: data.wpsModel.present ? data.wpsModel.value : this.wpsModel,
      beaconInterval: data.beaconInterval.present
          ? data.beaconInterval.value
          : this.beaconInterval,
      capabilityMask: data.capabilityMask.present
          ? data.capabilityMask.value
          : this.capabilityMask,
      firstSeen: data.firstSeen.present ? data.firstSeen.value : this.firstSeen,
      lastSeen: data.lastSeen.present ? data.lastSeen.value : this.lastSeen,
      packetCount:
          data.packetCount.present ? data.packetCount.value : this.packetCount,
      vendorIEs: data.vendorIEs.present ? data.vendorIEs.value : this.vendorIEs,
      clientIds: data.clientIds.present ? data.clientIds.value : this.clientIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAccessPoint(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('bssid: $bssid, ')
          ..write('ssid: $ssid, ')
          ..write('frequency: $frequency, ')
          ..write('channel: $channel, ')
          ..write('signalLevel: $signalLevel, ')
          ..write('noiseLevel: $noiseLevel, ')
          ..write('security: $security, ')
          ..write('supportedProtocols: $supportedProtocols, ')
          ..write('wpsEnabled: $wpsEnabled, ')
          ..write('wpsManufacturer: $wpsManufacturer, ')
          ..write('wpsModel: $wpsModel, ')
          ..write('beaconInterval: $beaconInterval, ')
          ..write('capabilityMask: $capabilityMask, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('packetCount: $packetCount, ')
          ..write('vendorIEs: $vendorIEs, ')
          ..write('clientIds: $clientIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      assessmentId,
      bssid,
      ssid,
      frequency,
      channel,
      signalLevel,
      noiseLevel,
      security,
      supportedProtocols,
      wpsEnabled,
      wpsManufacturer,
      wpsModel,
      beaconInterval,
      capabilityMask,
      firstSeen,
      lastSeen,
      packetCount,
      vendorIEs,
      clientIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAccessPoint &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.bssid == this.bssid &&
          other.ssid == this.ssid &&
          other.frequency == this.frequency &&
          other.channel == this.channel &&
          other.signalLevel == this.signalLevel &&
          other.noiseLevel == this.noiseLevel &&
          other.security == this.security &&
          other.supportedProtocols == this.supportedProtocols &&
          other.wpsEnabled == this.wpsEnabled &&
          other.wpsManufacturer == this.wpsManufacturer &&
          other.wpsModel == this.wpsModel &&
          other.beaconInterval == this.beaconInterval &&
          other.capabilityMask == this.capabilityMask &&
          other.firstSeen == this.firstSeen &&
          other.lastSeen == this.lastSeen &&
          other.packetCount == this.packetCount &&
          other.vendorIEs == this.vendorIEs &&
          other.clientIds == this.clientIds);
}

class AccessPointsCompanion extends UpdateCompanion<DbAccessPoint> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<String> bssid;
  final Value<String> ssid;
  final Value<int> frequency;
  final Value<int> channel;
  final Value<int> signalLevel;
  final Value<int> noiseLevel;
  final Value<SecurityProtocol> security;
  final Value<List<SecurityProtocol>> supportedProtocols;
  final Value<bool> wpsEnabled;
  final Value<String?> wpsManufacturer;
  final Value<String?> wpsModel;
  final Value<int> beaconInterval;
  final Value<int> capabilityMask;
  final Value<DateTime> firstSeen;
  final Value<DateTime> lastSeen;
  final Value<int> packetCount;
  final Value<Map<String, dynamic>> vendorIEs;
  final Value<List<String>> clientIds;
  final Value<int> rowid;
  const AccessPointsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.bssid = const Value.absent(),
    this.ssid = const Value.absent(),
    this.frequency = const Value.absent(),
    this.channel = const Value.absent(),
    this.signalLevel = const Value.absent(),
    this.noiseLevel = const Value.absent(),
    this.security = const Value.absent(),
    this.supportedProtocols = const Value.absent(),
    this.wpsEnabled = const Value.absent(),
    this.wpsManufacturer = const Value.absent(),
    this.wpsModel = const Value.absent(),
    this.beaconInterval = const Value.absent(),
    this.capabilityMask = const Value.absent(),
    this.firstSeen = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.packetCount = const Value.absent(),
    this.vendorIEs = const Value.absent(),
    this.clientIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccessPointsCompanion.insert({
    required String id,
    required String assessmentId,
    required String bssid,
    required String ssid,
    required int frequency,
    required int channel,
    required int signalLevel,
    required int noiseLevel,
    required SecurityProtocol security,
    required List<SecurityProtocol> supportedProtocols,
    required bool wpsEnabled,
    this.wpsManufacturer = const Value.absent(),
    this.wpsModel = const Value.absent(),
    required int beaconInterval,
    required int capabilityMask,
    required DateTime firstSeen,
    required DateTime lastSeen,
    required int packetCount,
    required Map<String, dynamic> vendorIEs,
    required List<String> clientIds,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        bssid = Value(bssid),
        ssid = Value(ssid),
        frequency = Value(frequency),
        channel = Value(channel),
        signalLevel = Value(signalLevel),
        noiseLevel = Value(noiseLevel),
        security = Value(security),
        supportedProtocols = Value(supportedProtocols),
        wpsEnabled = Value(wpsEnabled),
        beaconInterval = Value(beaconInterval),
        capabilityMask = Value(capabilityMask),
        firstSeen = Value(firstSeen),
        lastSeen = Value(lastSeen),
        packetCount = Value(packetCount),
        vendorIEs = Value(vendorIEs),
        clientIds = Value(clientIds);
  static Insertable<DbAccessPoint> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<String>? bssid,
    Expression<String>? ssid,
    Expression<int>? frequency,
    Expression<int>? channel,
    Expression<int>? signalLevel,
    Expression<int>? noiseLevel,
    Expression<int>? security,
    Expression<String>? supportedProtocols,
    Expression<bool>? wpsEnabled,
    Expression<String>? wpsManufacturer,
    Expression<String>? wpsModel,
    Expression<int>? beaconInterval,
    Expression<int>? capabilityMask,
    Expression<DateTime>? firstSeen,
    Expression<DateTime>? lastSeen,
    Expression<int>? packetCount,
    Expression<String>? vendorIEs,
    Expression<String>? clientIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (bssid != null) 'bssid': bssid,
      if (ssid != null) 'ssid': ssid,
      if (frequency != null) 'frequency': frequency,
      if (channel != null) 'channel': channel,
      if (signalLevel != null) 'signal_level': signalLevel,
      if (noiseLevel != null) 'noise_level': noiseLevel,
      if (security != null) 'security': security,
      if (supportedProtocols != null) 'supported_protocols': supportedProtocols,
      if (wpsEnabled != null) 'wps_enabled': wpsEnabled,
      if (wpsManufacturer != null) 'wps_manufacturer': wpsManufacturer,
      if (wpsModel != null) 'wps_model': wpsModel,
      if (beaconInterval != null) 'beacon_interval': beaconInterval,
      if (capabilityMask != null) 'capability_mask': capabilityMask,
      if (firstSeen != null) 'first_seen': firstSeen,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (packetCount != null) 'packet_count': packetCount,
      if (vendorIEs != null) 'vendor_i_es': vendorIEs,
      if (clientIds != null) 'client_ids': clientIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccessPointsCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<String>? bssid,
      Value<String>? ssid,
      Value<int>? frequency,
      Value<int>? channel,
      Value<int>? signalLevel,
      Value<int>? noiseLevel,
      Value<SecurityProtocol>? security,
      Value<List<SecurityProtocol>>? supportedProtocols,
      Value<bool>? wpsEnabled,
      Value<String?>? wpsManufacturer,
      Value<String?>? wpsModel,
      Value<int>? beaconInterval,
      Value<int>? capabilityMask,
      Value<DateTime>? firstSeen,
      Value<DateTime>? lastSeen,
      Value<int>? packetCount,
      Value<Map<String, dynamic>>? vendorIEs,
      Value<List<String>>? clientIds,
      Value<int>? rowid}) {
    return AccessPointsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      bssid: bssid ?? this.bssid,
      ssid: ssid ?? this.ssid,
      frequency: frequency ?? this.frequency,
      channel: channel ?? this.channel,
      signalLevel: signalLevel ?? this.signalLevel,
      noiseLevel: noiseLevel ?? this.noiseLevel,
      security: security ?? this.security,
      supportedProtocols: supportedProtocols ?? this.supportedProtocols,
      wpsEnabled: wpsEnabled ?? this.wpsEnabled,
      wpsManufacturer: wpsManufacturer ?? this.wpsManufacturer,
      wpsModel: wpsModel ?? this.wpsModel,
      beaconInterval: beaconInterval ?? this.beaconInterval,
      capabilityMask: capabilityMask ?? this.capabilityMask,
      firstSeen: firstSeen ?? this.firstSeen,
      lastSeen: lastSeen ?? this.lastSeen,
      packetCount: packetCount ?? this.packetCount,
      vendorIEs: vendorIEs ?? this.vendorIEs,
      clientIds: clientIds ?? this.clientIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (bssid.present) {
      map['bssid'] = Variable<String>(bssid.value);
    }
    if (ssid.present) {
      map['ssid'] = Variable<String>(ssid.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (channel.present) {
      map['channel'] = Variable<int>(channel.value);
    }
    if (signalLevel.present) {
      map['signal_level'] = Variable<int>(signalLevel.value);
    }
    if (noiseLevel.present) {
      map['noise_level'] = Variable<int>(noiseLevel.value);
    }
    if (security.present) {
      map['security'] = Variable<int>(
          $AccessPointsTable.$convertersecurity.toSql(security.value));
    }
    if (supportedProtocols.present) {
      map['supported_protocols'] = Variable<String>($AccessPointsTable
          .$convertersupportedProtocols
          .toSql(supportedProtocols.value));
    }
    if (wpsEnabled.present) {
      map['wps_enabled'] = Variable<bool>(wpsEnabled.value);
    }
    if (wpsManufacturer.present) {
      map['wps_manufacturer'] = Variable<String>(wpsManufacturer.value);
    }
    if (wpsModel.present) {
      map['wps_model'] = Variable<String>(wpsModel.value);
    }
    if (beaconInterval.present) {
      map['beacon_interval'] = Variable<int>(beaconInterval.value);
    }
    if (capabilityMask.present) {
      map['capability_mask'] = Variable<int>(capabilityMask.value);
    }
    if (firstSeen.present) {
      map['first_seen'] = Variable<DateTime>(firstSeen.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (packetCount.present) {
      map['packet_count'] = Variable<int>(packetCount.value);
    }
    if (vendorIEs.present) {
      map['vendor_i_es'] = Variable<String>(
          $AccessPointsTable.$convertervendorIEs.toSql(vendorIEs.value));
    }
    if (clientIds.present) {
      map['client_ids'] = Variable<String>(
          $AccessPointsTable.$converterclientIds.toSql(clientIds.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccessPointsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('bssid: $bssid, ')
          ..write('ssid: $ssid, ')
          ..write('frequency: $frequency, ')
          ..write('channel: $channel, ')
          ..write('signalLevel: $signalLevel, ')
          ..write('noiseLevel: $noiseLevel, ')
          ..write('security: $security, ')
          ..write('supportedProtocols: $supportedProtocols, ')
          ..write('wpsEnabled: $wpsEnabled, ')
          ..write('wpsManufacturer: $wpsManufacturer, ')
          ..write('wpsModel: $wpsModel, ')
          ..write('beaconInterval: $beaconInterval, ')
          ..write('capabilityMask: $capabilityMask, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('packetCount: $packetCount, ')
          ..write('vendorIEs: $vendorIEs, ')
          ..write('clientIds: $clientIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientDevicesTable extends ClientDevices
    with TableInfo<$ClientDevicesTable, DbClientDevice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientDevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessPointIdMeta =
      const VerificationMeta('accessPointId');
  @override
  late final GeneratedColumn<String> accessPointId = GeneratedColumn<String>(
      'access_point_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _macAddressMeta =
      const VerificationMeta('macAddress');
  @override
  late final GeneratedColumn<String> macAddress = GeneratedColumn<String>(
      'mac_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hostnameMeta =
      const VerificationMeta('hostname');
  @override
  late final GeneratedColumn<String> hostname = GeneratedColumn<String>(
      'hostname', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  @override
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
      'vendor', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _signalLevelMeta =
      const VerificationMeta('signalLevel');
  @override
  late final GeneratedColumn<int> signalLevel = GeneratedColumn<int>(
      'signal_level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dataFramesMeta =
      const VerificationMeta('dataFrames');
  @override
  late final GeneratedColumn<int> dataFrames = GeneratedColumn<int>(
      'data_frames', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _firstSeenMeta =
      const VerificationMeta('firstSeen');
  @override
  late final GeneratedColumn<DateTime> firstSeen = GeneratedColumn<DateTime>(
      'first_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastSeenMeta =
      const VerificationMeta('lastSeen');
  @override
  late final GeneratedColumn<DateTime> lastSeen = GeneratedColumn<DateTime>(
      'last_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _associatedBssidMeta =
      const VerificationMeta('associatedBssid');
  @override
  late final GeneratedColumn<String> associatedBssid = GeneratedColumn<String>(
      'associated_bssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _probeRequestsJsonMeta =
      const VerificationMeta('probeRequestsJson');
  @override
  late final GeneratedColumnWithTypeConverter<List<ProbeRequest>, String>
      probeRequestsJson = GeneratedColumn<String>(
              'probe_requests_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<ProbeRequest>>(
              $ClientDevicesTable.$converterprobeRequestsJson);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accessPointId,
        macAddress,
        hostname,
        vendor,
        signalLevel,
        dataFrames,
        firstSeen,
        lastSeen,
        associatedBssid,
        probeRequestsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client_devices';
  @override
  VerificationContext validateIntegrity(Insertable<DbClientDevice> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('access_point_id')) {
      context.handle(
          _accessPointIdMeta,
          accessPointId.isAcceptableOrUnknown(
              data['access_point_id']!, _accessPointIdMeta));
    } else if (isInserting) {
      context.missing(_accessPointIdMeta);
    }
    if (data.containsKey('mac_address')) {
      context.handle(
          _macAddressMeta,
          macAddress.isAcceptableOrUnknown(
              data['mac_address']!, _macAddressMeta));
    } else if (isInserting) {
      context.missing(_macAddressMeta);
    }
    if (data.containsKey('hostname')) {
      context.handle(_hostnameMeta,
          hostname.isAcceptableOrUnknown(data['hostname']!, _hostnameMeta));
    }
    if (data.containsKey('vendor')) {
      context.handle(_vendorMeta,
          vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta));
    }
    if (data.containsKey('signal_level')) {
      context.handle(
          _signalLevelMeta,
          signalLevel.isAcceptableOrUnknown(
              data['signal_level']!, _signalLevelMeta));
    } else if (isInserting) {
      context.missing(_signalLevelMeta);
    }
    if (data.containsKey('data_frames')) {
      context.handle(
          _dataFramesMeta,
          dataFrames.isAcceptableOrUnknown(
              data['data_frames']!, _dataFramesMeta));
    } else if (isInserting) {
      context.missing(_dataFramesMeta);
    }
    if (data.containsKey('first_seen')) {
      context.handle(_firstSeenMeta,
          firstSeen.isAcceptableOrUnknown(data['first_seen']!, _firstSeenMeta));
    } else if (isInserting) {
      context.missing(_firstSeenMeta);
    }
    if (data.containsKey('last_seen')) {
      context.handle(_lastSeenMeta,
          lastSeen.isAcceptableOrUnknown(data['last_seen']!, _lastSeenMeta));
    } else if (isInserting) {
      context.missing(_lastSeenMeta);
    }
    if (data.containsKey('associated_bssid')) {
      context.handle(
          _associatedBssidMeta,
          associatedBssid.isAcceptableOrUnknown(
              data['associated_bssid']!, _associatedBssidMeta));
    } else if (isInserting) {
      context.missing(_associatedBssidMeta);
    }
    context.handle(_probeRequestsJsonMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbClientDevice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbClientDevice(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      accessPointId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}access_point_id'])!,
      macAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mac_address'])!,
      hostname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hostname']),
      vendor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vendor']),
      signalLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}signal_level'])!,
      dataFrames: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}data_frames'])!,
      firstSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}first_seen'])!,
      lastSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_seen'])!,
      associatedBssid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}associated_bssid'])!,
      probeRequestsJson: $ClientDevicesTable.$converterprobeRequestsJson
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}probe_requests_json'])!),
    );
  }

  @override
  $ClientDevicesTable createAlias(String alias) {
    return $ClientDevicesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ProbeRequest>, String> $converterprobeRequestsJson =
      const ProbeRequestListConverter();
}

class DbClientDevice extends DataClass implements Insertable<DbClientDevice> {
  final String id;
  final String accessPointId;
  final String macAddress;
  final String? hostname;
  final String? vendor;
  final int signalLevel;
  final int dataFrames;
  final DateTime firstSeen;
  final DateTime lastSeen;
  final String associatedBssid;
  final List<ProbeRequest> probeRequestsJson;
  const DbClientDevice(
      {required this.id,
      required this.accessPointId,
      required this.macAddress,
      this.hostname,
      this.vendor,
      required this.signalLevel,
      required this.dataFrames,
      required this.firstSeen,
      required this.lastSeen,
      required this.associatedBssid,
      required this.probeRequestsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['access_point_id'] = Variable<String>(accessPointId);
    map['mac_address'] = Variable<String>(macAddress);
    if (!nullToAbsent || hostname != null) {
      map['hostname'] = Variable<String>(hostname);
    }
    if (!nullToAbsent || vendor != null) {
      map['vendor'] = Variable<String>(vendor);
    }
    map['signal_level'] = Variable<int>(signalLevel);
    map['data_frames'] = Variable<int>(dataFrames);
    map['first_seen'] = Variable<DateTime>(firstSeen);
    map['last_seen'] = Variable<DateTime>(lastSeen);
    map['associated_bssid'] = Variable<String>(associatedBssid);
    {
      map['probe_requests_json'] = Variable<String>($ClientDevicesTable
          .$converterprobeRequestsJson
          .toSql(probeRequestsJson));
    }
    return map;
  }

  ClientDevicesCompanion toCompanion(bool nullToAbsent) {
    return ClientDevicesCompanion(
      id: Value(id),
      accessPointId: Value(accessPointId),
      macAddress: Value(macAddress),
      hostname: hostname == null && nullToAbsent
          ? const Value.absent()
          : Value(hostname),
      vendor:
          vendor == null && nullToAbsent ? const Value.absent() : Value(vendor),
      signalLevel: Value(signalLevel),
      dataFrames: Value(dataFrames),
      firstSeen: Value(firstSeen),
      lastSeen: Value(lastSeen),
      associatedBssid: Value(associatedBssid),
      probeRequestsJson: Value(probeRequestsJson),
    );
  }

  factory DbClientDevice.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbClientDevice(
      id: serializer.fromJson<String>(json['id']),
      accessPointId: serializer.fromJson<String>(json['accessPointId']),
      macAddress: serializer.fromJson<String>(json['macAddress']),
      hostname: serializer.fromJson<String?>(json['hostname']),
      vendor: serializer.fromJson<String?>(json['vendor']),
      signalLevel: serializer.fromJson<int>(json['signalLevel']),
      dataFrames: serializer.fromJson<int>(json['dataFrames']),
      firstSeen: serializer.fromJson<DateTime>(json['firstSeen']),
      lastSeen: serializer.fromJson<DateTime>(json['lastSeen']),
      associatedBssid: serializer.fromJson<String>(json['associatedBssid']),
      probeRequestsJson:
          serializer.fromJson<List<ProbeRequest>>(json['probeRequestsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accessPointId': serializer.toJson<String>(accessPointId),
      'macAddress': serializer.toJson<String>(macAddress),
      'hostname': serializer.toJson<String?>(hostname),
      'vendor': serializer.toJson<String?>(vendor),
      'signalLevel': serializer.toJson<int>(signalLevel),
      'dataFrames': serializer.toJson<int>(dataFrames),
      'firstSeen': serializer.toJson<DateTime>(firstSeen),
      'lastSeen': serializer.toJson<DateTime>(lastSeen),
      'associatedBssid': serializer.toJson<String>(associatedBssid),
      'probeRequestsJson':
          serializer.toJson<List<ProbeRequest>>(probeRequestsJson),
    };
  }

  DbClientDevice copyWith(
          {String? id,
          String? accessPointId,
          String? macAddress,
          Value<String?> hostname = const Value.absent(),
          Value<String?> vendor = const Value.absent(),
          int? signalLevel,
          int? dataFrames,
          DateTime? firstSeen,
          DateTime? lastSeen,
          String? associatedBssid,
          List<ProbeRequest>? probeRequestsJson}) =>
      DbClientDevice(
        id: id ?? this.id,
        accessPointId: accessPointId ?? this.accessPointId,
        macAddress: macAddress ?? this.macAddress,
        hostname: hostname.present ? hostname.value : this.hostname,
        vendor: vendor.present ? vendor.value : this.vendor,
        signalLevel: signalLevel ?? this.signalLevel,
        dataFrames: dataFrames ?? this.dataFrames,
        firstSeen: firstSeen ?? this.firstSeen,
        lastSeen: lastSeen ?? this.lastSeen,
        associatedBssid: associatedBssid ?? this.associatedBssid,
        probeRequestsJson: probeRequestsJson ?? this.probeRequestsJson,
      );
  DbClientDevice copyWithCompanion(ClientDevicesCompanion data) {
    return DbClientDevice(
      id: data.id.present ? data.id.value : this.id,
      accessPointId: data.accessPointId.present
          ? data.accessPointId.value
          : this.accessPointId,
      macAddress:
          data.macAddress.present ? data.macAddress.value : this.macAddress,
      hostname: data.hostname.present ? data.hostname.value : this.hostname,
      vendor: data.vendor.present ? data.vendor.value : this.vendor,
      signalLevel:
          data.signalLevel.present ? data.signalLevel.value : this.signalLevel,
      dataFrames:
          data.dataFrames.present ? data.dataFrames.value : this.dataFrames,
      firstSeen: data.firstSeen.present ? data.firstSeen.value : this.firstSeen,
      lastSeen: data.lastSeen.present ? data.lastSeen.value : this.lastSeen,
      associatedBssid: data.associatedBssid.present
          ? data.associatedBssid.value
          : this.associatedBssid,
      probeRequestsJson: data.probeRequestsJson.present
          ? data.probeRequestsJson.value
          : this.probeRequestsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbClientDevice(')
          ..write('id: $id, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('macAddress: $macAddress, ')
          ..write('hostname: $hostname, ')
          ..write('vendor: $vendor, ')
          ..write('signalLevel: $signalLevel, ')
          ..write('dataFrames: $dataFrames, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('associatedBssid: $associatedBssid, ')
          ..write('probeRequestsJson: $probeRequestsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      accessPointId,
      macAddress,
      hostname,
      vendor,
      signalLevel,
      dataFrames,
      firstSeen,
      lastSeen,
      associatedBssid,
      probeRequestsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbClientDevice &&
          other.id == this.id &&
          other.accessPointId == this.accessPointId &&
          other.macAddress == this.macAddress &&
          other.hostname == this.hostname &&
          other.vendor == this.vendor &&
          other.signalLevel == this.signalLevel &&
          other.dataFrames == this.dataFrames &&
          other.firstSeen == this.firstSeen &&
          other.lastSeen == this.lastSeen &&
          other.associatedBssid == this.associatedBssid &&
          other.probeRequestsJson == this.probeRequestsJson);
}

class ClientDevicesCompanion extends UpdateCompanion<DbClientDevice> {
  final Value<String> id;
  final Value<String> accessPointId;
  final Value<String> macAddress;
  final Value<String?> hostname;
  final Value<String?> vendor;
  final Value<int> signalLevel;
  final Value<int> dataFrames;
  final Value<DateTime> firstSeen;
  final Value<DateTime> lastSeen;
  final Value<String> associatedBssid;
  final Value<List<ProbeRequest>> probeRequestsJson;
  final Value<int> rowid;
  const ClientDevicesCompanion({
    this.id = const Value.absent(),
    this.accessPointId = const Value.absent(),
    this.macAddress = const Value.absent(),
    this.hostname = const Value.absent(),
    this.vendor = const Value.absent(),
    this.signalLevel = const Value.absent(),
    this.dataFrames = const Value.absent(),
    this.firstSeen = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.associatedBssid = const Value.absent(),
    this.probeRequestsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientDevicesCompanion.insert({
    required String id,
    required String accessPointId,
    required String macAddress,
    this.hostname = const Value.absent(),
    this.vendor = const Value.absent(),
    required int signalLevel,
    required int dataFrames,
    required DateTime firstSeen,
    required DateTime lastSeen,
    required String associatedBssid,
    required List<ProbeRequest> probeRequestsJson,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        accessPointId = Value(accessPointId),
        macAddress = Value(macAddress),
        signalLevel = Value(signalLevel),
        dataFrames = Value(dataFrames),
        firstSeen = Value(firstSeen),
        lastSeen = Value(lastSeen),
        associatedBssid = Value(associatedBssid),
        probeRequestsJson = Value(probeRequestsJson);
  static Insertable<DbClientDevice> custom({
    Expression<String>? id,
    Expression<String>? accessPointId,
    Expression<String>? macAddress,
    Expression<String>? hostname,
    Expression<String>? vendor,
    Expression<int>? signalLevel,
    Expression<int>? dataFrames,
    Expression<DateTime>? firstSeen,
    Expression<DateTime>? lastSeen,
    Expression<String>? associatedBssid,
    Expression<String>? probeRequestsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accessPointId != null) 'access_point_id': accessPointId,
      if (macAddress != null) 'mac_address': macAddress,
      if (hostname != null) 'hostname': hostname,
      if (vendor != null) 'vendor': vendor,
      if (signalLevel != null) 'signal_level': signalLevel,
      if (dataFrames != null) 'data_frames': dataFrames,
      if (firstSeen != null) 'first_seen': firstSeen,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (associatedBssid != null) 'associated_bssid': associatedBssid,
      if (probeRequestsJson != null) 'probe_requests_json': probeRequestsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientDevicesCompanion copyWith(
      {Value<String>? id,
      Value<String>? accessPointId,
      Value<String>? macAddress,
      Value<String?>? hostname,
      Value<String?>? vendor,
      Value<int>? signalLevel,
      Value<int>? dataFrames,
      Value<DateTime>? firstSeen,
      Value<DateTime>? lastSeen,
      Value<String>? associatedBssid,
      Value<List<ProbeRequest>>? probeRequestsJson,
      Value<int>? rowid}) {
    return ClientDevicesCompanion(
      id: id ?? this.id,
      accessPointId: accessPointId ?? this.accessPointId,
      macAddress: macAddress ?? this.macAddress,
      hostname: hostname ?? this.hostname,
      vendor: vendor ?? this.vendor,
      signalLevel: signalLevel ?? this.signalLevel,
      dataFrames: dataFrames ?? this.dataFrames,
      firstSeen: firstSeen ?? this.firstSeen,
      lastSeen: lastSeen ?? this.lastSeen,
      associatedBssid: associatedBssid ?? this.associatedBssid,
      probeRequestsJson: probeRequestsJson ?? this.probeRequestsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accessPointId.present) {
      map['access_point_id'] = Variable<String>(accessPointId.value);
    }
    if (macAddress.present) {
      map['mac_address'] = Variable<String>(macAddress.value);
    }
    if (hostname.present) {
      map['hostname'] = Variable<String>(hostname.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (signalLevel.present) {
      map['signal_level'] = Variable<int>(signalLevel.value);
    }
    if (dataFrames.present) {
      map['data_frames'] = Variable<int>(dataFrames.value);
    }
    if (firstSeen.present) {
      map['first_seen'] = Variable<DateTime>(firstSeen.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (associatedBssid.present) {
      map['associated_bssid'] = Variable<String>(associatedBssid.value);
    }
    if (probeRequestsJson.present) {
      map['probe_requests_json'] = Variable<String>($ClientDevicesTable
          .$converterprobeRequestsJson
          .toSql(probeRequestsJson.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientDevicesCompanion(')
          ..write('id: $id, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('macAddress: $macAddress, ')
          ..write('hostname: $hostname, ')
          ..write('vendor: $vendor, ')
          ..write('signalLevel: $signalLevel, ')
          ..write('dataFrames: $dataFrames, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('associatedBssid: $associatedBssid, ')
          ..write('probeRequestsJson: $probeRequestsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HandshakeCapturesTable extends HandshakeCaptures
    with TableInfo<$HandshakeCapturesTable, DbHandshakeCapture> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HandshakeCapturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessPointIdMeta =
      const VerificationMeta('accessPointId');
  @override
  late final GeneratedColumn<String> accessPointId = GeneratedColumn<String>(
      'access_point_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bssidMeta = const VerificationMeta('bssid');
  @override
  late final GeneratedColumn<String> bssid = GeneratedColumn<String>(
      'bssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ssidMeta = const VerificationMeta('ssid');
  @override
  late final GeneratedColumn<String> ssid = GeneratedColumn<String>(
      'ssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<HandshakeType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<HandshakeType>($HandshakeCapturesTable.$convertertype);
  static const VerificationMeta _eapolFramesMeta =
      const VerificationMeta('eapolFrames');
  @override
  late final GeneratedColumn<Uint8List> eapolFrames =
      GeneratedColumn<Uint8List>('eapol_frames', aliasedName, false,
          type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _capturedAtMeta =
      const VerificationMeta('capturedAt');
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
      'captured_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _frameCountMeta =
      const VerificationMeta('frameCount');
  @override
  late final GeneratedColumn<int> frameCount = GeneratedColumn<int>(
      'frame_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCompleteMeta =
      const VerificationMeta('isComplete');
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
      'is_complete', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_complete" IN (0, 1))'));
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $HandshakeCapturesTable.$convertermetadata);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        accessPointId,
        bssid,
        ssid,
        type,
        eapolFrames,
        capturedAt,
        frameCount,
        isComplete,
        metadata
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'handshake_captures';
  @override
  VerificationContext validateIntegrity(Insertable<DbHandshakeCapture> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('access_point_id')) {
      context.handle(
          _accessPointIdMeta,
          accessPointId.isAcceptableOrUnknown(
              data['access_point_id']!, _accessPointIdMeta));
    } else if (isInserting) {
      context.missing(_accessPointIdMeta);
    }
    if (data.containsKey('bssid')) {
      context.handle(
          _bssidMeta, bssid.isAcceptableOrUnknown(data['bssid']!, _bssidMeta));
    } else if (isInserting) {
      context.missing(_bssidMeta);
    }
    if (data.containsKey('ssid')) {
      context.handle(
          _ssidMeta, ssid.isAcceptableOrUnknown(data['ssid']!, _ssidMeta));
    } else if (isInserting) {
      context.missing(_ssidMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('eapol_frames')) {
      context.handle(
          _eapolFramesMeta,
          eapolFrames.isAcceptableOrUnknown(
              data['eapol_frames']!, _eapolFramesMeta));
    } else if (isInserting) {
      context.missing(_eapolFramesMeta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
          _capturedAtMeta,
          capturedAt.isAcceptableOrUnknown(
              data['captured_at']!, _capturedAtMeta));
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('frame_count')) {
      context.handle(
          _frameCountMeta,
          frameCount.isAcceptableOrUnknown(
              data['frame_count']!, _frameCountMeta));
    } else if (isInserting) {
      context.missing(_frameCountMeta);
    }
    if (data.containsKey('is_complete')) {
      context.handle(
          _isCompleteMeta,
          isComplete.isAcceptableOrUnknown(
              data['is_complete']!, _isCompleteMeta));
    } else if (isInserting) {
      context.missing(_isCompleteMeta);
    }
    context.handle(_metadataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbHandshakeCapture map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbHandshakeCapture(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      accessPointId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}access_point_id'])!,
      bssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bssid'])!,
      ssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ssid'])!,
      type: $HandshakeCapturesTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      eapolFrames: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}eapol_frames'])!,
      capturedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}captured_at'])!,
      frameCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frame_count'])!,
      isComplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_complete'])!,
      metadata: $HandshakeCapturesTable.$convertermetadata.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!),
    );
  }

  @override
  $HandshakeCapturesTable createAlias(String alias) {
    return $HandshakeCapturesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<HandshakeType, int, int> $convertertype =
      const EnumIndexConverter<HandshakeType>(HandshakeType.values);
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
}

class DbHandshakeCapture extends DataClass
    implements Insertable<DbHandshakeCapture> {
  final String id;
  final String assessmentId;
  final String accessPointId;
  final String bssid;
  final String ssid;
  final HandshakeType type;
  final Uint8List eapolFrames;
  final DateTime capturedAt;
  final int frameCount;
  final bool isComplete;
  final Map<String, dynamic> metadata;
  const DbHandshakeCapture(
      {required this.id,
      required this.assessmentId,
      required this.accessPointId,
      required this.bssid,
      required this.ssid,
      required this.type,
      required this.eapolFrames,
      required this.capturedAt,
      required this.frameCount,
      required this.isComplete,
      required this.metadata});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    map['access_point_id'] = Variable<String>(accessPointId);
    map['bssid'] = Variable<String>(bssid);
    map['ssid'] = Variable<String>(ssid);
    {
      map['type'] =
          Variable<int>($HandshakeCapturesTable.$convertertype.toSql(type));
    }
    map['eapol_frames'] = Variable<Uint8List>(eapolFrames);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    map['frame_count'] = Variable<int>(frameCount);
    map['is_complete'] = Variable<bool>(isComplete);
    {
      map['metadata'] = Variable<String>(
          $HandshakeCapturesTable.$convertermetadata.toSql(metadata));
    }
    return map;
  }

  HandshakeCapturesCompanion toCompanion(bool nullToAbsent) {
    return HandshakeCapturesCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      accessPointId: Value(accessPointId),
      bssid: Value(bssid),
      ssid: Value(ssid),
      type: Value(type),
      eapolFrames: Value(eapolFrames),
      capturedAt: Value(capturedAt),
      frameCount: Value(frameCount),
      isComplete: Value(isComplete),
      metadata: Value(metadata),
    );
  }

  factory DbHandshakeCapture.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbHandshakeCapture(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      accessPointId: serializer.fromJson<String>(json['accessPointId']),
      bssid: serializer.fromJson<String>(json['bssid']),
      ssid: serializer.fromJson<String>(json['ssid']),
      type: $HandshakeCapturesTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      eapolFrames: serializer.fromJson<Uint8List>(json['eapolFrames']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      frameCount: serializer.fromJson<int>(json['frameCount']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      metadata: serializer.fromJson<Map<String, dynamic>>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'accessPointId': serializer.toJson<String>(accessPointId),
      'bssid': serializer.toJson<String>(bssid),
      'ssid': serializer.toJson<String>(ssid),
      'type': serializer
          .toJson<int>($HandshakeCapturesTable.$convertertype.toJson(type)),
      'eapolFrames': serializer.toJson<Uint8List>(eapolFrames),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'frameCount': serializer.toJson<int>(frameCount),
      'isComplete': serializer.toJson<bool>(isComplete),
      'metadata': serializer.toJson<Map<String, dynamic>>(metadata),
    };
  }

  DbHandshakeCapture copyWith(
          {String? id,
          String? assessmentId,
          String? accessPointId,
          String? bssid,
          String? ssid,
          HandshakeType? type,
          Uint8List? eapolFrames,
          DateTime? capturedAt,
          int? frameCount,
          bool? isComplete,
          Map<String, dynamic>? metadata}) =>
      DbHandshakeCapture(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        accessPointId: accessPointId ?? this.accessPointId,
        bssid: bssid ?? this.bssid,
        ssid: ssid ?? this.ssid,
        type: type ?? this.type,
        eapolFrames: eapolFrames ?? this.eapolFrames,
        capturedAt: capturedAt ?? this.capturedAt,
        frameCount: frameCount ?? this.frameCount,
        isComplete: isComplete ?? this.isComplete,
        metadata: metadata ?? this.metadata,
      );
  DbHandshakeCapture copyWithCompanion(HandshakeCapturesCompanion data) {
    return DbHandshakeCapture(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      accessPointId: data.accessPointId.present
          ? data.accessPointId.value
          : this.accessPointId,
      bssid: data.bssid.present ? data.bssid.value : this.bssid,
      ssid: data.ssid.present ? data.ssid.value : this.ssid,
      type: data.type.present ? data.type.value : this.type,
      eapolFrames:
          data.eapolFrames.present ? data.eapolFrames.value : this.eapolFrames,
      capturedAt:
          data.capturedAt.present ? data.capturedAt.value : this.capturedAt,
      frameCount:
          data.frameCount.present ? data.frameCount.value : this.frameCount,
      isComplete:
          data.isComplete.present ? data.isComplete.value : this.isComplete,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbHandshakeCapture(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('bssid: $bssid, ')
          ..write('ssid: $ssid, ')
          ..write('type: $type, ')
          ..write('eapolFrames: $eapolFrames, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('frameCount: $frameCount, ')
          ..write('isComplete: $isComplete, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      assessmentId,
      accessPointId,
      bssid,
      ssid,
      type,
      $driftBlobEquality.hash(eapolFrames),
      capturedAt,
      frameCount,
      isComplete,
      metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbHandshakeCapture &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.accessPointId == this.accessPointId &&
          other.bssid == this.bssid &&
          other.ssid == this.ssid &&
          other.type == this.type &&
          $driftBlobEquality.equals(other.eapolFrames, this.eapolFrames) &&
          other.capturedAt == this.capturedAt &&
          other.frameCount == this.frameCount &&
          other.isComplete == this.isComplete &&
          other.metadata == this.metadata);
}

class HandshakeCapturesCompanion extends UpdateCompanion<DbHandshakeCapture> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<String> accessPointId;
  final Value<String> bssid;
  final Value<String> ssid;
  final Value<HandshakeType> type;
  final Value<Uint8List> eapolFrames;
  final Value<DateTime> capturedAt;
  final Value<int> frameCount;
  final Value<bool> isComplete;
  final Value<Map<String, dynamic>> metadata;
  final Value<int> rowid;
  const HandshakeCapturesCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.accessPointId = const Value.absent(),
    this.bssid = const Value.absent(),
    this.ssid = const Value.absent(),
    this.type = const Value.absent(),
    this.eapolFrames = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.frameCount = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HandshakeCapturesCompanion.insert({
    required String id,
    required String assessmentId,
    required String accessPointId,
    required String bssid,
    required String ssid,
    required HandshakeType type,
    required Uint8List eapolFrames,
    required DateTime capturedAt,
    required int frameCount,
    required bool isComplete,
    required Map<String, dynamic> metadata,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        accessPointId = Value(accessPointId),
        bssid = Value(bssid),
        ssid = Value(ssid),
        type = Value(type),
        eapolFrames = Value(eapolFrames),
        capturedAt = Value(capturedAt),
        frameCount = Value(frameCount),
        isComplete = Value(isComplete),
        metadata = Value(metadata);
  static Insertable<DbHandshakeCapture> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<String>? accessPointId,
    Expression<String>? bssid,
    Expression<String>? ssid,
    Expression<int>? type,
    Expression<Uint8List>? eapolFrames,
    Expression<DateTime>? capturedAt,
    Expression<int>? frameCount,
    Expression<bool>? isComplete,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (accessPointId != null) 'access_point_id': accessPointId,
      if (bssid != null) 'bssid': bssid,
      if (ssid != null) 'ssid': ssid,
      if (type != null) 'type': type,
      if (eapolFrames != null) 'eapol_frames': eapolFrames,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (frameCount != null) 'frame_count': frameCount,
      if (isComplete != null) 'is_complete': isComplete,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HandshakeCapturesCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<String>? accessPointId,
      Value<String>? bssid,
      Value<String>? ssid,
      Value<HandshakeType>? type,
      Value<Uint8List>? eapolFrames,
      Value<DateTime>? capturedAt,
      Value<int>? frameCount,
      Value<bool>? isComplete,
      Value<Map<String, dynamic>>? metadata,
      Value<int>? rowid}) {
    return HandshakeCapturesCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      accessPointId: accessPointId ?? this.accessPointId,
      bssid: bssid ?? this.bssid,
      ssid: ssid ?? this.ssid,
      type: type ?? this.type,
      eapolFrames: eapolFrames ?? this.eapolFrames,
      capturedAt: capturedAt ?? this.capturedAt,
      frameCount: frameCount ?? this.frameCount,
      isComplete: isComplete ?? this.isComplete,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (accessPointId.present) {
      map['access_point_id'] = Variable<String>(accessPointId.value);
    }
    if (bssid.present) {
      map['bssid'] = Variable<String>(bssid.value);
    }
    if (ssid.present) {
      map['ssid'] = Variable<String>(ssid.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
          $HandshakeCapturesTable.$convertertype.toSql(type.value));
    }
    if (eapolFrames.present) {
      map['eapol_frames'] = Variable<Uint8List>(eapolFrames.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (frameCount.present) {
      map['frame_count'] = Variable<int>(frameCount.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $HandshakeCapturesTable.$convertermetadata.toSql(metadata.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HandshakeCapturesCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('bssid: $bssid, ')
          ..write('ssid: $ssid, ')
          ..write('type: $type, ')
          ..write('eapolFrames: $eapolFrames, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('frameCount: $frameCount, ')
          ..write('isComplete: $isComplete, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PmkidCapturesTable extends PmkidCaptures
    with TableInfo<$PmkidCapturesTable, DbPmkidCapture> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PmkidCapturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessPointIdMeta =
      const VerificationMeta('accessPointId');
  @override
  late final GeneratedColumn<String> accessPointId = GeneratedColumn<String>(
      'access_point_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bssidMeta = const VerificationMeta('bssid');
  @override
  late final GeneratedColumn<String> bssid = GeneratedColumn<String>(
      'bssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ssidMeta = const VerificationMeta('ssid');
  @override
  late final GeneratedColumn<String> ssid = GeneratedColumn<String>(
      'ssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pmkidDataMeta =
      const VerificationMeta('pmkidData');
  @override
  late final GeneratedColumn<Uint8List> pmkidData = GeneratedColumn<Uint8List>(
      'pmkid_data', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _capturedAtMeta =
      const VerificationMeta('capturedAt');
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
      'captured_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $PmkidCapturesTable.$convertermetadata);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        accessPointId,
        bssid,
        ssid,
        pmkidData,
        capturedAt,
        metadata
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pmkid_captures';
  @override
  VerificationContext validateIntegrity(Insertable<DbPmkidCapture> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('access_point_id')) {
      context.handle(
          _accessPointIdMeta,
          accessPointId.isAcceptableOrUnknown(
              data['access_point_id']!, _accessPointIdMeta));
    } else if (isInserting) {
      context.missing(_accessPointIdMeta);
    }
    if (data.containsKey('bssid')) {
      context.handle(
          _bssidMeta, bssid.isAcceptableOrUnknown(data['bssid']!, _bssidMeta));
    } else if (isInserting) {
      context.missing(_bssidMeta);
    }
    if (data.containsKey('ssid')) {
      context.handle(
          _ssidMeta, ssid.isAcceptableOrUnknown(data['ssid']!, _ssidMeta));
    } else if (isInserting) {
      context.missing(_ssidMeta);
    }
    if (data.containsKey('pmkid_data')) {
      context.handle(_pmkidDataMeta,
          pmkidData.isAcceptableOrUnknown(data['pmkid_data']!, _pmkidDataMeta));
    } else if (isInserting) {
      context.missing(_pmkidDataMeta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
          _capturedAtMeta,
          capturedAt.isAcceptableOrUnknown(
              data['captured_at']!, _capturedAtMeta));
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    context.handle(_metadataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbPmkidCapture map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbPmkidCapture(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      accessPointId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}access_point_id'])!,
      bssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bssid'])!,
      ssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ssid'])!,
      pmkidData: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}pmkid_data'])!,
      capturedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}captured_at'])!,
      metadata: $PmkidCapturesTable.$convertermetadata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!),
    );
  }

  @override
  $PmkidCapturesTable createAlias(String alias) {
    return $PmkidCapturesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
}

class DbPmkidCapture extends DataClass implements Insertable<DbPmkidCapture> {
  final String id;
  final String assessmentId;
  final String accessPointId;
  final String bssid;
  final String ssid;
  final Uint8List pmkidData;
  final DateTime capturedAt;
  final Map<String, dynamic> metadata;
  const DbPmkidCapture(
      {required this.id,
      required this.assessmentId,
      required this.accessPointId,
      required this.bssid,
      required this.ssid,
      required this.pmkidData,
      required this.capturedAt,
      required this.metadata});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    map['access_point_id'] = Variable<String>(accessPointId);
    map['bssid'] = Variable<String>(bssid);
    map['ssid'] = Variable<String>(ssid);
    map['pmkid_data'] = Variable<Uint8List>(pmkidData);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    {
      map['metadata'] = Variable<String>(
          $PmkidCapturesTable.$convertermetadata.toSql(metadata));
    }
    return map;
  }

  PmkidCapturesCompanion toCompanion(bool nullToAbsent) {
    return PmkidCapturesCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      accessPointId: Value(accessPointId),
      bssid: Value(bssid),
      ssid: Value(ssid),
      pmkidData: Value(pmkidData),
      capturedAt: Value(capturedAt),
      metadata: Value(metadata),
    );
  }

  factory DbPmkidCapture.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbPmkidCapture(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      accessPointId: serializer.fromJson<String>(json['accessPointId']),
      bssid: serializer.fromJson<String>(json['bssid']),
      ssid: serializer.fromJson<String>(json['ssid']),
      pmkidData: serializer.fromJson<Uint8List>(json['pmkidData']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      metadata: serializer.fromJson<Map<String, dynamic>>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'accessPointId': serializer.toJson<String>(accessPointId),
      'bssid': serializer.toJson<String>(bssid),
      'ssid': serializer.toJson<String>(ssid),
      'pmkidData': serializer.toJson<Uint8List>(pmkidData),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'metadata': serializer.toJson<Map<String, dynamic>>(metadata),
    };
  }

  DbPmkidCapture copyWith(
          {String? id,
          String? assessmentId,
          String? accessPointId,
          String? bssid,
          String? ssid,
          Uint8List? pmkidData,
          DateTime? capturedAt,
          Map<String, dynamic>? metadata}) =>
      DbPmkidCapture(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        accessPointId: accessPointId ?? this.accessPointId,
        bssid: bssid ?? this.bssid,
        ssid: ssid ?? this.ssid,
        pmkidData: pmkidData ?? this.pmkidData,
        capturedAt: capturedAt ?? this.capturedAt,
        metadata: metadata ?? this.metadata,
      );
  DbPmkidCapture copyWithCompanion(PmkidCapturesCompanion data) {
    return DbPmkidCapture(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      accessPointId: data.accessPointId.present
          ? data.accessPointId.value
          : this.accessPointId,
      bssid: data.bssid.present ? data.bssid.value : this.bssid,
      ssid: data.ssid.present ? data.ssid.value : this.ssid,
      pmkidData: data.pmkidData.present ? data.pmkidData.value : this.pmkidData,
      capturedAt:
          data.capturedAt.present ? data.capturedAt.value : this.capturedAt,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbPmkidCapture(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('bssid: $bssid, ')
          ..write('ssid: $ssid, ')
          ..write('pmkidData: $pmkidData, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, assessmentId, accessPointId, bssid, ssid,
      $driftBlobEquality.hash(pmkidData), capturedAt, metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbPmkidCapture &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.accessPointId == this.accessPointId &&
          other.bssid == this.bssid &&
          other.ssid == this.ssid &&
          $driftBlobEquality.equals(other.pmkidData, this.pmkidData) &&
          other.capturedAt == this.capturedAt &&
          other.metadata == this.metadata);
}

class PmkidCapturesCompanion extends UpdateCompanion<DbPmkidCapture> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<String> accessPointId;
  final Value<String> bssid;
  final Value<String> ssid;
  final Value<Uint8List> pmkidData;
  final Value<DateTime> capturedAt;
  final Value<Map<String, dynamic>> metadata;
  final Value<int> rowid;
  const PmkidCapturesCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.accessPointId = const Value.absent(),
    this.bssid = const Value.absent(),
    this.ssid = const Value.absent(),
    this.pmkidData = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PmkidCapturesCompanion.insert({
    required String id,
    required String assessmentId,
    required String accessPointId,
    required String bssid,
    required String ssid,
    required Uint8List pmkidData,
    required DateTime capturedAt,
    required Map<String, dynamic> metadata,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        accessPointId = Value(accessPointId),
        bssid = Value(bssid),
        ssid = Value(ssid),
        pmkidData = Value(pmkidData),
        capturedAt = Value(capturedAt),
        metadata = Value(metadata);
  static Insertable<DbPmkidCapture> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<String>? accessPointId,
    Expression<String>? bssid,
    Expression<String>? ssid,
    Expression<Uint8List>? pmkidData,
    Expression<DateTime>? capturedAt,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (accessPointId != null) 'access_point_id': accessPointId,
      if (bssid != null) 'bssid': bssid,
      if (ssid != null) 'ssid': ssid,
      if (pmkidData != null) 'pmkid_data': pmkidData,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PmkidCapturesCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<String>? accessPointId,
      Value<String>? bssid,
      Value<String>? ssid,
      Value<Uint8List>? pmkidData,
      Value<DateTime>? capturedAt,
      Value<Map<String, dynamic>>? metadata,
      Value<int>? rowid}) {
    return PmkidCapturesCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      accessPointId: accessPointId ?? this.accessPointId,
      bssid: bssid ?? this.bssid,
      ssid: ssid ?? this.ssid,
      pmkidData: pmkidData ?? this.pmkidData,
      capturedAt: capturedAt ?? this.capturedAt,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (accessPointId.present) {
      map['access_point_id'] = Variable<String>(accessPointId.value);
    }
    if (bssid.present) {
      map['bssid'] = Variable<String>(bssid.value);
    }
    if (ssid.present) {
      map['ssid'] = Variable<String>(ssid.value);
    }
    if (pmkidData.present) {
      map['pmkid_data'] = Variable<Uint8List>(pmkidData.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $PmkidCapturesTable.$convertermetadata.toSql(metadata.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PmkidCapturesCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('bssid: $bssid, ')
          ..write('ssid: $ssid, ')
          ..write('pmkidData: $pmkidData, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WpsPinsTable extends WpsPins with TableInfo<$WpsPinsTable, DbWpsPin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WpsPinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessPointIdMeta =
      const VerificationMeta('accessPointId');
  @override
  late final GeneratedColumn<String> accessPointId = GeneratedColumn<String>(
      'access_point_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bssidMeta = const VerificationMeta('bssid');
  @override
  late final GeneratedColumn<String> bssid = GeneratedColumn<String>(
      'bssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pinMeta = const VerificationMeta('pin');
  @override
  late final GeneratedColumn<String> pin = GeneratedColumn<String>(
      'pin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumnWithTypeConverter<WpsMethod, int> method =
      GeneratedColumn<int>('method', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<WpsMethod>($WpsPinsTable.$convertermethod);
  static const VerificationMeta _recoveredAtMeta =
      const VerificationMeta('recoveredAt');
  @override
  late final GeneratedColumn<DateTime> recoveredAt = GeneratedColumn<DateTime>(
      'recovered_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $WpsPinsTable.$convertermetadata);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        accessPointId,
        bssid,
        pin,
        method,
        recoveredAt,
        metadata
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wps_pins';
  @override
  VerificationContext validateIntegrity(Insertable<DbWpsPin> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('access_point_id')) {
      context.handle(
          _accessPointIdMeta,
          accessPointId.isAcceptableOrUnknown(
              data['access_point_id']!, _accessPointIdMeta));
    } else if (isInserting) {
      context.missing(_accessPointIdMeta);
    }
    if (data.containsKey('bssid')) {
      context.handle(
          _bssidMeta, bssid.isAcceptableOrUnknown(data['bssid']!, _bssidMeta));
    } else if (isInserting) {
      context.missing(_bssidMeta);
    }
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    } else if (isInserting) {
      context.missing(_pinMeta);
    }
    context.handle(_methodMeta, const VerificationResult.success());
    if (data.containsKey('recovered_at')) {
      context.handle(
          _recoveredAtMeta,
          recoveredAt.isAcceptableOrUnknown(
              data['recovered_at']!, _recoveredAtMeta));
    } else if (isInserting) {
      context.missing(_recoveredAtMeta);
    }
    context.handle(_metadataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbWpsPin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWpsPin(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      accessPointId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}access_point_id'])!,
      bssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bssid'])!,
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin'])!,
      method: $WpsPinsTable.$convertermethod.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}method'])!),
      recoveredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recovered_at'])!,
      metadata: $WpsPinsTable.$convertermetadata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!),
    );
  }

  @override
  $WpsPinsTable createAlias(String alias) {
    return $WpsPinsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WpsMethod, int, int> $convertermethod =
      const EnumIndexConverter<WpsMethod>(WpsMethod.values);
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
}

class DbWpsPin extends DataClass implements Insertable<DbWpsPin> {
  final String id;
  final String assessmentId;
  final String accessPointId;
  final String bssid;
  final String pin;
  final WpsMethod method;
  final DateTime recoveredAt;
  final Map<String, dynamic> metadata;
  const DbWpsPin(
      {required this.id,
      required this.assessmentId,
      required this.accessPointId,
      required this.bssid,
      required this.pin,
      required this.method,
      required this.recoveredAt,
      required this.metadata});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    map['access_point_id'] = Variable<String>(accessPointId);
    map['bssid'] = Variable<String>(bssid);
    map['pin'] = Variable<String>(pin);
    {
      map['method'] =
          Variable<int>($WpsPinsTable.$convertermethod.toSql(method));
    }
    map['recovered_at'] = Variable<DateTime>(recoveredAt);
    {
      map['metadata'] =
          Variable<String>($WpsPinsTable.$convertermetadata.toSql(metadata));
    }
    return map;
  }

  WpsPinsCompanion toCompanion(bool nullToAbsent) {
    return WpsPinsCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      accessPointId: Value(accessPointId),
      bssid: Value(bssid),
      pin: Value(pin),
      method: Value(method),
      recoveredAt: Value(recoveredAt),
      metadata: Value(metadata),
    );
  }

  factory DbWpsPin.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWpsPin(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      accessPointId: serializer.fromJson<String>(json['accessPointId']),
      bssid: serializer.fromJson<String>(json['bssid']),
      pin: serializer.fromJson<String>(json['pin']),
      method: $WpsPinsTable.$convertermethod
          .fromJson(serializer.fromJson<int>(json['method'])),
      recoveredAt: serializer.fromJson<DateTime>(json['recoveredAt']),
      metadata: serializer.fromJson<Map<String, dynamic>>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'accessPointId': serializer.toJson<String>(accessPointId),
      'bssid': serializer.toJson<String>(bssid),
      'pin': serializer.toJson<String>(pin),
      'method':
          serializer.toJson<int>($WpsPinsTable.$convertermethod.toJson(method)),
      'recoveredAt': serializer.toJson<DateTime>(recoveredAt),
      'metadata': serializer.toJson<Map<String, dynamic>>(metadata),
    };
  }

  DbWpsPin copyWith(
          {String? id,
          String? assessmentId,
          String? accessPointId,
          String? bssid,
          String? pin,
          WpsMethod? method,
          DateTime? recoveredAt,
          Map<String, dynamic>? metadata}) =>
      DbWpsPin(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        accessPointId: accessPointId ?? this.accessPointId,
        bssid: bssid ?? this.bssid,
        pin: pin ?? this.pin,
        method: method ?? this.method,
        recoveredAt: recoveredAt ?? this.recoveredAt,
        metadata: metadata ?? this.metadata,
      );
  DbWpsPin copyWithCompanion(WpsPinsCompanion data) {
    return DbWpsPin(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      accessPointId: data.accessPointId.present
          ? data.accessPointId.value
          : this.accessPointId,
      bssid: data.bssid.present ? data.bssid.value : this.bssid,
      pin: data.pin.present ? data.pin.value : this.pin,
      method: data.method.present ? data.method.value : this.method,
      recoveredAt:
          data.recoveredAt.present ? data.recoveredAt.value : this.recoveredAt,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWpsPin(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('bssid: $bssid, ')
          ..write('pin: $pin, ')
          ..write('method: $method, ')
          ..write('recoveredAt: $recoveredAt, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, assessmentId, accessPointId, bssid, pin,
      method, recoveredAt, metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWpsPin &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.accessPointId == this.accessPointId &&
          other.bssid == this.bssid &&
          other.pin == this.pin &&
          other.method == this.method &&
          other.recoveredAt == this.recoveredAt &&
          other.metadata == this.metadata);
}

class WpsPinsCompanion extends UpdateCompanion<DbWpsPin> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<String> accessPointId;
  final Value<String> bssid;
  final Value<String> pin;
  final Value<WpsMethod> method;
  final Value<DateTime> recoveredAt;
  final Value<Map<String, dynamic>> metadata;
  final Value<int> rowid;
  const WpsPinsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.accessPointId = const Value.absent(),
    this.bssid = const Value.absent(),
    this.pin = const Value.absent(),
    this.method = const Value.absent(),
    this.recoveredAt = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WpsPinsCompanion.insert({
    required String id,
    required String assessmentId,
    required String accessPointId,
    required String bssid,
    required String pin,
    required WpsMethod method,
    required DateTime recoveredAt,
    required Map<String, dynamic> metadata,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        accessPointId = Value(accessPointId),
        bssid = Value(bssid),
        pin = Value(pin),
        method = Value(method),
        recoveredAt = Value(recoveredAt),
        metadata = Value(metadata);
  static Insertable<DbWpsPin> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<String>? accessPointId,
    Expression<String>? bssid,
    Expression<String>? pin,
    Expression<int>? method,
    Expression<DateTime>? recoveredAt,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (accessPointId != null) 'access_point_id': accessPointId,
      if (bssid != null) 'bssid': bssid,
      if (pin != null) 'pin': pin,
      if (method != null) 'method': method,
      if (recoveredAt != null) 'recovered_at': recoveredAt,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WpsPinsCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<String>? accessPointId,
      Value<String>? bssid,
      Value<String>? pin,
      Value<WpsMethod>? method,
      Value<DateTime>? recoveredAt,
      Value<Map<String, dynamic>>? metadata,
      Value<int>? rowid}) {
    return WpsPinsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      accessPointId: accessPointId ?? this.accessPointId,
      bssid: bssid ?? this.bssid,
      pin: pin ?? this.pin,
      method: method ?? this.method,
      recoveredAt: recoveredAt ?? this.recoveredAt,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (accessPointId.present) {
      map['access_point_id'] = Variable<String>(accessPointId.value);
    }
    if (bssid.present) {
      map['bssid'] = Variable<String>(bssid.value);
    }
    if (pin.present) {
      map['pin'] = Variable<String>(pin.value);
    }
    if (method.present) {
      map['method'] =
          Variable<int>($WpsPinsTable.$convertermethod.toSql(method.value));
    }
    if (recoveredAt.present) {
      map['recovered_at'] = Variable<DateTime>(recoveredAt.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $WpsPinsTable.$convertermetadata.toSql(metadata.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WpsPinsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('bssid: $bssid, ')
          ..write('pin: $pin, ')
          ..write('method: $method, ')
          ..write('recoveredAt: $recoveredAt, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VulnerabilityFindingsTable extends VulnerabilityFindings
    with TableInfo<$VulnerabilityFindingsTable, DbVulnerabilityFinding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VulnerabilityFindingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accessPointIdMeta =
      const VerificationMeta('accessPointId');
  @override
  late final GeneratedColumn<String> accessPointId = GeneratedColumn<String>(
      'access_point_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<VulnerabilityType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<VulnerabilityType>(
              $VulnerabilityFindingsTable.$convertertype);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumnWithTypeConverter<Severity, int> severity =
      GeneratedColumn<int>('severity', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Severity>(
              $VulnerabilityFindingsTable.$converterseverity);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recommendationMeta =
      const VerificationMeta('recommendation');
  @override
  late final GeneratedColumn<String> recommendation = GeneratedColumn<String>(
      'recommendation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _evidenceMeta =
      const VerificationMeta('evidence');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      evidence = GeneratedColumn<String>('evidence', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $VulnerabilityFindingsTable.$converterevidence);
  static const VerificationMeta _discoveredAtMeta =
      const VerificationMeta('discoveredAt');
  @override
  late final GeneratedColumn<DateTime> discoveredAt = GeneratedColumn<DateTime>(
      'discovered_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cvssVectorJsonMeta =
      const VerificationMeta('cvssVectorJson');
  @override
  late final GeneratedColumnWithTypeConverter<CvssVector?, String>
      cvssVectorJson = GeneratedColumn<String>(
              'cvss_vector_json', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<CvssVector?>(
              $VulnerabilityFindingsTable.$convertercvssVectorJsonn);
  static const VerificationMeta _verifiedMeta =
      const VerificationMeta('verified');
  @override
  late final GeneratedColumn<bool> verified = GeneratedColumn<bool>(
      'verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("verified" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        accessPointId,
        type,
        severity,
        title,
        description,
        recommendation,
        evidence,
        discoveredAt,
        cvssVectorJson,
        verified
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vulnerability_findings';
  @override
  VerificationContext validateIntegrity(
      Insertable<DbVulnerabilityFinding> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('access_point_id')) {
      context.handle(
          _accessPointIdMeta,
          accessPointId.isAcceptableOrUnknown(
              data['access_point_id']!, _accessPointIdMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_severityMeta, const VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('recommendation')) {
      context.handle(
          _recommendationMeta,
          recommendation.isAcceptableOrUnknown(
              data['recommendation']!, _recommendationMeta));
    } else if (isInserting) {
      context.missing(_recommendationMeta);
    }
    context.handle(_evidenceMeta, const VerificationResult.success());
    if (data.containsKey('discovered_at')) {
      context.handle(
          _discoveredAtMeta,
          discoveredAt.isAcceptableOrUnknown(
              data['discovered_at']!, _discoveredAtMeta));
    } else if (isInserting) {
      context.missing(_discoveredAtMeta);
    }
    context.handle(_cvssVectorJsonMeta, const VerificationResult.success());
    if (data.containsKey('verified')) {
      context.handle(_verifiedMeta,
          verified.isAcceptableOrUnknown(data['verified']!, _verifiedMeta));
    } else if (isInserting) {
      context.missing(_verifiedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbVulnerabilityFinding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbVulnerabilityFinding(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      accessPointId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}access_point_id']),
      type: $VulnerabilityFindingsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      severity: $VulnerabilityFindingsTable.$converterseverity.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}severity'])!),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      recommendation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recommendation'])!,
      evidence: $VulnerabilityFindingsTable.$converterevidence.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}evidence'])!),
      discoveredAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}discovered_at'])!,
      cvssVectorJson: $VulnerabilityFindingsTable.$convertercvssVectorJsonn
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}cvss_vector_json'])),
      verified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}verified'])!,
    );
  }

  @override
  $VulnerabilityFindingsTable createAlias(String alias) {
    return $VulnerabilityFindingsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<VulnerabilityType, int, int> $convertertype =
      const EnumIndexConverter<VulnerabilityType>(VulnerabilityType.values);
  static JsonTypeConverter2<Severity, int, int> $converterseverity =
      const EnumIndexConverter<Severity>(Severity.values);
  static TypeConverter<Map<String, dynamic>, String> $converterevidence =
      const JsonMapConverter();
  static TypeConverter<CvssVector, String> $convertercvssVectorJson =
      const CvssVectorConverter();
  static TypeConverter<CvssVector?, String?> $convertercvssVectorJsonn =
      NullAwareTypeConverter.wrap($convertercvssVectorJson);
}

class DbVulnerabilityFinding extends DataClass
    implements Insertable<DbVulnerabilityFinding> {
  final String id;
  final String assessmentId;
  final String? accessPointId;
  final VulnerabilityType type;
  final Severity severity;
  final String title;
  final String description;
  final String recommendation;
  final Map<String, dynamic> evidence;
  final DateTime discoveredAt;
  final CvssVector? cvssVectorJson;
  final bool verified;
  const DbVulnerabilityFinding(
      {required this.id,
      required this.assessmentId,
      this.accessPointId,
      required this.type,
      required this.severity,
      required this.title,
      required this.description,
      required this.recommendation,
      required this.evidence,
      required this.discoveredAt,
      this.cvssVectorJson,
      required this.verified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    if (!nullToAbsent || accessPointId != null) {
      map['access_point_id'] = Variable<String>(accessPointId);
    }
    {
      map['type'] =
          Variable<int>($VulnerabilityFindingsTable.$convertertype.toSql(type));
    }
    {
      map['severity'] = Variable<int>(
          $VulnerabilityFindingsTable.$converterseverity.toSql(severity));
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['recommendation'] = Variable<String>(recommendation);
    {
      map['evidence'] = Variable<String>(
          $VulnerabilityFindingsTable.$converterevidence.toSql(evidence));
    }
    map['discovered_at'] = Variable<DateTime>(discoveredAt);
    if (!nullToAbsent || cvssVectorJson != null) {
      map['cvss_vector_json'] = Variable<String>($VulnerabilityFindingsTable
          .$convertercvssVectorJsonn
          .toSql(cvssVectorJson));
    }
    map['verified'] = Variable<bool>(verified);
    return map;
  }

  VulnerabilityFindingsCompanion toCompanion(bool nullToAbsent) {
    return VulnerabilityFindingsCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      accessPointId: accessPointId == null && nullToAbsent
          ? const Value.absent()
          : Value(accessPointId),
      type: Value(type),
      severity: Value(severity),
      title: Value(title),
      description: Value(description),
      recommendation: Value(recommendation),
      evidence: Value(evidence),
      discoveredAt: Value(discoveredAt),
      cvssVectorJson: cvssVectorJson == null && nullToAbsent
          ? const Value.absent()
          : Value(cvssVectorJson),
      verified: Value(verified),
    );
  }

  factory DbVulnerabilityFinding.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbVulnerabilityFinding(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      accessPointId: serializer.fromJson<String?>(json['accessPointId']),
      type: $VulnerabilityFindingsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      severity: $VulnerabilityFindingsTable.$converterseverity
          .fromJson(serializer.fromJson<int>(json['severity'])),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      recommendation: serializer.fromJson<String>(json['recommendation']),
      evidence: serializer.fromJson<Map<String, dynamic>>(json['evidence']),
      discoveredAt: serializer.fromJson<DateTime>(json['discoveredAt']),
      cvssVectorJson: serializer.fromJson<CvssVector?>(json['cvssVectorJson']),
      verified: serializer.fromJson<bool>(json['verified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'accessPointId': serializer.toJson<String?>(accessPointId),
      'type': serializer
          .toJson<int>($VulnerabilityFindingsTable.$convertertype.toJson(type)),
      'severity': serializer.toJson<int>(
          $VulnerabilityFindingsTable.$converterseverity.toJson(severity)),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'recommendation': serializer.toJson<String>(recommendation),
      'evidence': serializer.toJson<Map<String, dynamic>>(evidence),
      'discoveredAt': serializer.toJson<DateTime>(discoveredAt),
      'cvssVectorJson': serializer.toJson<CvssVector?>(cvssVectorJson),
      'verified': serializer.toJson<bool>(verified),
    };
  }

  DbVulnerabilityFinding copyWith(
          {String? id,
          String? assessmentId,
          Value<String?> accessPointId = const Value.absent(),
          VulnerabilityType? type,
          Severity? severity,
          String? title,
          String? description,
          String? recommendation,
          Map<String, dynamic>? evidence,
          DateTime? discoveredAt,
          Value<CvssVector?> cvssVectorJson = const Value.absent(),
          bool? verified}) =>
      DbVulnerabilityFinding(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        accessPointId:
            accessPointId.present ? accessPointId.value : this.accessPointId,
        type: type ?? this.type,
        severity: severity ?? this.severity,
        title: title ?? this.title,
        description: description ?? this.description,
        recommendation: recommendation ?? this.recommendation,
        evidence: evidence ?? this.evidence,
        discoveredAt: discoveredAt ?? this.discoveredAt,
        cvssVectorJson:
            cvssVectorJson.present ? cvssVectorJson.value : this.cvssVectorJson,
        verified: verified ?? this.verified,
      );
  DbVulnerabilityFinding copyWithCompanion(
      VulnerabilityFindingsCompanion data) {
    return DbVulnerabilityFinding(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      accessPointId: data.accessPointId.present
          ? data.accessPointId.value
          : this.accessPointId,
      type: data.type.present ? data.type.value : this.type,
      severity: data.severity.present ? data.severity.value : this.severity,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      recommendation: data.recommendation.present
          ? data.recommendation.value
          : this.recommendation,
      evidence: data.evidence.present ? data.evidence.value : this.evidence,
      discoveredAt: data.discoveredAt.present
          ? data.discoveredAt.value
          : this.discoveredAt,
      cvssVectorJson: data.cvssVectorJson.present
          ? data.cvssVectorJson.value
          : this.cvssVectorJson,
      verified: data.verified.present ? data.verified.value : this.verified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbVulnerabilityFinding(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('type: $type, ')
          ..write('severity: $severity, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('recommendation: $recommendation, ')
          ..write('evidence: $evidence, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('cvssVectorJson: $cvssVectorJson, ')
          ..write('verified: $verified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      assessmentId,
      accessPointId,
      type,
      severity,
      title,
      description,
      recommendation,
      evidence,
      discoveredAt,
      cvssVectorJson,
      verified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbVulnerabilityFinding &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.accessPointId == this.accessPointId &&
          other.type == this.type &&
          other.severity == this.severity &&
          other.title == this.title &&
          other.description == this.description &&
          other.recommendation == this.recommendation &&
          other.evidence == this.evidence &&
          other.discoveredAt == this.discoveredAt &&
          other.cvssVectorJson == this.cvssVectorJson &&
          other.verified == this.verified);
}

class VulnerabilityFindingsCompanion
    extends UpdateCompanion<DbVulnerabilityFinding> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<String?> accessPointId;
  final Value<VulnerabilityType> type;
  final Value<Severity> severity;
  final Value<String> title;
  final Value<String> description;
  final Value<String> recommendation;
  final Value<Map<String, dynamic>> evidence;
  final Value<DateTime> discoveredAt;
  final Value<CvssVector?> cvssVectorJson;
  final Value<bool> verified;
  final Value<int> rowid;
  const VulnerabilityFindingsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.accessPointId = const Value.absent(),
    this.type = const Value.absent(),
    this.severity = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.recommendation = const Value.absent(),
    this.evidence = const Value.absent(),
    this.discoveredAt = const Value.absent(),
    this.cvssVectorJson = const Value.absent(),
    this.verified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VulnerabilityFindingsCompanion.insert({
    required String id,
    required String assessmentId,
    this.accessPointId = const Value.absent(),
    required VulnerabilityType type,
    required Severity severity,
    required String title,
    required String description,
    required String recommendation,
    required Map<String, dynamic> evidence,
    required DateTime discoveredAt,
    this.cvssVectorJson = const Value.absent(),
    required bool verified,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        type = Value(type),
        severity = Value(severity),
        title = Value(title),
        description = Value(description),
        recommendation = Value(recommendation),
        evidence = Value(evidence),
        discoveredAt = Value(discoveredAt),
        verified = Value(verified);
  static Insertable<DbVulnerabilityFinding> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<String>? accessPointId,
    Expression<int>? type,
    Expression<int>? severity,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? recommendation,
    Expression<String>? evidence,
    Expression<DateTime>? discoveredAt,
    Expression<String>? cvssVectorJson,
    Expression<bool>? verified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (accessPointId != null) 'access_point_id': accessPointId,
      if (type != null) 'type': type,
      if (severity != null) 'severity': severity,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (recommendation != null) 'recommendation': recommendation,
      if (evidence != null) 'evidence': evidence,
      if (discoveredAt != null) 'discovered_at': discoveredAt,
      if (cvssVectorJson != null) 'cvss_vector_json': cvssVectorJson,
      if (verified != null) 'verified': verified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VulnerabilityFindingsCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<String?>? accessPointId,
      Value<VulnerabilityType>? type,
      Value<Severity>? severity,
      Value<String>? title,
      Value<String>? description,
      Value<String>? recommendation,
      Value<Map<String, dynamic>>? evidence,
      Value<DateTime>? discoveredAt,
      Value<CvssVector?>? cvssVectorJson,
      Value<bool>? verified,
      Value<int>? rowid}) {
    return VulnerabilityFindingsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      accessPointId: accessPointId ?? this.accessPointId,
      type: type ?? this.type,
      severity: severity ?? this.severity,
      title: title ?? this.title,
      description: description ?? this.description,
      recommendation: recommendation ?? this.recommendation,
      evidence: evidence ?? this.evidence,
      discoveredAt: discoveredAt ?? this.discoveredAt,
      cvssVectorJson: cvssVectorJson ?? this.cvssVectorJson,
      verified: verified ?? this.verified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (accessPointId.present) {
      map['access_point_id'] = Variable<String>(accessPointId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
          $VulnerabilityFindingsTable.$convertertype.toSql(type.value));
    }
    if (severity.present) {
      map['severity'] = Variable<int>(
          $VulnerabilityFindingsTable.$converterseverity.toSql(severity.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (recommendation.present) {
      map['recommendation'] = Variable<String>(recommendation.value);
    }
    if (evidence.present) {
      map['evidence'] = Variable<String>(
          $VulnerabilityFindingsTable.$converterevidence.toSql(evidence.value));
    }
    if (discoveredAt.present) {
      map['discovered_at'] = Variable<DateTime>(discoveredAt.value);
    }
    if (cvssVectorJson.present) {
      map['cvss_vector_json'] = Variable<String>($VulnerabilityFindingsTable
          .$convertercvssVectorJsonn
          .toSql(cvssVectorJson.value));
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VulnerabilityFindingsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('accessPointId: $accessPointId, ')
          ..write('type: $type, ')
          ..write('severity: $severity, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('recommendation: $recommendation, ')
          ..write('evidence: $evidence, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('cvssVectorJson: $cvssVectorJson, ')
          ..write('verified: $verified, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FindingsTable extends Findings
    with TableInfo<$FindingsTable, DbFinding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FindingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<FindingType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<FindingType>($FindingsTable.$convertertype);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumnWithTypeConverter<Severity, int> severity =
      GeneratedColumn<int>('severity', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Severity>($FindingsTable.$converterseverity);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recommendationMeta =
      const VerificationMeta('recommendation');
  @override
  late final GeneratedColumn<String> recommendation = GeneratedColumn<String>(
      'recommendation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _affectedTargetMeta =
      const VerificationMeta('affectedTarget');
  @override
  late final GeneratedColumn<String> affectedTarget = GeneratedColumn<String>(
      'affected_target', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _evidenceMeta =
      const VerificationMeta('evidence');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      evidence = GeneratedColumn<String>('evidence', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $FindingsTable.$converterevidence);
  static const VerificationMeta _evidenceIdsMeta =
      const VerificationMeta('evidenceIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      evidenceIds = GeneratedColumn<String>('evidence_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($FindingsTable.$converterevidenceIds);
  static const VerificationMeta _cvssVectorJsonMeta =
      const VerificationMeta('cvssVectorJson');
  @override
  late final GeneratedColumnWithTypeConverter<CvssVector, String>
      cvssVectorJson = GeneratedColumn<String>(
              'cvss_vector_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CvssVector>($FindingsTable.$convertercvssVectorJson);
  static const VerificationMeta _discoveredAtMeta =
      const VerificationMeta('discoveredAt');
  @override
  late final GeneratedColumn<DateTime> discoveredAt = GeneratedColumn<DateTime>(
      'discovered_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _verifiedAtMeta =
      const VerificationMeta('verifiedAt');
  @override
  late final GeneratedColumn<DateTime> verifiedAt = GeneratedColumn<DateTime>(
      'verified_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _verifiedMeta =
      const VerificationMeta('verified');
  @override
  late final GeneratedColumn<bool> verified = GeneratedColumn<bool>(
      'verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("verified" IN (0, 1))'));
  static const VerificationMeta _falsePositiveMeta =
      const VerificationMeta('falsePositive');
  @override
  late final GeneratedColumn<bool> falsePositive = GeneratedColumn<bool>(
      'false_positive', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("false_positive" IN (0, 1))'));
  static const VerificationMeta _referencesMeta =
      const VerificationMeta('references');
  @override
  late final GeneratedColumn<String> references = GeneratedColumn<String>(
      'references', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $FindingsTable.$convertermetadata);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        type,
        severity,
        title,
        description,
        recommendation,
        affectedTarget,
        evidence,
        evidenceIds,
        cvssVectorJson,
        discoveredAt,
        verifiedAt,
        verified,
        falsePositive,
        references,
        metadata
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'findings';
  @override
  VerificationContext validateIntegrity(Insertable<DbFinding> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_severityMeta, const VerificationResult.success());
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('recommendation')) {
      context.handle(
          _recommendationMeta,
          recommendation.isAcceptableOrUnknown(
              data['recommendation']!, _recommendationMeta));
    } else if (isInserting) {
      context.missing(_recommendationMeta);
    }
    if (data.containsKey('affected_target')) {
      context.handle(
          _affectedTargetMeta,
          affectedTarget.isAcceptableOrUnknown(
              data['affected_target']!, _affectedTargetMeta));
    } else if (isInserting) {
      context.missing(_affectedTargetMeta);
    }
    context.handle(_evidenceMeta, const VerificationResult.success());
    context.handle(_evidenceIdsMeta, const VerificationResult.success());
    context.handle(_cvssVectorJsonMeta, const VerificationResult.success());
    if (data.containsKey('discovered_at')) {
      context.handle(
          _discoveredAtMeta,
          discoveredAt.isAcceptableOrUnknown(
              data['discovered_at']!, _discoveredAtMeta));
    } else if (isInserting) {
      context.missing(_discoveredAtMeta);
    }
    if (data.containsKey('verified_at')) {
      context.handle(
          _verifiedAtMeta,
          verifiedAt.isAcceptableOrUnknown(
              data['verified_at']!, _verifiedAtMeta));
    }
    if (data.containsKey('verified')) {
      context.handle(_verifiedMeta,
          verified.isAcceptableOrUnknown(data['verified']!, _verifiedMeta));
    } else if (isInserting) {
      context.missing(_verifiedMeta);
    }
    if (data.containsKey('false_positive')) {
      context.handle(
          _falsePositiveMeta,
          falsePositive.isAcceptableOrUnknown(
              data['false_positive']!, _falsePositiveMeta));
    } else if (isInserting) {
      context.missing(_falsePositiveMeta);
    }
    if (data.containsKey('references')) {
      context.handle(
          _referencesMeta,
          references.isAcceptableOrUnknown(
              data['references']!, _referencesMeta));
    } else if (isInserting) {
      context.missing(_referencesMeta);
    }
    context.handle(_metadataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbFinding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbFinding(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      type: $FindingsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      severity: $FindingsTable.$converterseverity.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}severity'])!),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      recommendation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recommendation'])!,
      affectedTarget: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}affected_target'])!,
      evidence: $FindingsTable.$converterevidence.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence'])!),
      evidenceIds: $FindingsTable.$converterevidenceIds.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}evidence_ids'])!),
      cvssVectorJson: $FindingsTable.$convertercvssVectorJson.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}cvss_vector_json'])!),
      discoveredAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}discovered_at'])!,
      verifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}verified_at']),
      verified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}verified'])!,
      falsePositive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}false_positive'])!,
      references: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}references'])!,
      metadata: $FindingsTable.$convertermetadata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!),
    );
  }

  @override
  $FindingsTable createAlias(String alias) {
    return $FindingsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FindingType, int, int> $convertertype =
      const EnumIndexConverter<FindingType>(FindingType.values);
  static JsonTypeConverter2<Severity, int, int> $converterseverity =
      const EnumIndexConverter<Severity>(Severity.values);
  static TypeConverter<Map<String, dynamic>, String> $converterevidence =
      const JsonMapConverter();
  static TypeConverter<List<String>, String> $converterevidenceIds =
      const StringListConverter();
  static TypeConverter<CvssVector, String> $convertercvssVectorJson =
      const CvssVectorConverter();
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
}

class DbFinding extends DataClass implements Insertable<DbFinding> {
  final String id;
  final String assessmentId;
  final FindingType type;
  final Severity severity;
  final String title;
  final String description;
  final String recommendation;
  final String affectedTarget;
  final Map<String, dynamic> evidence;
  final List<String> evidenceIds;
  final CvssVector cvssVectorJson;
  final DateTime discoveredAt;
  final DateTime? verifiedAt;
  final bool verified;
  final bool falsePositive;
  final String references;
  final Map<String, dynamic> metadata;
  const DbFinding(
      {required this.id,
      required this.assessmentId,
      required this.type,
      required this.severity,
      required this.title,
      required this.description,
      required this.recommendation,
      required this.affectedTarget,
      required this.evidence,
      required this.evidenceIds,
      required this.cvssVectorJson,
      required this.discoveredAt,
      this.verifiedAt,
      required this.verified,
      required this.falsePositive,
      required this.references,
      required this.metadata});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    {
      map['type'] = Variable<int>($FindingsTable.$convertertype.toSql(type));
    }
    {
      map['severity'] =
          Variable<int>($FindingsTable.$converterseverity.toSql(severity));
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['recommendation'] = Variable<String>(recommendation);
    map['affected_target'] = Variable<String>(affectedTarget);
    {
      map['evidence'] =
          Variable<String>($FindingsTable.$converterevidence.toSql(evidence));
    }
    {
      map['evidence_ids'] = Variable<String>(
          $FindingsTable.$converterevidenceIds.toSql(evidenceIds));
    }
    {
      map['cvss_vector_json'] = Variable<String>(
          $FindingsTable.$convertercvssVectorJson.toSql(cvssVectorJson));
    }
    map['discovered_at'] = Variable<DateTime>(discoveredAt);
    if (!nullToAbsent || verifiedAt != null) {
      map['verified_at'] = Variable<DateTime>(verifiedAt);
    }
    map['verified'] = Variable<bool>(verified);
    map['false_positive'] = Variable<bool>(falsePositive);
    map['references'] = Variable<String>(references);
    {
      map['metadata'] =
          Variable<String>($FindingsTable.$convertermetadata.toSql(metadata));
    }
    return map;
  }

  FindingsCompanion toCompanion(bool nullToAbsent) {
    return FindingsCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      type: Value(type),
      severity: Value(severity),
      title: Value(title),
      description: Value(description),
      recommendation: Value(recommendation),
      affectedTarget: Value(affectedTarget),
      evidence: Value(evidence),
      evidenceIds: Value(evidenceIds),
      cvssVectorJson: Value(cvssVectorJson),
      discoveredAt: Value(discoveredAt),
      verifiedAt: verifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(verifiedAt),
      verified: Value(verified),
      falsePositive: Value(falsePositive),
      references: Value(references),
      metadata: Value(metadata),
    );
  }

  factory DbFinding.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbFinding(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      type: $FindingsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      severity: $FindingsTable.$converterseverity
          .fromJson(serializer.fromJson<int>(json['severity'])),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      recommendation: serializer.fromJson<String>(json['recommendation']),
      affectedTarget: serializer.fromJson<String>(json['affectedTarget']),
      evidence: serializer.fromJson<Map<String, dynamic>>(json['evidence']),
      evidenceIds: serializer.fromJson<List<String>>(json['evidenceIds']),
      cvssVectorJson: serializer.fromJson<CvssVector>(json['cvssVectorJson']),
      discoveredAt: serializer.fromJson<DateTime>(json['discoveredAt']),
      verifiedAt: serializer.fromJson<DateTime?>(json['verifiedAt']),
      verified: serializer.fromJson<bool>(json['verified']),
      falsePositive: serializer.fromJson<bool>(json['falsePositive']),
      references: serializer.fromJson<String>(json['references']),
      metadata: serializer.fromJson<Map<String, dynamic>>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'type':
          serializer.toJson<int>($FindingsTable.$convertertype.toJson(type)),
      'severity': serializer
          .toJson<int>($FindingsTable.$converterseverity.toJson(severity)),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'recommendation': serializer.toJson<String>(recommendation),
      'affectedTarget': serializer.toJson<String>(affectedTarget),
      'evidence': serializer.toJson<Map<String, dynamic>>(evidence),
      'evidenceIds': serializer.toJson<List<String>>(evidenceIds),
      'cvssVectorJson': serializer.toJson<CvssVector>(cvssVectorJson),
      'discoveredAt': serializer.toJson<DateTime>(discoveredAt),
      'verifiedAt': serializer.toJson<DateTime?>(verifiedAt),
      'verified': serializer.toJson<bool>(verified),
      'falsePositive': serializer.toJson<bool>(falsePositive),
      'references': serializer.toJson<String>(references),
      'metadata': serializer.toJson<Map<String, dynamic>>(metadata),
    };
  }

  DbFinding copyWith(
          {String? id,
          String? assessmentId,
          FindingType? type,
          Severity? severity,
          String? title,
          String? description,
          String? recommendation,
          String? affectedTarget,
          Map<String, dynamic>? evidence,
          List<String>? evidenceIds,
          CvssVector? cvssVectorJson,
          DateTime? discoveredAt,
          Value<DateTime?> verifiedAt = const Value.absent(),
          bool? verified,
          bool? falsePositive,
          String? references,
          Map<String, dynamic>? metadata}) =>
      DbFinding(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        type: type ?? this.type,
        severity: severity ?? this.severity,
        title: title ?? this.title,
        description: description ?? this.description,
        recommendation: recommendation ?? this.recommendation,
        affectedTarget: affectedTarget ?? this.affectedTarget,
        evidence: evidence ?? this.evidence,
        evidenceIds: evidenceIds ?? this.evidenceIds,
        cvssVectorJson: cvssVectorJson ?? this.cvssVectorJson,
        discoveredAt: discoveredAt ?? this.discoveredAt,
        verifiedAt: verifiedAt.present ? verifiedAt.value : this.verifiedAt,
        verified: verified ?? this.verified,
        falsePositive: falsePositive ?? this.falsePositive,
        references: references ?? this.references,
        metadata: metadata ?? this.metadata,
      );
  DbFinding copyWithCompanion(FindingsCompanion data) {
    return DbFinding(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      type: data.type.present ? data.type.value : this.type,
      severity: data.severity.present ? data.severity.value : this.severity,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      recommendation: data.recommendation.present
          ? data.recommendation.value
          : this.recommendation,
      affectedTarget: data.affectedTarget.present
          ? data.affectedTarget.value
          : this.affectedTarget,
      evidence: data.evidence.present ? data.evidence.value : this.evidence,
      evidenceIds:
          data.evidenceIds.present ? data.evidenceIds.value : this.evidenceIds,
      cvssVectorJson: data.cvssVectorJson.present
          ? data.cvssVectorJson.value
          : this.cvssVectorJson,
      discoveredAt: data.discoveredAt.present
          ? data.discoveredAt.value
          : this.discoveredAt,
      verifiedAt:
          data.verifiedAt.present ? data.verifiedAt.value : this.verifiedAt,
      verified: data.verified.present ? data.verified.value : this.verified,
      falsePositive: data.falsePositive.present
          ? data.falsePositive.value
          : this.falsePositive,
      references:
          data.references.present ? data.references.value : this.references,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbFinding(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('type: $type, ')
          ..write('severity: $severity, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('recommendation: $recommendation, ')
          ..write('affectedTarget: $affectedTarget, ')
          ..write('evidence: $evidence, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('cvssVectorJson: $cvssVectorJson, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('verifiedAt: $verifiedAt, ')
          ..write('verified: $verified, ')
          ..write('falsePositive: $falsePositive, ')
          ..write('references: $references, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      assessmentId,
      type,
      severity,
      title,
      description,
      recommendation,
      affectedTarget,
      evidence,
      evidenceIds,
      cvssVectorJson,
      discoveredAt,
      verifiedAt,
      verified,
      falsePositive,
      references,
      metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbFinding &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.type == this.type &&
          other.severity == this.severity &&
          other.title == this.title &&
          other.description == this.description &&
          other.recommendation == this.recommendation &&
          other.affectedTarget == this.affectedTarget &&
          other.evidence == this.evidence &&
          other.evidenceIds == this.evidenceIds &&
          other.cvssVectorJson == this.cvssVectorJson &&
          other.discoveredAt == this.discoveredAt &&
          other.verifiedAt == this.verifiedAt &&
          other.verified == this.verified &&
          other.falsePositive == this.falsePositive &&
          other.references == this.references &&
          other.metadata == this.metadata);
}

class FindingsCompanion extends UpdateCompanion<DbFinding> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<FindingType> type;
  final Value<Severity> severity;
  final Value<String> title;
  final Value<String> description;
  final Value<String> recommendation;
  final Value<String> affectedTarget;
  final Value<Map<String, dynamic>> evidence;
  final Value<List<String>> evidenceIds;
  final Value<CvssVector> cvssVectorJson;
  final Value<DateTime> discoveredAt;
  final Value<DateTime?> verifiedAt;
  final Value<bool> verified;
  final Value<bool> falsePositive;
  final Value<String> references;
  final Value<Map<String, dynamic>> metadata;
  final Value<int> rowid;
  const FindingsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.type = const Value.absent(),
    this.severity = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.recommendation = const Value.absent(),
    this.affectedTarget = const Value.absent(),
    this.evidence = const Value.absent(),
    this.evidenceIds = const Value.absent(),
    this.cvssVectorJson = const Value.absent(),
    this.discoveredAt = const Value.absent(),
    this.verifiedAt = const Value.absent(),
    this.verified = const Value.absent(),
    this.falsePositive = const Value.absent(),
    this.references = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FindingsCompanion.insert({
    required String id,
    required String assessmentId,
    required FindingType type,
    required Severity severity,
    required String title,
    required String description,
    required String recommendation,
    required String affectedTarget,
    required Map<String, dynamic> evidence,
    required List<String> evidenceIds,
    required CvssVector cvssVectorJson,
    required DateTime discoveredAt,
    this.verifiedAt = const Value.absent(),
    required bool verified,
    required bool falsePositive,
    required String references,
    required Map<String, dynamic> metadata,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        type = Value(type),
        severity = Value(severity),
        title = Value(title),
        description = Value(description),
        recommendation = Value(recommendation),
        affectedTarget = Value(affectedTarget),
        evidence = Value(evidence),
        evidenceIds = Value(evidenceIds),
        cvssVectorJson = Value(cvssVectorJson),
        discoveredAt = Value(discoveredAt),
        verified = Value(verified),
        falsePositive = Value(falsePositive),
        references = Value(references),
        metadata = Value(metadata);
  static Insertable<DbFinding> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<int>? type,
    Expression<int>? severity,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? recommendation,
    Expression<String>? affectedTarget,
    Expression<String>? evidence,
    Expression<String>? evidenceIds,
    Expression<String>? cvssVectorJson,
    Expression<DateTime>? discoveredAt,
    Expression<DateTime>? verifiedAt,
    Expression<bool>? verified,
    Expression<bool>? falsePositive,
    Expression<String>? references,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (type != null) 'type': type,
      if (severity != null) 'severity': severity,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (recommendation != null) 'recommendation': recommendation,
      if (affectedTarget != null) 'affected_target': affectedTarget,
      if (evidence != null) 'evidence': evidence,
      if (evidenceIds != null) 'evidence_ids': evidenceIds,
      if (cvssVectorJson != null) 'cvss_vector_json': cvssVectorJson,
      if (discoveredAt != null) 'discovered_at': discoveredAt,
      if (verifiedAt != null) 'verified_at': verifiedAt,
      if (verified != null) 'verified': verified,
      if (falsePositive != null) 'false_positive': falsePositive,
      if (references != null) 'references': references,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FindingsCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<FindingType>? type,
      Value<Severity>? severity,
      Value<String>? title,
      Value<String>? description,
      Value<String>? recommendation,
      Value<String>? affectedTarget,
      Value<Map<String, dynamic>>? evidence,
      Value<List<String>>? evidenceIds,
      Value<CvssVector>? cvssVectorJson,
      Value<DateTime>? discoveredAt,
      Value<DateTime?>? verifiedAt,
      Value<bool>? verified,
      Value<bool>? falsePositive,
      Value<String>? references,
      Value<Map<String, dynamic>>? metadata,
      Value<int>? rowid}) {
    return FindingsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      type: type ?? this.type,
      severity: severity ?? this.severity,
      title: title ?? this.title,
      description: description ?? this.description,
      recommendation: recommendation ?? this.recommendation,
      affectedTarget: affectedTarget ?? this.affectedTarget,
      evidence: evidence ?? this.evidence,
      evidenceIds: evidenceIds ?? this.evidenceIds,
      cvssVectorJson: cvssVectorJson ?? this.cvssVectorJson,
      discoveredAt: discoveredAt ?? this.discoveredAt,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      verified: verified ?? this.verified,
      falsePositive: falsePositive ?? this.falsePositive,
      references: references ?? this.references,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($FindingsTable.$convertertype.toSql(type.value));
    }
    if (severity.present) {
      map['severity'] = Variable<int>(
          $FindingsTable.$converterseverity.toSql(severity.value));
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (recommendation.present) {
      map['recommendation'] = Variable<String>(recommendation.value);
    }
    if (affectedTarget.present) {
      map['affected_target'] = Variable<String>(affectedTarget.value);
    }
    if (evidence.present) {
      map['evidence'] = Variable<String>(
          $FindingsTable.$converterevidence.toSql(evidence.value));
    }
    if (evidenceIds.present) {
      map['evidence_ids'] = Variable<String>(
          $FindingsTable.$converterevidenceIds.toSql(evidenceIds.value));
    }
    if (cvssVectorJson.present) {
      map['cvss_vector_json'] = Variable<String>(
          $FindingsTable.$convertercvssVectorJson.toSql(cvssVectorJson.value));
    }
    if (discoveredAt.present) {
      map['discovered_at'] = Variable<DateTime>(discoveredAt.value);
    }
    if (verifiedAt.present) {
      map['verified_at'] = Variable<DateTime>(verifiedAt.value);
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (falsePositive.present) {
      map['false_positive'] = Variable<bool>(falsePositive.value);
    }
    if (references.present) {
      map['references'] = Variable<String>(references.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $FindingsTable.$convertermetadata.toSql(metadata.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FindingsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('type: $type, ')
          ..write('severity: $severity, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('recommendation: $recommendation, ')
          ..write('affectedTarget: $affectedTarget, ')
          ..write('evidence: $evidence, ')
          ..write('evidenceIds: $evidenceIds, ')
          ..write('cvssVectorJson: $cvssVectorJson, ')
          ..write('discoveredAt: $discoveredAt, ')
          ..write('verifiedAt: $verifiedAt, ')
          ..write('verified: $verified, ')
          ..write('falsePositive: $falsePositive, ')
          ..write('references: $references, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EvidenceTable extends Evidence
    with TableInfo<$EvidenceTable, DbEvidence> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvidenceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<EvidenceType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<EvidenceType>($EvidenceTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hashSha256Meta =
      const VerificationMeta('hashSha256');
  @override
  late final GeneratedColumn<String> hashSha256 = GeneratedColumn<String>(
      'hash_sha256', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _capturedAtMeta =
      const VerificationMeta('capturedAt');
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
      'captured_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _capturedByMeta =
      const VerificationMeta('capturedBy');
  @override
  late final GeneratedColumn<String> capturedBy = GeneratedColumn<String>(
      'captured_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      metadata = GeneratedColumn<String>('metadata', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $EvidenceTable.$convertermetadata);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($EvidenceTable.$convertertags);
  static const VerificationMeta _isEncryptedMeta =
      const VerificationMeta('isEncrypted');
  @override
  late final GeneratedColumn<bool> isEncrypted = GeneratedColumn<bool>(
      'is_encrypted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_encrypted" IN (0, 1))'));
  static const VerificationMeta _encryptionKeyIdMeta =
      const VerificationMeta('encryptionKeyId');
  @override
  late final GeneratedColumn<String> encryptionKeyId = GeneratedColumn<String>(
      'encryption_key_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        type,
        name,
        description,
        filePath,
        hashSha256,
        sizeBytes,
        capturedAt,
        capturedBy,
        metadata,
        tags,
        isEncrypted,
        encryptionKeyId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evidence';
  @override
  VerificationContext validateIntegrity(Insertable<DbEvidence> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('hash_sha256')) {
      context.handle(
          _hashSha256Meta,
          hashSha256.isAcceptableOrUnknown(
              data['hash_sha256']!, _hashSha256Meta));
    } else if (isInserting) {
      context.missing(_hashSha256Meta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    } else if (isInserting) {
      context.missing(_sizeBytesMeta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
          _capturedAtMeta,
          capturedAt.isAcceptableOrUnknown(
              data['captured_at']!, _capturedAtMeta));
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('captured_by')) {
      context.handle(
          _capturedByMeta,
          capturedBy.isAcceptableOrUnknown(
              data['captured_by']!, _capturedByMeta));
    } else if (isInserting) {
      context.missing(_capturedByMeta);
    }
    context.handle(_metadataMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('is_encrypted')) {
      context.handle(
          _isEncryptedMeta,
          isEncrypted.isAcceptableOrUnknown(
              data['is_encrypted']!, _isEncryptedMeta));
    } else if (isInserting) {
      context.missing(_isEncryptedMeta);
    }
    if (data.containsKey('encryption_key_id')) {
      context.handle(
          _encryptionKeyIdMeta,
          encryptionKeyId.isAcceptableOrUnknown(
              data['encryption_key_id']!, _encryptionKeyIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbEvidence map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbEvidence(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      type: $EvidenceTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      hashSha256: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash_sha256'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      capturedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}captured_at'])!,
      capturedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}captured_by'])!,
      metadata: $EvidenceTable.$convertermetadata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!),
      tags: $EvidenceTable.$convertertags.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      isEncrypted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_encrypted'])!,
      encryptionKeyId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}encryption_key_id']),
    );
  }

  @override
  $EvidenceTable createAlias(String alias) {
    return $EvidenceTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EvidenceType, int, int> $convertertype =
      const EnumIndexConverter<EvidenceType>(EvidenceType.values);
  static TypeConverter<Map<String, dynamic>, String> $convertermetadata =
      const JsonMapConverter();
  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
}

class DbEvidence extends DataClass implements Insertable<DbEvidence> {
  final String id;
  final String assessmentId;
  final EvidenceType type;
  final String name;
  final String description;
  final String filePath;
  final String hashSha256;
  final int sizeBytes;
  final DateTime capturedAt;
  final String capturedBy;
  final Map<String, dynamic> metadata;
  final List<String> tags;
  final bool isEncrypted;
  final String? encryptionKeyId;
  const DbEvidence(
      {required this.id,
      required this.assessmentId,
      required this.type,
      required this.name,
      required this.description,
      required this.filePath,
      required this.hashSha256,
      required this.sizeBytes,
      required this.capturedAt,
      required this.capturedBy,
      required this.metadata,
      required this.tags,
      required this.isEncrypted,
      this.encryptionKeyId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    {
      map['type'] = Variable<int>($EvidenceTable.$convertertype.toSql(type));
    }
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['file_path'] = Variable<String>(filePath);
    map['hash_sha256'] = Variable<String>(hashSha256);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    map['captured_by'] = Variable<String>(capturedBy);
    {
      map['metadata'] =
          Variable<String>($EvidenceTable.$convertermetadata.toSql(metadata));
    }
    {
      map['tags'] = Variable<String>($EvidenceTable.$convertertags.toSql(tags));
    }
    map['is_encrypted'] = Variable<bool>(isEncrypted);
    if (!nullToAbsent || encryptionKeyId != null) {
      map['encryption_key_id'] = Variable<String>(encryptionKeyId);
    }
    return map;
  }

  EvidenceCompanion toCompanion(bool nullToAbsent) {
    return EvidenceCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      type: Value(type),
      name: Value(name),
      description: Value(description),
      filePath: Value(filePath),
      hashSha256: Value(hashSha256),
      sizeBytes: Value(sizeBytes),
      capturedAt: Value(capturedAt),
      capturedBy: Value(capturedBy),
      metadata: Value(metadata),
      tags: Value(tags),
      isEncrypted: Value(isEncrypted),
      encryptionKeyId: encryptionKeyId == null && nullToAbsent
          ? const Value.absent()
          : Value(encryptionKeyId),
    );
  }

  factory DbEvidence.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbEvidence(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      type: $EvidenceTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      filePath: serializer.fromJson<String>(json['filePath']),
      hashSha256: serializer.fromJson<String>(json['hashSha256']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      capturedBy: serializer.fromJson<String>(json['capturedBy']),
      metadata: serializer.fromJson<Map<String, dynamic>>(json['metadata']),
      tags: serializer.fromJson<List<String>>(json['tags']),
      isEncrypted: serializer.fromJson<bool>(json['isEncrypted']),
      encryptionKeyId: serializer.fromJson<String?>(json['encryptionKeyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'type':
          serializer.toJson<int>($EvidenceTable.$convertertype.toJson(type)),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'filePath': serializer.toJson<String>(filePath),
      'hashSha256': serializer.toJson<String>(hashSha256),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'capturedBy': serializer.toJson<String>(capturedBy),
      'metadata': serializer.toJson<Map<String, dynamic>>(metadata),
      'tags': serializer.toJson<List<String>>(tags),
      'isEncrypted': serializer.toJson<bool>(isEncrypted),
      'encryptionKeyId': serializer.toJson<String?>(encryptionKeyId),
    };
  }

  DbEvidence copyWith(
          {String? id,
          String? assessmentId,
          EvidenceType? type,
          String? name,
          String? description,
          String? filePath,
          String? hashSha256,
          int? sizeBytes,
          DateTime? capturedAt,
          String? capturedBy,
          Map<String, dynamic>? metadata,
          List<String>? tags,
          bool? isEncrypted,
          Value<String?> encryptionKeyId = const Value.absent()}) =>
      DbEvidence(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        type: type ?? this.type,
        name: name ?? this.name,
        description: description ?? this.description,
        filePath: filePath ?? this.filePath,
        hashSha256: hashSha256 ?? this.hashSha256,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        capturedAt: capturedAt ?? this.capturedAt,
        capturedBy: capturedBy ?? this.capturedBy,
        metadata: metadata ?? this.metadata,
        tags: tags ?? this.tags,
        isEncrypted: isEncrypted ?? this.isEncrypted,
        encryptionKeyId: encryptionKeyId.present
            ? encryptionKeyId.value
            : this.encryptionKeyId,
      );
  DbEvidence copyWithCompanion(EvidenceCompanion data) {
    return DbEvidence(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      hashSha256:
          data.hashSha256.present ? data.hashSha256.value : this.hashSha256,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      capturedAt:
          data.capturedAt.present ? data.capturedAt.value : this.capturedAt,
      capturedBy:
          data.capturedBy.present ? data.capturedBy.value : this.capturedBy,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      tags: data.tags.present ? data.tags.value : this.tags,
      isEncrypted:
          data.isEncrypted.present ? data.isEncrypted.value : this.isEncrypted,
      encryptionKeyId: data.encryptionKeyId.present
          ? data.encryptionKeyId.value
          : this.encryptionKeyId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbEvidence(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('filePath: $filePath, ')
          ..write('hashSha256: $hashSha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('capturedBy: $capturedBy, ')
          ..write('metadata: $metadata, ')
          ..write('tags: $tags, ')
          ..write('isEncrypted: $isEncrypted, ')
          ..write('encryptionKeyId: $encryptionKeyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      assessmentId,
      type,
      name,
      description,
      filePath,
      hashSha256,
      sizeBytes,
      capturedAt,
      capturedBy,
      metadata,
      tags,
      isEncrypted,
      encryptionKeyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbEvidence &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.type == this.type &&
          other.name == this.name &&
          other.description == this.description &&
          other.filePath == this.filePath &&
          other.hashSha256 == this.hashSha256 &&
          other.sizeBytes == this.sizeBytes &&
          other.capturedAt == this.capturedAt &&
          other.capturedBy == this.capturedBy &&
          other.metadata == this.metadata &&
          other.tags == this.tags &&
          other.isEncrypted == this.isEncrypted &&
          other.encryptionKeyId == this.encryptionKeyId);
}

class EvidenceCompanion extends UpdateCompanion<DbEvidence> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<EvidenceType> type;
  final Value<String> name;
  final Value<String> description;
  final Value<String> filePath;
  final Value<String> hashSha256;
  final Value<int> sizeBytes;
  final Value<DateTime> capturedAt;
  final Value<String> capturedBy;
  final Value<Map<String, dynamic>> metadata;
  final Value<List<String>> tags;
  final Value<bool> isEncrypted;
  final Value<String?> encryptionKeyId;
  final Value<int> rowid;
  const EvidenceCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.filePath = const Value.absent(),
    this.hashSha256 = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.capturedBy = const Value.absent(),
    this.metadata = const Value.absent(),
    this.tags = const Value.absent(),
    this.isEncrypted = const Value.absent(),
    this.encryptionKeyId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EvidenceCompanion.insert({
    required String id,
    required String assessmentId,
    required EvidenceType type,
    required String name,
    required String description,
    required String filePath,
    required String hashSha256,
    required int sizeBytes,
    required DateTime capturedAt,
    required String capturedBy,
    required Map<String, dynamic> metadata,
    required List<String> tags,
    required bool isEncrypted,
    this.encryptionKeyId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        type = Value(type),
        name = Value(name),
        description = Value(description),
        filePath = Value(filePath),
        hashSha256 = Value(hashSha256),
        sizeBytes = Value(sizeBytes),
        capturedAt = Value(capturedAt),
        capturedBy = Value(capturedBy),
        metadata = Value(metadata),
        tags = Value(tags),
        isEncrypted = Value(isEncrypted);
  static Insertable<DbEvidence> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<int>? type,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? filePath,
    Expression<String>? hashSha256,
    Expression<int>? sizeBytes,
    Expression<DateTime>? capturedAt,
    Expression<String>? capturedBy,
    Expression<String>? metadata,
    Expression<String>? tags,
    Expression<bool>? isEncrypted,
    Expression<String>? encryptionKeyId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (filePath != null) 'file_path': filePath,
      if (hashSha256 != null) 'hash_sha256': hashSha256,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (capturedBy != null) 'captured_by': capturedBy,
      if (metadata != null) 'metadata': metadata,
      if (tags != null) 'tags': tags,
      if (isEncrypted != null) 'is_encrypted': isEncrypted,
      if (encryptionKeyId != null) 'encryption_key_id': encryptionKeyId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EvidenceCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<EvidenceType>? type,
      Value<String>? name,
      Value<String>? description,
      Value<String>? filePath,
      Value<String>? hashSha256,
      Value<int>? sizeBytes,
      Value<DateTime>? capturedAt,
      Value<String>? capturedBy,
      Value<Map<String, dynamic>>? metadata,
      Value<List<String>>? tags,
      Value<bool>? isEncrypted,
      Value<String?>? encryptionKeyId,
      Value<int>? rowid}) {
    return EvidenceCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      filePath: filePath ?? this.filePath,
      hashSha256: hashSha256 ?? this.hashSha256,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      capturedAt: capturedAt ?? this.capturedAt,
      capturedBy: capturedBy ?? this.capturedBy,
      metadata: metadata ?? this.metadata,
      tags: tags ?? this.tags,
      isEncrypted: isEncrypted ?? this.isEncrypted,
      encryptionKeyId: encryptionKeyId ?? this.encryptionKeyId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($EvidenceTable.$convertertype.toSql(type.value));
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (hashSha256.present) {
      map['hash_sha256'] = Variable<String>(hashSha256.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (capturedBy.present) {
      map['captured_by'] = Variable<String>(capturedBy.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(
          $EvidenceTable.$convertermetadata.toSql(metadata.value));
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($EvidenceTable.$convertertags.toSql(tags.value));
    }
    if (isEncrypted.present) {
      map['is_encrypted'] = Variable<bool>(isEncrypted.value);
    }
    if (encryptionKeyId.present) {
      map['encryption_key_id'] = Variable<String>(encryptionKeyId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvidenceCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('filePath: $filePath, ')
          ..write('hashSha256: $hashSha256, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('capturedBy: $capturedBy, ')
          ..write('metadata: $metadata, ')
          ..write('tags: $tags, ')
          ..write('isEncrypted: $isEncrypted, ')
          ..write('encryptionKeyId: $encryptionKeyId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReportsTable extends Reports with TableInfo<$ReportsTable, DbReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<ReportType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ReportType>($ReportsTable.$convertertype);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<ReportStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ReportStatus>($ReportsTable.$converterstatus);
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumnWithTypeConverter<ReportFormat, int> format =
      GeneratedColumn<int>('format', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ReportFormat>($ReportsTable.$converterformat);
  static const VerificationMeta _templateMeta =
      const VerificationMeta('template');
  @override
  late final GeneratedColumnWithTypeConverter<ReportTemplate, int> template =
      GeneratedColumn<int>('template', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ReportTemplate>($ReportsTable.$convertertemplate);
  static const VerificationMeta _contentJsonMeta =
      const VerificationMeta('contentJson');
  @override
  late final GeneratedColumnWithTypeConverter<ReportContent, String>
      contentJson = GeneratedColumn<String>('content_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ReportContent>($ReportsTable.$convertercontentJson);
  static const VerificationMeta _metadataJsonMeta =
      const VerificationMeta('metadataJson');
  @override
  late final GeneratedColumnWithTypeConverter<ReportMetadata, String>
      metadataJson = GeneratedColumn<String>(
              'metadata_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ReportMetadata>($ReportsTable.$convertermetadataJson);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _generatedAtMeta =
      const VerificationMeta('generatedAt');
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
      'generated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deliveredAtMeta =
      const VerificationMeta('deliveredAt');
  @override
  late final GeneratedColumn<DateTime> deliveredAt = GeneratedColumn<DateTime>(
      'delivered_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _attachedEvidenceIdsMeta =
      const VerificationMeta('attachedEvidenceIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      attachedEvidenceIds = GeneratedColumn<String>(
              'attached_evidence_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $ReportsTable.$converterattachedEvidenceIds);
  static const VerificationMeta _customDataMeta =
      const VerificationMeta('customData');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      customData = GeneratedColumn<String>('custom_data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $ReportsTable.$convertercustomData);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        projectId,
        assessmentId,
        title,
        type,
        status,
        format,
        template,
        contentJson,
        metadataJson,
        createdAt,
        generatedAt,
        deliveredAt,
        attachedEvidenceIds,
        customData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reports';
  @override
  VerificationContext validateIntegrity(Insertable<DbReport> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    context.handle(_formatMeta, const VerificationResult.success());
    context.handle(_templateMeta, const VerificationResult.success());
    context.handle(_contentJsonMeta, const VerificationResult.success());
    context.handle(_metadataJsonMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
          _generatedAtMeta,
          generatedAt.isAcceptableOrUnknown(
              data['generated_at']!, _generatedAtMeta));
    }
    if (data.containsKey('delivered_at')) {
      context.handle(
          _deliveredAtMeta,
          deliveredAt.isAcceptableOrUnknown(
              data['delivered_at']!, _deliveredAtMeta));
    }
    context.handle(
        _attachedEvidenceIdsMeta, const VerificationResult.success());
    context.handle(_customDataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbReport(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: $ReportsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      status: $ReportsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      format: $ReportsTable.$converterformat.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}format'])!),
      template: $ReportsTable.$convertertemplate.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}template'])!),
      contentJson: $ReportsTable.$convertercontentJson.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_json'])!),
      metadataJson: $ReportsTable.$convertermetadataJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}metadata_json'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      generatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}generated_at']),
      deliveredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delivered_at']),
      attachedEvidenceIds: $ReportsTable.$converterattachedEvidenceIds.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}attached_evidence_ids'])!),
      customData: $ReportsTable.$convertercustomData.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}custom_data'])!),
    );
  }

  @override
  $ReportsTable createAlias(String alias) {
    return $ReportsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ReportType, int, int> $convertertype =
      const EnumIndexConverter<ReportType>(ReportType.values);
  static JsonTypeConverter2<ReportStatus, int, int> $converterstatus =
      const EnumIndexConverter<ReportStatus>(ReportStatus.values);
  static JsonTypeConverter2<ReportFormat, int, int> $converterformat =
      const EnumIndexConverter<ReportFormat>(ReportFormat.values);
  static JsonTypeConverter2<ReportTemplate, int, int> $convertertemplate =
      const EnumIndexConverter<ReportTemplate>(ReportTemplate.values);
  static TypeConverter<ReportContent, String> $convertercontentJson =
      const ReportContentConverter();
  static TypeConverter<ReportMetadata, String> $convertermetadataJson =
      const ReportMetadataConverter();
  static TypeConverter<List<String>, String> $converterattachedEvidenceIds =
      const StringListConverter();
  static TypeConverter<Map<String, dynamic>, String> $convertercustomData =
      const JsonMapConverter();
}

class DbReport extends DataClass implements Insertable<DbReport> {
  final String id;
  final String projectId;
  final String assessmentId;
  final String title;
  final ReportType type;
  final ReportStatus status;
  final ReportFormat format;
  final ReportTemplate template;
  final ReportContent contentJson;
  final ReportMetadata metadataJson;
  final DateTime createdAt;
  final DateTime? generatedAt;
  final DateTime? deliveredAt;
  final List<String> attachedEvidenceIds;
  final Map<String, dynamic> customData;
  const DbReport(
      {required this.id,
      required this.projectId,
      required this.assessmentId,
      required this.title,
      required this.type,
      required this.status,
      required this.format,
      required this.template,
      required this.contentJson,
      required this.metadataJson,
      required this.createdAt,
      this.generatedAt,
      this.deliveredAt,
      required this.attachedEvidenceIds,
      required this.customData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['assessment_id'] = Variable<String>(assessmentId);
    map['title'] = Variable<String>(title);
    {
      map['type'] = Variable<int>($ReportsTable.$convertertype.toSql(type));
    }
    {
      map['status'] =
          Variable<int>($ReportsTable.$converterstatus.toSql(status));
    }
    {
      map['format'] =
          Variable<int>($ReportsTable.$converterformat.toSql(format));
    }
    {
      map['template'] =
          Variable<int>($ReportsTable.$convertertemplate.toSql(template));
    }
    {
      map['content_json'] = Variable<String>(
          $ReportsTable.$convertercontentJson.toSql(contentJson));
    }
    {
      map['metadata_json'] = Variable<String>(
          $ReportsTable.$convertermetadataJson.toSql(metadataJson));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || generatedAt != null) {
      map['generated_at'] = Variable<DateTime>(generatedAt);
    }
    if (!nullToAbsent || deliveredAt != null) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt);
    }
    {
      map['attached_evidence_ids'] = Variable<String>($ReportsTable
          .$converterattachedEvidenceIds
          .toSql(attachedEvidenceIds));
    }
    {
      map['custom_data'] = Variable<String>(
          $ReportsTable.$convertercustomData.toSql(customData));
    }
    return map;
  }

  ReportsCompanion toCompanion(bool nullToAbsent) {
    return ReportsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      assessmentId: Value(assessmentId),
      title: Value(title),
      type: Value(type),
      status: Value(status),
      format: Value(format),
      template: Value(template),
      contentJson: Value(contentJson),
      metadataJson: Value(metadataJson),
      createdAt: Value(createdAt),
      generatedAt: generatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(generatedAt),
      deliveredAt: deliveredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveredAt),
      attachedEvidenceIds: Value(attachedEvidenceIds),
      customData: Value(customData),
    );
  }

  factory DbReport.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbReport(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      title: serializer.fromJson<String>(json['title']),
      type: $ReportsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      status: $ReportsTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      format: $ReportsTable.$converterformat
          .fromJson(serializer.fromJson<int>(json['format'])),
      template: $ReportsTable.$convertertemplate
          .fromJson(serializer.fromJson<int>(json['template'])),
      contentJson: serializer.fromJson<ReportContent>(json['contentJson']),
      metadataJson: serializer.fromJson<ReportMetadata>(json['metadataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      generatedAt: serializer.fromJson<DateTime?>(json['generatedAt']),
      deliveredAt: serializer.fromJson<DateTime?>(json['deliveredAt']),
      attachedEvidenceIds:
          serializer.fromJson<List<String>>(json['attachedEvidenceIds']),
      customData: serializer.fromJson<Map<String, dynamic>>(json['customData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<int>($ReportsTable.$convertertype.toJson(type)),
      'status':
          serializer.toJson<int>($ReportsTable.$converterstatus.toJson(status)),
      'format':
          serializer.toJson<int>($ReportsTable.$converterformat.toJson(format)),
      'template': serializer
          .toJson<int>($ReportsTable.$convertertemplate.toJson(template)),
      'contentJson': serializer.toJson<ReportContent>(contentJson),
      'metadataJson': serializer.toJson<ReportMetadata>(metadataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'generatedAt': serializer.toJson<DateTime?>(generatedAt),
      'deliveredAt': serializer.toJson<DateTime?>(deliveredAt),
      'attachedEvidenceIds':
          serializer.toJson<List<String>>(attachedEvidenceIds),
      'customData': serializer.toJson<Map<String, dynamic>>(customData),
    };
  }

  DbReport copyWith(
          {String? id,
          String? projectId,
          String? assessmentId,
          String? title,
          ReportType? type,
          ReportStatus? status,
          ReportFormat? format,
          ReportTemplate? template,
          ReportContent? contentJson,
          ReportMetadata? metadataJson,
          DateTime? createdAt,
          Value<DateTime?> generatedAt = const Value.absent(),
          Value<DateTime?> deliveredAt = const Value.absent(),
          List<String>? attachedEvidenceIds,
          Map<String, dynamic>? customData}) =>
      DbReport(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        assessmentId: assessmentId ?? this.assessmentId,
        title: title ?? this.title,
        type: type ?? this.type,
        status: status ?? this.status,
        format: format ?? this.format,
        template: template ?? this.template,
        contentJson: contentJson ?? this.contentJson,
        metadataJson: metadataJson ?? this.metadataJson,
        createdAt: createdAt ?? this.createdAt,
        generatedAt: generatedAt.present ? generatedAt.value : this.generatedAt,
        deliveredAt: deliveredAt.present ? deliveredAt.value : this.deliveredAt,
        attachedEvidenceIds: attachedEvidenceIds ?? this.attachedEvidenceIds,
        customData: customData ?? this.customData,
      );
  DbReport copyWithCompanion(ReportsCompanion data) {
    return DbReport(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      format: data.format.present ? data.format.value : this.format,
      template: data.template.present ? data.template.value : this.template,
      contentJson:
          data.contentJson.present ? data.contentJson.value : this.contentJson,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      generatedAt:
          data.generatedAt.present ? data.generatedAt.value : this.generatedAt,
      deliveredAt:
          data.deliveredAt.present ? data.deliveredAt.value : this.deliveredAt,
      attachedEvidenceIds: data.attachedEvidenceIds.present
          ? data.attachedEvidenceIds.value
          : this.attachedEvidenceIds,
      customData:
          data.customData.present ? data.customData.value : this.customData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbReport(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('format: $format, ')
          ..write('template: $template, ')
          ..write('contentJson: $contentJson, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('deliveredAt: $deliveredAt, ')
          ..write('attachedEvidenceIds: $attachedEvidenceIds, ')
          ..write('customData: $customData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      projectId,
      assessmentId,
      title,
      type,
      status,
      format,
      template,
      contentJson,
      metadataJson,
      createdAt,
      generatedAt,
      deliveredAt,
      attachedEvidenceIds,
      customData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbReport &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.assessmentId == this.assessmentId &&
          other.title == this.title &&
          other.type == this.type &&
          other.status == this.status &&
          other.format == this.format &&
          other.template == this.template &&
          other.contentJson == this.contentJson &&
          other.metadataJson == this.metadataJson &&
          other.createdAt == this.createdAt &&
          other.generatedAt == this.generatedAt &&
          other.deliveredAt == this.deliveredAt &&
          other.attachedEvidenceIds == this.attachedEvidenceIds &&
          other.customData == this.customData);
}

class ReportsCompanion extends UpdateCompanion<DbReport> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> assessmentId;
  final Value<String> title;
  final Value<ReportType> type;
  final Value<ReportStatus> status;
  final Value<ReportFormat> format;
  final Value<ReportTemplate> template;
  final Value<ReportContent> contentJson;
  final Value<ReportMetadata> metadataJson;
  final Value<DateTime> createdAt;
  final Value<DateTime?> generatedAt;
  final Value<DateTime?> deliveredAt;
  final Value<List<String>> attachedEvidenceIds;
  final Value<Map<String, dynamic>> customData;
  final Value<int> rowid;
  const ReportsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.format = const Value.absent(),
    this.template = const Value.absent(),
    this.contentJson = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
    this.attachedEvidenceIds = const Value.absent(),
    this.customData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReportsCompanion.insert({
    required String id,
    required String projectId,
    required String assessmentId,
    required String title,
    required ReportType type,
    required ReportStatus status,
    required ReportFormat format,
    required ReportTemplate template,
    required ReportContent contentJson,
    required ReportMetadata metadataJson,
    required DateTime createdAt,
    this.generatedAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
    required List<String> attachedEvidenceIds,
    required Map<String, dynamic> customData,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        projectId = Value(projectId),
        assessmentId = Value(assessmentId),
        title = Value(title),
        type = Value(type),
        status = Value(status),
        format = Value(format),
        template = Value(template),
        contentJson = Value(contentJson),
        metadataJson = Value(metadataJson),
        createdAt = Value(createdAt),
        attachedEvidenceIds = Value(attachedEvidenceIds),
        customData = Value(customData);
  static Insertable<DbReport> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? assessmentId,
    Expression<String>? title,
    Expression<int>? type,
    Expression<int>? status,
    Expression<int>? format,
    Expression<int>? template,
    Expression<String>? contentJson,
    Expression<String>? metadataJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? generatedAt,
    Expression<DateTime>? deliveredAt,
    Expression<String>? attachedEvidenceIds,
    Expression<String>? customData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (format != null) 'format': format,
      if (template != null) 'template': template,
      if (contentJson != null) 'content_json': contentJson,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (deliveredAt != null) 'delivered_at': deliveredAt,
      if (attachedEvidenceIds != null)
        'attached_evidence_ids': attachedEvidenceIds,
      if (customData != null) 'custom_data': customData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReportsCompanion copyWith(
      {Value<String>? id,
      Value<String>? projectId,
      Value<String>? assessmentId,
      Value<String>? title,
      Value<ReportType>? type,
      Value<ReportStatus>? status,
      Value<ReportFormat>? format,
      Value<ReportTemplate>? template,
      Value<ReportContent>? contentJson,
      Value<ReportMetadata>? metadataJson,
      Value<DateTime>? createdAt,
      Value<DateTime?>? generatedAt,
      Value<DateTime?>? deliveredAt,
      Value<List<String>>? attachedEvidenceIds,
      Value<Map<String, dynamic>>? customData,
      Value<int>? rowid}) {
    return ReportsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      assessmentId: assessmentId ?? this.assessmentId,
      title: title ?? this.title,
      type: type ?? this.type,
      status: status ?? this.status,
      format: format ?? this.format,
      template: template ?? this.template,
      contentJson: contentJson ?? this.contentJson,
      metadataJson: metadataJson ?? this.metadataJson,
      createdAt: createdAt ?? this.createdAt,
      generatedAt: generatedAt ?? this.generatedAt,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      attachedEvidenceIds: attachedEvidenceIds ?? this.attachedEvidenceIds,
      customData: customData ?? this.customData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($ReportsTable.$convertertype.toSql(type.value));
    }
    if (status.present) {
      map['status'] =
          Variable<int>($ReportsTable.$converterstatus.toSql(status.value));
    }
    if (format.present) {
      map['format'] =
          Variable<int>($ReportsTable.$converterformat.toSql(format.value));
    }
    if (template.present) {
      map['template'] =
          Variable<int>($ReportsTable.$convertertemplate.toSql(template.value));
    }
    if (contentJson.present) {
      map['content_json'] = Variable<String>(
          $ReportsTable.$convertercontentJson.toSql(contentJson.value));
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(
          $ReportsTable.$convertermetadataJson.toSql(metadataJson.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (deliveredAt.present) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt.value);
    }
    if (attachedEvidenceIds.present) {
      map['attached_evidence_ids'] = Variable<String>($ReportsTable
          .$converterattachedEvidenceIds
          .toSql(attachedEvidenceIds.value));
    }
    if (customData.present) {
      map['custom_data'] = Variable<String>(
          $ReportsTable.$convertercustomData.toSql(customData.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('format: $format, ')
          ..write('template: $template, ')
          ..write('contentJson: $contentJson, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('deliveredAt: $deliveredAt, ')
          ..write('attachedEvidenceIds: $attachedEvidenceIds, ')
          ..write('customData: $customData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScanSessionsTable extends ScanSessions
    with TableInfo<$ScanSessionsTable, DbScanSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScanSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumnWithTypeConverter<ScanMode, int> mode =
      GeneratedColumn<int>('mode', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ScanMode>($ScanSessionsTable.$convertermode);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<ScanStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<ScanStatus>($ScanSessionsTable.$converterstatus);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _configJsonMeta =
      const VerificationMeta('configJson');
  @override
  late final GeneratedColumnWithTypeConverter<ScanConfig, String> configJson =
      GeneratedColumn<String>('config_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ScanConfig>($ScanSessionsTable.$converterconfigJson);
  static const VerificationMeta _statisticsJsonMeta =
      const VerificationMeta('statisticsJson');
  @override
  late final GeneratedColumnWithTypeConverter<ScanStatistics, String>
      statisticsJson = GeneratedColumn<String>(
              'statistics_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ScanStatistics>(
              $ScanSessionsTable.$converterstatisticsJson);
  static const VerificationMeta _accessPointIdsMeta =
      const VerificationMeta('accessPointIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      accessPointIds = GeneratedColumn<String>(
              'access_point_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $ScanSessionsTable.$converteraccessPointIds);
  static const VerificationMeta _handshakeIdsMeta =
      const VerificationMeta('handshakeIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      handshakeIds = GeneratedColumn<String>(
              'handshake_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $ScanSessionsTable.$converterhandshakeIds);
  static const VerificationMeta _pmkidIdsMeta =
      const VerificationMeta('pmkidIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> pmkidIds =
      GeneratedColumn<String>('pmkid_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($ScanSessionsTable.$converterpmkidIds);
  static const VerificationMeta _wpsPinIdsMeta =
      const VerificationMeta('wpsPinIds');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> wpsPinIds =
      GeneratedColumn<String>('wps_pin_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($ScanSessionsTable.$converterwpsPinIds);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        name,
        mode,
        status,
        startedAt,
        completedAt,
        configJson,
        statisticsJson,
        accessPointIds,
        handshakeIds,
        pmkidIds,
        wpsPinIds
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scan_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<DbScanSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_modeMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    context.handle(_configJsonMeta, const VerificationResult.success());
    context.handle(_statisticsJsonMeta, const VerificationResult.success());
    context.handle(_accessPointIdsMeta, const VerificationResult.success());
    context.handle(_handshakeIdsMeta, const VerificationResult.success());
    context.handle(_pmkidIdsMeta, const VerificationResult.success());
    context.handle(_wpsPinIdsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbScanSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbScanSession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      mode: $ScanSessionsTable.$convertermode.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mode'])!),
      status: $ScanSessionsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      configJson: $ScanSessionsTable.$converterconfigJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}config_json'])!),
      statisticsJson: $ScanSessionsTable.$converterstatisticsJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}statistics_json'])!),
      accessPointIds: $ScanSessionsTable.$converteraccessPointIds.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}access_point_ids'])!),
      handshakeIds: $ScanSessionsTable.$converterhandshakeIds.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}handshake_ids'])!),
      pmkidIds: $ScanSessionsTable.$converterpmkidIds.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pmkid_ids'])!),
      wpsPinIds: $ScanSessionsTable.$converterwpsPinIds.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wps_pin_ids'])!),
    );
  }

  @override
  $ScanSessionsTable createAlias(String alias) {
    return $ScanSessionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ScanMode, int, int> $convertermode =
      const EnumIndexConverter<ScanMode>(ScanMode.values);
  static JsonTypeConverter2<ScanStatus, int, int> $converterstatus =
      const EnumIndexConverter<ScanStatus>(ScanStatus.values);
  static TypeConverter<ScanConfig, String> $converterconfigJson =
      const ScanConfigConverter();
  static TypeConverter<ScanStatistics, String> $converterstatisticsJson =
      const ScanStatisticsConverter();
  static TypeConverter<List<String>, String> $converteraccessPointIds =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterhandshakeIds =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterpmkidIds =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterwpsPinIds =
      const StringListConverter();
}

class DbScanSession extends DataClass implements Insertable<DbScanSession> {
  final String id;
  final String? assessmentId;
  final String name;
  final ScanMode mode;
  final ScanStatus status;
  final DateTime startedAt;
  final DateTime? completedAt;
  final ScanConfig configJson;
  final ScanStatistics statisticsJson;
  final List<String> accessPointIds;
  final List<String> handshakeIds;
  final List<String> pmkidIds;
  final List<String> wpsPinIds;
  const DbScanSession(
      {required this.id,
      this.assessmentId,
      required this.name,
      required this.mode,
      required this.status,
      required this.startedAt,
      this.completedAt,
      required this.configJson,
      required this.statisticsJson,
      required this.accessPointIds,
      required this.handshakeIds,
      required this.pmkidIds,
      required this.wpsPinIds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || assessmentId != null) {
      map['assessment_id'] = Variable<String>(assessmentId);
    }
    map['name'] = Variable<String>(name);
    {
      map['mode'] =
          Variable<int>($ScanSessionsTable.$convertermode.toSql(mode));
    }
    {
      map['status'] =
          Variable<int>($ScanSessionsTable.$converterstatus.toSql(status));
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    {
      map['config_json'] = Variable<String>(
          $ScanSessionsTable.$converterconfigJson.toSql(configJson));
    }
    {
      map['statistics_json'] = Variable<String>(
          $ScanSessionsTable.$converterstatisticsJson.toSql(statisticsJson));
    }
    {
      map['access_point_ids'] = Variable<String>(
          $ScanSessionsTable.$converteraccessPointIds.toSql(accessPointIds));
    }
    {
      map['handshake_ids'] = Variable<String>(
          $ScanSessionsTable.$converterhandshakeIds.toSql(handshakeIds));
    }
    {
      map['pmkid_ids'] = Variable<String>(
          $ScanSessionsTable.$converterpmkidIds.toSql(pmkidIds));
    }
    {
      map['wps_pin_ids'] = Variable<String>(
          $ScanSessionsTable.$converterwpsPinIds.toSql(wpsPinIds));
    }
    return map;
  }

  ScanSessionsCompanion toCompanion(bool nullToAbsent) {
    return ScanSessionsCompanion(
      id: Value(id),
      assessmentId: assessmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(assessmentId),
      name: Value(name),
      mode: Value(mode),
      status: Value(status),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      configJson: Value(configJson),
      statisticsJson: Value(statisticsJson),
      accessPointIds: Value(accessPointIds),
      handshakeIds: Value(handshakeIds),
      pmkidIds: Value(pmkidIds),
      wpsPinIds: Value(wpsPinIds),
    );
  }

  factory DbScanSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbScanSession(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String?>(json['assessmentId']),
      name: serializer.fromJson<String>(json['name']),
      mode: $ScanSessionsTable.$convertermode
          .fromJson(serializer.fromJson<int>(json['mode'])),
      status: $ScanSessionsTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      configJson: serializer.fromJson<ScanConfig>(json['configJson']),
      statisticsJson:
          serializer.fromJson<ScanStatistics>(json['statisticsJson']),
      accessPointIds: serializer.fromJson<List<String>>(json['accessPointIds']),
      handshakeIds: serializer.fromJson<List<String>>(json['handshakeIds']),
      pmkidIds: serializer.fromJson<List<String>>(json['pmkidIds']),
      wpsPinIds: serializer.fromJson<List<String>>(json['wpsPinIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String?>(assessmentId),
      'name': serializer.toJson<String>(name),
      'mode': serializer
          .toJson<int>($ScanSessionsTable.$convertermode.toJson(mode)),
      'status': serializer
          .toJson<int>($ScanSessionsTable.$converterstatus.toJson(status)),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'configJson': serializer.toJson<ScanConfig>(configJson),
      'statisticsJson': serializer.toJson<ScanStatistics>(statisticsJson),
      'accessPointIds': serializer.toJson<List<String>>(accessPointIds),
      'handshakeIds': serializer.toJson<List<String>>(handshakeIds),
      'pmkidIds': serializer.toJson<List<String>>(pmkidIds),
      'wpsPinIds': serializer.toJson<List<String>>(wpsPinIds),
    };
  }

  DbScanSession copyWith(
          {String? id,
          Value<String?> assessmentId = const Value.absent(),
          String? name,
          ScanMode? mode,
          ScanStatus? status,
          DateTime? startedAt,
          Value<DateTime?> completedAt = const Value.absent(),
          ScanConfig? configJson,
          ScanStatistics? statisticsJson,
          List<String>? accessPointIds,
          List<String>? handshakeIds,
          List<String>? pmkidIds,
          List<String>? wpsPinIds}) =>
      DbScanSession(
        id: id ?? this.id,
        assessmentId:
            assessmentId.present ? assessmentId.value : this.assessmentId,
        name: name ?? this.name,
        mode: mode ?? this.mode,
        status: status ?? this.status,
        startedAt: startedAt ?? this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        configJson: configJson ?? this.configJson,
        statisticsJson: statisticsJson ?? this.statisticsJson,
        accessPointIds: accessPointIds ?? this.accessPointIds,
        handshakeIds: handshakeIds ?? this.handshakeIds,
        pmkidIds: pmkidIds ?? this.pmkidIds,
        wpsPinIds: wpsPinIds ?? this.wpsPinIds,
      );
  DbScanSession copyWithCompanion(ScanSessionsCompanion data) {
    return DbScanSession(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      name: data.name.present ? data.name.value : this.name,
      mode: data.mode.present ? data.mode.value : this.mode,
      status: data.status.present ? data.status.value : this.status,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      configJson:
          data.configJson.present ? data.configJson.value : this.configJson,
      statisticsJson: data.statisticsJson.present
          ? data.statisticsJson.value
          : this.statisticsJson,
      accessPointIds: data.accessPointIds.present
          ? data.accessPointIds.value
          : this.accessPointIds,
      handshakeIds: data.handshakeIds.present
          ? data.handshakeIds.value
          : this.handshakeIds,
      pmkidIds: data.pmkidIds.present ? data.pmkidIds.value : this.pmkidIds,
      wpsPinIds: data.wpsPinIds.present ? data.wpsPinIds.value : this.wpsPinIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbScanSession(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('name: $name, ')
          ..write('mode: $mode, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('configJson: $configJson, ')
          ..write('statisticsJson: $statisticsJson, ')
          ..write('accessPointIds: $accessPointIds, ')
          ..write('handshakeIds: $handshakeIds, ')
          ..write('pmkidIds: $pmkidIds, ')
          ..write('wpsPinIds: $wpsPinIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      assessmentId,
      name,
      mode,
      status,
      startedAt,
      completedAt,
      configJson,
      statisticsJson,
      accessPointIds,
      handshakeIds,
      pmkidIds,
      wpsPinIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbScanSession &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.name == this.name &&
          other.mode == this.mode &&
          other.status == this.status &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.configJson == this.configJson &&
          other.statisticsJson == this.statisticsJson &&
          other.accessPointIds == this.accessPointIds &&
          other.handshakeIds == this.handshakeIds &&
          other.pmkidIds == this.pmkidIds &&
          other.wpsPinIds == this.wpsPinIds);
}

class ScanSessionsCompanion extends UpdateCompanion<DbScanSession> {
  final Value<String> id;
  final Value<String?> assessmentId;
  final Value<String> name;
  final Value<ScanMode> mode;
  final Value<ScanStatus> status;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<ScanConfig> configJson;
  final Value<ScanStatistics> statisticsJson;
  final Value<List<String>> accessPointIds;
  final Value<List<String>> handshakeIds;
  final Value<List<String>> pmkidIds;
  final Value<List<String>> wpsPinIds;
  final Value<int> rowid;
  const ScanSessionsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.name = const Value.absent(),
    this.mode = const Value.absent(),
    this.status = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.configJson = const Value.absent(),
    this.statisticsJson = const Value.absent(),
    this.accessPointIds = const Value.absent(),
    this.handshakeIds = const Value.absent(),
    this.pmkidIds = const Value.absent(),
    this.wpsPinIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScanSessionsCompanion.insert({
    required String id,
    this.assessmentId = const Value.absent(),
    required String name,
    required ScanMode mode,
    required ScanStatus status,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    required ScanConfig configJson,
    required ScanStatistics statisticsJson,
    required List<String> accessPointIds,
    required List<String> handshakeIds,
    required List<String> pmkidIds,
    required List<String> wpsPinIds,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        mode = Value(mode),
        status = Value(status),
        startedAt = Value(startedAt),
        configJson = Value(configJson),
        statisticsJson = Value(statisticsJson),
        accessPointIds = Value(accessPointIds),
        handshakeIds = Value(handshakeIds),
        pmkidIds = Value(pmkidIds),
        wpsPinIds = Value(wpsPinIds);
  static Insertable<DbScanSession> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<String>? name,
    Expression<int>? mode,
    Expression<int>? status,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? configJson,
    Expression<String>? statisticsJson,
    Expression<String>? accessPointIds,
    Expression<String>? handshakeIds,
    Expression<String>? pmkidIds,
    Expression<String>? wpsPinIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (name != null) 'name': name,
      if (mode != null) 'mode': mode,
      if (status != null) 'status': status,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (configJson != null) 'config_json': configJson,
      if (statisticsJson != null) 'statistics_json': statisticsJson,
      if (accessPointIds != null) 'access_point_ids': accessPointIds,
      if (handshakeIds != null) 'handshake_ids': handshakeIds,
      if (pmkidIds != null) 'pmkid_ids': pmkidIds,
      if (wpsPinIds != null) 'wps_pin_ids': wpsPinIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScanSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? assessmentId,
      Value<String>? name,
      Value<ScanMode>? mode,
      Value<ScanStatus>? status,
      Value<DateTime>? startedAt,
      Value<DateTime?>? completedAt,
      Value<ScanConfig>? configJson,
      Value<ScanStatistics>? statisticsJson,
      Value<List<String>>? accessPointIds,
      Value<List<String>>? handshakeIds,
      Value<List<String>>? pmkidIds,
      Value<List<String>>? wpsPinIds,
      Value<int>? rowid}) {
    return ScanSessionsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      name: name ?? this.name,
      mode: mode ?? this.mode,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      configJson: configJson ?? this.configJson,
      statisticsJson: statisticsJson ?? this.statisticsJson,
      accessPointIds: accessPointIds ?? this.accessPointIds,
      handshakeIds: handshakeIds ?? this.handshakeIds,
      pmkidIds: pmkidIds ?? this.pmkidIds,
      wpsPinIds: wpsPinIds ?? this.wpsPinIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (mode.present) {
      map['mode'] =
          Variable<int>($ScanSessionsTable.$convertermode.toSql(mode.value));
    }
    if (status.present) {
      map['status'] = Variable<int>(
          $ScanSessionsTable.$converterstatus.toSql(status.value));
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (configJson.present) {
      map['config_json'] = Variable<String>(
          $ScanSessionsTable.$converterconfigJson.toSql(configJson.value));
    }
    if (statisticsJson.present) {
      map['statistics_json'] = Variable<String>($ScanSessionsTable
          .$converterstatisticsJson
          .toSql(statisticsJson.value));
    }
    if (accessPointIds.present) {
      map['access_point_ids'] = Variable<String>($ScanSessionsTable
          .$converteraccessPointIds
          .toSql(accessPointIds.value));
    }
    if (handshakeIds.present) {
      map['handshake_ids'] = Variable<String>(
          $ScanSessionsTable.$converterhandshakeIds.toSql(handshakeIds.value));
    }
    if (pmkidIds.present) {
      map['pmkid_ids'] = Variable<String>(
          $ScanSessionsTable.$converterpmkidIds.toSql(pmkidIds.value));
    }
    if (wpsPinIds.present) {
      map['wps_pin_ids'] = Variable<String>(
          $ScanSessionsTable.$converterwpsPinIds.toSql(wpsPinIds.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScanSessionsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('name: $name, ')
          ..write('mode: $mode, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('configJson: $configJson, ')
          ..write('statisticsJson: $statisticsJson, ')
          ..write('accessPointIds: $accessPointIds, ')
          ..write('handshakeIds: $handshakeIds, ')
          ..write('pmkidIds: $pmkidIds, ')
          ..write('wpsPinIds: $wpsPinIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssessmentEventsTable extends AssessmentEvents
    with TableInfo<$AssessmentEventsTable, DbAssessmentEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assessmentIdMeta =
      const VerificationMeta('assessmentId');
  @override
  late final GeneratedColumn<String> assessmentId = GeneratedColumn<String>(
      'assessment_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<EventType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<EventType>($AssessmentEventsTable.$convertertype);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      data = GeneratedColumn<String>('data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $AssessmentEventsTable.$converterdata);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumnWithTypeConverter<LogLevel, int> level =
      GeneratedColumn<int>('level', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<LogLevel>($AssessmentEventsTable.$converterlevel);
  static const VerificationMeta _phaseIdMeta =
      const VerificationMeta('phaseId');
  @override
  late final GeneratedColumn<String> phaseId = GeneratedColumn<String>(
      'phase_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assessmentId,
        type,
        timestamp,
        message,
        data,
        level,
        phaseId,
        taskId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_events';
  @override
  VerificationContext validateIntegrity(Insertable<DbAssessmentEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_id')) {
      context.handle(
          _assessmentIdMeta,
          assessmentId.isAcceptableOrUnknown(
              data['assessment_id']!, _assessmentIdMeta));
    } else if (isInserting) {
      context.missing(_assessmentIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    context.handle(_dataMeta, const VerificationResult.success());
    context.handle(_levelMeta, const VerificationResult.success());
    if (data.containsKey('phase_id')) {
      context.handle(_phaseIdMeta,
          phaseId.isAcceptableOrUnknown(data['phase_id']!, _phaseIdMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAssessmentEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAssessmentEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assessmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}assessment_id'])!,
      type: $AssessmentEventsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      data: $AssessmentEventsTable.$converterdata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!),
      level: $AssessmentEventsTable.$converterlevel.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!),
      phaseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phase_id']),
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_id']),
    );
  }

  @override
  $AssessmentEventsTable createAlias(String alias) {
    return $AssessmentEventsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EventType, int, int> $convertertype =
      const EnumIndexConverter<EventType>(EventType.values);
  static TypeConverter<Map<String, dynamic>, String> $converterdata =
      const JsonMapConverter();
  static JsonTypeConverter2<LogLevel, int, int> $converterlevel =
      const EnumIndexConverter<LogLevel>(LogLevel.values);
}

class DbAssessmentEvent extends DataClass
    implements Insertable<DbAssessmentEvent> {
  final String id;
  final String assessmentId;
  final EventType type;
  final DateTime timestamp;
  final String message;
  final Map<String, dynamic> data;
  final LogLevel level;
  final String? phaseId;
  final String? taskId;
  const DbAssessmentEvent(
      {required this.id,
      required this.assessmentId,
      required this.type,
      required this.timestamp,
      required this.message,
      required this.data,
      required this.level,
      this.phaseId,
      this.taskId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_id'] = Variable<String>(assessmentId);
    {
      map['type'] =
          Variable<int>($AssessmentEventsTable.$convertertype.toSql(type));
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['message'] = Variable<String>(message);
    {
      map['data'] =
          Variable<String>($AssessmentEventsTable.$converterdata.toSql(data));
    }
    {
      map['level'] =
          Variable<int>($AssessmentEventsTable.$converterlevel.toSql(level));
    }
    if (!nullToAbsent || phaseId != null) {
      map['phase_id'] = Variable<String>(phaseId);
    }
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    return map;
  }

  AssessmentEventsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentEventsCompanion(
      id: Value(id),
      assessmentId: Value(assessmentId),
      type: Value(type),
      timestamp: Value(timestamp),
      message: Value(message),
      data: Value(data),
      level: Value(level),
      phaseId: phaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(phaseId),
      taskId:
          taskId == null && nullToAbsent ? const Value.absent() : Value(taskId),
    );
  }

  factory DbAssessmentEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAssessmentEvent(
      id: serializer.fromJson<String>(json['id']),
      assessmentId: serializer.fromJson<String>(json['assessmentId']),
      type: $AssessmentEventsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      message: serializer.fromJson<String>(json['message']),
      data: serializer.fromJson<Map<String, dynamic>>(json['data']),
      level: $AssessmentEventsTable.$converterlevel
          .fromJson(serializer.fromJson<int>(json['level'])),
      phaseId: serializer.fromJson<String?>(json['phaseId']),
      taskId: serializer.fromJson<String?>(json['taskId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentId': serializer.toJson<String>(assessmentId),
      'type': serializer
          .toJson<int>($AssessmentEventsTable.$convertertype.toJson(type)),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'message': serializer.toJson<String>(message),
      'data': serializer.toJson<Map<String, dynamic>>(data),
      'level': serializer
          .toJson<int>($AssessmentEventsTable.$converterlevel.toJson(level)),
      'phaseId': serializer.toJson<String?>(phaseId),
      'taskId': serializer.toJson<String?>(taskId),
    };
  }

  DbAssessmentEvent copyWith(
          {String? id,
          String? assessmentId,
          EventType? type,
          DateTime? timestamp,
          String? message,
          Map<String, dynamic>? data,
          LogLevel? level,
          Value<String?> phaseId = const Value.absent(),
          Value<String?> taskId = const Value.absent()}) =>
      DbAssessmentEvent(
        id: id ?? this.id,
        assessmentId: assessmentId ?? this.assessmentId,
        type: type ?? this.type,
        timestamp: timestamp ?? this.timestamp,
        message: message ?? this.message,
        data: data ?? this.data,
        level: level ?? this.level,
        phaseId: phaseId.present ? phaseId.value : this.phaseId,
        taskId: taskId.present ? taskId.value : this.taskId,
      );
  DbAssessmentEvent copyWithCompanion(AssessmentEventsCompanion data) {
    return DbAssessmentEvent(
      id: data.id.present ? data.id.value : this.id,
      assessmentId: data.assessmentId.present
          ? data.assessmentId.value
          : this.assessmentId,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      message: data.message.present ? data.message.value : this.message,
      data: data.data.present ? data.data.value : this.data,
      level: data.level.present ? data.level.value : this.level,
      phaseId: data.phaseId.present ? data.phaseId.value : this.phaseId,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAssessmentEvent(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('message: $message, ')
          ..write('data: $data, ')
          ..write('level: $level, ')
          ..write('phaseId: $phaseId, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, assessmentId, type, timestamp, message, data, level, phaseId, taskId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAssessmentEvent &&
          other.id == this.id &&
          other.assessmentId == this.assessmentId &&
          other.type == this.type &&
          other.timestamp == this.timestamp &&
          other.message == this.message &&
          other.data == this.data &&
          other.level == this.level &&
          other.phaseId == this.phaseId &&
          other.taskId == this.taskId);
}

class AssessmentEventsCompanion extends UpdateCompanion<DbAssessmentEvent> {
  final Value<String> id;
  final Value<String> assessmentId;
  final Value<EventType> type;
  final Value<DateTime> timestamp;
  final Value<String> message;
  final Value<Map<String, dynamic>> data;
  final Value<LogLevel> level;
  final Value<String?> phaseId;
  final Value<String?> taskId;
  final Value<int> rowid;
  const AssessmentEventsCompanion({
    this.id = const Value.absent(),
    this.assessmentId = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.message = const Value.absent(),
    this.data = const Value.absent(),
    this.level = const Value.absent(),
    this.phaseId = const Value.absent(),
    this.taskId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentEventsCompanion.insert({
    required String id,
    required String assessmentId,
    required EventType type,
    required DateTime timestamp,
    required String message,
    required Map<String, dynamic> data,
    required LogLevel level,
    this.phaseId = const Value.absent(),
    this.taskId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assessmentId = Value(assessmentId),
        type = Value(type),
        timestamp = Value(timestamp),
        message = Value(message),
        data = Value(data),
        level = Value(level);
  static Insertable<DbAssessmentEvent> custom({
    Expression<String>? id,
    Expression<String>? assessmentId,
    Expression<int>? type,
    Expression<DateTime>? timestamp,
    Expression<String>? message,
    Expression<String>? data,
    Expression<int>? level,
    Expression<String>? phaseId,
    Expression<String>? taskId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentId != null) 'assessment_id': assessmentId,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
      if (message != null) 'message': message,
      if (data != null) 'data': data,
      if (level != null) 'level': level,
      if (phaseId != null) 'phase_id': phaseId,
      if (taskId != null) 'task_id': taskId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? assessmentId,
      Value<EventType>? type,
      Value<DateTime>? timestamp,
      Value<String>? message,
      Value<Map<String, dynamic>>? data,
      Value<LogLevel>? level,
      Value<String?>? phaseId,
      Value<String?>? taskId,
      Value<int>? rowid}) {
    return AssessmentEventsCompanion(
      id: id ?? this.id,
      assessmentId: assessmentId ?? this.assessmentId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      message: message ?? this.message,
      data: data ?? this.data,
      level: level ?? this.level,
      phaseId: phaseId ?? this.phaseId,
      taskId: taskId ?? this.taskId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentId.present) {
      map['assessment_id'] = Variable<String>(assessmentId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
          $AssessmentEventsTable.$convertertype.toSql(type.value));
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(
          $AssessmentEventsTable.$converterdata.toSql(data.value));
    }
    if (level.present) {
      map['level'] = Variable<int>(
          $AssessmentEventsTable.$converterlevel.toSql(level.value));
    }
    if (phaseId.present) {
      map['phase_id'] = Variable<String>(phaseId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentEventsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentId: $assessmentId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('message: $message, ')
          ..write('data: $data, ')
          ..write('level: $level, ')
          ..write('phaseId: $phaseId, ')
          ..write('taskId: $taskId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PluginConfigsTable extends PluginConfigs
    with TableInfo<$PluginConfigsTable, DbPluginConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PluginConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pluginIdMeta =
      const VerificationMeta('pluginId');
  @override
  late final GeneratedColumn<String> pluginId = GeneratedColumn<String>(
      'plugin_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _configJsonMeta =
      const VerificationMeta('configJson');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      configJson = GeneratedColumn<String>('config_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $PluginConfigsTable.$converterconfigJson);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [pluginId, configJson, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plugin_configs';
  @override
  VerificationContext validateIntegrity(Insertable<DbPluginConfig> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('plugin_id')) {
      context.handle(_pluginIdMeta,
          pluginId.isAcceptableOrUnknown(data['plugin_id']!, _pluginIdMeta));
    } else if (isInserting) {
      context.missing(_pluginIdMeta);
    }
    context.handle(_configJsonMeta, const VerificationResult.success());
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pluginId};
  @override
  DbPluginConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbPluginConfig(
      pluginId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plugin_id'])!,
      configJson: $PluginConfigsTable.$converterconfigJson.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}config_json'])!),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PluginConfigsTable createAlias(String alias) {
    return $PluginConfigsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converterconfigJson =
      const JsonMapConverter();
}

class DbPluginConfig extends DataClass implements Insertable<DbPluginConfig> {
  final String pluginId;
  final Map<String, dynamic> configJson;
  final DateTime updatedAt;
  const DbPluginConfig(
      {required this.pluginId,
      required this.configJson,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['plugin_id'] = Variable<String>(pluginId);
    {
      map['config_json'] = Variable<String>(
          $PluginConfigsTable.$converterconfigJson.toSql(configJson));
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PluginConfigsCompanion toCompanion(bool nullToAbsent) {
    return PluginConfigsCompanion(
      pluginId: Value(pluginId),
      configJson: Value(configJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbPluginConfig.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbPluginConfig(
      pluginId: serializer.fromJson<String>(json['pluginId']),
      configJson: serializer.fromJson<Map<String, dynamic>>(json['configJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pluginId': serializer.toJson<String>(pluginId),
      'configJson': serializer.toJson<Map<String, dynamic>>(configJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DbPluginConfig copyWith(
          {String? pluginId,
          Map<String, dynamic>? configJson,
          DateTime? updatedAt}) =>
      DbPluginConfig(
        pluginId: pluginId ?? this.pluginId,
        configJson: configJson ?? this.configJson,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DbPluginConfig copyWithCompanion(PluginConfigsCompanion data) {
    return DbPluginConfig(
      pluginId: data.pluginId.present ? data.pluginId.value : this.pluginId,
      configJson:
          data.configJson.present ? data.configJson.value : this.configJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbPluginConfig(')
          ..write('pluginId: $pluginId, ')
          ..write('configJson: $configJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pluginId, configJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbPluginConfig &&
          other.pluginId == this.pluginId &&
          other.configJson == this.configJson &&
          other.updatedAt == this.updatedAt);
}

class PluginConfigsCompanion extends UpdateCompanion<DbPluginConfig> {
  final Value<String> pluginId;
  final Value<Map<String, dynamic>> configJson;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PluginConfigsCompanion({
    this.pluginId = const Value.absent(),
    this.configJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PluginConfigsCompanion.insert({
    required String pluginId,
    required Map<String, dynamic> configJson,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : pluginId = Value(pluginId),
        configJson = Value(configJson),
        updatedAt = Value(updatedAt);
  static Insertable<DbPluginConfig> custom({
    Expression<String>? pluginId,
    Expression<String>? configJson,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pluginId != null) 'plugin_id': pluginId,
      if (configJson != null) 'config_json': configJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PluginConfigsCompanion copyWith(
      {Value<String>? pluginId,
      Value<Map<String, dynamic>>? configJson,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PluginConfigsCompanion(
      pluginId: pluginId ?? this.pluginId,
      configJson: configJson ?? this.configJson,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pluginId.present) {
      map['plugin_id'] = Variable<String>(pluginId.value);
    }
    if (configJson.present) {
      map['config_json'] = Variable<String>(
          $PluginConfigsTable.$converterconfigJson.toSql(configJson.value));
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PluginConfigsCompanion(')
          ..write('pluginId: $pluginId, ')
          ..write('configJson: $configJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, DbAppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      value = GeneratedColumn<String>('value', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $AppSettingsTable.$convertervalue);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<DbAppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    context.handle(_valueMeta, const VerificationResult.success());
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  DbAppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: $AppSettingsTable.$convertervalue.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertervalue =
      const JsonMapConverter();
}

class DbAppSetting extends DataClass implements Insertable<DbAppSetting> {
  final String key;
  final Map<String, dynamic> value;
  final DateTime updatedAt;
  const DbAppSetting(
      {required this.key, required this.value, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    {
      map['value'] =
          Variable<String>($AppSettingsTable.$convertervalue.toSql(value));
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbAppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<Map<String, dynamic>>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<Map<String, dynamic>>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DbAppSetting copyWith(
          {String? key, Map<String, dynamic>? value, DateTime? updatedAt}) =>
      DbAppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DbAppSetting copyWithCompanion(AppSettingsCompanion data) {
    return DbAppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbAppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<DbAppSetting> {
  final Value<String> key;
  final Value<Map<String, dynamic>> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required Map<String, dynamic> value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value),
        updatedAt = Value(updatedAt);
  static Insertable<DbAppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key,
      Value<Map<String, dynamic>>? value,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(
          $AppSettingsTable.$convertervalue.toSql(value.value));
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabaseSchema extends GeneratedDatabase {
  _$AppDatabaseSchema(QueryExecutor e) : super(e);
  $AppDatabaseSchemaManager get managers => $AppDatabaseSchemaManager(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $AssessmentsTable assessments = $AssessmentsTable(this);
  late final $AccessPointsTable accessPoints = $AccessPointsTable(this);
  late final $ClientDevicesTable clientDevices = $ClientDevicesTable(this);
  late final $HandshakeCapturesTable handshakeCaptures =
      $HandshakeCapturesTable(this);
  late final $PmkidCapturesTable pmkidCaptures = $PmkidCapturesTable(this);
  late final $WpsPinsTable wpsPins = $WpsPinsTable(this);
  late final $VulnerabilityFindingsTable vulnerabilityFindings =
      $VulnerabilityFindingsTable(this);
  late final $FindingsTable findings = $FindingsTable(this);
  late final $EvidenceTable evidence = $EvidenceTable(this);
  late final $ReportsTable reports = $ReportsTable(this);
  late final $ScanSessionsTable scanSessions = $ScanSessionsTable(this);
  late final $AssessmentEventsTable assessmentEvents =
      $AssessmentEventsTable(this);
  late final $PluginConfigsTable pluginConfigs = $PluginConfigsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        projects,
        assessments,
        accessPoints,
        clientDevices,
        handshakeCaptures,
        pmkidCaptures,
        wpsPins,
        vulnerabilityFindings,
        findings,
        evidence,
        reports,
        scanSessions,
        assessmentEvents,
        pluginConfigs,
        appSettings
      ];
}

typedef $$ProjectsTableCreateCompanionBuilder = ProjectsCompanion Function({
  required String id,
  required String name,
  required String description,
  required ProjectType type,
  required ProjectStatus status,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  required ClientInfo clientJson,
  required ScopeDefinition scopeJson,
  required Authorization authorizationJson,
  required ProjectSettings settingsJson,
  required List<String> assessmentIds,
  required List<String> teamMembers,
  required Map<String, dynamic> metadata,
  Value<int> rowid,
});
typedef $$ProjectsTableUpdateCompanionBuilder = ProjectsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> description,
  Value<ProjectType> type,
  Value<ProjectStatus> status,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<ClientInfo> clientJson,
  Value<ScopeDefinition> scopeJson,
  Value<Authorization> authorizationJson,
  Value<ProjectSettings> settingsJson,
  Value<List<String>> assessmentIds,
  Value<List<String>> teamMembers,
  Value<Map<String, dynamic>> metadata,
  Value<int> rowid,
});

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProjectType, ProjectType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ProjectStatus, ProjectStatus, int>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ClientInfo, ClientInfo, String>
      get clientJson => $composableBuilder(
          column: $table.clientJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ScopeDefinition, ScopeDefinition, String>
      get scopeJson => $composableBuilder(
          column: $table.scopeJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Authorization, Authorization, String>
      get authorizationJson => $composableBuilder(
          column: $table.authorizationJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ProjectSettings, ProjectSettings, String>
      get settingsJson => $composableBuilder(
          column: $table.settingsJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get assessmentIds => $composableBuilder(
          column: $table.assessmentIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get teamMembers => $composableBuilder(
          column: $table.teamMembers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientJson => $composableBuilder(
      column: $table.clientJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scopeJson => $composableBuilder(
      column: $table.scopeJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authorizationJson => $composableBuilder(
      column: $table.authorizationJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get settingsJson => $composableBuilder(
      column: $table.settingsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentIds => $composableBuilder(
      column: $table.assessmentIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get teamMembers => $composableBuilder(
      column: $table.teamMembers, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProjectType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProjectStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ClientInfo, String> get clientJson =>
      $composableBuilder(
          column: $table.clientJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ScopeDefinition, String> get scopeJson =>
      $composableBuilder(column: $table.scopeJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Authorization, String>
      get authorizationJson => $composableBuilder(
          column: $table.authorizationJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProjectSettings, String> get settingsJson =>
      $composableBuilder(
          column: $table.settingsJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get assessmentIds =>
      $composableBuilder(
          column: $table.assessmentIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get teamMembers =>
      $composableBuilder(
          column: $table.teamMembers, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$ProjectsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $ProjectsTable,
    DbProject,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableAnnotationComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (DbProject, BaseReferences<_$AppDatabaseSchema, $ProjectsTable, DbProject>),
    DbProject,
    PrefetchHooks Function()> {
  $$ProjectsTableTableManager(_$AppDatabaseSchema db, $ProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<ProjectType> type = const Value.absent(),
            Value<ProjectStatus> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<ClientInfo> clientJson = const Value.absent(),
            Value<ScopeDefinition> scopeJson = const Value.absent(),
            Value<Authorization> authorizationJson = const Value.absent(),
            Value<ProjectSettings> settingsJson = const Value.absent(),
            Value<List<String>> assessmentIds = const Value.absent(),
            Value<List<String>> teamMembers = const Value.absent(),
            Value<Map<String, dynamic>> metadata = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProjectsCompanion(
            id: id,
            name: name,
            description: description,
            type: type,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            startedAt: startedAt,
            completedAt: completedAt,
            clientJson: clientJson,
            scopeJson: scopeJson,
            authorizationJson: authorizationJson,
            settingsJson: settingsJson,
            assessmentIds: assessmentIds,
            teamMembers: teamMembers,
            metadata: metadata,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String description,
            required ProjectType type,
            required ProjectStatus status,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            required ClientInfo clientJson,
            required ScopeDefinition scopeJson,
            required Authorization authorizationJson,
            required ProjectSettings settingsJson,
            required List<String> assessmentIds,
            required List<String> teamMembers,
            required Map<String, dynamic> metadata,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProjectsCompanion.insert(
            id: id,
            name: name,
            description: description,
            type: type,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            startedAt: startedAt,
            completedAt: completedAt,
            clientJson: clientJson,
            scopeJson: scopeJson,
            authorizationJson: authorizationJson,
            settingsJson: settingsJson,
            assessmentIds: assessmentIds,
            teamMembers: teamMembers,
            metadata: metadata,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $ProjectsTable,
    DbProject,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableAnnotationComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (DbProject, BaseReferences<_$AppDatabaseSchema, $ProjectsTable, DbProject>),
    DbProject,
    PrefetchHooks Function()>;
typedef $$AssessmentsTableCreateCompanionBuilder = AssessmentsCompanion
    Function({
  required String id,
  required String projectId,
  required String name,
  required AssessmentType type,
  required AssessmentStatus status,
  required AssessmentScope scopeJson,
  required AssessmentConfig configJson,
  required DateTime createdAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<DateTime?> pausedAt,
  required int totalDurationMs,
  required AssessmentProgress progressJson,
  required List<AssessmentPhase> phasesJson,
  required List<String> findingIds,
  required List<String> evidenceIds,
  required Map<String, dynamic> metadata,
  Value<String?> assignedTo,
  Value<String?> parentAssessmentId,
  Value<int> rowid,
});
typedef $$AssessmentsTableUpdateCompanionBuilder = AssessmentsCompanion
    Function({
  Value<String> id,
  Value<String> projectId,
  Value<String> name,
  Value<AssessmentType> type,
  Value<AssessmentStatus> status,
  Value<AssessmentScope> scopeJson,
  Value<AssessmentConfig> configJson,
  Value<DateTime> createdAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<DateTime?> pausedAt,
  Value<int> totalDurationMs,
  Value<AssessmentProgress> progressJson,
  Value<List<AssessmentPhase>> phasesJson,
  Value<List<String>> findingIds,
  Value<List<String>> evidenceIds,
  Value<Map<String, dynamic>> metadata,
  Value<String?> assignedTo,
  Value<String?> parentAssessmentId,
  Value<int> rowid,
});

class $$AssessmentsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $AssessmentsTable> {
  $$AssessmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AssessmentType, AssessmentType, int>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<AssessmentStatus, AssessmentStatus, int>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<AssessmentScope, AssessmentScope, String>
      get scopeJson => $composableBuilder(
          column: $table.scopeJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<AssessmentConfig, AssessmentConfig, String>
      get configJson => $composableBuilder(
          column: $table.configJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get pausedAt => $composableBuilder(
      column: $table.pausedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalDurationMs => $composableBuilder(
      column: $table.totalDurationMs,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AssessmentProgress, AssessmentProgress, String>
      get progressJson => $composableBuilder(
          column: $table.progressJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<AssessmentPhase>, List<AssessmentPhase>,
          String>
      get phasesJson => $composableBuilder(
          column: $table.phasesJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get findingIds => $composableBuilder(
          column: $table.findingIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get evidenceIds => $composableBuilder(
          column: $table.evidenceIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get assignedTo => $composableBuilder(
      column: $table.assignedTo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentAssessmentId => $composableBuilder(
      column: $table.parentAssessmentId,
      builder: (column) => ColumnFilters(column));
}

class $$AssessmentsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $AssessmentsTable> {
  $$AssessmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scopeJson => $composableBuilder(
      column: $table.scopeJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get configJson => $composableBuilder(
      column: $table.configJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get pausedAt => $composableBuilder(
      column: $table.pausedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalDurationMs => $composableBuilder(
      column: $table.totalDurationMs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get progressJson => $composableBuilder(
      column: $table.progressJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phasesJson => $composableBuilder(
      column: $table.phasesJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get findingIds => $composableBuilder(
      column: $table.findingIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assignedTo => $composableBuilder(
      column: $table.assignedTo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentAssessmentId => $composableBuilder(
      column: $table.parentAssessmentId,
      builder: (column) => ColumnOrderings(column));
}

class $$AssessmentsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $AssessmentsTable> {
  $$AssessmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentScope, String> get scopeJson =>
      $composableBuilder(column: $table.scopeJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentConfig, String> get configJson =>
      $composableBuilder(
          column: $table.configJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get pausedAt =>
      $composableBuilder(column: $table.pausedAt, builder: (column) => column);

  GeneratedColumn<int> get totalDurationMs => $composableBuilder(
      column: $table.totalDurationMs, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentProgress, String>
      get progressJson => $composableBuilder(
          column: $table.progressJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<AssessmentPhase>, String>
      get phasesJson => $composableBuilder(
          column: $table.phasesJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get findingIds =>
      $composableBuilder(
          column: $table.findingIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get evidenceIds =>
      $composableBuilder(
          column: $table.evidenceIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<String> get assignedTo => $composableBuilder(
      column: $table.assignedTo, builder: (column) => column);

  GeneratedColumn<String> get parentAssessmentId => $composableBuilder(
      column: $table.parentAssessmentId, builder: (column) => column);
}

class $$AssessmentsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $AssessmentsTable,
    DbAssessment,
    $$AssessmentsTableFilterComposer,
    $$AssessmentsTableOrderingComposer,
    $$AssessmentsTableAnnotationComposer,
    $$AssessmentsTableCreateCompanionBuilder,
    $$AssessmentsTableUpdateCompanionBuilder,
    (
      DbAssessment,
      BaseReferences<_$AppDatabaseSchema, $AssessmentsTable, DbAssessment>
    ),
    DbAssessment,
    PrefetchHooks Function()> {
  $$AssessmentsTableTableManager(
      _$AppDatabaseSchema db, $AssessmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<AssessmentType> type = const Value.absent(),
            Value<AssessmentStatus> status = const Value.absent(),
            Value<AssessmentScope> scopeJson = const Value.absent(),
            Value<AssessmentConfig> configJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime?> pausedAt = const Value.absent(),
            Value<int> totalDurationMs = const Value.absent(),
            Value<AssessmentProgress> progressJson = const Value.absent(),
            Value<List<AssessmentPhase>> phasesJson = const Value.absent(),
            Value<List<String>> findingIds = const Value.absent(),
            Value<List<String>> evidenceIds = const Value.absent(),
            Value<Map<String, dynamic>> metadata = const Value.absent(),
            Value<String?> assignedTo = const Value.absent(),
            Value<String?> parentAssessmentId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssessmentsCompanion(
            id: id,
            projectId: projectId,
            name: name,
            type: type,
            status: status,
            scopeJson: scopeJson,
            configJson: configJson,
            createdAt: createdAt,
            startedAt: startedAt,
            completedAt: completedAt,
            pausedAt: pausedAt,
            totalDurationMs: totalDurationMs,
            progressJson: progressJson,
            phasesJson: phasesJson,
            findingIds: findingIds,
            evidenceIds: evidenceIds,
            metadata: metadata,
            assignedTo: assignedTo,
            parentAssessmentId: parentAssessmentId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String projectId,
            required String name,
            required AssessmentType type,
            required AssessmentStatus status,
            required AssessmentScope scopeJson,
            required AssessmentConfig configJson,
            required DateTime createdAt,
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime?> pausedAt = const Value.absent(),
            required int totalDurationMs,
            required AssessmentProgress progressJson,
            required List<AssessmentPhase> phasesJson,
            required List<String> findingIds,
            required List<String> evidenceIds,
            required Map<String, dynamic> metadata,
            Value<String?> assignedTo = const Value.absent(),
            Value<String?> parentAssessmentId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssessmentsCompanion.insert(
            id: id,
            projectId: projectId,
            name: name,
            type: type,
            status: status,
            scopeJson: scopeJson,
            configJson: configJson,
            createdAt: createdAt,
            startedAt: startedAt,
            completedAt: completedAt,
            pausedAt: pausedAt,
            totalDurationMs: totalDurationMs,
            progressJson: progressJson,
            phasesJson: phasesJson,
            findingIds: findingIds,
            evidenceIds: evidenceIds,
            metadata: metadata,
            assignedTo: assignedTo,
            parentAssessmentId: parentAssessmentId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssessmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $AssessmentsTable,
    DbAssessment,
    $$AssessmentsTableFilterComposer,
    $$AssessmentsTableOrderingComposer,
    $$AssessmentsTableAnnotationComposer,
    $$AssessmentsTableCreateCompanionBuilder,
    $$AssessmentsTableUpdateCompanionBuilder,
    (
      DbAssessment,
      BaseReferences<_$AppDatabaseSchema, $AssessmentsTable, DbAssessment>
    ),
    DbAssessment,
    PrefetchHooks Function()>;
typedef $$AccessPointsTableCreateCompanionBuilder = AccessPointsCompanion
    Function({
  required String id,
  required String assessmentId,
  required String bssid,
  required String ssid,
  required int frequency,
  required int channel,
  required int signalLevel,
  required int noiseLevel,
  required SecurityProtocol security,
  required List<SecurityProtocol> supportedProtocols,
  required bool wpsEnabled,
  Value<String?> wpsManufacturer,
  Value<String?> wpsModel,
  required int beaconInterval,
  required int capabilityMask,
  required DateTime firstSeen,
  required DateTime lastSeen,
  required int packetCount,
  required Map<String, dynamic> vendorIEs,
  required List<String> clientIds,
  Value<int> rowid,
});
typedef $$AccessPointsTableUpdateCompanionBuilder = AccessPointsCompanion
    Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<String> bssid,
  Value<String> ssid,
  Value<int> frequency,
  Value<int> channel,
  Value<int> signalLevel,
  Value<int> noiseLevel,
  Value<SecurityProtocol> security,
  Value<List<SecurityProtocol>> supportedProtocols,
  Value<bool> wpsEnabled,
  Value<String?> wpsManufacturer,
  Value<String?> wpsModel,
  Value<int> beaconInterval,
  Value<int> capabilityMask,
  Value<DateTime> firstSeen,
  Value<DateTime> lastSeen,
  Value<int> packetCount,
  Value<Map<String, dynamic>> vendorIEs,
  Value<List<String>> clientIds,
  Value<int> rowid,
});

class $$AccessPointsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $AccessPointsTable> {
  $$AccessPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ssid => $composableBuilder(
      column: $table.ssid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get channel => $composableBuilder(
      column: $table.channel, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get signalLevel => $composableBuilder(
      column: $table.signalLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get noiseLevel => $composableBuilder(
      column: $table.noiseLevel, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<SecurityProtocol, SecurityProtocol, int>
      get security => $composableBuilder(
          column: $table.security,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<SecurityProtocol>, List<SecurityProtocol>,
          String>
      get supportedProtocols => $composableBuilder(
          column: $table.supportedProtocols,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get wpsEnabled => $composableBuilder(
      column: $table.wpsEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wpsManufacturer => $composableBuilder(
      column: $table.wpsManufacturer,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wpsModel => $composableBuilder(
      column: $table.wpsModel, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get beaconInterval => $composableBuilder(
      column: $table.beaconInterval,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get capabilityMask => $composableBuilder(
      column: $table.capabilityMask,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get firstSeen => $composableBuilder(
      column: $table.firstSeen, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSeen => $composableBuilder(
      column: $table.lastSeen, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get packetCount => $composableBuilder(
      column: $table.packetCount, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get vendorIEs => $composableBuilder(
          column: $table.vendorIEs,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get clientIds => $composableBuilder(
          column: $table.clientIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$AccessPointsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $AccessPointsTable> {
  $$AccessPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ssid => $composableBuilder(
      column: $table.ssid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get channel => $composableBuilder(
      column: $table.channel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get signalLevel => $composableBuilder(
      column: $table.signalLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get noiseLevel => $composableBuilder(
      column: $table.noiseLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get security => $composableBuilder(
      column: $table.security, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supportedProtocols => $composableBuilder(
      column: $table.supportedProtocols,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get wpsEnabled => $composableBuilder(
      column: $table.wpsEnabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wpsManufacturer => $composableBuilder(
      column: $table.wpsManufacturer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wpsModel => $composableBuilder(
      column: $table.wpsModel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get beaconInterval => $composableBuilder(
      column: $table.beaconInterval,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get capabilityMask => $composableBuilder(
      column: $table.capabilityMask,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get firstSeen => $composableBuilder(
      column: $table.firstSeen, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSeen => $composableBuilder(
      column: $table.lastSeen, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get packetCount => $composableBuilder(
      column: $table.packetCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vendorIEs => $composableBuilder(
      column: $table.vendorIEs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientIds => $composableBuilder(
      column: $table.clientIds, builder: (column) => ColumnOrderings(column));
}

class $$AccessPointsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $AccessPointsTable> {
  $$AccessPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumn<String> get bssid =>
      $composableBuilder(column: $table.bssid, builder: (column) => column);

  GeneratedColumn<String> get ssid =>
      $composableBuilder(column: $table.ssid, builder: (column) => column);

  GeneratedColumn<int> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<int> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<int> get signalLevel => $composableBuilder(
      column: $table.signalLevel, builder: (column) => column);

  GeneratedColumn<int> get noiseLevel => $composableBuilder(
      column: $table.noiseLevel, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SecurityProtocol, int> get security =>
      $composableBuilder(column: $table.security, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<SecurityProtocol>, String>
      get supportedProtocols => $composableBuilder(
          column: $table.supportedProtocols, builder: (column) => column);

  GeneratedColumn<bool> get wpsEnabled => $composableBuilder(
      column: $table.wpsEnabled, builder: (column) => column);

  GeneratedColumn<String> get wpsManufacturer => $composableBuilder(
      column: $table.wpsManufacturer, builder: (column) => column);

  GeneratedColumn<String> get wpsModel =>
      $composableBuilder(column: $table.wpsModel, builder: (column) => column);

  GeneratedColumn<int> get beaconInterval => $composableBuilder(
      column: $table.beaconInterval, builder: (column) => column);

  GeneratedColumn<int> get capabilityMask => $composableBuilder(
      column: $table.capabilityMask, builder: (column) => column);

  GeneratedColumn<DateTime> get firstSeen =>
      $composableBuilder(column: $table.firstSeen, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSeen =>
      $composableBuilder(column: $table.lastSeen, builder: (column) => column);

  GeneratedColumn<int> get packetCount => $composableBuilder(
      column: $table.packetCount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get vendorIEs => $composableBuilder(
          column: $table.vendorIEs, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get clientIds =>
      $composableBuilder(column: $table.clientIds, builder: (column) => column);
}

class $$AccessPointsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $AccessPointsTable,
    DbAccessPoint,
    $$AccessPointsTableFilterComposer,
    $$AccessPointsTableOrderingComposer,
    $$AccessPointsTableAnnotationComposer,
    $$AccessPointsTableCreateCompanionBuilder,
    $$AccessPointsTableUpdateCompanionBuilder,
    (
      DbAccessPoint,
      BaseReferences<_$AppDatabaseSchema, $AccessPointsTable, DbAccessPoint>
    ),
    DbAccessPoint,
    PrefetchHooks Function()> {
  $$AccessPointsTableTableManager(
      _$AppDatabaseSchema db, $AccessPointsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccessPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccessPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccessPointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<String> bssid = const Value.absent(),
            Value<String> ssid = const Value.absent(),
            Value<int> frequency = const Value.absent(),
            Value<int> channel = const Value.absent(),
            Value<int> signalLevel = const Value.absent(),
            Value<int> noiseLevel = const Value.absent(),
            Value<SecurityProtocol> security = const Value.absent(),
            Value<List<SecurityProtocol>> supportedProtocols =
                const Value.absent(),
            Value<bool> wpsEnabled = const Value.absent(),
            Value<String?> wpsManufacturer = const Value.absent(),
            Value<String?> wpsModel = const Value.absent(),
            Value<int> beaconInterval = const Value.absent(),
            Value<int> capabilityMask = const Value.absent(),
            Value<DateTime> firstSeen = const Value.absent(),
            Value<DateTime> lastSeen = const Value.absent(),
            Value<int> packetCount = const Value.absent(),
            Value<Map<String, dynamic>> vendorIEs = const Value.absent(),
            Value<List<String>> clientIds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccessPointsCompanion(
            id: id,
            assessmentId: assessmentId,
            bssid: bssid,
            ssid: ssid,
            frequency: frequency,
            channel: channel,
            signalLevel: signalLevel,
            noiseLevel: noiseLevel,
            security: security,
            supportedProtocols: supportedProtocols,
            wpsEnabled: wpsEnabled,
            wpsManufacturer: wpsManufacturer,
            wpsModel: wpsModel,
            beaconInterval: beaconInterval,
            capabilityMask: capabilityMask,
            firstSeen: firstSeen,
            lastSeen: lastSeen,
            packetCount: packetCount,
            vendorIEs: vendorIEs,
            clientIds: clientIds,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            required String bssid,
            required String ssid,
            required int frequency,
            required int channel,
            required int signalLevel,
            required int noiseLevel,
            required SecurityProtocol security,
            required List<SecurityProtocol> supportedProtocols,
            required bool wpsEnabled,
            Value<String?> wpsManufacturer = const Value.absent(),
            Value<String?> wpsModel = const Value.absent(),
            required int beaconInterval,
            required int capabilityMask,
            required DateTime firstSeen,
            required DateTime lastSeen,
            required int packetCount,
            required Map<String, dynamic> vendorIEs,
            required List<String> clientIds,
            Value<int> rowid = const Value.absent(),
          }) =>
              AccessPointsCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            bssid: bssid,
            ssid: ssid,
            frequency: frequency,
            channel: channel,
            signalLevel: signalLevel,
            noiseLevel: noiseLevel,
            security: security,
            supportedProtocols: supportedProtocols,
            wpsEnabled: wpsEnabled,
            wpsManufacturer: wpsManufacturer,
            wpsModel: wpsModel,
            beaconInterval: beaconInterval,
            capabilityMask: capabilityMask,
            firstSeen: firstSeen,
            lastSeen: lastSeen,
            packetCount: packetCount,
            vendorIEs: vendorIEs,
            clientIds: clientIds,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AccessPointsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $AccessPointsTable,
    DbAccessPoint,
    $$AccessPointsTableFilterComposer,
    $$AccessPointsTableOrderingComposer,
    $$AccessPointsTableAnnotationComposer,
    $$AccessPointsTableCreateCompanionBuilder,
    $$AccessPointsTableUpdateCompanionBuilder,
    (
      DbAccessPoint,
      BaseReferences<_$AppDatabaseSchema, $AccessPointsTable, DbAccessPoint>
    ),
    DbAccessPoint,
    PrefetchHooks Function()>;
typedef $$ClientDevicesTableCreateCompanionBuilder = ClientDevicesCompanion
    Function({
  required String id,
  required String accessPointId,
  required String macAddress,
  Value<String?> hostname,
  Value<String?> vendor,
  required int signalLevel,
  required int dataFrames,
  required DateTime firstSeen,
  required DateTime lastSeen,
  required String associatedBssid,
  required List<ProbeRequest> probeRequestsJson,
  Value<int> rowid,
});
typedef $$ClientDevicesTableUpdateCompanionBuilder = ClientDevicesCompanion
    Function({
  Value<String> id,
  Value<String> accessPointId,
  Value<String> macAddress,
  Value<String?> hostname,
  Value<String?> vendor,
  Value<int> signalLevel,
  Value<int> dataFrames,
  Value<DateTime> firstSeen,
  Value<DateTime> lastSeen,
  Value<String> associatedBssid,
  Value<List<ProbeRequest>> probeRequestsJson,
  Value<int> rowid,
});

class $$ClientDevicesTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $ClientDevicesTable> {
  $$ClientDevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get macAddress => $composableBuilder(
      column: $table.macAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hostname => $composableBuilder(
      column: $table.hostname, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vendor => $composableBuilder(
      column: $table.vendor, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get signalLevel => $composableBuilder(
      column: $table.signalLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dataFrames => $composableBuilder(
      column: $table.dataFrames, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get firstSeen => $composableBuilder(
      column: $table.firstSeen, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSeen => $composableBuilder(
      column: $table.lastSeen, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get associatedBssid => $composableBuilder(
      column: $table.associatedBssid,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<ProbeRequest>, List<ProbeRequest>, String>
      get probeRequestsJson => $composableBuilder(
          column: $table.probeRequestsJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ClientDevicesTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $ClientDevicesTable> {
  $$ClientDevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get macAddress => $composableBuilder(
      column: $table.macAddress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hostname => $composableBuilder(
      column: $table.hostname, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vendor => $composableBuilder(
      column: $table.vendor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get signalLevel => $composableBuilder(
      column: $table.signalLevel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dataFrames => $composableBuilder(
      column: $table.dataFrames, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get firstSeen => $composableBuilder(
      column: $table.firstSeen, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSeen => $composableBuilder(
      column: $table.lastSeen, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get associatedBssid => $composableBuilder(
      column: $table.associatedBssid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get probeRequestsJson => $composableBuilder(
      column: $table.probeRequestsJson,
      builder: (column) => ColumnOrderings(column));
}

class $$ClientDevicesTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $ClientDevicesTable> {
  $$ClientDevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => column);

  GeneratedColumn<String> get macAddress => $composableBuilder(
      column: $table.macAddress, builder: (column) => column);

  GeneratedColumn<String> get hostname =>
      $composableBuilder(column: $table.hostname, builder: (column) => column);

  GeneratedColumn<String> get vendor =>
      $composableBuilder(column: $table.vendor, builder: (column) => column);

  GeneratedColumn<int> get signalLevel => $composableBuilder(
      column: $table.signalLevel, builder: (column) => column);

  GeneratedColumn<int> get dataFrames => $composableBuilder(
      column: $table.dataFrames, builder: (column) => column);

  GeneratedColumn<DateTime> get firstSeen =>
      $composableBuilder(column: $table.firstSeen, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSeen =>
      $composableBuilder(column: $table.lastSeen, builder: (column) => column);

  GeneratedColumn<String> get associatedBssid => $composableBuilder(
      column: $table.associatedBssid, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ProbeRequest>, String>
      get probeRequestsJson => $composableBuilder(
          column: $table.probeRequestsJson, builder: (column) => column);
}

class $$ClientDevicesTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $ClientDevicesTable,
    DbClientDevice,
    $$ClientDevicesTableFilterComposer,
    $$ClientDevicesTableOrderingComposer,
    $$ClientDevicesTableAnnotationComposer,
    $$ClientDevicesTableCreateCompanionBuilder,
    $$ClientDevicesTableUpdateCompanionBuilder,
    (
      DbClientDevice,
      BaseReferences<_$AppDatabaseSchema, $ClientDevicesTable, DbClientDevice>
    ),
    DbClientDevice,
    PrefetchHooks Function()> {
  $$ClientDevicesTableTableManager(
      _$AppDatabaseSchema db, $ClientDevicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientDevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientDevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientDevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> accessPointId = const Value.absent(),
            Value<String> macAddress = const Value.absent(),
            Value<String?> hostname = const Value.absent(),
            Value<String?> vendor = const Value.absent(),
            Value<int> signalLevel = const Value.absent(),
            Value<int> dataFrames = const Value.absent(),
            Value<DateTime> firstSeen = const Value.absent(),
            Value<DateTime> lastSeen = const Value.absent(),
            Value<String> associatedBssid = const Value.absent(),
            Value<List<ProbeRequest>> probeRequestsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClientDevicesCompanion(
            id: id,
            accessPointId: accessPointId,
            macAddress: macAddress,
            hostname: hostname,
            vendor: vendor,
            signalLevel: signalLevel,
            dataFrames: dataFrames,
            firstSeen: firstSeen,
            lastSeen: lastSeen,
            associatedBssid: associatedBssid,
            probeRequestsJson: probeRequestsJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String accessPointId,
            required String macAddress,
            Value<String?> hostname = const Value.absent(),
            Value<String?> vendor = const Value.absent(),
            required int signalLevel,
            required int dataFrames,
            required DateTime firstSeen,
            required DateTime lastSeen,
            required String associatedBssid,
            required List<ProbeRequest> probeRequestsJson,
            Value<int> rowid = const Value.absent(),
          }) =>
              ClientDevicesCompanion.insert(
            id: id,
            accessPointId: accessPointId,
            macAddress: macAddress,
            hostname: hostname,
            vendor: vendor,
            signalLevel: signalLevel,
            dataFrames: dataFrames,
            firstSeen: firstSeen,
            lastSeen: lastSeen,
            associatedBssid: associatedBssid,
            probeRequestsJson: probeRequestsJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClientDevicesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $ClientDevicesTable,
    DbClientDevice,
    $$ClientDevicesTableFilterComposer,
    $$ClientDevicesTableOrderingComposer,
    $$ClientDevicesTableAnnotationComposer,
    $$ClientDevicesTableCreateCompanionBuilder,
    $$ClientDevicesTableUpdateCompanionBuilder,
    (
      DbClientDevice,
      BaseReferences<_$AppDatabaseSchema, $ClientDevicesTable, DbClientDevice>
    ),
    DbClientDevice,
    PrefetchHooks Function()>;
typedef $$HandshakeCapturesTableCreateCompanionBuilder
    = HandshakeCapturesCompanion Function({
  required String id,
  required String assessmentId,
  required String accessPointId,
  required String bssid,
  required String ssid,
  required HandshakeType type,
  required Uint8List eapolFrames,
  required DateTime capturedAt,
  required int frameCount,
  required bool isComplete,
  required Map<String, dynamic> metadata,
  Value<int> rowid,
});
typedef $$HandshakeCapturesTableUpdateCompanionBuilder
    = HandshakeCapturesCompanion Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<String> accessPointId,
  Value<String> bssid,
  Value<String> ssid,
  Value<HandshakeType> type,
  Value<Uint8List> eapolFrames,
  Value<DateTime> capturedAt,
  Value<int> frameCount,
  Value<bool> isComplete,
  Value<Map<String, dynamic>> metadata,
  Value<int> rowid,
});

class $$HandshakeCapturesTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $HandshakeCapturesTable> {
  $$HandshakeCapturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ssid => $composableBuilder(
      column: $table.ssid, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<HandshakeType, HandshakeType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<Uint8List> get eapolFrames => $composableBuilder(
      column: $table.eapolFrames, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get frameCount => $composableBuilder(
      column: $table.frameCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$HandshakeCapturesTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $HandshakeCapturesTable> {
  $$HandshakeCapturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ssid => $composableBuilder(
      column: $table.ssid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get eapolFrames => $composableBuilder(
      column: $table.eapolFrames, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get frameCount => $composableBuilder(
      column: $table.frameCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));
}

class $$HandshakeCapturesTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $HandshakeCapturesTable> {
  $$HandshakeCapturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumn<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => column);

  GeneratedColumn<String> get bssid =>
      $composableBuilder(column: $table.bssid, builder: (column) => column);

  GeneratedColumn<String> get ssid =>
      $composableBuilder(column: $table.ssid, builder: (column) => column);

  GeneratedColumnWithTypeConverter<HandshakeType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<Uint8List> get eapolFrames => $composableBuilder(
      column: $table.eapolFrames, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => column);

  GeneratedColumn<int> get frameCount => $composableBuilder(
      column: $table.frameCount, builder: (column) => column);

  GeneratedColumn<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$HandshakeCapturesTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $HandshakeCapturesTable,
    DbHandshakeCapture,
    $$HandshakeCapturesTableFilterComposer,
    $$HandshakeCapturesTableOrderingComposer,
    $$HandshakeCapturesTableAnnotationComposer,
    $$HandshakeCapturesTableCreateCompanionBuilder,
    $$HandshakeCapturesTableUpdateCompanionBuilder,
    (
      DbHandshakeCapture,
      BaseReferences<_$AppDatabaseSchema, $HandshakeCapturesTable,
          DbHandshakeCapture>
    ),
    DbHandshakeCapture,
    PrefetchHooks Function()> {
  $$HandshakeCapturesTableTableManager(
      _$AppDatabaseSchema db, $HandshakeCapturesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HandshakeCapturesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HandshakeCapturesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HandshakeCapturesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<String> accessPointId = const Value.absent(),
            Value<String> bssid = const Value.absent(),
            Value<String> ssid = const Value.absent(),
            Value<HandshakeType> type = const Value.absent(),
            Value<Uint8List> eapolFrames = const Value.absent(),
            Value<DateTime> capturedAt = const Value.absent(),
            Value<int> frameCount = const Value.absent(),
            Value<bool> isComplete = const Value.absent(),
            Value<Map<String, dynamic>> metadata = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HandshakeCapturesCompanion(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            bssid: bssid,
            ssid: ssid,
            type: type,
            eapolFrames: eapolFrames,
            capturedAt: capturedAt,
            frameCount: frameCount,
            isComplete: isComplete,
            metadata: metadata,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            required String accessPointId,
            required String bssid,
            required String ssid,
            required HandshakeType type,
            required Uint8List eapolFrames,
            required DateTime capturedAt,
            required int frameCount,
            required bool isComplete,
            required Map<String, dynamic> metadata,
            Value<int> rowid = const Value.absent(),
          }) =>
              HandshakeCapturesCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            bssid: bssid,
            ssid: ssid,
            type: type,
            eapolFrames: eapolFrames,
            capturedAt: capturedAt,
            frameCount: frameCount,
            isComplete: isComplete,
            metadata: metadata,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HandshakeCapturesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $HandshakeCapturesTable,
    DbHandshakeCapture,
    $$HandshakeCapturesTableFilterComposer,
    $$HandshakeCapturesTableOrderingComposer,
    $$HandshakeCapturesTableAnnotationComposer,
    $$HandshakeCapturesTableCreateCompanionBuilder,
    $$HandshakeCapturesTableUpdateCompanionBuilder,
    (
      DbHandshakeCapture,
      BaseReferences<_$AppDatabaseSchema, $HandshakeCapturesTable,
          DbHandshakeCapture>
    ),
    DbHandshakeCapture,
    PrefetchHooks Function()>;
typedef $$PmkidCapturesTableCreateCompanionBuilder = PmkidCapturesCompanion
    Function({
  required String id,
  required String assessmentId,
  required String accessPointId,
  required String bssid,
  required String ssid,
  required Uint8List pmkidData,
  required DateTime capturedAt,
  required Map<String, dynamic> metadata,
  Value<int> rowid,
});
typedef $$PmkidCapturesTableUpdateCompanionBuilder = PmkidCapturesCompanion
    Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<String> accessPointId,
  Value<String> bssid,
  Value<String> ssid,
  Value<Uint8List> pmkidData,
  Value<DateTime> capturedAt,
  Value<Map<String, dynamic>> metadata,
  Value<int> rowid,
});

class $$PmkidCapturesTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $PmkidCapturesTable> {
  $$PmkidCapturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ssid => $composableBuilder(
      column: $table.ssid, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get pmkidData => $composableBuilder(
      column: $table.pmkidData, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$PmkidCapturesTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $PmkidCapturesTable> {
  $$PmkidCapturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ssid => $composableBuilder(
      column: $table.ssid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get pmkidData => $composableBuilder(
      column: $table.pmkidData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));
}

class $$PmkidCapturesTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $PmkidCapturesTable> {
  $$PmkidCapturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumn<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => column);

  GeneratedColumn<String> get bssid =>
      $composableBuilder(column: $table.bssid, builder: (column) => column);

  GeneratedColumn<String> get ssid =>
      $composableBuilder(column: $table.ssid, builder: (column) => column);

  GeneratedColumn<Uint8List> get pmkidData =>
      $composableBuilder(column: $table.pmkidData, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$PmkidCapturesTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $PmkidCapturesTable,
    DbPmkidCapture,
    $$PmkidCapturesTableFilterComposer,
    $$PmkidCapturesTableOrderingComposer,
    $$PmkidCapturesTableAnnotationComposer,
    $$PmkidCapturesTableCreateCompanionBuilder,
    $$PmkidCapturesTableUpdateCompanionBuilder,
    (
      DbPmkidCapture,
      BaseReferences<_$AppDatabaseSchema, $PmkidCapturesTable, DbPmkidCapture>
    ),
    DbPmkidCapture,
    PrefetchHooks Function()> {
  $$PmkidCapturesTableTableManager(
      _$AppDatabaseSchema db, $PmkidCapturesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PmkidCapturesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PmkidCapturesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PmkidCapturesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<String> accessPointId = const Value.absent(),
            Value<String> bssid = const Value.absent(),
            Value<String> ssid = const Value.absent(),
            Value<Uint8List> pmkidData = const Value.absent(),
            Value<DateTime> capturedAt = const Value.absent(),
            Value<Map<String, dynamic>> metadata = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PmkidCapturesCompanion(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            bssid: bssid,
            ssid: ssid,
            pmkidData: pmkidData,
            capturedAt: capturedAt,
            metadata: metadata,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            required String accessPointId,
            required String bssid,
            required String ssid,
            required Uint8List pmkidData,
            required DateTime capturedAt,
            required Map<String, dynamic> metadata,
            Value<int> rowid = const Value.absent(),
          }) =>
              PmkidCapturesCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            bssid: bssid,
            ssid: ssid,
            pmkidData: pmkidData,
            capturedAt: capturedAt,
            metadata: metadata,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PmkidCapturesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $PmkidCapturesTable,
    DbPmkidCapture,
    $$PmkidCapturesTableFilterComposer,
    $$PmkidCapturesTableOrderingComposer,
    $$PmkidCapturesTableAnnotationComposer,
    $$PmkidCapturesTableCreateCompanionBuilder,
    $$PmkidCapturesTableUpdateCompanionBuilder,
    (
      DbPmkidCapture,
      BaseReferences<_$AppDatabaseSchema, $PmkidCapturesTable, DbPmkidCapture>
    ),
    DbPmkidCapture,
    PrefetchHooks Function()>;
typedef $$WpsPinsTableCreateCompanionBuilder = WpsPinsCompanion Function({
  required String id,
  required String assessmentId,
  required String accessPointId,
  required String bssid,
  required String pin,
  required WpsMethod method,
  required DateTime recoveredAt,
  required Map<String, dynamic> metadata,
  Value<int> rowid,
});
typedef $$WpsPinsTableUpdateCompanionBuilder = WpsPinsCompanion Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<String> accessPointId,
  Value<String> bssid,
  Value<String> pin,
  Value<WpsMethod> method,
  Value<DateTime> recoveredAt,
  Value<Map<String, dynamic>> metadata,
  Value<int> rowid,
});

class $$WpsPinsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $WpsPinsTable> {
  $$WpsPinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<WpsMethod, WpsMethod, int> get method =>
      $composableBuilder(
          column: $table.method,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get recoveredAt => $composableBuilder(
      column: $table.recoveredAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$WpsPinsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $WpsPinsTable> {
  $$WpsPinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bssid => $composableBuilder(
      column: $table.bssid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get method => $composableBuilder(
      column: $table.method, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get recoveredAt => $composableBuilder(
      column: $table.recoveredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));
}

class $$WpsPinsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $WpsPinsTable> {
  $$WpsPinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumn<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => column);

  GeneratedColumn<String> get bssid =>
      $composableBuilder(column: $table.bssid, builder: (column) => column);

  GeneratedColumn<String> get pin =>
      $composableBuilder(column: $table.pin, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WpsMethod, int> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<DateTime> get recoveredAt => $composableBuilder(
      column: $table.recoveredAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$WpsPinsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $WpsPinsTable,
    DbWpsPin,
    $$WpsPinsTableFilterComposer,
    $$WpsPinsTableOrderingComposer,
    $$WpsPinsTableAnnotationComposer,
    $$WpsPinsTableCreateCompanionBuilder,
    $$WpsPinsTableUpdateCompanionBuilder,
    (DbWpsPin, BaseReferences<_$AppDatabaseSchema, $WpsPinsTable, DbWpsPin>),
    DbWpsPin,
    PrefetchHooks Function()> {
  $$WpsPinsTableTableManager(_$AppDatabaseSchema db, $WpsPinsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WpsPinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WpsPinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WpsPinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<String> accessPointId = const Value.absent(),
            Value<String> bssid = const Value.absent(),
            Value<String> pin = const Value.absent(),
            Value<WpsMethod> method = const Value.absent(),
            Value<DateTime> recoveredAt = const Value.absent(),
            Value<Map<String, dynamic>> metadata = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WpsPinsCompanion(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            bssid: bssid,
            pin: pin,
            method: method,
            recoveredAt: recoveredAt,
            metadata: metadata,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            required String accessPointId,
            required String bssid,
            required String pin,
            required WpsMethod method,
            required DateTime recoveredAt,
            required Map<String, dynamic> metadata,
            Value<int> rowid = const Value.absent(),
          }) =>
              WpsPinsCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            bssid: bssid,
            pin: pin,
            method: method,
            recoveredAt: recoveredAt,
            metadata: metadata,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WpsPinsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $WpsPinsTable,
    DbWpsPin,
    $$WpsPinsTableFilterComposer,
    $$WpsPinsTableOrderingComposer,
    $$WpsPinsTableAnnotationComposer,
    $$WpsPinsTableCreateCompanionBuilder,
    $$WpsPinsTableUpdateCompanionBuilder,
    (DbWpsPin, BaseReferences<_$AppDatabaseSchema, $WpsPinsTable, DbWpsPin>),
    DbWpsPin,
    PrefetchHooks Function()>;
typedef $$VulnerabilityFindingsTableCreateCompanionBuilder
    = VulnerabilityFindingsCompanion Function({
  required String id,
  required String assessmentId,
  Value<String?> accessPointId,
  required VulnerabilityType type,
  required Severity severity,
  required String title,
  required String description,
  required String recommendation,
  required Map<String, dynamic> evidence,
  required DateTime discoveredAt,
  Value<CvssVector?> cvssVectorJson,
  required bool verified,
  Value<int> rowid,
});
typedef $$VulnerabilityFindingsTableUpdateCompanionBuilder
    = VulnerabilityFindingsCompanion Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<String?> accessPointId,
  Value<VulnerabilityType> type,
  Value<Severity> severity,
  Value<String> title,
  Value<String> description,
  Value<String> recommendation,
  Value<Map<String, dynamic>> evidence,
  Value<DateTime> discoveredAt,
  Value<CvssVector?> cvssVectorJson,
  Value<bool> verified,
  Value<int> rowid,
});

class $$VulnerabilityFindingsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $VulnerabilityFindingsTable> {
  $$VulnerabilityFindingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<VulnerabilityType, VulnerabilityType, int>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Severity, Severity, int> get severity =>
      $composableBuilder(
          column: $table.severity,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recommendation => $composableBuilder(
      column: $table.recommendation,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get evidence => $composableBuilder(
          column: $table.evidence,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get discoveredAt => $composableBuilder(
      column: $table.discoveredAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CvssVector?, CvssVector, String>
      get cvssVectorJson => $composableBuilder(
          column: $table.cvssVectorJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get verified => $composableBuilder(
      column: $table.verified, builder: (column) => ColumnFilters(column));
}

class $$VulnerabilityFindingsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $VulnerabilityFindingsTable> {
  $$VulnerabilityFindingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recommendation => $composableBuilder(
      column: $table.recommendation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidence => $composableBuilder(
      column: $table.evidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get discoveredAt => $composableBuilder(
      column: $table.discoveredAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cvssVectorJson => $composableBuilder(
      column: $table.cvssVectorJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get verified => $composableBuilder(
      column: $table.verified, builder: (column) => ColumnOrderings(column));
}

class $$VulnerabilityFindingsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $VulnerabilityFindingsTable> {
  $$VulnerabilityFindingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumn<String> get accessPointId => $composableBuilder(
      column: $table.accessPointId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<VulnerabilityType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Severity, int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get recommendation => $composableBuilder(
      column: $table.recommendation, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get evidence =>
      $composableBuilder(column: $table.evidence, builder: (column) => column);

  GeneratedColumn<DateTime> get discoveredAt => $composableBuilder(
      column: $table.discoveredAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CvssVector?, String> get cvssVectorJson =>
      $composableBuilder(
          column: $table.cvssVectorJson, builder: (column) => column);

  GeneratedColumn<bool> get verified =>
      $composableBuilder(column: $table.verified, builder: (column) => column);
}

class $$VulnerabilityFindingsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $VulnerabilityFindingsTable,
    DbVulnerabilityFinding,
    $$VulnerabilityFindingsTableFilterComposer,
    $$VulnerabilityFindingsTableOrderingComposer,
    $$VulnerabilityFindingsTableAnnotationComposer,
    $$VulnerabilityFindingsTableCreateCompanionBuilder,
    $$VulnerabilityFindingsTableUpdateCompanionBuilder,
    (
      DbVulnerabilityFinding,
      BaseReferences<_$AppDatabaseSchema, $VulnerabilityFindingsTable,
          DbVulnerabilityFinding>
    ),
    DbVulnerabilityFinding,
    PrefetchHooks Function()> {
  $$VulnerabilityFindingsTableTableManager(
      _$AppDatabaseSchema db, $VulnerabilityFindingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VulnerabilityFindingsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$VulnerabilityFindingsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VulnerabilityFindingsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<String?> accessPointId = const Value.absent(),
            Value<VulnerabilityType> type = const Value.absent(),
            Value<Severity> severity = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> recommendation = const Value.absent(),
            Value<Map<String, dynamic>> evidence = const Value.absent(),
            Value<DateTime> discoveredAt = const Value.absent(),
            Value<CvssVector?> cvssVectorJson = const Value.absent(),
            Value<bool> verified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VulnerabilityFindingsCompanion(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            type: type,
            severity: severity,
            title: title,
            description: description,
            recommendation: recommendation,
            evidence: evidence,
            discoveredAt: discoveredAt,
            cvssVectorJson: cvssVectorJson,
            verified: verified,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            Value<String?> accessPointId = const Value.absent(),
            required VulnerabilityType type,
            required Severity severity,
            required String title,
            required String description,
            required String recommendation,
            required Map<String, dynamic> evidence,
            required DateTime discoveredAt,
            Value<CvssVector?> cvssVectorJson = const Value.absent(),
            required bool verified,
            Value<int> rowid = const Value.absent(),
          }) =>
              VulnerabilityFindingsCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            accessPointId: accessPointId,
            type: type,
            severity: severity,
            title: title,
            description: description,
            recommendation: recommendation,
            evidence: evidence,
            discoveredAt: discoveredAt,
            cvssVectorJson: cvssVectorJson,
            verified: verified,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VulnerabilityFindingsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabaseSchema,
        $VulnerabilityFindingsTable,
        DbVulnerabilityFinding,
        $$VulnerabilityFindingsTableFilterComposer,
        $$VulnerabilityFindingsTableOrderingComposer,
        $$VulnerabilityFindingsTableAnnotationComposer,
        $$VulnerabilityFindingsTableCreateCompanionBuilder,
        $$VulnerabilityFindingsTableUpdateCompanionBuilder,
        (
          DbVulnerabilityFinding,
          BaseReferences<_$AppDatabaseSchema, $VulnerabilityFindingsTable,
              DbVulnerabilityFinding>
        ),
        DbVulnerabilityFinding,
        PrefetchHooks Function()>;
typedef $$FindingsTableCreateCompanionBuilder = FindingsCompanion Function({
  required String id,
  required String assessmentId,
  required FindingType type,
  required Severity severity,
  required String title,
  required String description,
  required String recommendation,
  required String affectedTarget,
  required Map<String, dynamic> evidence,
  required List<String> evidenceIds,
  required CvssVector cvssVectorJson,
  required DateTime discoveredAt,
  Value<DateTime?> verifiedAt,
  required bool verified,
  required bool falsePositive,
  required String references,
  required Map<String, dynamic> metadata,
  Value<int> rowid,
});
typedef $$FindingsTableUpdateCompanionBuilder = FindingsCompanion Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<FindingType> type,
  Value<Severity> severity,
  Value<String> title,
  Value<String> description,
  Value<String> recommendation,
  Value<String> affectedTarget,
  Value<Map<String, dynamic>> evidence,
  Value<List<String>> evidenceIds,
  Value<CvssVector> cvssVectorJson,
  Value<DateTime> discoveredAt,
  Value<DateTime?> verifiedAt,
  Value<bool> verified,
  Value<bool> falsePositive,
  Value<String> references,
  Value<Map<String, dynamic>> metadata,
  Value<int> rowid,
});

class $$FindingsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $FindingsTable> {
  $$FindingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<FindingType, FindingType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Severity, Severity, int> get severity =>
      $composableBuilder(
          column: $table.severity,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recommendation => $composableBuilder(
      column: $table.recommendation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get affectedTarget => $composableBuilder(
      column: $table.affectedTarget,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get evidence => $composableBuilder(
          column: $table.evidence,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get evidenceIds => $composableBuilder(
          column: $table.evidenceIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<CvssVector, CvssVector, String>
      get cvssVectorJson => $composableBuilder(
          column: $table.cvssVectorJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get discoveredAt => $composableBuilder(
      column: $table.discoveredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get verifiedAt => $composableBuilder(
      column: $table.verifiedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get verified => $composableBuilder(
      column: $table.verified, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get falsePositive => $composableBuilder(
      column: $table.falsePositive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get references => $composableBuilder(
      column: $table.references, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$FindingsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $FindingsTable> {
  $$FindingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recommendation => $composableBuilder(
      column: $table.recommendation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get affectedTarget => $composableBuilder(
      column: $table.affectedTarget,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidence => $composableBuilder(
      column: $table.evidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get evidenceIds => $composableBuilder(
      column: $table.evidenceIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cvssVectorJson => $composableBuilder(
      column: $table.cvssVectorJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get discoveredAt => $composableBuilder(
      column: $table.discoveredAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get verifiedAt => $composableBuilder(
      column: $table.verifiedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get verified => $composableBuilder(
      column: $table.verified, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get falsePositive => $composableBuilder(
      column: $table.falsePositive,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get references => $composableBuilder(
      column: $table.references, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));
}

class $$FindingsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $FindingsTable> {
  $$FindingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FindingType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Severity, int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get recommendation => $composableBuilder(
      column: $table.recommendation, builder: (column) => column);

  GeneratedColumn<String> get affectedTarget => $composableBuilder(
      column: $table.affectedTarget, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get evidence =>
      $composableBuilder(column: $table.evidence, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get evidenceIds =>
      $composableBuilder(
          column: $table.evidenceIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CvssVector, String> get cvssVectorJson =>
      $composableBuilder(
          column: $table.cvssVectorJson, builder: (column) => column);

  GeneratedColumn<DateTime> get discoveredAt => $composableBuilder(
      column: $table.discoveredAt, builder: (column) => column);

  GeneratedColumn<DateTime> get verifiedAt => $composableBuilder(
      column: $table.verifiedAt, builder: (column) => column);

  GeneratedColumn<bool> get verified =>
      $composableBuilder(column: $table.verified, builder: (column) => column);

  GeneratedColumn<bool> get falsePositive => $composableBuilder(
      column: $table.falsePositive, builder: (column) => column);

  GeneratedColumn<String> get references => $composableBuilder(
      column: $table.references, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$FindingsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $FindingsTable,
    DbFinding,
    $$FindingsTableFilterComposer,
    $$FindingsTableOrderingComposer,
    $$FindingsTableAnnotationComposer,
    $$FindingsTableCreateCompanionBuilder,
    $$FindingsTableUpdateCompanionBuilder,
    (DbFinding, BaseReferences<_$AppDatabaseSchema, $FindingsTable, DbFinding>),
    DbFinding,
    PrefetchHooks Function()> {
  $$FindingsTableTableManager(_$AppDatabaseSchema db, $FindingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FindingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FindingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FindingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<FindingType> type = const Value.absent(),
            Value<Severity> severity = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> recommendation = const Value.absent(),
            Value<String> affectedTarget = const Value.absent(),
            Value<Map<String, dynamic>> evidence = const Value.absent(),
            Value<List<String>> evidenceIds = const Value.absent(),
            Value<CvssVector> cvssVectorJson = const Value.absent(),
            Value<DateTime> discoveredAt = const Value.absent(),
            Value<DateTime?> verifiedAt = const Value.absent(),
            Value<bool> verified = const Value.absent(),
            Value<bool> falsePositive = const Value.absent(),
            Value<String> references = const Value.absent(),
            Value<Map<String, dynamic>> metadata = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FindingsCompanion(
            id: id,
            assessmentId: assessmentId,
            type: type,
            severity: severity,
            title: title,
            description: description,
            recommendation: recommendation,
            affectedTarget: affectedTarget,
            evidence: evidence,
            evidenceIds: evidenceIds,
            cvssVectorJson: cvssVectorJson,
            discoveredAt: discoveredAt,
            verifiedAt: verifiedAt,
            verified: verified,
            falsePositive: falsePositive,
            references: references,
            metadata: metadata,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            required FindingType type,
            required Severity severity,
            required String title,
            required String description,
            required String recommendation,
            required String affectedTarget,
            required Map<String, dynamic> evidence,
            required List<String> evidenceIds,
            required CvssVector cvssVectorJson,
            required DateTime discoveredAt,
            Value<DateTime?> verifiedAt = const Value.absent(),
            required bool verified,
            required bool falsePositive,
            required String references,
            required Map<String, dynamic> metadata,
            Value<int> rowid = const Value.absent(),
          }) =>
              FindingsCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            type: type,
            severity: severity,
            title: title,
            description: description,
            recommendation: recommendation,
            affectedTarget: affectedTarget,
            evidence: evidence,
            evidenceIds: evidenceIds,
            cvssVectorJson: cvssVectorJson,
            discoveredAt: discoveredAt,
            verifiedAt: verifiedAt,
            verified: verified,
            falsePositive: falsePositive,
            references: references,
            metadata: metadata,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FindingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $FindingsTable,
    DbFinding,
    $$FindingsTableFilterComposer,
    $$FindingsTableOrderingComposer,
    $$FindingsTableAnnotationComposer,
    $$FindingsTableCreateCompanionBuilder,
    $$FindingsTableUpdateCompanionBuilder,
    (DbFinding, BaseReferences<_$AppDatabaseSchema, $FindingsTable, DbFinding>),
    DbFinding,
    PrefetchHooks Function()>;
typedef $$EvidenceTableCreateCompanionBuilder = EvidenceCompanion Function({
  required String id,
  required String assessmentId,
  required EvidenceType type,
  required String name,
  required String description,
  required String filePath,
  required String hashSha256,
  required int sizeBytes,
  required DateTime capturedAt,
  required String capturedBy,
  required Map<String, dynamic> metadata,
  required List<String> tags,
  required bool isEncrypted,
  Value<String?> encryptionKeyId,
  Value<int> rowid,
});
typedef $$EvidenceTableUpdateCompanionBuilder = EvidenceCompanion Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<EvidenceType> type,
  Value<String> name,
  Value<String> description,
  Value<String> filePath,
  Value<String> hashSha256,
  Value<int> sizeBytes,
  Value<DateTime> capturedAt,
  Value<String> capturedBy,
  Value<Map<String, dynamic>> metadata,
  Value<List<String>> tags,
  Value<bool> isEncrypted,
  Value<String?> encryptionKeyId,
  Value<int> rowid,
});

class $$EvidenceTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $EvidenceTable> {
  $$EvidenceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<EvidenceType, EvidenceType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hashSha256 => $composableBuilder(
      column: $table.hashSha256, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get capturedBy => $composableBuilder(
      column: $table.capturedBy, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get metadata => $composableBuilder(
          column: $table.metadata,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isEncrypted => $composableBuilder(
      column: $table.isEncrypted, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get encryptionKeyId => $composableBuilder(
      column: $table.encryptionKeyId,
      builder: (column) => ColumnFilters(column));
}

class $$EvidenceTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $EvidenceTable> {
  $$EvidenceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hashSha256 => $composableBuilder(
      column: $table.hashSha256, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get capturedBy => $composableBuilder(
      column: $table.capturedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isEncrypted => $composableBuilder(
      column: $table.isEncrypted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get encryptionKeyId => $composableBuilder(
      column: $table.encryptionKeyId,
      builder: (column) => ColumnOrderings(column));
}

class $$EvidenceTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $EvidenceTable> {
  $$EvidenceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EvidenceType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get hashSha256 => $composableBuilder(
      column: $table.hashSha256, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => column);

  GeneratedColumn<String> get capturedBy => $composableBuilder(
      column: $table.capturedBy, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<bool> get isEncrypted => $composableBuilder(
      column: $table.isEncrypted, builder: (column) => column);

  GeneratedColumn<String> get encryptionKeyId => $composableBuilder(
      column: $table.encryptionKeyId, builder: (column) => column);
}

class $$EvidenceTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $EvidenceTable,
    DbEvidence,
    $$EvidenceTableFilterComposer,
    $$EvidenceTableOrderingComposer,
    $$EvidenceTableAnnotationComposer,
    $$EvidenceTableCreateCompanionBuilder,
    $$EvidenceTableUpdateCompanionBuilder,
    (
      DbEvidence,
      BaseReferences<_$AppDatabaseSchema, $EvidenceTable, DbEvidence>
    ),
    DbEvidence,
    PrefetchHooks Function()> {
  $$EvidenceTableTableManager(_$AppDatabaseSchema db, $EvidenceTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvidenceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvidenceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvidenceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<EvidenceType> type = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String> hashSha256 = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<DateTime> capturedAt = const Value.absent(),
            Value<String> capturedBy = const Value.absent(),
            Value<Map<String, dynamic>> metadata = const Value.absent(),
            Value<List<String>> tags = const Value.absent(),
            Value<bool> isEncrypted = const Value.absent(),
            Value<String?> encryptionKeyId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EvidenceCompanion(
            id: id,
            assessmentId: assessmentId,
            type: type,
            name: name,
            description: description,
            filePath: filePath,
            hashSha256: hashSha256,
            sizeBytes: sizeBytes,
            capturedAt: capturedAt,
            capturedBy: capturedBy,
            metadata: metadata,
            tags: tags,
            isEncrypted: isEncrypted,
            encryptionKeyId: encryptionKeyId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            required EvidenceType type,
            required String name,
            required String description,
            required String filePath,
            required String hashSha256,
            required int sizeBytes,
            required DateTime capturedAt,
            required String capturedBy,
            required Map<String, dynamic> metadata,
            required List<String> tags,
            required bool isEncrypted,
            Value<String?> encryptionKeyId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EvidenceCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            type: type,
            name: name,
            description: description,
            filePath: filePath,
            hashSha256: hashSha256,
            sizeBytes: sizeBytes,
            capturedAt: capturedAt,
            capturedBy: capturedBy,
            metadata: metadata,
            tags: tags,
            isEncrypted: isEncrypted,
            encryptionKeyId: encryptionKeyId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EvidenceTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $EvidenceTable,
    DbEvidence,
    $$EvidenceTableFilterComposer,
    $$EvidenceTableOrderingComposer,
    $$EvidenceTableAnnotationComposer,
    $$EvidenceTableCreateCompanionBuilder,
    $$EvidenceTableUpdateCompanionBuilder,
    (
      DbEvidence,
      BaseReferences<_$AppDatabaseSchema, $EvidenceTable, DbEvidence>
    ),
    DbEvidence,
    PrefetchHooks Function()>;
typedef $$ReportsTableCreateCompanionBuilder = ReportsCompanion Function({
  required String id,
  required String projectId,
  required String assessmentId,
  required String title,
  required ReportType type,
  required ReportStatus status,
  required ReportFormat format,
  required ReportTemplate template,
  required ReportContent contentJson,
  required ReportMetadata metadataJson,
  required DateTime createdAt,
  Value<DateTime?> generatedAt,
  Value<DateTime?> deliveredAt,
  required List<String> attachedEvidenceIds,
  required Map<String, dynamic> customData,
  Value<int> rowid,
});
typedef $$ReportsTableUpdateCompanionBuilder = ReportsCompanion Function({
  Value<String> id,
  Value<String> projectId,
  Value<String> assessmentId,
  Value<String> title,
  Value<ReportType> type,
  Value<ReportStatus> status,
  Value<ReportFormat> format,
  Value<ReportTemplate> template,
  Value<ReportContent> contentJson,
  Value<ReportMetadata> metadataJson,
  Value<DateTime> createdAt,
  Value<DateTime?> generatedAt,
  Value<DateTime?> deliveredAt,
  Value<List<String>> attachedEvidenceIds,
  Value<Map<String, dynamic>> customData,
  Value<int> rowid,
});

class $$ReportsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $ReportsTable> {
  $$ReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ReportType, ReportType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ReportStatus, ReportStatus, int> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ReportFormat, ReportFormat, int> get format =>
      $composableBuilder(
          column: $table.format,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ReportTemplate, ReportTemplate, int>
      get template => $composableBuilder(
          column: $table.template,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ReportContent, ReportContent, String>
      get contentJson => $composableBuilder(
          column: $table.contentJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ReportMetadata, ReportMetadata, String>
      get metadataJson => $composableBuilder(
          column: $table.metadataJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get attachedEvidenceIds => $composableBuilder(
          column: $table.attachedEvidenceIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get customData => $composableBuilder(
          column: $table.customData,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ReportsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $ReportsTable> {
  $$ReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get template => $composableBuilder(
      column: $table.template, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contentJson => $composableBuilder(
      column: $table.contentJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadataJson => $composableBuilder(
      column: $table.metadataJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachedEvidenceIds => $composableBuilder(
      column: $table.attachedEvidenceIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customData => $composableBuilder(
      column: $table.customData, builder: (column) => ColumnOrderings(column));
}

class $$ReportsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $ReportsTable> {
  $$ReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReportType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReportStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReportFormat, int> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReportTemplate, int> get template =>
      $composableBuilder(column: $table.template, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReportContent, String> get contentJson =>
      $composableBuilder(
          column: $table.contentJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReportMetadata, String> get metadataJson =>
      $composableBuilder(
          column: $table.metadataJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
      column: $table.generatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get attachedEvidenceIds => $composableBuilder(
          column: $table.attachedEvidenceIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get customData => $composableBuilder(
          column: $table.customData, builder: (column) => column);
}

class $$ReportsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $ReportsTable,
    DbReport,
    $$ReportsTableFilterComposer,
    $$ReportsTableOrderingComposer,
    $$ReportsTableAnnotationComposer,
    $$ReportsTableCreateCompanionBuilder,
    $$ReportsTableUpdateCompanionBuilder,
    (DbReport, BaseReferences<_$AppDatabaseSchema, $ReportsTable, DbReport>),
    DbReport,
    PrefetchHooks Function()> {
  $$ReportsTableTableManager(_$AppDatabaseSchema db, $ReportsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<ReportType> type = const Value.absent(),
            Value<ReportStatus> status = const Value.absent(),
            Value<ReportFormat> format = const Value.absent(),
            Value<ReportTemplate> template = const Value.absent(),
            Value<ReportContent> contentJson = const Value.absent(),
            Value<ReportMetadata> metadataJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> generatedAt = const Value.absent(),
            Value<DateTime?> deliveredAt = const Value.absent(),
            Value<List<String>> attachedEvidenceIds = const Value.absent(),
            Value<Map<String, dynamic>> customData = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportsCompanion(
            id: id,
            projectId: projectId,
            assessmentId: assessmentId,
            title: title,
            type: type,
            status: status,
            format: format,
            template: template,
            contentJson: contentJson,
            metadataJson: metadataJson,
            createdAt: createdAt,
            generatedAt: generatedAt,
            deliveredAt: deliveredAt,
            attachedEvidenceIds: attachedEvidenceIds,
            customData: customData,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String projectId,
            required String assessmentId,
            required String title,
            required ReportType type,
            required ReportStatus status,
            required ReportFormat format,
            required ReportTemplate template,
            required ReportContent contentJson,
            required ReportMetadata metadataJson,
            required DateTime createdAt,
            Value<DateTime?> generatedAt = const Value.absent(),
            Value<DateTime?> deliveredAt = const Value.absent(),
            required List<String> attachedEvidenceIds,
            required Map<String, dynamic> customData,
            Value<int> rowid = const Value.absent(),
          }) =>
              ReportsCompanion.insert(
            id: id,
            projectId: projectId,
            assessmentId: assessmentId,
            title: title,
            type: type,
            status: status,
            format: format,
            template: template,
            contentJson: contentJson,
            metadataJson: metadataJson,
            createdAt: createdAt,
            generatedAt: generatedAt,
            deliveredAt: deliveredAt,
            attachedEvidenceIds: attachedEvidenceIds,
            customData: customData,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReportsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $ReportsTable,
    DbReport,
    $$ReportsTableFilterComposer,
    $$ReportsTableOrderingComposer,
    $$ReportsTableAnnotationComposer,
    $$ReportsTableCreateCompanionBuilder,
    $$ReportsTableUpdateCompanionBuilder,
    (DbReport, BaseReferences<_$AppDatabaseSchema, $ReportsTable, DbReport>),
    DbReport,
    PrefetchHooks Function()>;
typedef $$ScanSessionsTableCreateCompanionBuilder = ScanSessionsCompanion
    Function({
  required String id,
  Value<String?> assessmentId,
  required String name,
  required ScanMode mode,
  required ScanStatus status,
  required DateTime startedAt,
  Value<DateTime?> completedAt,
  required ScanConfig configJson,
  required ScanStatistics statisticsJson,
  required List<String> accessPointIds,
  required List<String> handshakeIds,
  required List<String> pmkidIds,
  required List<String> wpsPinIds,
  Value<int> rowid,
});
typedef $$ScanSessionsTableUpdateCompanionBuilder = ScanSessionsCompanion
    Function({
  Value<String> id,
  Value<String?> assessmentId,
  Value<String> name,
  Value<ScanMode> mode,
  Value<ScanStatus> status,
  Value<DateTime> startedAt,
  Value<DateTime?> completedAt,
  Value<ScanConfig> configJson,
  Value<ScanStatistics> statisticsJson,
  Value<List<String>> accessPointIds,
  Value<List<String>> handshakeIds,
  Value<List<String>> pmkidIds,
  Value<List<String>> wpsPinIds,
  Value<int> rowid,
});

class $$ScanSessionsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $ScanSessionsTable> {
  $$ScanSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ScanMode, ScanMode, int> get mode =>
      $composableBuilder(
          column: $table.mode,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ScanStatus, ScanStatus, int> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ScanConfig, ScanConfig, String>
      get configJson => $composableBuilder(
          column: $table.configJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<ScanStatistics, ScanStatistics, String>
      get statisticsJson => $composableBuilder(
          column: $table.statisticsJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get accessPointIds => $composableBuilder(
          column: $table.accessPointIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get handshakeIds => $composableBuilder(
          column: $table.handshakeIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get pmkidIds => $composableBuilder(
          column: $table.pmkidIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get wpsPinIds => $composableBuilder(
          column: $table.wpsPinIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ScanSessionsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $ScanSessionsTable> {
  $$ScanSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mode => $composableBuilder(
      column: $table.mode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get configJson => $composableBuilder(
      column: $table.configJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get statisticsJson => $composableBuilder(
      column: $table.statisticsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accessPointIds => $composableBuilder(
      column: $table.accessPointIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get handshakeIds => $composableBuilder(
      column: $table.handshakeIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pmkidIds => $composableBuilder(
      column: $table.pmkidIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wpsPinIds => $composableBuilder(
      column: $table.wpsPinIds, builder: (column) => ColumnOrderings(column));
}

class $$ScanSessionsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $ScanSessionsTable> {
  $$ScanSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ScanMode, int> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ScanStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ScanConfig, String> get configJson =>
      $composableBuilder(
          column: $table.configJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ScanStatistics, String> get statisticsJson =>
      $composableBuilder(
          column: $table.statisticsJson, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get accessPointIds =>
      $composableBuilder(
          column: $table.accessPointIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get handshakeIds =>
      $composableBuilder(
          column: $table.handshakeIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get pmkidIds =>
      $composableBuilder(column: $table.pmkidIds, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get wpsPinIds =>
      $composableBuilder(column: $table.wpsPinIds, builder: (column) => column);
}

class $$ScanSessionsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $ScanSessionsTable,
    DbScanSession,
    $$ScanSessionsTableFilterComposer,
    $$ScanSessionsTableOrderingComposer,
    $$ScanSessionsTableAnnotationComposer,
    $$ScanSessionsTableCreateCompanionBuilder,
    $$ScanSessionsTableUpdateCompanionBuilder,
    (
      DbScanSession,
      BaseReferences<_$AppDatabaseSchema, $ScanSessionsTable, DbScanSession>
    ),
    DbScanSession,
    PrefetchHooks Function()> {
  $$ScanSessionsTableTableManager(
      _$AppDatabaseSchema db, $ScanSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScanSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScanSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScanSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> assessmentId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<ScanMode> mode = const Value.absent(),
            Value<ScanStatus> status = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<ScanConfig> configJson = const Value.absent(),
            Value<ScanStatistics> statisticsJson = const Value.absent(),
            Value<List<String>> accessPointIds = const Value.absent(),
            Value<List<String>> handshakeIds = const Value.absent(),
            Value<List<String>> pmkidIds = const Value.absent(),
            Value<List<String>> wpsPinIds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ScanSessionsCompanion(
            id: id,
            assessmentId: assessmentId,
            name: name,
            mode: mode,
            status: status,
            startedAt: startedAt,
            completedAt: completedAt,
            configJson: configJson,
            statisticsJson: statisticsJson,
            accessPointIds: accessPointIds,
            handshakeIds: handshakeIds,
            pmkidIds: pmkidIds,
            wpsPinIds: wpsPinIds,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> assessmentId = const Value.absent(),
            required String name,
            required ScanMode mode,
            required ScanStatus status,
            required DateTime startedAt,
            Value<DateTime?> completedAt = const Value.absent(),
            required ScanConfig configJson,
            required ScanStatistics statisticsJson,
            required List<String> accessPointIds,
            required List<String> handshakeIds,
            required List<String> pmkidIds,
            required List<String> wpsPinIds,
            Value<int> rowid = const Value.absent(),
          }) =>
              ScanSessionsCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            name: name,
            mode: mode,
            status: status,
            startedAt: startedAt,
            completedAt: completedAt,
            configJson: configJson,
            statisticsJson: statisticsJson,
            accessPointIds: accessPointIds,
            handshakeIds: handshakeIds,
            pmkidIds: pmkidIds,
            wpsPinIds: wpsPinIds,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ScanSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $ScanSessionsTable,
    DbScanSession,
    $$ScanSessionsTableFilterComposer,
    $$ScanSessionsTableOrderingComposer,
    $$ScanSessionsTableAnnotationComposer,
    $$ScanSessionsTableCreateCompanionBuilder,
    $$ScanSessionsTableUpdateCompanionBuilder,
    (
      DbScanSession,
      BaseReferences<_$AppDatabaseSchema, $ScanSessionsTable, DbScanSession>
    ),
    DbScanSession,
    PrefetchHooks Function()>;
typedef $$AssessmentEventsTableCreateCompanionBuilder
    = AssessmentEventsCompanion Function({
  required String id,
  required String assessmentId,
  required EventType type,
  required DateTime timestamp,
  required String message,
  required Map<String, dynamic> data,
  required LogLevel level,
  Value<String?> phaseId,
  Value<String?> taskId,
  Value<int> rowid,
});
typedef $$AssessmentEventsTableUpdateCompanionBuilder
    = AssessmentEventsCompanion Function({
  Value<String> id,
  Value<String> assessmentId,
  Value<EventType> type,
  Value<DateTime> timestamp,
  Value<String> message,
  Value<Map<String, dynamic>> data,
  Value<LogLevel> level,
  Value<String?> phaseId,
  Value<String?> taskId,
  Value<int> rowid,
});

class $$AssessmentEventsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $AssessmentEventsTable> {
  $$AssessmentEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<EventType, EventType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get data => $composableBuilder(
          column: $table.data,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<LogLevel, LogLevel, int> get level =>
      $composableBuilder(
          column: $table.level,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get phaseId => $composableBuilder(
      column: $table.phaseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));
}

class $$AssessmentEventsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $AssessmentEventsTable> {
  $$AssessmentEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phaseId => $composableBuilder(
      column: $table.phaseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));
}

class $$AssessmentEventsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $AssessmentEventsTable> {
  $$AssessmentEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentId => $composableBuilder(
      column: $table.assessmentId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EventType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogLevel, int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get phaseId =>
      $composableBuilder(column: $table.phaseId, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);
}

class $$AssessmentEventsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $AssessmentEventsTable,
    DbAssessmentEvent,
    $$AssessmentEventsTableFilterComposer,
    $$AssessmentEventsTableOrderingComposer,
    $$AssessmentEventsTableAnnotationComposer,
    $$AssessmentEventsTableCreateCompanionBuilder,
    $$AssessmentEventsTableUpdateCompanionBuilder,
    (
      DbAssessmentEvent,
      BaseReferences<_$AppDatabaseSchema, $AssessmentEventsTable,
          DbAssessmentEvent>
    ),
    DbAssessmentEvent,
    PrefetchHooks Function()> {
  $$AssessmentEventsTableTableManager(
      _$AppDatabaseSchema db, $AssessmentEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assessmentId = const Value.absent(),
            Value<EventType> type = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<Map<String, dynamic>> data = const Value.absent(),
            Value<LogLevel> level = const Value.absent(),
            Value<String?> phaseId = const Value.absent(),
            Value<String?> taskId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssessmentEventsCompanion(
            id: id,
            assessmentId: assessmentId,
            type: type,
            timestamp: timestamp,
            message: message,
            data: data,
            level: level,
            phaseId: phaseId,
            taskId: taskId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assessmentId,
            required EventType type,
            required DateTime timestamp,
            required String message,
            required Map<String, dynamic> data,
            required LogLevel level,
            Value<String?> phaseId = const Value.absent(),
            Value<String?> taskId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssessmentEventsCompanion.insert(
            id: id,
            assessmentId: assessmentId,
            type: type,
            timestamp: timestamp,
            message: message,
            data: data,
            level: level,
            phaseId: phaseId,
            taskId: taskId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssessmentEventsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $AssessmentEventsTable,
    DbAssessmentEvent,
    $$AssessmentEventsTableFilterComposer,
    $$AssessmentEventsTableOrderingComposer,
    $$AssessmentEventsTableAnnotationComposer,
    $$AssessmentEventsTableCreateCompanionBuilder,
    $$AssessmentEventsTableUpdateCompanionBuilder,
    (
      DbAssessmentEvent,
      BaseReferences<_$AppDatabaseSchema, $AssessmentEventsTable,
          DbAssessmentEvent>
    ),
    DbAssessmentEvent,
    PrefetchHooks Function()>;
typedef $$PluginConfigsTableCreateCompanionBuilder = PluginConfigsCompanion
    Function({
  required String pluginId,
  required Map<String, dynamic> configJson,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PluginConfigsTableUpdateCompanionBuilder = PluginConfigsCompanion
    Function({
  Value<String> pluginId,
  Value<Map<String, dynamic>> configJson,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$PluginConfigsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $PluginConfigsTable> {
  $$PluginConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pluginId => $composableBuilder(
      column: $table.pluginId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get configJson => $composableBuilder(
          column: $table.configJson,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PluginConfigsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $PluginConfigsTable> {
  $$PluginConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pluginId => $composableBuilder(
      column: $table.pluginId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get configJson => $composableBuilder(
      column: $table.configJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PluginConfigsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $PluginConfigsTable> {
  $$PluginConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pluginId =>
      $composableBuilder(column: $table.pluginId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      get configJson => $composableBuilder(
          column: $table.configJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PluginConfigsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $PluginConfigsTable,
    DbPluginConfig,
    $$PluginConfigsTableFilterComposer,
    $$PluginConfigsTableOrderingComposer,
    $$PluginConfigsTableAnnotationComposer,
    $$PluginConfigsTableCreateCompanionBuilder,
    $$PluginConfigsTableUpdateCompanionBuilder,
    (
      DbPluginConfig,
      BaseReferences<_$AppDatabaseSchema, $PluginConfigsTable, DbPluginConfig>
    ),
    DbPluginConfig,
    PrefetchHooks Function()> {
  $$PluginConfigsTableTableManager(
      _$AppDatabaseSchema db, $PluginConfigsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PluginConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PluginConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PluginConfigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pluginId = const Value.absent(),
            Value<Map<String, dynamic>> configJson = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PluginConfigsCompanion(
            pluginId: pluginId,
            configJson: configJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pluginId,
            required Map<String, dynamic> configJson,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PluginConfigsCompanion.insert(
            pluginId: pluginId,
            configJson: configJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PluginConfigsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $PluginConfigsTable,
    DbPluginConfig,
    $$PluginConfigsTableFilterComposer,
    $$PluginConfigsTableOrderingComposer,
    $$PluginConfigsTableAnnotationComposer,
    $$PluginConfigsTableCreateCompanionBuilder,
    $$PluginConfigsTableUpdateCompanionBuilder,
    (
      DbPluginConfig,
      BaseReferences<_$AppDatabaseSchema, $PluginConfigsTable, DbPluginConfig>
    ),
    DbPluginConfig,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required Map<String, dynamic> value,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<Map<String, dynamic>> value,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabaseSchema, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get value => $composableBuilder(
          column: $table.value,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabaseSchema, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabaseSchema, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>, String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabaseSchema,
    $AppSettingsTable,
    DbAppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (
      DbAppSetting,
      BaseReferences<_$AppDatabaseSchema, $AppSettingsTable, DbAppSetting>
    ),
    DbAppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(
      _$AppDatabaseSchema db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<Map<String, dynamic>> value = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required Map<String, dynamic> value,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabaseSchema,
    $AppSettingsTable,
    DbAppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (
      DbAppSetting,
      BaseReferences<_$AppDatabaseSchema, $AppSettingsTable, DbAppSetting>
    ),
    DbAppSetting,
    PrefetchHooks Function()>;

class $AppDatabaseSchemaManager {
  final _$AppDatabaseSchema _db;
  $AppDatabaseSchemaManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$AssessmentsTableTableManager get assessments =>
      $$AssessmentsTableTableManager(_db, _db.assessments);
  $$AccessPointsTableTableManager get accessPoints =>
      $$AccessPointsTableTableManager(_db, _db.accessPoints);
  $$ClientDevicesTableTableManager get clientDevices =>
      $$ClientDevicesTableTableManager(_db, _db.clientDevices);
  $$HandshakeCapturesTableTableManager get handshakeCaptures =>
      $$HandshakeCapturesTableTableManager(_db, _db.handshakeCaptures);
  $$PmkidCapturesTableTableManager get pmkidCaptures =>
      $$PmkidCapturesTableTableManager(_db, _db.pmkidCaptures);
  $$WpsPinsTableTableManager get wpsPins =>
      $$WpsPinsTableTableManager(_db, _db.wpsPins);
  $$VulnerabilityFindingsTableTableManager get vulnerabilityFindings =>
      $$VulnerabilityFindingsTableTableManager(_db, _db.vulnerabilityFindings);
  $$FindingsTableTableManager get findings =>
      $$FindingsTableTableManager(_db, _db.findings);
  $$EvidenceTableTableManager get evidence =>
      $$EvidenceTableTableManager(_db, _db.evidence);
  $$ReportsTableTableManager get reports =>
      $$ReportsTableTableManager(_db, _db.reports);
  $$ScanSessionsTableTableManager get scanSessions =>
      $$ScanSessionsTableTableManager(_db, _db.scanSessions);
  $$AssessmentEventsTableTableManager get assessmentEvents =>
      $$AssessmentEventsTableTableManager(_db, _db.assessmentEvents);
  $$PluginConfigsTableTableManager get pluginConfigs =>
      $$PluginConfigsTableTableManager(_db, _db.pluginConfigs);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
