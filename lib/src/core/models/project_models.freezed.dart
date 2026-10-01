// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ProjectType get type => throw _privateConstructorUsedError;
  ProjectStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  ClientInfo get client => throw _privateConstructorUsedError;
  ScopeDefinition get scope => throw _privateConstructorUsedError;
  Authorization get authorization => throw _privateConstructorUsedError;
  ProjectSettings get settings => throw _privateConstructorUsedError;
  List<String> get assessmentIds => throw _privateConstructorUsedError;
  List<String> get teamMembers => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    ProjectType type,
    ProjectStatus status,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? startedAt,
    DateTime? completedAt,
    ClientInfo client,
    ScopeDefinition scope,
    Authorization authorization,
    ProjectSettings settings,
    List<String> assessmentIds,
    List<String> teamMembers,
    Map<String, dynamic> metadata,
  });

  $ClientInfoCopyWith<$Res> get client;
  $ScopeDefinitionCopyWith<$Res> get scope;
  $AuthorizationCopyWith<$Res> get authorization;
  $ProjectSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? client = null,
    Object? scope = null,
    Object? authorization = null,
    Object? settings = null,
    Object? assessmentIds = null,
    Object? teamMembers = null,
    Object? metadata = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ProjectType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ProjectStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            client: null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                      as ClientInfo,
            scope: null == scope
                ? _value.scope
                : scope // ignore: cast_nullable_to_non_nullable
                      as ScopeDefinition,
            authorization: null == authorization
                ? _value.authorization
                : authorization // ignore: cast_nullable_to_non_nullable
                      as Authorization,
            settings: null == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                      as ProjectSettings,
            assessmentIds: null == assessmentIds
                ? _value.assessmentIds
                : assessmentIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            teamMembers: null == teamMembers
                ? _value.teamMembers
                : teamMembers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientInfoCopyWith<$Res> get client {
    return $ClientInfoCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScopeDefinitionCopyWith<$Res> get scope {
    return $ScopeDefinitionCopyWith<$Res>(_value.scope, (value) {
      return _then(_value.copyWith(scope: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorizationCopyWith<$Res> get authorization {
    return $AuthorizationCopyWith<$Res>(_value.authorization, (value) {
      return _then(_value.copyWith(authorization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectSettingsCopyWith<$Res> get settings {
    return $ProjectSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
    _$ProjectImpl value,
    $Res Function(_$ProjectImpl) then,
  ) = __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    ProjectType type,
    ProjectStatus status,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? startedAt,
    DateTime? completedAt,
    ClientInfo client,
    ScopeDefinition scope,
    Authorization authorization,
    ProjectSettings settings,
    List<String> assessmentIds,
    List<String> teamMembers,
    Map<String, dynamic> metadata,
  });

  @override
  $ClientInfoCopyWith<$Res> get client;
  @override
  $ScopeDefinitionCopyWith<$Res> get scope;
  @override
  $AuthorizationCopyWith<$Res> get authorization;
  @override
  $ProjectSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
    _$ProjectImpl _value,
    $Res Function(_$ProjectImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? client = null,
    Object? scope = null,
    Object? authorization = null,
    Object? settings = null,
    Object? assessmentIds = null,
    Object? teamMembers = null,
    Object? metadata = null,
  }) {
    return _then(
      _$ProjectImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ProjectType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ProjectStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        client: null == client
            ? _value.client
            : client // ignore: cast_nullable_to_non_nullable
                  as ClientInfo,
        scope: null == scope
            ? _value.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as ScopeDefinition,
        authorization: null == authorization
            ? _value.authorization
            : authorization // ignore: cast_nullable_to_non_nullable
                  as Authorization,
        settings: null == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as ProjectSettings,
        assessmentIds: null == assessmentIds
            ? _value._assessmentIds
            : assessmentIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        teamMembers: null == teamMembers
            ? _value._teamMembers
            : teamMembers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.startedAt,
    required this.completedAt,
    required this.client,
    required this.scope,
    required this.authorization,
    required this.settings,
    final List<String> assessmentIds = const [],
    final List<String> teamMembers = const [],
    final Map<String, dynamic> metadata = const {},
  }) : _assessmentIds = assessmentIds,
       _teamMembers = teamMembers,
       _metadata = metadata;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final ProjectType type;
  @override
  final ProjectStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final ClientInfo client;
  @override
  final ScopeDefinition scope;
  @override
  final Authorization authorization;
  @override
  final ProjectSettings settings;
  final List<String> _assessmentIds;
  @override
  @JsonKey()
  List<String> get assessmentIds {
    if (_assessmentIds is EqualUnmodifiableListView) return _assessmentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assessmentIds);
  }

  final List<String> _teamMembers;
  @override
  @JsonKey()
  List<String> get teamMembers {
    if (_teamMembers is EqualUnmodifiableListView) return _teamMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamMembers);
  }

  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Project(id: $id, name: $name, description: $description, type: $type, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, completedAt: $completedAt, client: $client, scope: $scope, authorization: $authorization, settings: $settings, assessmentIds: $assessmentIds, teamMembers: $teamMembers, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.authorization, authorization) ||
                other.authorization == authorization) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality().equals(
              other._assessmentIds,
              _assessmentIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._teamMembers,
              _teamMembers,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    type,
    status,
    createdAt,
    updatedAt,
    startedAt,
    completedAt,
    client,
    scope,
    authorization,
    settings,
    const DeepCollectionEquality().hash(_assessmentIds),
    const DeepCollectionEquality().hash(_teamMembers),
    const DeepCollectionEquality().hash(_metadata),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(this);
  }
}

abstract class _Project implements Project {
  const factory _Project({
    required final String id,
    required final String name,
    required final String description,
    required final ProjectType type,
    required final ProjectStatus status,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    required final DateTime? startedAt,
    required final DateTime? completedAt,
    required final ClientInfo client,
    required final ScopeDefinition scope,
    required final Authorization authorization,
    required final ProjectSettings settings,
    final List<String> assessmentIds,
    final List<String> teamMembers,
    final Map<String, dynamic> metadata,
  }) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  ProjectType get type;
  @override
  ProjectStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  ClientInfo get client;
  @override
  ScopeDefinition get scope;
  @override
  Authorization get authorization;
  @override
  ProjectSettings get settings;
  @override
  List<String> get assessmentIds;
  @override
  List<String> get teamMembers;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) {
  return _ClientInfo.fromJson(json);
}

/// @nodoc
mixin _$ClientInfo {
  String get name => throw _privateConstructorUsedError;
  String get contactEmail => throw _privateConstructorUsedError;
  String? get contactPhone => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  Map<String, dynamic> get customFields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientInfoCopyWith<ClientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientInfoCopyWith<$Res> {
  factory $ClientInfoCopyWith(
    ClientInfo value,
    $Res Function(ClientInfo) then,
  ) = _$ClientInfoCopyWithImpl<$Res, ClientInfo>;
  @useResult
  $Res call({
    String name,
    String contactEmail,
    String? contactPhone,
    String? company,
    String? address,
    Map<String, dynamic> customFields,
  });
}

/// @nodoc
class _$ClientInfoCopyWithImpl<$Res, $Val extends ClientInfo>
    implements $ClientInfoCopyWith<$Res> {
  _$ClientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactEmail = null,
    Object? contactPhone = freezed,
    Object? company = freezed,
    Object? address = freezed,
    Object? customFields = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            contactEmail: null == contactEmail
                ? _value.contactEmail
                : contactEmail // ignore: cast_nullable_to_non_nullable
                      as String,
            contactPhone: freezed == contactPhone
                ? _value.contactPhone
                : contactPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            customFields: null == customFields
                ? _value.customFields
                : customFields // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClientInfoImplCopyWith<$Res>
    implements $ClientInfoCopyWith<$Res> {
  factory _$$ClientInfoImplCopyWith(
    _$ClientInfoImpl value,
    $Res Function(_$ClientInfoImpl) then,
  ) = __$$ClientInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String contactEmail,
    String? contactPhone,
    String? company,
    String? address,
    Map<String, dynamic> customFields,
  });
}

/// @nodoc
class __$$ClientInfoImplCopyWithImpl<$Res>
    extends _$ClientInfoCopyWithImpl<$Res, _$ClientInfoImpl>
    implements _$$ClientInfoImplCopyWith<$Res> {
  __$$ClientInfoImplCopyWithImpl(
    _$ClientInfoImpl _value,
    $Res Function(_$ClientInfoImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactEmail = null,
    Object? contactPhone = freezed,
    Object? company = freezed,
    Object? address = freezed,
    Object? customFields = null,
  }) {
    return _then(
      _$ClientInfoImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        contactEmail: null == contactEmail
            ? _value.contactEmail
            : contactEmail // ignore: cast_nullable_to_non_nullable
                  as String,
        contactPhone: freezed == contactPhone
            ? _value.contactPhone
            : contactPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        customFields: null == customFields
            ? _value._customFields
            : customFields // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientInfoImpl implements _ClientInfo {
  const _$ClientInfoImpl({
    required this.name,
    required this.contactEmail,
    required this.contactPhone,
    required this.company,
    required this.address,
    final Map<String, dynamic> customFields = const {},
  }) : _customFields = customFields;

  factory _$ClientInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String contactEmail;
  @override
  final String? contactPhone;
  @override
  final String? company;
  @override
  final String? address;
  final Map<String, dynamic> _customFields;
  @override
  @JsonKey()
  Map<String, dynamic> get customFields {
    if (_customFields is EqualUnmodifiableMapView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customFields);
  }

  @override
  String toString() {
    return 'ClientInfo(name: $name, contactEmail: $contactEmail, contactPhone: $contactPhone, company: $company, address: $address, customFields: $customFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(
              other._customFields,
              _customFields,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    contactEmail,
    contactPhone,
    company,
    address,
    const DeepCollectionEquality().hash(_customFields),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientInfoImplCopyWith<_$ClientInfoImpl> get copyWith =>
      __$$ClientInfoImplCopyWithImpl<_$ClientInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientInfoImplToJson(this);
  }
}

abstract class _ClientInfo implements ClientInfo {
  const factory _ClientInfo({
    required final String name,
    required final String contactEmail,
    required final String? contactPhone,
    required final String? company,
    required final String? address,
    final Map<String, dynamic> customFields,
  }) = _$ClientInfoImpl;

  factory _ClientInfo.fromJson(Map<String, dynamic> json) =
      _$ClientInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get contactEmail;
  @override
  String? get contactPhone;
  @override
  String? get company;
  @override
  String? get address;
  @override
  Map<String, dynamic> get customFields;
  @override
  @JsonKey(ignore: true)
  _$$ClientInfoImplCopyWith<_$ClientInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScopeDefinition _$ScopeDefinitionFromJson(Map<String, dynamic> json) {
  return _ScopeDefinition.fromJson(json);
}

/// @nodoc
mixin _$ScopeDefinition {
  List<String> get targetNetworks => throw _privateConstructorUsedError;
  List<String> get targetDomains => throw _privateConstructorUsedError;
  List<String> get targetIps => throw _privateConstructorUsedError;
  List<String> get targetSsids => throw _privateConstructorUsedError;
  List<String> get excludedNetworks => throw _privateConstructorUsedError;
  List<String> get excludedDomains => throw _privateConstructorUsedError;
  bool get wirelessInScope => throw _privateConstructorUsedError;
  bool get wiredInScope => throw _privateConstructorUsedError;
  bool get socialEngineeringInScope => throw _privateConstructorUsedError;
  bool get physicalInScope => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScopeDefinitionCopyWith<ScopeDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScopeDefinitionCopyWith<$Res> {
  factory $ScopeDefinitionCopyWith(
    ScopeDefinition value,
    $Res Function(ScopeDefinition) then,
  ) = _$ScopeDefinitionCopyWithImpl<$Res, ScopeDefinition>;
  @useResult
  $Res call({
    List<String> targetNetworks,
    List<String> targetDomains,
    List<String> targetIps,
    List<String> targetSsids,
    List<String> excludedNetworks,
    List<String> excludedDomains,
    bool wirelessInScope,
    bool wiredInScope,
    bool socialEngineeringInScope,
    bool physicalInScope,
    String notes,
  });
}

/// @nodoc
class _$ScopeDefinitionCopyWithImpl<$Res, $Val extends ScopeDefinition>
    implements $ScopeDefinitionCopyWith<$Res> {
  _$ScopeDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetNetworks = null,
    Object? targetDomains = null,
    Object? targetIps = null,
    Object? targetSsids = null,
    Object? excludedNetworks = null,
    Object? excludedDomains = null,
    Object? wirelessInScope = null,
    Object? wiredInScope = null,
    Object? socialEngineeringInScope = null,
    Object? physicalInScope = null,
    Object? notes = null,
  }) {
    return _then(
      _value.copyWith(
            targetNetworks: null == targetNetworks
                ? _value.targetNetworks
                : targetNetworks // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetDomains: null == targetDomains
                ? _value.targetDomains
                : targetDomains // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetIps: null == targetIps
                ? _value.targetIps
                : targetIps // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetSsids: null == targetSsids
                ? _value.targetSsids
                : targetSsids // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            excludedNetworks: null == excludedNetworks
                ? _value.excludedNetworks
                : excludedNetworks // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            excludedDomains: null == excludedDomains
                ? _value.excludedDomains
                : excludedDomains // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            wirelessInScope: null == wirelessInScope
                ? _value.wirelessInScope
                : wirelessInScope // ignore: cast_nullable_to_non_nullable
                      as bool,
            wiredInScope: null == wiredInScope
                ? _value.wiredInScope
                : wiredInScope // ignore: cast_nullable_to_non_nullable
                      as bool,
            socialEngineeringInScope: null == socialEngineeringInScope
                ? _value.socialEngineeringInScope
                : socialEngineeringInScope // ignore: cast_nullable_to_non_nullable
                      as bool,
            physicalInScope: null == physicalInScope
                ? _value.physicalInScope
                : physicalInScope // ignore: cast_nullable_to_non_nullable
                      as bool,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScopeDefinitionImplCopyWith<$Res>
    implements $ScopeDefinitionCopyWith<$Res> {
  factory _$$ScopeDefinitionImplCopyWith(
    _$ScopeDefinitionImpl value,
    $Res Function(_$ScopeDefinitionImpl) then,
  ) = __$$ScopeDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> targetNetworks,
    List<String> targetDomains,
    List<String> targetIps,
    List<String> targetSsids,
    List<String> excludedNetworks,
    List<String> excludedDomains,
    bool wirelessInScope,
    bool wiredInScope,
    bool socialEngineeringInScope,
    bool physicalInScope,
    String notes,
  });
}

/// @nodoc
class __$$ScopeDefinitionImplCopyWithImpl<$Res>
    extends _$ScopeDefinitionCopyWithImpl<$Res, _$ScopeDefinitionImpl>
    implements _$$ScopeDefinitionImplCopyWith<$Res> {
  __$$ScopeDefinitionImplCopyWithImpl(
    _$ScopeDefinitionImpl _value,
    $Res Function(_$ScopeDefinitionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetNetworks = null,
    Object? targetDomains = null,
    Object? targetIps = null,
    Object? targetSsids = null,
    Object? excludedNetworks = null,
    Object? excludedDomains = null,
    Object? wirelessInScope = null,
    Object? wiredInScope = null,
    Object? socialEngineeringInScope = null,
    Object? physicalInScope = null,
    Object? notes = null,
  }) {
    return _then(
      _$ScopeDefinitionImpl(
        targetNetworks: null == targetNetworks
            ? _value._targetNetworks
            : targetNetworks // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetDomains: null == targetDomains
            ? _value._targetDomains
            : targetDomains // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetIps: null == targetIps
            ? _value._targetIps
            : targetIps // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetSsids: null == targetSsids
            ? _value._targetSsids
            : targetSsids // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        excludedNetworks: null == excludedNetworks
            ? _value._excludedNetworks
            : excludedNetworks // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        excludedDomains: null == excludedDomains
            ? _value._excludedDomains
            : excludedDomains // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        wirelessInScope: null == wirelessInScope
            ? _value.wirelessInScope
            : wirelessInScope // ignore: cast_nullable_to_non_nullable
                  as bool,
        wiredInScope: null == wiredInScope
            ? _value.wiredInScope
            : wiredInScope // ignore: cast_nullable_to_non_nullable
                  as bool,
        socialEngineeringInScope: null == socialEngineeringInScope
            ? _value.socialEngineeringInScope
            : socialEngineeringInScope // ignore: cast_nullable_to_non_nullable
                  as bool,
        physicalInScope: null == physicalInScope
            ? _value.physicalInScope
            : physicalInScope // ignore: cast_nullable_to_non_nullable
                  as bool,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScopeDefinitionImpl implements _ScopeDefinition {
  const _$ScopeDefinitionImpl({
    final List<String> targetNetworks = const [],
    final List<String> targetDomains = const [],
    final List<String> targetIps = const [],
    final List<String> targetSsids = const [],
    final List<String> excludedNetworks = const [],
    final List<String> excludedDomains = const [],
    this.wirelessInScope = true,
    this.wiredInScope = true,
    this.socialEngineeringInScope = false,
    this.physicalInScope = false,
    this.notes = '',
  }) : _targetNetworks = targetNetworks,
       _targetDomains = targetDomains,
       _targetIps = targetIps,
       _targetSsids = targetSsids,
       _excludedNetworks = excludedNetworks,
       _excludedDomains = excludedDomains;

  factory _$ScopeDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScopeDefinitionImplFromJson(json);

  final List<String> _targetNetworks;
  @override
  @JsonKey()
  List<String> get targetNetworks {
    if (_targetNetworks is EqualUnmodifiableListView) return _targetNetworks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetNetworks);
  }

  final List<String> _targetDomains;
  @override
  @JsonKey()
  List<String> get targetDomains {
    if (_targetDomains is EqualUnmodifiableListView) return _targetDomains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetDomains);
  }

  final List<String> _targetIps;
  @override
  @JsonKey()
  List<String> get targetIps {
    if (_targetIps is EqualUnmodifiableListView) return _targetIps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetIps);
  }

  final List<String> _targetSsids;
  @override
  @JsonKey()
  List<String> get targetSsids {
    if (_targetSsids is EqualUnmodifiableListView) return _targetSsids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetSsids);
  }

  final List<String> _excludedNetworks;
  @override
  @JsonKey()
  List<String> get excludedNetworks {
    if (_excludedNetworks is EqualUnmodifiableListView)
      return _excludedNetworks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedNetworks);
  }

  final List<String> _excludedDomains;
  @override
  @JsonKey()
  List<String> get excludedDomains {
    if (_excludedDomains is EqualUnmodifiableListView) return _excludedDomains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedDomains);
  }

  @override
  @JsonKey()
  final bool wirelessInScope;
  @override
  @JsonKey()
  final bool wiredInScope;
  @override
  @JsonKey()
  final bool socialEngineeringInScope;
  @override
  @JsonKey()
  final bool physicalInScope;
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'ScopeDefinition(targetNetworks: $targetNetworks, targetDomains: $targetDomains, targetIps: $targetIps, targetSsids: $targetSsids, excludedNetworks: $excludedNetworks, excludedDomains: $excludedDomains, wirelessInScope: $wirelessInScope, wiredInScope: $wiredInScope, socialEngineeringInScope: $socialEngineeringInScope, physicalInScope: $physicalInScope, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScopeDefinitionImpl &&
            const DeepCollectionEquality().equals(
              other._targetNetworks,
              _targetNetworks,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetDomains,
              _targetDomains,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetIps,
              _targetIps,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetSsids,
              _targetSsids,
            ) &&
            const DeepCollectionEquality().equals(
              other._excludedNetworks,
              _excludedNetworks,
            ) &&
            const DeepCollectionEquality().equals(
              other._excludedDomains,
              _excludedDomains,
            ) &&
            (identical(other.wirelessInScope, wirelessInScope) ||
                other.wirelessInScope == wirelessInScope) &&
            (identical(other.wiredInScope, wiredInScope) ||
                other.wiredInScope == wiredInScope) &&
            (identical(
                  other.socialEngineeringInScope,
                  socialEngineeringInScope,
                ) ||
                other.socialEngineeringInScope == socialEngineeringInScope) &&
            (identical(other.physicalInScope, physicalInScope) ||
                other.physicalInScope == physicalInScope) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_targetNetworks),
    const DeepCollectionEquality().hash(_targetDomains),
    const DeepCollectionEquality().hash(_targetIps),
    const DeepCollectionEquality().hash(_targetSsids),
    const DeepCollectionEquality().hash(_excludedNetworks),
    const DeepCollectionEquality().hash(_excludedDomains),
    wirelessInScope,
    wiredInScope,
    socialEngineeringInScope,
    physicalInScope,
    notes,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScopeDefinitionImplCopyWith<_$ScopeDefinitionImpl> get copyWith =>
      __$$ScopeDefinitionImplCopyWithImpl<_$ScopeDefinitionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScopeDefinitionImplToJson(this);
  }
}

abstract class _ScopeDefinition implements ScopeDefinition {
  const factory _ScopeDefinition({
    final List<String> targetNetworks,
    final List<String> targetDomains,
    final List<String> targetIps,
    final List<String> targetSsids,
    final List<String> excludedNetworks,
    final List<String> excludedDomains,
    final bool wirelessInScope,
    final bool wiredInScope,
    final bool socialEngineeringInScope,
    final bool physicalInScope,
    final String notes,
  }) = _$ScopeDefinitionImpl;

  factory _ScopeDefinition.fromJson(Map<String, dynamic> json) =
      _$ScopeDefinitionImpl.fromJson;

  @override
  List<String> get targetNetworks;
  @override
  List<String> get targetDomains;
  @override
  List<String> get targetIps;
  @override
  List<String> get targetSsids;
  @override
  List<String> get excludedNetworks;
  @override
  List<String> get excludedDomains;
  @override
  bool get wirelessInScope;
  @override
  bool get wiredInScope;
  @override
  bool get socialEngineeringInScope;
  @override
  bool get physicalInScope;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$ScopeDefinitionImplCopyWith<_$ScopeDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return _Authorization.fromJson(json);
}

/// @nodoc
mixin _$Authorization {
  String get documentId => throw _privateConstructorUsedError;
  String get signedBy => throw _privateConstructorUsedError;
  DateTime get signedAt => throw _privateConstructorUsedError;
  DateTime get validFrom => throw _privateConstructorUsedError;
  DateTime get validUntil => throw _privateConstructorUsedError;
  List<TechniqueAuthorization> get techniques =>
      throw _privateConstructorUsedError;
  DataHandlingPolicy get dataPolicy => throw _privateConstructorUsedError;
  String? get legalEntityId => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorizationCopyWith<Authorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationCopyWith<$Res> {
  factory $AuthorizationCopyWith(
    Authorization value,
    $Res Function(Authorization) then,
  ) = _$AuthorizationCopyWithImpl<$Res, Authorization>;
  @useResult
  $Res call({
    String documentId,
    String signedBy,
    DateTime signedAt,
    DateTime validFrom,
    DateTime validUntil,
    List<TechniqueAuthorization> techniques,
    DataHandlingPolicy dataPolicy,
    String? legalEntityId,
    String notes,
    bool isVerified,
  });

  $DataHandlingPolicyCopyWith<$Res> get dataPolicy;
}

/// @nodoc
class _$AuthorizationCopyWithImpl<$Res, $Val extends Authorization>
    implements $AuthorizationCopyWith<$Res> {
  _$AuthorizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? signedBy = null,
    Object? signedAt = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? techniques = null,
    Object? dataPolicy = null,
    Object? legalEntityId = freezed,
    Object? notes = null,
    Object? isVerified = null,
  }) {
    return _then(
      _value.copyWith(
            documentId: null == documentId
                ? _value.documentId
                : documentId // ignore: cast_nullable_to_non_nullable
                      as String,
            signedBy: null == signedBy
                ? _value.signedBy
                : signedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            signedAt: null == signedAt
                ? _value.signedAt
                : signedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            validFrom: null == validFrom
                ? _value.validFrom
                : validFrom // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            validUntil: null == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            techniques: null == techniques
                ? _value.techniques
                : techniques // ignore: cast_nullable_to_non_nullable
                      as List<TechniqueAuthorization>,
            dataPolicy: null == dataPolicy
                ? _value.dataPolicy
                : dataPolicy // ignore: cast_nullable_to_non_nullable
                      as DataHandlingPolicy,
            legalEntityId: freezed == legalEntityId
                ? _value.legalEntityId
                : legalEntityId // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $DataHandlingPolicyCopyWith<$Res> get dataPolicy {
    return $DataHandlingPolicyCopyWith<$Res>(_value.dataPolicy, (value) {
      return _then(_value.copyWith(dataPolicy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthorizationImplCopyWith<$Res>
    implements $AuthorizationCopyWith<$Res> {
  factory _$$AuthorizationImplCopyWith(
    _$AuthorizationImpl value,
    $Res Function(_$AuthorizationImpl) then,
  ) = __$$AuthorizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String documentId,
    String signedBy,
    DateTime signedAt,
    DateTime validFrom,
    DateTime validUntil,
    List<TechniqueAuthorization> techniques,
    DataHandlingPolicy dataPolicy,
    String? legalEntityId,
    String notes,
    bool isVerified,
  });

  @override
  $DataHandlingPolicyCopyWith<$Res> get dataPolicy;
}

/// @nodoc
class __$$AuthorizationImplCopyWithImpl<$Res>
    extends _$AuthorizationCopyWithImpl<$Res, _$AuthorizationImpl>
    implements _$$AuthorizationImplCopyWith<$Res> {
  __$$AuthorizationImplCopyWithImpl(
    _$AuthorizationImpl _value,
    $Res Function(_$AuthorizationImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? signedBy = null,
    Object? signedAt = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? techniques = null,
    Object? dataPolicy = null,
    Object? legalEntityId = freezed,
    Object? notes = null,
    Object? isVerified = null,
  }) {
    return _then(
      _$AuthorizationImpl(
        documentId: null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                  as String,
        signedBy: null == signedBy
            ? _value.signedBy
            : signedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        signedAt: null == signedAt
            ? _value.signedAt
            : signedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        validFrom: null == validFrom
            ? _value.validFrom
            : validFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        validUntil: null == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        techniques: null == techniques
            ? _value._techniques
            : techniques // ignore: cast_nullable_to_non_nullable
                  as List<TechniqueAuthorization>,
        dataPolicy: null == dataPolicy
            ? _value.dataPolicy
            : dataPolicy // ignore: cast_nullable_to_non_nullable
                  as DataHandlingPolicy,
        legalEntityId: freezed == legalEntityId
            ? _value.legalEntityId
            : legalEntityId // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorizationImpl implements _Authorization {
  const _$AuthorizationImpl({
    required this.documentId,
    required this.signedBy,
    required this.signedAt,
    required this.validFrom,
    required this.validUntil,
    required final List<TechniqueAuthorization> techniques,
    required this.dataPolicy,
    required this.legalEntityId,
    this.notes = '',
    this.isVerified = false,
  }) : _techniques = techniques;

  factory _$AuthorizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorizationImplFromJson(json);

  @override
  final String documentId;
  @override
  final String signedBy;
  @override
  final DateTime signedAt;
  @override
  final DateTime validFrom;
  @override
  final DateTime validUntil;
  final List<TechniqueAuthorization> _techniques;
  @override
  List<TechniqueAuthorization> get techniques {
    if (_techniques is EqualUnmodifiableListView) return _techniques;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_techniques);
  }

  @override
  final DataHandlingPolicy dataPolicy;
  @override
  final String? legalEntityId;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'Authorization(documentId: $documentId, signedBy: $signedBy, signedAt: $signedAt, validFrom: $validFrom, validUntil: $validUntil, techniques: $techniques, dataPolicy: $dataPolicy, legalEntityId: $legalEntityId, notes: $notes, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.signedBy, signedBy) ||
                other.signedBy == signedBy) &&
            (identical(other.signedAt, signedAt) ||
                other.signedAt == signedAt) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality().equals(
              other._techniques,
              _techniques,
            ) &&
            (identical(other.dataPolicy, dataPolicy) ||
                other.dataPolicy == dataPolicy) &&
            (identical(other.legalEntityId, legalEntityId) ||
                other.legalEntityId == legalEntityId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    documentId,
    signedBy,
    signedAt,
    validFrom,
    validUntil,
    const DeepCollectionEquality().hash(_techniques),
    dataPolicy,
    legalEntityId,
    notes,
    isVerified,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationImplCopyWith<_$AuthorizationImpl> get copyWith =>
      __$$AuthorizationImplCopyWithImpl<_$AuthorizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorizationImplToJson(this);
  }
}

abstract class _Authorization implements Authorization {
  const factory _Authorization({
    required final String documentId,
    required final String signedBy,
    required final DateTime signedAt,
    required final DateTime validFrom,
    required final DateTime validUntil,
    required final List<TechniqueAuthorization> techniques,
    required final DataHandlingPolicy dataPolicy,
    required final String? legalEntityId,
    final String notes,
    final bool isVerified,
  }) = _$AuthorizationImpl;

  factory _Authorization.fromJson(Map<String, dynamic> json) =
      _$AuthorizationImpl.fromJson;

  @override
  String get documentId;
  @override
  String get signedBy;
  @override
  DateTime get signedAt;
  @override
  DateTime get validFrom;
  @override
  DateTime get validUntil;
  @override
  List<TechniqueAuthorization> get techniques;
  @override
  DataHandlingPolicy get dataPolicy;
  @override
  String? get legalEntityId;
  @override
  String get notes;
  @override
  bool get isVerified;
  @override
  @JsonKey(ignore: true)
  _$$AuthorizationImplCopyWith<_$AuthorizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TechniqueAuthorization _$TechniqueAuthorizationFromJson(
  Map<String, dynamic> json,
) {
  return _TechniqueAuthorization.fromJson(json);
}

/// @nodoc
mixin _$TechniqueAuthorization {
  String get techniqueId => throw _privateConstructorUsedError;
  TechniqueAction get action => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TechniqueAuthorizationCopyWith<TechniqueAuthorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechniqueAuthorizationCopyWith<$Res> {
  factory $TechniqueAuthorizationCopyWith(
    TechniqueAuthorization value,
    $Res Function(TechniqueAuthorization) then,
  ) = _$TechniqueAuthorizationCopyWithImpl<$Res, TechniqueAuthorization>;
  @useResult
  $Res call({String techniqueId, TechniqueAction action, String conditions});
}

/// @nodoc
class _$TechniqueAuthorizationCopyWithImpl<
  $Res,
  $Val extends TechniqueAuthorization
>
    implements $TechniqueAuthorizationCopyWith<$Res> {
  _$TechniqueAuthorizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techniqueId = null,
    Object? action = null,
    Object? conditions = null,
  }) {
    return _then(
      _value.copyWith(
            techniqueId: null == techniqueId
                ? _value.techniqueId
                : techniqueId // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as TechniqueAction,
            conditions: null == conditions
                ? _value.conditions
                : conditions // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TechniqueAuthorizationImplCopyWith<$Res>
    implements $TechniqueAuthorizationCopyWith<$Res> {
  factory _$$TechniqueAuthorizationImplCopyWith(
    _$TechniqueAuthorizationImpl value,
    $Res Function(_$TechniqueAuthorizationImpl) then,
  ) = __$$TechniqueAuthorizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String techniqueId, TechniqueAction action, String conditions});
}

/// @nodoc
class __$$TechniqueAuthorizationImplCopyWithImpl<$Res>
    extends
        _$TechniqueAuthorizationCopyWithImpl<$Res, _$TechniqueAuthorizationImpl>
    implements _$$TechniqueAuthorizationImplCopyWith<$Res> {
  __$$TechniqueAuthorizationImplCopyWithImpl(
    _$TechniqueAuthorizationImpl _value,
    $Res Function(_$TechniqueAuthorizationImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techniqueId = null,
    Object? action = null,
    Object? conditions = null,
  }) {
    return _then(
      _$TechniqueAuthorizationImpl(
        techniqueId: null == techniqueId
            ? _value.techniqueId
            : techniqueId // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as TechniqueAction,
        conditions: null == conditions
            ? _value.conditions
            : conditions // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TechniqueAuthorizationImpl implements _TechniqueAuthorization {
  const _$TechniqueAuthorizationImpl({
    required this.techniqueId,
    required this.action,
    this.conditions = '',
  });

  factory _$TechniqueAuthorizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechniqueAuthorizationImplFromJson(json);

  @override
  final String techniqueId;
  @override
  final TechniqueAction action;
  @override
  @JsonKey()
  final String conditions;

  @override
  String toString() {
    return 'TechniqueAuthorization(techniqueId: $techniqueId, action: $action, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechniqueAuthorizationImpl &&
            (identical(other.techniqueId, techniqueId) ||
                other.techniqueId == techniqueId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, techniqueId, action, conditions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TechniqueAuthorizationImplCopyWith<_$TechniqueAuthorizationImpl>
  get copyWith =>
      __$$TechniqueAuthorizationImplCopyWithImpl<_$TechniqueAuthorizationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TechniqueAuthorizationImplToJson(this);
  }
}

abstract class _TechniqueAuthorization implements TechniqueAuthorization {
  const factory _TechniqueAuthorization({
    required final String techniqueId,
    required final TechniqueAction action,
    final String conditions,
  }) = _$TechniqueAuthorizationImpl;

  factory _TechniqueAuthorization.fromJson(Map<String, dynamic> json) =
      _$TechniqueAuthorizationImpl.fromJson;

  @override
  String get techniqueId;
  @override
  TechniqueAction get action;
  @override
  String get conditions;
  @override
  @JsonKey(ignore: true)
  _$$TechniqueAuthorizationImplCopyWith<_$TechniqueAuthorizationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DataHandlingPolicy _$DataHandlingPolicyFromJson(Map<String, dynamic> json) {
  return _DataHandlingPolicy.fromJson(json);
}

/// @nodoc
mixin _$DataHandlingPolicy {
  int get retentionDays => throw _privateConstructorUsedError;
  bool get encryptAtRest => throw _privateConstructorUsedError;
  bool get encryptInTransit => throw _privateConstructorUsedError;
  bool get autoDeleteEvidence => throw _privateConstructorUsedError;
  List<String> get allowedExportFormats => throw _privateConstructorUsedError;
  String get jurisdiction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataHandlingPolicyCopyWith<DataHandlingPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataHandlingPolicyCopyWith<$Res> {
  factory $DataHandlingPolicyCopyWith(
    DataHandlingPolicy value,
    $Res Function(DataHandlingPolicy) then,
  ) = _$DataHandlingPolicyCopyWithImpl<$Res, DataHandlingPolicy>;
  @useResult
  $Res call({
    int retentionDays,
    bool encryptAtRest,
    bool encryptInTransit,
    bool autoDeleteEvidence,
    List<String> allowedExportFormats,
    String jurisdiction,
  });
}

/// @nodoc
class _$DataHandlingPolicyCopyWithImpl<$Res, $Val extends DataHandlingPolicy>
    implements $DataHandlingPolicyCopyWith<$Res> {
  _$DataHandlingPolicyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retentionDays = null,
    Object? encryptAtRest = null,
    Object? encryptInTransit = null,
    Object? autoDeleteEvidence = null,
    Object? allowedExportFormats = null,
    Object? jurisdiction = null,
  }) {
    return _then(
      _value.copyWith(
            retentionDays: null == retentionDays
                ? _value.retentionDays
                : retentionDays // ignore: cast_nullable_to_non_nullable
                      as int,
            encryptAtRest: null == encryptAtRest
                ? _value.encryptAtRest
                : encryptAtRest // ignore: cast_nullable_to_non_nullable
                      as bool,
            encryptInTransit: null == encryptInTransit
                ? _value.encryptInTransit
                : encryptInTransit // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoDeleteEvidence: null == autoDeleteEvidence
                ? _value.autoDeleteEvidence
                : autoDeleteEvidence // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowedExportFormats: null == allowedExportFormats
                ? _value.allowedExportFormats
                : allowedExportFormats // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            jurisdiction: null == jurisdiction
                ? _value.jurisdiction
                : jurisdiction // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DataHandlingPolicyImplCopyWith<$Res>
    implements $DataHandlingPolicyCopyWith<$Res> {
  factory _$$DataHandlingPolicyImplCopyWith(
    _$DataHandlingPolicyImpl value,
    $Res Function(_$DataHandlingPolicyImpl) then,
  ) = __$$DataHandlingPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int retentionDays,
    bool encryptAtRest,
    bool encryptInTransit,
    bool autoDeleteEvidence,
    List<String> allowedExportFormats,
    String jurisdiction,
  });
}

/// @nodoc
class __$$DataHandlingPolicyImplCopyWithImpl<$Res>
    extends _$DataHandlingPolicyCopyWithImpl<$Res, _$DataHandlingPolicyImpl>
    implements _$$DataHandlingPolicyImplCopyWith<$Res> {
  __$$DataHandlingPolicyImplCopyWithImpl(
    _$DataHandlingPolicyImpl _value,
    $Res Function(_$DataHandlingPolicyImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retentionDays = null,
    Object? encryptAtRest = null,
    Object? encryptInTransit = null,
    Object? autoDeleteEvidence = null,
    Object? allowedExportFormats = null,
    Object? jurisdiction = null,
  }) {
    return _then(
      _$DataHandlingPolicyImpl(
        retentionDays: null == retentionDays
            ? _value.retentionDays
            : retentionDays // ignore: cast_nullable_to_non_nullable
                  as int,
        encryptAtRest: null == encryptAtRest
            ? _value.encryptAtRest
            : encryptAtRest // ignore: cast_nullable_to_non_nullable
                  as bool,
        encryptInTransit: null == encryptInTransit
            ? _value.encryptInTransit
            : encryptInTransit // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoDeleteEvidence: null == autoDeleteEvidence
            ? _value.autoDeleteEvidence
            : autoDeleteEvidence // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowedExportFormats: null == allowedExportFormats
            ? _value._allowedExportFormats
            : allowedExportFormats // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        jurisdiction: null == jurisdiction
            ? _value.jurisdiction
            : jurisdiction // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DataHandlingPolicyImpl implements _DataHandlingPolicy {
  const _$DataHandlingPolicyImpl({
    required this.retentionDays,
    required this.encryptAtRest,
    required this.encryptInTransit,
    required this.autoDeleteEvidence,
    required final List<String> allowedExportFormats,
    this.jurisdiction = '',
  }) : _allowedExportFormats = allowedExportFormats;

  factory _$DataHandlingPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataHandlingPolicyImplFromJson(json);

  @override
  final int retentionDays;
  @override
  final bool encryptAtRest;
  @override
  final bool encryptInTransit;
  @override
  final bool autoDeleteEvidence;
  final List<String> _allowedExportFormats;
  @override
  List<String> get allowedExportFormats {
    if (_allowedExportFormats is EqualUnmodifiableListView)
      return _allowedExportFormats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedExportFormats);
  }

  @override
  @JsonKey()
  final String jurisdiction;

  @override
  String toString() {
    return 'DataHandlingPolicy(retentionDays: $retentionDays, encryptAtRest: $encryptAtRest, encryptInTransit: $encryptInTransit, autoDeleteEvidence: $autoDeleteEvidence, allowedExportFormats: $allowedExportFormats, jurisdiction: $jurisdiction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataHandlingPolicyImpl &&
            (identical(other.retentionDays, retentionDays) ||
                other.retentionDays == retentionDays) &&
            (identical(other.encryptAtRest, encryptAtRest) ||
                other.encryptAtRest == encryptAtRest) &&
            (identical(other.encryptInTransit, encryptInTransit) ||
                other.encryptInTransit == encryptInTransit) &&
            (identical(other.autoDeleteEvidence, autoDeleteEvidence) ||
                other.autoDeleteEvidence == autoDeleteEvidence) &&
            const DeepCollectionEquality().equals(
              other._allowedExportFormats,
              _allowedExportFormats,
            ) &&
            (identical(other.jurisdiction, jurisdiction) ||
                other.jurisdiction == jurisdiction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    retentionDays,
    encryptAtRest,
    encryptInTransit,
    autoDeleteEvidence,
    const DeepCollectionEquality().hash(_allowedExportFormats),
    jurisdiction,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataHandlingPolicyImplCopyWith<_$DataHandlingPolicyImpl> get copyWith =>
      __$$DataHandlingPolicyImplCopyWithImpl<_$DataHandlingPolicyImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DataHandlingPolicyImplToJson(this);
  }
}

abstract class _DataHandlingPolicy implements DataHandlingPolicy {
  const factory _DataHandlingPolicy({
    required final int retentionDays,
    required final bool encryptAtRest,
    required final bool encryptInTransit,
    required final bool autoDeleteEvidence,
    required final List<String> allowedExportFormats,
    final String jurisdiction,
  }) = _$DataHandlingPolicyImpl;

  factory _DataHandlingPolicy.fromJson(Map<String, dynamic> json) =
      _$DataHandlingPolicyImpl.fromJson;

  @override
  int get retentionDays;
  @override
  bool get encryptAtRest;
  @override
  bool get encryptInTransit;
  @override
  bool get autoDeleteEvidence;
  @override
  List<String> get allowedExportFormats;
  @override
  String get jurisdiction;
  @override
  @JsonKey(ignore: true)
  _$$DataHandlingPolicyImplCopyWith<_$DataHandlingPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectSettings _$ProjectSettingsFromJson(Map<String, dynamic> json) {
  return _ProjectSettings.fromJson(json);
}

/// @nodoc
mixin _$ProjectSettings {
  bool get autoGenerateReports => throw _privateConstructorUsedError;
  ReportFormat get defaultReportFormat => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  Map<String, dynamic> get pluginSettings => throw _privateConstructorUsedError;
  List<String> get enabledPlugins => throw _privateConstructorUsedError;
  Map<String, dynamic> get notificationSettings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectSettingsCopyWith<ProjectSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectSettingsCopyWith<$Res> {
  factory $ProjectSettingsCopyWith(
    ProjectSettings value,
    $Res Function(ProjectSettings) then,
  ) = _$ProjectSettingsCopyWithImpl<$Res, ProjectSettings>;
  @useResult
  $Res call({
    bool autoGenerateReports,
    ReportFormat defaultReportFormat,
    String language,
    String timezone,
    Map<String, dynamic> pluginSettings,
    List<String> enabledPlugins,
    Map<String, dynamic> notificationSettings,
  });
}

/// @nodoc
class _$ProjectSettingsCopyWithImpl<$Res, $Val extends ProjectSettings>
    implements $ProjectSettingsCopyWith<$Res> {
  _$ProjectSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoGenerateReports = null,
    Object? defaultReportFormat = null,
    Object? language = null,
    Object? timezone = null,
    Object? pluginSettings = null,
    Object? enabledPlugins = null,
    Object? notificationSettings = null,
  }) {
    return _then(
      _value.copyWith(
            autoGenerateReports: null == autoGenerateReports
                ? _value.autoGenerateReports
                : autoGenerateReports // ignore: cast_nullable_to_non_nullable
                      as bool,
            defaultReportFormat: null == defaultReportFormat
                ? _value.defaultReportFormat
                : defaultReportFormat // ignore: cast_nullable_to_non_nullable
                      as ReportFormat,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
            pluginSettings: null == pluginSettings
                ? _value.pluginSettings
                : pluginSettings // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            enabledPlugins: null == enabledPlugins
                ? _value.enabledPlugins
                : enabledPlugins // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            notificationSettings: null == notificationSettings
                ? _value.notificationSettings
                : notificationSettings // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectSettingsImplCopyWith<$Res>
    implements $ProjectSettingsCopyWith<$Res> {
  factory _$$ProjectSettingsImplCopyWith(
    _$ProjectSettingsImpl value,
    $Res Function(_$ProjectSettingsImpl) then,
  ) = __$$ProjectSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool autoGenerateReports,
    ReportFormat defaultReportFormat,
    String language,
    String timezone,
    Map<String, dynamic> pluginSettings,
    List<String> enabledPlugins,
    Map<String, dynamic> notificationSettings,
  });
}

/// @nodoc
class __$$ProjectSettingsImplCopyWithImpl<$Res>
    extends _$ProjectSettingsCopyWithImpl<$Res, _$ProjectSettingsImpl>
    implements _$$ProjectSettingsImplCopyWith<$Res> {
  __$$ProjectSettingsImplCopyWithImpl(
    _$ProjectSettingsImpl _value,
    $Res Function(_$ProjectSettingsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoGenerateReports = null,
    Object? defaultReportFormat = null,
    Object? language = null,
    Object? timezone = null,
    Object? pluginSettings = null,
    Object? enabledPlugins = null,
    Object? notificationSettings = null,
  }) {
    return _then(
      _$ProjectSettingsImpl(
        autoGenerateReports: null == autoGenerateReports
            ? _value.autoGenerateReports
            : autoGenerateReports // ignore: cast_nullable_to_non_nullable
                  as bool,
        defaultReportFormat: null == defaultReportFormat
            ? _value.defaultReportFormat
            : defaultReportFormat // ignore: cast_nullable_to_non_nullable
                  as ReportFormat,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        pluginSettings: null == pluginSettings
            ? _value._pluginSettings
            : pluginSettings // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        enabledPlugins: null == enabledPlugins
            ? _value._enabledPlugins
            : enabledPlugins // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        notificationSettings: null == notificationSettings
            ? _value._notificationSettings
            : notificationSettings // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectSettingsImpl implements _ProjectSettings {
  const _$ProjectSettingsImpl({
    this.autoGenerateReports = true,
    this.defaultReportFormat = ReportFormat.pdf,
    this.language = 'en',
    this.timezone = 'UTC',
    final Map<String, dynamic> pluginSettings = const {},
    final List<String> enabledPlugins = const [],
    final Map<String, dynamic> notificationSettings = const {},
  }) : _pluginSettings = pluginSettings,
       _enabledPlugins = enabledPlugins,
       _notificationSettings = notificationSettings;

  factory _$ProjectSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool autoGenerateReports;
  @override
  @JsonKey()
  final ReportFormat defaultReportFormat;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final String timezone;
  final Map<String, dynamic> _pluginSettings;
  @override
  @JsonKey()
  Map<String, dynamic> get pluginSettings {
    if (_pluginSettings is EqualUnmodifiableMapView) return _pluginSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pluginSettings);
  }

  final List<String> _enabledPlugins;
  @override
  @JsonKey()
  List<String> get enabledPlugins {
    if (_enabledPlugins is EqualUnmodifiableListView) return _enabledPlugins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabledPlugins);
  }

  final Map<String, dynamic> _notificationSettings;
  @override
  @JsonKey()
  Map<String, dynamic> get notificationSettings {
    if (_notificationSettings is EqualUnmodifiableMapView)
      return _notificationSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notificationSettings);
  }

  @override
  String toString() {
    return 'ProjectSettings(autoGenerateReports: $autoGenerateReports, defaultReportFormat: $defaultReportFormat, language: $language, timezone: $timezone, pluginSettings: $pluginSettings, enabledPlugins: $enabledPlugins, notificationSettings: $notificationSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectSettingsImpl &&
            (identical(other.autoGenerateReports, autoGenerateReports) ||
                other.autoGenerateReports == autoGenerateReports) &&
            (identical(other.defaultReportFormat, defaultReportFormat) ||
                other.defaultReportFormat == defaultReportFormat) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(
              other._pluginSettings,
              _pluginSettings,
            ) &&
            const DeepCollectionEquality().equals(
              other._enabledPlugins,
              _enabledPlugins,
            ) &&
            const DeepCollectionEquality().equals(
              other._notificationSettings,
              _notificationSettings,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    autoGenerateReports,
    defaultReportFormat,
    language,
    timezone,
    const DeepCollectionEquality().hash(_pluginSettings),
    const DeepCollectionEquality().hash(_enabledPlugins),
    const DeepCollectionEquality().hash(_notificationSettings),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectSettingsImplCopyWith<_$ProjectSettingsImpl> get copyWith =>
      __$$ProjectSettingsImplCopyWithImpl<_$ProjectSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectSettingsImplToJson(this);
  }
}

abstract class _ProjectSettings implements ProjectSettings {
  const factory _ProjectSettings({
    final bool autoGenerateReports,
    final ReportFormat defaultReportFormat,
    final String language,
    final String timezone,
    final Map<String, dynamic> pluginSettings,
    final List<String> enabledPlugins,
    final Map<String, dynamic> notificationSettings,
  }) = _$ProjectSettingsImpl;

  factory _ProjectSettings.fromJson(Map<String, dynamic> json) =
      _$ProjectSettingsImpl.fromJson;

  @override
  bool get autoGenerateReports;
  @override
  ReportFormat get defaultReportFormat;
  @override
  String get language;
  @override
  String get timezone;
  @override
  Map<String, dynamic> get pluginSettings;
  @override
  List<String> get enabledPlugins;
  @override
  Map<String, dynamic> get notificationSettings;
  @override
  @JsonKey(ignore: true)
  _$$ProjectSettingsImplCopyWith<_$ProjectSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
