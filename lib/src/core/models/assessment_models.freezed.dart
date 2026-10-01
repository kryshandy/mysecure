// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return _Assessment.fromJson(json);
}

/// @nodoc
mixin _$Assessment {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AssessmentType get type => throw _privateConstructorUsedError;
  AssessmentStatus get status => throw _privateConstructorUsedError;
  AssessmentScope get scope => throw _privateConstructorUsedError;
  AssessmentConfig get config => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get pausedAt => throw _privateConstructorUsedError;
  Duration get totalDuration => throw _privateConstructorUsedError;
  AssessmentProgress get progress => throw _privateConstructorUsedError;
  List<AssessmentPhase> get phases => throw _privateConstructorUsedError;
  List<String> get findingIds => throw _privateConstructorUsedError;
  List<String> get evidenceIds => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  String? get assignedTo => throw _privateConstructorUsedError;
  String? get parentAssessmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentCopyWith<Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentCopyWith<$Res> {
  factory $AssessmentCopyWith(
    Assessment value,
    $Res Function(Assessment) then,
  ) = _$AssessmentCopyWithImpl<$Res, Assessment>;
  @useResult
  $Res call({
    String id,
    String projectId,
    String name,
    AssessmentType type,
    AssessmentStatus status,
    AssessmentScope scope,
    AssessmentConfig config,
    DateTime createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? pausedAt,
    Duration totalDuration,
    AssessmentProgress progress,
    List<AssessmentPhase> phases,
    List<String> findingIds,
    List<String> evidenceIds,
    Map<String, dynamic> metadata,
    String? assignedTo,
    String? parentAssessmentId,
  });

  $AssessmentScopeCopyWith<$Res> get scope;
  $AssessmentConfigCopyWith<$Res> get config;
  $AssessmentProgressCopyWith<$Res> get progress;
}

/// @nodoc
class _$AssessmentCopyWithImpl<$Res, $Val extends Assessment>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? scope = null,
    Object? config = null,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? pausedAt = freezed,
    Object? totalDuration = null,
    Object? progress = null,
    Object? phases = null,
    Object? findingIds = null,
    Object? evidenceIds = null,
    Object? metadata = null,
    Object? assignedTo = freezed,
    Object? parentAssessmentId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AssessmentType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AssessmentStatus,
            scope: null == scope
                ? _value.scope
                : scope // ignore: cast_nullable_to_non_nullable
                      as AssessmentScope,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as AssessmentConfig,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            pausedAt: freezed == pausedAt
                ? _value.pausedAt
                : pausedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            totalDuration: null == totalDuration
                ? _value.totalDuration
                : totalDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as AssessmentProgress,
            phases: null == phases
                ? _value.phases
                : phases // ignore: cast_nullable_to_non_nullable
                      as List<AssessmentPhase>,
            findingIds: null == findingIds
                ? _value.findingIds
                : findingIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            evidenceIds: null == evidenceIds
                ? _value.evidenceIds
                : evidenceIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as String?,
            parentAssessmentId: freezed == parentAssessmentId
                ? _value.parentAssessmentId
                : parentAssessmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $AssessmentScopeCopyWith<$Res> get scope {
    return $AssessmentScopeCopyWith<$Res>(_value.scope, (value) {
      return _then(_value.copyWith(scope: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssessmentConfigCopyWith<$Res> get config {
    return $AssessmentConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssessmentProgressCopyWith<$Res> get progress {
    return $AssessmentProgressCopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentImplCopyWith<$Res>
    implements $AssessmentCopyWith<$Res> {
  factory _$$AssessmentImplCopyWith(
    _$AssessmentImpl value,
    $Res Function(_$AssessmentImpl) then,
  ) = __$$AssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String projectId,
    String name,
    AssessmentType type,
    AssessmentStatus status,
    AssessmentScope scope,
    AssessmentConfig config,
    DateTime createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? pausedAt,
    Duration totalDuration,
    AssessmentProgress progress,
    List<AssessmentPhase> phases,
    List<String> findingIds,
    List<String> evidenceIds,
    Map<String, dynamic> metadata,
    String? assignedTo,
    String? parentAssessmentId,
  });

  @override
  $AssessmentScopeCopyWith<$Res> get scope;
  @override
  $AssessmentConfigCopyWith<$Res> get config;
  @override
  $AssessmentProgressCopyWith<$Res> get progress;
}

/// @nodoc
class __$$AssessmentImplCopyWithImpl<$Res>
    extends _$AssessmentCopyWithImpl<$Res, _$AssessmentImpl>
    implements _$$AssessmentImplCopyWith<$Res> {
  __$$AssessmentImplCopyWithImpl(
    _$AssessmentImpl _value,
    $Res Function(_$AssessmentImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? scope = null,
    Object? config = null,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? pausedAt = freezed,
    Object? totalDuration = null,
    Object? progress = null,
    Object? phases = null,
    Object? findingIds = null,
    Object? evidenceIds = null,
    Object? metadata = null,
    Object? assignedTo = freezed,
    Object? parentAssessmentId = freezed,
  }) {
    return _then(
      _$AssessmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AssessmentType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AssessmentStatus,
        scope: null == scope
            ? _value.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as AssessmentScope,
        config: null == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as AssessmentConfig,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pausedAt: freezed == pausedAt
            ? _value.pausedAt
            : pausedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        totalDuration: null == totalDuration
            ? _value.totalDuration
            : totalDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as AssessmentProgress,
        phases: null == phases
            ? _value._phases
            : phases // ignore: cast_nullable_to_non_nullable
                  as List<AssessmentPhase>,
        findingIds: null == findingIds
            ? _value._findingIds
            : findingIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        evidenceIds: null == evidenceIds
            ? _value._evidenceIds
            : evidenceIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as String?,
        parentAssessmentId: freezed == parentAssessmentId
            ? _value.parentAssessmentId
            : parentAssessmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentImpl implements _Assessment {
  const _$AssessmentImpl({
    required this.id,
    required this.projectId,
    required this.name,
    required this.type,
    required this.status,
    required this.scope,
    required this.config,
    required this.createdAt,
    required this.startedAt,
    required this.completedAt,
    required this.pausedAt,
    this.totalDuration = Duration.zero,
    this.progress = const AssessmentProgress(),
    final List<AssessmentPhase> phases = const [],
    final List<String> findingIds = const [],
    final List<String> evidenceIds = const [],
    final Map<String, dynamic> metadata = const {},
    this.assignedTo,
    this.parentAssessmentId,
  }) : _phases = phases,
       _findingIds = findingIds,
       _evidenceIds = evidenceIds,
       _metadata = metadata;

  factory _$AssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String name;
  @override
  final AssessmentType type;
  @override
  final AssessmentStatus status;
  @override
  final AssessmentScope scope;
  @override
  final AssessmentConfig config;
  @override
  final DateTime createdAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? pausedAt;
  @override
  @JsonKey()
  final Duration totalDuration;
  @override
  @JsonKey()
  final AssessmentProgress progress;
  final List<AssessmentPhase> _phases;
  @override
  @JsonKey()
  List<AssessmentPhase> get phases {
    if (_phases is EqualUnmodifiableListView) return _phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phases);
  }

  final List<String> _findingIds;
  @override
  @JsonKey()
  List<String> get findingIds {
    if (_findingIds is EqualUnmodifiableListView) return _findingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_findingIds);
  }

  final List<String> _evidenceIds;
  @override
  @JsonKey()
  List<String> get evidenceIds {
    if (_evidenceIds is EqualUnmodifiableListView) return _evidenceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceIds);
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
  final String? assignedTo;
  @override
  final String? parentAssessmentId;

  @override
  String toString() {
    return 'Assessment(id: $id, projectId: $projectId, name: $name, type: $type, status: $status, scope: $scope, config: $config, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, pausedAt: $pausedAt, totalDuration: $totalDuration, progress: $progress, phases: $phases, findingIds: $findingIds, evidenceIds: $evidenceIds, metadata: $metadata, assignedTo: $assignedTo, parentAssessmentId: $parentAssessmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.pausedAt, pausedAt) ||
                other.pausedAt == pausedAt) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality().equals(other._phases, _phases) &&
            const DeepCollectionEquality().equals(
              other._findingIds,
              _findingIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._evidenceIds,
              _evidenceIds,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.parentAssessmentId, parentAssessmentId) ||
                other.parentAssessmentId == parentAssessmentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    projectId,
    name,
    type,
    status,
    scope,
    config,
    createdAt,
    startedAt,
    completedAt,
    pausedAt,
    totalDuration,
    progress,
    const DeepCollectionEquality().hash(_phases),
    const DeepCollectionEquality().hash(_findingIds),
    const DeepCollectionEquality().hash(_evidenceIds),
    const DeepCollectionEquality().hash(_metadata),
    assignedTo,
    parentAssessmentId,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      __$$AssessmentImplCopyWithImpl<_$AssessmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentImplToJson(this);
  }
}

abstract class _Assessment implements Assessment {
  const factory _Assessment({
    required final String id,
    required final String projectId,
    required final String name,
    required final AssessmentType type,
    required final AssessmentStatus status,
    required final AssessmentScope scope,
    required final AssessmentConfig config,
    required final DateTime createdAt,
    required final DateTime? startedAt,
    required final DateTime? completedAt,
    required final DateTime? pausedAt,
    final Duration totalDuration,
    final AssessmentProgress progress,
    final List<AssessmentPhase> phases,
    final List<String> findingIds,
    final List<String> evidenceIds,
    final Map<String, dynamic> metadata,
    final String? assignedTo,
    final String? parentAssessmentId,
  }) = _$AssessmentImpl;

  factory _Assessment.fromJson(Map<String, dynamic> json) =
      _$AssessmentImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get name;
  @override
  AssessmentType get type;
  @override
  AssessmentStatus get status;
  @override
  AssessmentScope get scope;
  @override
  AssessmentConfig get config;
  @override
  DateTime get createdAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get pausedAt;
  @override
  Duration get totalDuration;
  @override
  AssessmentProgress get progress;
  @override
  List<AssessmentPhase> get phases;
  @override
  List<String> get findingIds;
  @override
  List<String> get evidenceIds;
  @override
  Map<String, dynamic> get metadata;
  @override
  String? get assignedTo;
  @override
  String? get parentAssessmentId;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentImplCopyWith<_$AssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentScope _$AssessmentScopeFromJson(Map<String, dynamic> json) {
  return _AssessmentScope.fromJson(json);
}

/// @nodoc
mixin _$AssessmentScope {
  List<String> get targetBssids => throw _privateConstructorUsedError;
  List<String> get targetSsids => throw _privateConstructorUsedError;
  List<String> get targetNetworks => throw _privateConstructorUsedError;
  List<String> get targetDomains => throw _privateConstructorUsedError;
  List<String> get targetUrls => throw _privateConstructorUsedError;
  List<String> get targetIps => throw _privateConstructorUsedError;
  List<int> get targetPorts => throw _privateConstructorUsedError;
  List<String> get excludedTargets => throw _privateConstructorUsedError;
  bool get includeWireless => throw _privateConstructorUsedError;
  bool get includeWired => throw _privateConstructorUsedError;
  bool get includeBluetooth => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentScopeCopyWith<AssessmentScope> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentScopeCopyWith<$Res> {
  factory $AssessmentScopeCopyWith(
    AssessmentScope value,
    $Res Function(AssessmentScope) then,
  ) = _$AssessmentScopeCopyWithImpl<$Res, AssessmentScope>;
  @useResult
  $Res call({
    List<String> targetBssids,
    List<String> targetSsids,
    List<String> targetNetworks,
    List<String> targetDomains,
    List<String> targetUrls,
    List<String> targetIps,
    List<int> targetPorts,
    List<String> excludedTargets,
    bool includeWireless,
    bool includeWired,
    bool includeBluetooth,
    String notes,
  });
}

/// @nodoc
class _$AssessmentScopeCopyWithImpl<$Res, $Val extends AssessmentScope>
    implements $AssessmentScopeCopyWith<$Res> {
  _$AssessmentScopeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetBssids = null,
    Object? targetSsids = null,
    Object? targetNetworks = null,
    Object? targetDomains = null,
    Object? targetUrls = null,
    Object? targetIps = null,
    Object? targetPorts = null,
    Object? excludedTargets = null,
    Object? includeWireless = null,
    Object? includeWired = null,
    Object? includeBluetooth = null,
    Object? notes = null,
  }) {
    return _then(
      _value.copyWith(
            targetBssids: null == targetBssids
                ? _value.targetBssids
                : targetBssids // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetSsids: null == targetSsids
                ? _value.targetSsids
                : targetSsids // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetNetworks: null == targetNetworks
                ? _value.targetNetworks
                : targetNetworks // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetDomains: null == targetDomains
                ? _value.targetDomains
                : targetDomains // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetUrls: null == targetUrls
                ? _value.targetUrls
                : targetUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetIps: null == targetIps
                ? _value.targetIps
                : targetIps // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetPorts: null == targetPorts
                ? _value.targetPorts
                : targetPorts // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            excludedTargets: null == excludedTargets
                ? _value.excludedTargets
                : excludedTargets // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            includeWireless: null == includeWireless
                ? _value.includeWireless
                : includeWireless // ignore: cast_nullable_to_non_nullable
                      as bool,
            includeWired: null == includeWired
                ? _value.includeWired
                : includeWired // ignore: cast_nullable_to_non_nullable
                      as bool,
            includeBluetooth: null == includeBluetooth
                ? _value.includeBluetooth
                : includeBluetooth // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AssessmentScopeImplCopyWith<$Res>
    implements $AssessmentScopeCopyWith<$Res> {
  factory _$$AssessmentScopeImplCopyWith(
    _$AssessmentScopeImpl value,
    $Res Function(_$AssessmentScopeImpl) then,
  ) = __$$AssessmentScopeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> targetBssids,
    List<String> targetSsids,
    List<String> targetNetworks,
    List<String> targetDomains,
    List<String> targetUrls,
    List<String> targetIps,
    List<int> targetPorts,
    List<String> excludedTargets,
    bool includeWireless,
    bool includeWired,
    bool includeBluetooth,
    String notes,
  });
}

/// @nodoc
class __$$AssessmentScopeImplCopyWithImpl<$Res>
    extends _$AssessmentScopeCopyWithImpl<$Res, _$AssessmentScopeImpl>
    implements _$$AssessmentScopeImplCopyWith<$Res> {
  __$$AssessmentScopeImplCopyWithImpl(
    _$AssessmentScopeImpl _value,
    $Res Function(_$AssessmentScopeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetBssids = null,
    Object? targetSsids = null,
    Object? targetNetworks = null,
    Object? targetDomains = null,
    Object? targetUrls = null,
    Object? targetIps = null,
    Object? targetPorts = null,
    Object? excludedTargets = null,
    Object? includeWireless = null,
    Object? includeWired = null,
    Object? includeBluetooth = null,
    Object? notes = null,
  }) {
    return _then(
      _$AssessmentScopeImpl(
        targetBssids: null == targetBssids
            ? _value._targetBssids
            : targetBssids // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetSsids: null == targetSsids
            ? _value._targetSsids
            : targetSsids // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetNetworks: null == targetNetworks
            ? _value._targetNetworks
            : targetNetworks // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetDomains: null == targetDomains
            ? _value._targetDomains
            : targetDomains // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetUrls: null == targetUrls
            ? _value._targetUrls
            : targetUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetIps: null == targetIps
            ? _value._targetIps
            : targetIps // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetPorts: null == targetPorts
            ? _value._targetPorts
            : targetPorts // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        excludedTargets: null == excludedTargets
            ? _value._excludedTargets
            : excludedTargets // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        includeWireless: null == includeWireless
            ? _value.includeWireless
            : includeWireless // ignore: cast_nullable_to_non_nullable
                  as bool,
        includeWired: null == includeWired
            ? _value.includeWired
            : includeWired // ignore: cast_nullable_to_non_nullable
                  as bool,
        includeBluetooth: null == includeBluetooth
            ? _value.includeBluetooth
            : includeBluetooth // ignore: cast_nullable_to_non_nullable
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
class _$AssessmentScopeImpl implements _AssessmentScope {
  const _$AssessmentScopeImpl({
    final List<String> targetBssids = const [],
    final List<String> targetSsids = const [],
    final List<String> targetNetworks = const [],
    final List<String> targetDomains = const [],
    final List<String> targetUrls = const [],
    final List<String> targetIps = const [],
    final List<int> targetPorts = const [],
    final List<String> excludedTargets = const [],
    this.includeWireless = true,
    this.includeWired = false,
    this.includeBluetooth = false,
    this.notes = '',
  }) : _targetBssids = targetBssids,
       _targetSsids = targetSsids,
       _targetNetworks = targetNetworks,
       _targetDomains = targetDomains,
       _targetUrls = targetUrls,
       _targetIps = targetIps,
       _targetPorts = targetPorts,
       _excludedTargets = excludedTargets;

  factory _$AssessmentScopeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentScopeImplFromJson(json);

  final List<String> _targetBssids;
  @override
  @JsonKey()
  List<String> get targetBssids {
    if (_targetBssids is EqualUnmodifiableListView) return _targetBssids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetBssids);
  }

  final List<String> _targetSsids;
  @override
  @JsonKey()
  List<String> get targetSsids {
    if (_targetSsids is EqualUnmodifiableListView) return _targetSsids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetSsids);
  }

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

  final List<String> _targetUrls;
  @override
  @JsonKey()
  List<String> get targetUrls {
    if (_targetUrls is EqualUnmodifiableListView) return _targetUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetUrls);
  }

  final List<String> _targetIps;
  @override
  @JsonKey()
  List<String> get targetIps {
    if (_targetIps is EqualUnmodifiableListView) return _targetIps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetIps);
  }

  final List<int> _targetPorts;
  @override
  @JsonKey()
  List<int> get targetPorts {
    if (_targetPorts is EqualUnmodifiableListView) return _targetPorts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetPorts);
  }

  final List<String> _excludedTargets;
  @override
  @JsonKey()
  List<String> get excludedTargets {
    if (_excludedTargets is EqualUnmodifiableListView) return _excludedTargets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedTargets);
  }

  @override
  @JsonKey()
  final bool includeWireless;
  @override
  @JsonKey()
  final bool includeWired;
  @override
  @JsonKey()
  final bool includeBluetooth;
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'AssessmentScope(targetBssids: $targetBssids, targetSsids: $targetSsids, targetNetworks: $targetNetworks, targetDomains: $targetDomains, targetUrls: $targetUrls, targetIps: $targetIps, targetPorts: $targetPorts, excludedTargets: $excludedTargets, includeWireless: $includeWireless, includeWired: $includeWired, includeBluetooth: $includeBluetooth, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentScopeImpl &&
            const DeepCollectionEquality().equals(
              other._targetBssids,
              _targetBssids,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetSsids,
              _targetSsids,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetNetworks,
              _targetNetworks,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetDomains,
              _targetDomains,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetUrls,
              _targetUrls,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetIps,
              _targetIps,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetPorts,
              _targetPorts,
            ) &&
            const DeepCollectionEquality().equals(
              other._excludedTargets,
              _excludedTargets,
            ) &&
            (identical(other.includeWireless, includeWireless) ||
                other.includeWireless == includeWireless) &&
            (identical(other.includeWired, includeWired) ||
                other.includeWired == includeWired) &&
            (identical(other.includeBluetooth, includeBluetooth) ||
                other.includeBluetooth == includeBluetooth) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_targetBssids),
    const DeepCollectionEquality().hash(_targetSsids),
    const DeepCollectionEquality().hash(_targetNetworks),
    const DeepCollectionEquality().hash(_targetDomains),
    const DeepCollectionEquality().hash(_targetUrls),
    const DeepCollectionEquality().hash(_targetIps),
    const DeepCollectionEquality().hash(_targetPorts),
    const DeepCollectionEquality().hash(_excludedTargets),
    includeWireless,
    includeWired,
    includeBluetooth,
    notes,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentScopeImplCopyWith<_$AssessmentScopeImpl> get copyWith =>
      __$$AssessmentScopeImplCopyWithImpl<_$AssessmentScopeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentScopeImplToJson(this);
  }
}

abstract class _AssessmentScope implements AssessmentScope {
  const factory _AssessmentScope({
    final List<String> targetBssids,
    final List<String> targetSsids,
    final List<String> targetNetworks,
    final List<String> targetDomains,
    final List<String> targetUrls,
    final List<String> targetIps,
    final List<int> targetPorts,
    final List<String> excludedTargets,
    final bool includeWireless,
    final bool includeWired,
    final bool includeBluetooth,
    final String notes,
  }) = _$AssessmentScopeImpl;

  factory _AssessmentScope.fromJson(Map<String, dynamic> json) =
      _$AssessmentScopeImpl.fromJson;

  @override
  List<String> get targetBssids;
  @override
  List<String> get targetSsids;
  @override
  List<String> get targetNetworks;
  @override
  List<String> get targetDomains;
  @override
  List<String> get targetUrls;
  @override
  List<String> get targetIps;
  @override
  List<int> get targetPorts;
  @override
  List<String> get excludedTargets;
  @override
  bool get includeWireless;
  @override
  bool get includeWired;
  @override
  bool get includeBluetooth;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentScopeImplCopyWith<_$AssessmentScopeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentConfig _$AssessmentConfigFromJson(Map<String, dynamic> json) {
  return _AssessmentConfig.fromJson(json);
}

/// @nodoc
mixin _$AssessmentConfig {
  Map<String, dynamic> get pluginConfigs => throw _privateConstructorUsedError;
  int get maxConcurrentTasks => throw _privateConstructorUsedError;
  int get timeoutSeconds => throw _privateConstructorUsedError;
  bool get continueOnError => throw _privateConstructorUsedError;
  bool get captureEvidence => throw _privateConstructorUsedError;
  bool get realTimeUpdates => throw _privateConstructorUsedError;
  LogLevel get logLevel => throw _privateConstructorUsedError;
  Map<String, dynamic> get customParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentConfigCopyWith<AssessmentConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentConfigCopyWith<$Res> {
  factory $AssessmentConfigCopyWith(
    AssessmentConfig value,
    $Res Function(AssessmentConfig) then,
  ) = _$AssessmentConfigCopyWithImpl<$Res, AssessmentConfig>;
  @useResult
  $Res call({
    Map<String, dynamic> pluginConfigs,
    int maxConcurrentTasks,
    int timeoutSeconds,
    bool continueOnError,
    bool captureEvidence,
    bool realTimeUpdates,
    LogLevel logLevel,
    Map<String, dynamic> customParams,
  });
}

/// @nodoc
class _$AssessmentConfigCopyWithImpl<$Res, $Val extends AssessmentConfig>
    implements $AssessmentConfigCopyWith<$Res> {
  _$AssessmentConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pluginConfigs = null,
    Object? maxConcurrentTasks = null,
    Object? timeoutSeconds = null,
    Object? continueOnError = null,
    Object? captureEvidence = null,
    Object? realTimeUpdates = null,
    Object? logLevel = null,
    Object? customParams = null,
  }) {
    return _then(
      _value.copyWith(
            pluginConfigs: null == pluginConfigs
                ? _value.pluginConfigs
                : pluginConfigs // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            maxConcurrentTasks: null == maxConcurrentTasks
                ? _value.maxConcurrentTasks
                : maxConcurrentTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            timeoutSeconds: null == timeoutSeconds
                ? _value.timeoutSeconds
                : timeoutSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            continueOnError: null == continueOnError
                ? _value.continueOnError
                : continueOnError // ignore: cast_nullable_to_non_nullable
                      as bool,
            captureEvidence: null == captureEvidence
                ? _value.captureEvidence
                : captureEvidence // ignore: cast_nullable_to_non_nullable
                      as bool,
            realTimeUpdates: null == realTimeUpdates
                ? _value.realTimeUpdates
                : realTimeUpdates // ignore: cast_nullable_to_non_nullable
                      as bool,
            logLevel: null == logLevel
                ? _value.logLevel
                : logLevel // ignore: cast_nullable_to_non_nullable
                      as LogLevel,
            customParams: null == customParams
                ? _value.customParams
                : customParams // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssessmentConfigImplCopyWith<$Res>
    implements $AssessmentConfigCopyWith<$Res> {
  factory _$$AssessmentConfigImplCopyWith(
    _$AssessmentConfigImpl value,
    $Res Function(_$AssessmentConfigImpl) then,
  ) = __$$AssessmentConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, dynamic> pluginConfigs,
    int maxConcurrentTasks,
    int timeoutSeconds,
    bool continueOnError,
    bool captureEvidence,
    bool realTimeUpdates,
    LogLevel logLevel,
    Map<String, dynamic> customParams,
  });
}

/// @nodoc
class __$$AssessmentConfigImplCopyWithImpl<$Res>
    extends _$AssessmentConfigCopyWithImpl<$Res, _$AssessmentConfigImpl>
    implements _$$AssessmentConfigImplCopyWith<$Res> {
  __$$AssessmentConfigImplCopyWithImpl(
    _$AssessmentConfigImpl _value,
    $Res Function(_$AssessmentConfigImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pluginConfigs = null,
    Object? maxConcurrentTasks = null,
    Object? timeoutSeconds = null,
    Object? continueOnError = null,
    Object? captureEvidence = null,
    Object? realTimeUpdates = null,
    Object? logLevel = null,
    Object? customParams = null,
  }) {
    return _then(
      _$AssessmentConfigImpl(
        pluginConfigs: null == pluginConfigs
            ? _value._pluginConfigs
            : pluginConfigs // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        maxConcurrentTasks: null == maxConcurrentTasks
            ? _value.maxConcurrentTasks
            : maxConcurrentTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        timeoutSeconds: null == timeoutSeconds
            ? _value.timeoutSeconds
            : timeoutSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        continueOnError: null == continueOnError
            ? _value.continueOnError
            : continueOnError // ignore: cast_nullable_to_non_nullable
                  as bool,
        captureEvidence: null == captureEvidence
            ? _value.captureEvidence
            : captureEvidence // ignore: cast_nullable_to_non_nullable
                  as bool,
        realTimeUpdates: null == realTimeUpdates
            ? _value.realTimeUpdates
            : realTimeUpdates // ignore: cast_nullable_to_non_nullable
                  as bool,
        logLevel: null == logLevel
            ? _value.logLevel
            : logLevel // ignore: cast_nullable_to_non_nullable
                  as LogLevel,
        customParams: null == customParams
            ? _value._customParams
            : customParams // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentConfigImpl implements _AssessmentConfig {
  const _$AssessmentConfigImpl({
    final Map<String, dynamic> pluginConfigs = const {},
    this.maxConcurrentTasks = 5,
    this.timeoutSeconds = 3600,
    this.continueOnError = true,
    this.captureEvidence = true,
    this.realTimeUpdates = true,
    this.logLevel = LogLevel.info,
    final Map<String, dynamic> customParams = const {},
  }) : _pluginConfigs = pluginConfigs,
       _customParams = customParams;

  factory _$AssessmentConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentConfigImplFromJson(json);

  final Map<String, dynamic> _pluginConfigs;
  @override
  @JsonKey()
  Map<String, dynamic> get pluginConfigs {
    if (_pluginConfigs is EqualUnmodifiableMapView) return _pluginConfigs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pluginConfigs);
  }

  @override
  @JsonKey()
  final int maxConcurrentTasks;
  @override
  @JsonKey()
  final int timeoutSeconds;
  @override
  @JsonKey()
  final bool continueOnError;
  @override
  @JsonKey()
  final bool captureEvidence;
  @override
  @JsonKey()
  final bool realTimeUpdates;
  @override
  @JsonKey()
  final LogLevel logLevel;
  final Map<String, dynamic> _customParams;
  @override
  @JsonKey()
  Map<String, dynamic> get customParams {
    if (_customParams is EqualUnmodifiableMapView) return _customParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customParams);
  }

  @override
  String toString() {
    return 'AssessmentConfig(pluginConfigs: $pluginConfigs, maxConcurrentTasks: $maxConcurrentTasks, timeoutSeconds: $timeoutSeconds, continueOnError: $continueOnError, captureEvidence: $captureEvidence, realTimeUpdates: $realTimeUpdates, logLevel: $logLevel, customParams: $customParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentConfigImpl &&
            const DeepCollectionEquality().equals(
              other._pluginConfigs,
              _pluginConfigs,
            ) &&
            (identical(other.maxConcurrentTasks, maxConcurrentTasks) ||
                other.maxConcurrentTasks == maxConcurrentTasks) &&
            (identical(other.timeoutSeconds, timeoutSeconds) ||
                other.timeoutSeconds == timeoutSeconds) &&
            (identical(other.continueOnError, continueOnError) ||
                other.continueOnError == continueOnError) &&
            (identical(other.captureEvidence, captureEvidence) ||
                other.captureEvidence == captureEvidence) &&
            (identical(other.realTimeUpdates, realTimeUpdates) ||
                other.realTimeUpdates == realTimeUpdates) &&
            (identical(other.logLevel, logLevel) ||
                other.logLevel == logLevel) &&
            const DeepCollectionEquality().equals(
              other._customParams,
              _customParams,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pluginConfigs),
    maxConcurrentTasks,
    timeoutSeconds,
    continueOnError,
    captureEvidence,
    realTimeUpdates,
    logLevel,
    const DeepCollectionEquality().hash(_customParams),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentConfigImplCopyWith<_$AssessmentConfigImpl> get copyWith =>
      __$$AssessmentConfigImplCopyWithImpl<_$AssessmentConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentConfigImplToJson(this);
  }
}

abstract class _AssessmentConfig implements AssessmentConfig {
  const factory _AssessmentConfig({
    final Map<String, dynamic> pluginConfigs,
    final int maxConcurrentTasks,
    final int timeoutSeconds,
    final bool continueOnError,
    final bool captureEvidence,
    final bool realTimeUpdates,
    final LogLevel logLevel,
    final Map<String, dynamic> customParams,
  }) = _$AssessmentConfigImpl;

  factory _AssessmentConfig.fromJson(Map<String, dynamic> json) =
      _$AssessmentConfigImpl.fromJson;

  @override
  Map<String, dynamic> get pluginConfigs;
  @override
  int get maxConcurrentTasks;
  @override
  int get timeoutSeconds;
  @override
  bool get continueOnError;
  @override
  bool get captureEvidence;
  @override
  bool get realTimeUpdates;
  @override
  LogLevel get logLevel;
  @override
  Map<String, dynamic> get customParams;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentConfigImplCopyWith<_$AssessmentConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentProgress _$AssessmentProgressFromJson(Map<String, dynamic> json) {
  return _AssessmentProgress.fromJson(json);
}

/// @nodoc
mixin _$AssessmentProgress {
  double get overall => throw _privateConstructorUsedError;
  int get completedTasks => throw _privateConstructorUsedError;
  int get totalTasks => throw _privateConstructorUsedError;
  int get currentPhaseIndex => throw _privateConstructorUsedError;
  Map<String, double> get phaseProgress => throw _privateConstructorUsedError;
  Map<String, int> get tasksCompleted => throw _privateConstructorUsedError;
  Map<String, int> get tasksTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentProgressCopyWith<AssessmentProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentProgressCopyWith<$Res> {
  factory $AssessmentProgressCopyWith(
    AssessmentProgress value,
    $Res Function(AssessmentProgress) then,
  ) = _$AssessmentProgressCopyWithImpl<$Res, AssessmentProgress>;
  @useResult
  $Res call({
    double overall,
    int completedTasks,
    int totalTasks,
    int currentPhaseIndex,
    Map<String, double> phaseProgress,
    Map<String, int> tasksCompleted,
    Map<String, int> tasksTotal,
  });
}

/// @nodoc
class _$AssessmentProgressCopyWithImpl<$Res, $Val extends AssessmentProgress>
    implements $AssessmentProgressCopyWith<$Res> {
  _$AssessmentProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = null,
    Object? completedTasks = null,
    Object? totalTasks = null,
    Object? currentPhaseIndex = null,
    Object? phaseProgress = null,
    Object? tasksCompleted = null,
    Object? tasksTotal = null,
  }) {
    return _then(
      _value.copyWith(
            overall: null == overall
                ? _value.overall
                : overall // ignore: cast_nullable_to_non_nullable
                      as double,
            completedTasks: null == completedTasks
                ? _value.completedTasks
                : completedTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            totalTasks: null == totalTasks
                ? _value.totalTasks
                : totalTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPhaseIndex: null == currentPhaseIndex
                ? _value.currentPhaseIndex
                : currentPhaseIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            phaseProgress: null == phaseProgress
                ? _value.phaseProgress
                : phaseProgress // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            tasksCompleted: null == tasksCompleted
                ? _value.tasksCompleted
                : tasksCompleted // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            tasksTotal: null == tasksTotal
                ? _value.tasksTotal
                : tasksTotal // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssessmentProgressImplCopyWith<$Res>
    implements $AssessmentProgressCopyWith<$Res> {
  factory _$$AssessmentProgressImplCopyWith(
    _$AssessmentProgressImpl value,
    $Res Function(_$AssessmentProgressImpl) then,
  ) = __$$AssessmentProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double overall,
    int completedTasks,
    int totalTasks,
    int currentPhaseIndex,
    Map<String, double> phaseProgress,
    Map<String, int> tasksCompleted,
    Map<String, int> tasksTotal,
  });
}

/// @nodoc
class __$$AssessmentProgressImplCopyWithImpl<$Res>
    extends _$AssessmentProgressCopyWithImpl<$Res, _$AssessmentProgressImpl>
    implements _$$AssessmentProgressImplCopyWith<$Res> {
  __$$AssessmentProgressImplCopyWithImpl(
    _$AssessmentProgressImpl _value,
    $Res Function(_$AssessmentProgressImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = null,
    Object? completedTasks = null,
    Object? totalTasks = null,
    Object? currentPhaseIndex = null,
    Object? phaseProgress = null,
    Object? tasksCompleted = null,
    Object? tasksTotal = null,
  }) {
    return _then(
      _$AssessmentProgressImpl(
        overall: null == overall
            ? _value.overall
            : overall // ignore: cast_nullable_to_non_nullable
                  as double,
        completedTasks: null == completedTasks
            ? _value.completedTasks
            : completedTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTasks: null == totalTasks
            ? _value.totalTasks
            : totalTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPhaseIndex: null == currentPhaseIndex
            ? _value.currentPhaseIndex
            : currentPhaseIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        phaseProgress: null == phaseProgress
            ? _value._phaseProgress
            : phaseProgress // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        tasksCompleted: null == tasksCompleted
            ? _value._tasksCompleted
            : tasksCompleted // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        tasksTotal: null == tasksTotal
            ? _value._tasksTotal
            : tasksTotal // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentProgressImpl implements _AssessmentProgress {
  const _$AssessmentProgressImpl({
    this.overall = 0.0,
    this.completedTasks = 0,
    this.totalTasks = 0,
    this.currentPhaseIndex = 0,
    final Map<String, double> phaseProgress = const {},
    final Map<String, int> tasksCompleted = const {},
    final Map<String, int> tasksTotal = const {},
  }) : _phaseProgress = phaseProgress,
       _tasksCompleted = tasksCompleted,
       _tasksTotal = tasksTotal;

  factory _$AssessmentProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentProgressImplFromJson(json);

  @override
  @JsonKey()
  final double overall;
  @override
  @JsonKey()
  final int completedTasks;
  @override
  @JsonKey()
  final int totalTasks;
  @override
  @JsonKey()
  final int currentPhaseIndex;
  final Map<String, double> _phaseProgress;
  @override
  @JsonKey()
  Map<String, double> get phaseProgress {
    if (_phaseProgress is EqualUnmodifiableMapView) return _phaseProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_phaseProgress);
  }

  final Map<String, int> _tasksCompleted;
  @override
  @JsonKey()
  Map<String, int> get tasksCompleted {
    if (_tasksCompleted is EqualUnmodifiableMapView) return _tasksCompleted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tasksCompleted);
  }

  final Map<String, int> _tasksTotal;
  @override
  @JsonKey()
  Map<String, int> get tasksTotal {
    if (_tasksTotal is EqualUnmodifiableMapView) return _tasksTotal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tasksTotal);
  }

  @override
  String toString() {
    return 'AssessmentProgress(overall: $overall, completedTasks: $completedTasks, totalTasks: $totalTasks, currentPhaseIndex: $currentPhaseIndex, phaseProgress: $phaseProgress, tasksCompleted: $tasksCompleted, tasksTotal: $tasksTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentProgressImpl &&
            (identical(other.overall, overall) || other.overall == overall) &&
            (identical(other.completedTasks, completedTasks) ||
                other.completedTasks == completedTasks) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.currentPhaseIndex, currentPhaseIndex) ||
                other.currentPhaseIndex == currentPhaseIndex) &&
            const DeepCollectionEquality().equals(
              other._phaseProgress,
              _phaseProgress,
            ) &&
            const DeepCollectionEquality().equals(
              other._tasksCompleted,
              _tasksCompleted,
            ) &&
            const DeepCollectionEquality().equals(
              other._tasksTotal,
              _tasksTotal,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    overall,
    completedTasks,
    totalTasks,
    currentPhaseIndex,
    const DeepCollectionEquality().hash(_phaseProgress),
    const DeepCollectionEquality().hash(_tasksCompleted),
    const DeepCollectionEquality().hash(_tasksTotal),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentProgressImplCopyWith<_$AssessmentProgressImpl> get copyWith =>
      __$$AssessmentProgressImplCopyWithImpl<_$AssessmentProgressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentProgressImplToJson(this);
  }
}

abstract class _AssessmentProgress implements AssessmentProgress {
  const factory _AssessmentProgress({
    final double overall,
    final int completedTasks,
    final int totalTasks,
    final int currentPhaseIndex,
    final Map<String, double> phaseProgress,
    final Map<String, int> tasksCompleted,
    final Map<String, int> tasksTotal,
  }) = _$AssessmentProgressImpl;

  factory _AssessmentProgress.fromJson(Map<String, dynamic> json) =
      _$AssessmentProgressImpl.fromJson;

  @override
  double get overall;
  @override
  int get completedTasks;
  @override
  int get totalTasks;
  @override
  int get currentPhaseIndex;
  @override
  Map<String, double> get phaseProgress;
  @override
  Map<String, int> get tasksCompleted;
  @override
  Map<String, int> get tasksTotal;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentProgressImplCopyWith<_$AssessmentProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentPhase _$AssessmentPhaseFromJson(Map<String, dynamic> json) {
  return _AssessmentPhase.fromJson(json);
}

/// @nodoc
mixin _$AssessmentPhase {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  PhaseStatus get status => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  List<AssessmentTask> get tasks => throw _privateConstructorUsedError;
  Map<String, dynamic> get output => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentPhaseCopyWith<AssessmentPhase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentPhaseCopyWith<$Res> {
  factory $AssessmentPhaseCopyWith(
    AssessmentPhase value,
    $Res Function(AssessmentPhase) then,
  ) = _$AssessmentPhaseCopyWithImpl<$Res, AssessmentPhase>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    PhaseStatus status,
    DateTime? startedAt,
    DateTime? completedAt,
    List<AssessmentTask> tasks,
    Map<String, dynamic> output,
  });
}

/// @nodoc
class _$AssessmentPhaseCopyWithImpl<$Res, $Val extends AssessmentPhase>
    implements $AssessmentPhaseCopyWith<$Res> {
  _$AssessmentPhaseCopyWithImpl(this._value, this._then);

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
    Object? status = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? tasks = null,
    Object? output = null,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PhaseStatus,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            tasks: null == tasks
                ? _value.tasks
                : tasks // ignore: cast_nullable_to_non_nullable
                      as List<AssessmentTask>,
            output: null == output
                ? _value.output
                : output // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssessmentPhaseImplCopyWith<$Res>
    implements $AssessmentPhaseCopyWith<$Res> {
  factory _$$AssessmentPhaseImplCopyWith(
    _$AssessmentPhaseImpl value,
    $Res Function(_$AssessmentPhaseImpl) then,
  ) = __$$AssessmentPhaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    PhaseStatus status,
    DateTime? startedAt,
    DateTime? completedAt,
    List<AssessmentTask> tasks,
    Map<String, dynamic> output,
  });
}

/// @nodoc
class __$$AssessmentPhaseImplCopyWithImpl<$Res>
    extends _$AssessmentPhaseCopyWithImpl<$Res, _$AssessmentPhaseImpl>
    implements _$$AssessmentPhaseImplCopyWith<$Res> {
  __$$AssessmentPhaseImplCopyWithImpl(
    _$AssessmentPhaseImpl _value,
    $Res Function(_$AssessmentPhaseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? tasks = null,
    Object? output = null,
  }) {
    return _then(
      _$AssessmentPhaseImpl(
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
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PhaseStatus,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        tasks: null == tasks
            ? _value._tasks
            : tasks // ignore: cast_nullable_to_non_nullable
                  as List<AssessmentTask>,
        output: null == output
            ? _value._output
            : output // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentPhaseImpl implements _AssessmentPhase {
  const _$AssessmentPhaseImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.startedAt,
    required this.completedAt,
    final List<AssessmentTask> tasks = const [],
    final Map<String, dynamic> output = const {},
  }) : _tasks = tasks,
       _output = output;

  factory _$AssessmentPhaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentPhaseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final PhaseStatus status;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  final List<AssessmentTask> _tasks;
  @override
  @JsonKey()
  List<AssessmentTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final Map<String, dynamic> _output;
  @override
  @JsonKey()
  Map<String, dynamic> get output {
    if (_output is EqualUnmodifiableMapView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_output);
  }

  @override
  String toString() {
    return 'AssessmentPhase(id: $id, name: $name, description: $description, status: $status, startedAt: $startedAt, completedAt: $completedAt, tasks: $tasks, output: $output)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentPhaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other._output, _output));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    status,
    startedAt,
    completedAt,
    const DeepCollectionEquality().hash(_tasks),
    const DeepCollectionEquality().hash(_output),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentPhaseImplCopyWith<_$AssessmentPhaseImpl> get copyWith =>
      __$$AssessmentPhaseImplCopyWithImpl<_$AssessmentPhaseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentPhaseImplToJson(this);
  }
}

abstract class _AssessmentPhase implements AssessmentPhase {
  const factory _AssessmentPhase({
    required final String id,
    required final String name,
    required final String description,
    required final PhaseStatus status,
    required final DateTime? startedAt,
    required final DateTime? completedAt,
    final List<AssessmentTask> tasks,
    final Map<String, dynamic> output,
  }) = _$AssessmentPhaseImpl;

  factory _AssessmentPhase.fromJson(Map<String, dynamic> json) =
      _$AssessmentPhaseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  PhaseStatus get status;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  List<AssessmentTask> get tasks;
  @override
  Map<String, dynamic> get output;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentPhaseImplCopyWith<_$AssessmentPhaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentTask _$AssessmentTaskFromJson(Map<String, dynamic> json) {
  return _AssessmentTask.fromJson(json);
}

/// @nodoc
mixin _$AssessmentTask {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get pluginId => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get input => throw _privateConstructorUsedError;
  Map<String, dynamic> get output => throw _privateConstructorUsedError;
  List<String> get evidenceIds => throw _privateConstructorUsedError;
  List<String> get findingIds => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  int get retryCount => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentTaskCopyWith<AssessmentTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentTaskCopyWith<$Res> {
  factory $AssessmentTaskCopyWith(
    AssessmentTask value,
    $Res Function(AssessmentTask) then,
  ) = _$AssessmentTaskCopyWithImpl<$Res, AssessmentTask>;
  @useResult
  $Res call({
    String id,
    String name,
    String pluginId,
    TaskStatus status,
    DateTime? startedAt,
    DateTime? completedAt,
    Map<String, dynamic> input,
    Map<String, dynamic> output,
    List<String> evidenceIds,
    List<String> findingIds,
    String? errorMessage,
    int retryCount,
    Duration duration,
  });
}

/// @nodoc
class _$AssessmentTaskCopyWithImpl<$Res, $Val extends AssessmentTask>
    implements $AssessmentTaskCopyWith<$Res> {
  _$AssessmentTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pluginId = null,
    Object? status = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? input = null,
    Object? output = null,
    Object? evidenceIds = null,
    Object? findingIds = null,
    Object? errorMessage = freezed,
    Object? retryCount = null,
    Object? duration = null,
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
            pluginId: null == pluginId
                ? _value.pluginId
                : pluginId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            output: null == output
                ? _value.output
                : output // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            evidenceIds: null == evidenceIds
                ? _value.evidenceIds
                : evidenceIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            findingIds: null == findingIds
                ? _value.findingIds
                : findingIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            retryCount: null == retryCount
                ? _value.retryCount
                : retryCount // ignore: cast_nullable_to_non_nullable
                      as int,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssessmentTaskImplCopyWith<$Res>
    implements $AssessmentTaskCopyWith<$Res> {
  factory _$$AssessmentTaskImplCopyWith(
    _$AssessmentTaskImpl value,
    $Res Function(_$AssessmentTaskImpl) then,
  ) = __$$AssessmentTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String pluginId,
    TaskStatus status,
    DateTime? startedAt,
    DateTime? completedAt,
    Map<String, dynamic> input,
    Map<String, dynamic> output,
    List<String> evidenceIds,
    List<String> findingIds,
    String? errorMessage,
    int retryCount,
    Duration duration,
  });
}

/// @nodoc
class __$$AssessmentTaskImplCopyWithImpl<$Res>
    extends _$AssessmentTaskCopyWithImpl<$Res, _$AssessmentTaskImpl>
    implements _$$AssessmentTaskImplCopyWith<$Res> {
  __$$AssessmentTaskImplCopyWithImpl(
    _$AssessmentTaskImpl _value,
    $Res Function(_$AssessmentTaskImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pluginId = null,
    Object? status = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? input = null,
    Object? output = null,
    Object? evidenceIds = null,
    Object? findingIds = null,
    Object? errorMessage = freezed,
    Object? retryCount = null,
    Object? duration = null,
  }) {
    return _then(
      _$AssessmentTaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        pluginId: null == pluginId
            ? _value.pluginId
            : pluginId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        input: null == input
            ? _value._input
            : input // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        output: null == output
            ? _value._output
            : output // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        evidenceIds: null == evidenceIds
            ? _value._evidenceIds
            : evidenceIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        findingIds: null == findingIds
            ? _value._findingIds
            : findingIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        retryCount: null == retryCount
            ? _value.retryCount
            : retryCount // ignore: cast_nullable_to_non_nullable
                  as int,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentTaskImpl implements _AssessmentTask {
  const _$AssessmentTaskImpl({
    required this.id,
    required this.name,
    required this.pluginId,
    required this.status,
    required this.startedAt,
    required this.completedAt,
    final Map<String, dynamic> input = const {},
    final Map<String, dynamic> output = const {},
    final List<String> evidenceIds = const [],
    final List<String> findingIds = const [],
    this.errorMessage,
    this.retryCount = 0,
    this.duration = Duration.zero,
  }) : _input = input,
       _output = output,
       _evidenceIds = evidenceIds,
       _findingIds = findingIds;

  factory _$AssessmentTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String pluginId;
  @override
  final TaskStatus status;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  final Map<String, dynamic> _input;
  @override
  @JsonKey()
  Map<String, dynamic> get input {
    if (_input is EqualUnmodifiableMapView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_input);
  }

  final Map<String, dynamic> _output;
  @override
  @JsonKey()
  Map<String, dynamic> get output {
    if (_output is EqualUnmodifiableMapView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_output);
  }

  final List<String> _evidenceIds;
  @override
  @JsonKey()
  List<String> get evidenceIds {
    if (_evidenceIds is EqualUnmodifiableListView) return _evidenceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceIds);
  }

  final List<String> _findingIds;
  @override
  @JsonKey()
  List<String> get findingIds {
    if (_findingIds is EqualUnmodifiableListView) return _findingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_findingIds);
  }

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final int retryCount;
  @override
  @JsonKey()
  final Duration duration;

  @override
  String toString() {
    return 'AssessmentTask(id: $id, name: $name, pluginId: $pluginId, status: $status, startedAt: $startedAt, completedAt: $completedAt, input: $input, output: $output, evidenceIds: $evidenceIds, findingIds: $findingIds, errorMessage: $errorMessage, retryCount: $retryCount, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pluginId, pluginId) ||
                other.pluginId == pluginId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other._input, _input) &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            const DeepCollectionEquality().equals(
              other._evidenceIds,
              _evidenceIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._findingIds,
              _findingIds,
            ) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    pluginId,
    status,
    startedAt,
    completedAt,
    const DeepCollectionEquality().hash(_input),
    const DeepCollectionEquality().hash(_output),
    const DeepCollectionEquality().hash(_evidenceIds),
    const DeepCollectionEquality().hash(_findingIds),
    errorMessage,
    retryCount,
    duration,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentTaskImplCopyWith<_$AssessmentTaskImpl> get copyWith =>
      __$$AssessmentTaskImplCopyWithImpl<_$AssessmentTaskImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentTaskImplToJson(this);
  }
}

abstract class _AssessmentTask implements AssessmentTask {
  const factory _AssessmentTask({
    required final String id,
    required final String name,
    required final String pluginId,
    required final TaskStatus status,
    required final DateTime? startedAt,
    required final DateTime? completedAt,
    final Map<String, dynamic> input,
    final Map<String, dynamic> output,
    final List<String> evidenceIds,
    final List<String> findingIds,
    final String? errorMessage,
    final int retryCount,
    final Duration duration,
  }) = _$AssessmentTaskImpl;

  factory _AssessmentTask.fromJson(Map<String, dynamic> json) =
      _$AssessmentTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get pluginId;
  @override
  TaskStatus get status;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  Map<String, dynamic> get input;
  @override
  Map<String, dynamic> get output;
  @override
  List<String> get evidenceIds;
  @override
  List<String> get findingIds;
  @override
  String? get errorMessage;
  @override
  int get retryCount;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentTaskImplCopyWith<_$AssessmentTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentEvent _$AssessmentEventFromJson(Map<String, dynamic> json) {
  return _AssessmentEvent.fromJson(json);
}

/// @nodoc
mixin _$AssessmentEvent {
  String get id => throw _privateConstructorUsedError;
  String get assessmentId => throw _privateConstructorUsedError;
  EventType get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  LogLevel get level => throw _privateConstructorUsedError;
  String? get phaseId => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentEventCopyWith<AssessmentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentEventCopyWith<$Res> {
  factory $AssessmentEventCopyWith(
    AssessmentEvent value,
    $Res Function(AssessmentEvent) then,
  ) = _$AssessmentEventCopyWithImpl<$Res, AssessmentEvent>;
  @useResult
  $Res call({
    String id,
    String assessmentId,
    EventType type,
    DateTime timestamp,
    String message,
    Map<String, dynamic> data,
    LogLevel level,
    String? phaseId,
    String? taskId,
  });
}

/// @nodoc
class _$AssessmentEventCopyWithImpl<$Res, $Val extends AssessmentEvent>
    implements $AssessmentEventCopyWith<$Res> {
  _$AssessmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assessmentId = null,
    Object? type = null,
    Object? timestamp = null,
    Object? message = null,
    Object? data = null,
    Object? level = null,
    Object? phaseId = freezed,
    Object? taskId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            assessmentId: null == assessmentId
                ? _value.assessmentId
                : assessmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as EventType,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as LogLevel,
            phaseId: freezed == phaseId
                ? _value.phaseId
                : phaseId // ignore: cast_nullable_to_non_nullable
                      as String?,
            taskId: freezed == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssessmentEventImplCopyWith<$Res>
    implements $AssessmentEventCopyWith<$Res> {
  factory _$$AssessmentEventImplCopyWith(
    _$AssessmentEventImpl value,
    $Res Function(_$AssessmentEventImpl) then,
  ) = __$$AssessmentEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String assessmentId,
    EventType type,
    DateTime timestamp,
    String message,
    Map<String, dynamic> data,
    LogLevel level,
    String? phaseId,
    String? taskId,
  });
}

/// @nodoc
class __$$AssessmentEventImplCopyWithImpl<$Res>
    extends _$AssessmentEventCopyWithImpl<$Res, _$AssessmentEventImpl>
    implements _$$AssessmentEventImplCopyWith<$Res> {
  __$$AssessmentEventImplCopyWithImpl(
    _$AssessmentEventImpl _value,
    $Res Function(_$AssessmentEventImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assessmentId = null,
    Object? type = null,
    Object? timestamp = null,
    Object? message = null,
    Object? data = null,
    Object? level = null,
    Object? phaseId = freezed,
    Object? taskId = freezed,
  }) {
    return _then(
      _$AssessmentEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        assessmentId: null == assessmentId
            ? _value.assessmentId
            : assessmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as EventType,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as LogLevel,
        phaseId: freezed == phaseId
            ? _value.phaseId
            : phaseId // ignore: cast_nullable_to_non_nullable
                  as String?,
        taskId: freezed == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentEventImpl implements _AssessmentEvent {
  const _$AssessmentEventImpl({
    required this.id,
    required this.assessmentId,
    required this.type,
    required this.timestamp,
    required this.message,
    final Map<String, dynamic> data = const {},
    this.level = LogLevel.info,
    this.phaseId,
    this.taskId,
  }) : _data = data;

  factory _$AssessmentEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentEventImplFromJson(json);

  @override
  final String id;
  @override
  final String assessmentId;
  @override
  final EventType type;
  @override
  final DateTime timestamp;
  @override
  final String message;
  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  final LogLevel level;
  @override
  final String? phaseId;
  @override
  final String? taskId;

  @override
  String toString() {
    return 'AssessmentEvent(id: $id, assessmentId: $assessmentId, type: $type, timestamp: $timestamp, message: $message, data: $data, level: $level, phaseId: $phaseId, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.phaseId, phaseId) || other.phaseId == phaseId) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    assessmentId,
    type,
    timestamp,
    message,
    const DeepCollectionEquality().hash(_data),
    level,
    phaseId,
    taskId,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentEventImplCopyWith<_$AssessmentEventImpl> get copyWith =>
      __$$AssessmentEventImplCopyWithImpl<_$AssessmentEventImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentEventImplToJson(this);
  }
}

abstract class _AssessmentEvent implements AssessmentEvent {
  const factory _AssessmentEvent({
    required final String id,
    required final String assessmentId,
    required final EventType type,
    required final DateTime timestamp,
    required final String message,
    final Map<String, dynamic> data,
    final LogLevel level,
    final String? phaseId,
    final String? taskId,
  }) = _$AssessmentEventImpl;

  factory _AssessmentEvent.fromJson(Map<String, dynamic> json) =
      _$AssessmentEventImpl.fromJson;

  @override
  String get id;
  @override
  String get assessmentId;
  @override
  EventType get type;
  @override
  DateTime get timestamp;
  @override
  String get message;
  @override
  Map<String, dynamic> get data;
  @override
  LogLevel get level;
  @override
  String? get phaseId;
  @override
  String? get taskId;
  @override
  @JsonKey(ignore: true)
  _$$AssessmentEventImplCopyWith<_$AssessmentEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return _Evidence.fromJson(json);
}

/// @nodoc
mixin _$Evidence {
  String get id => throw _privateConstructorUsedError;
  String get assessmentId => throw _privateConstructorUsedError;
  EvidenceType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  String get hashSha256 => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;
  DateTime get capturedAt => throw _privateConstructorUsedError;
  String get capturedBy => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isEncrypted => throw _privateConstructorUsedError;
  String? get encryptionKeyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvidenceCopyWith<Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvidenceCopyWith<$Res> {
  factory $EvidenceCopyWith(Evidence value, $Res Function(Evidence) then) =
      _$EvidenceCopyWithImpl<$Res, Evidence>;
  @useResult
  $Res call({
    String id,
    String assessmentId,
    EvidenceType type,
    String name,
    String description,
    String filePath,
    String hashSha256,
    int sizeBytes,
    DateTime capturedAt,
    String capturedBy,
    Map<String, dynamic> metadata,
    List<String> tags,
    bool isEncrypted,
    String? encryptionKeyId,
  });
}

/// @nodoc
class _$EvidenceCopyWithImpl<$Res, $Val extends Evidence>
    implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assessmentId = null,
    Object? type = null,
    Object? name = null,
    Object? description = null,
    Object? filePath = null,
    Object? hashSha256 = null,
    Object? sizeBytes = null,
    Object? capturedAt = null,
    Object? capturedBy = null,
    Object? metadata = null,
    Object? tags = null,
    Object? isEncrypted = null,
    Object? encryptionKeyId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            assessmentId: null == assessmentId
                ? _value.assessmentId
                : assessmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as EvidenceType,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            filePath: null == filePath
                ? _value.filePath
                : filePath // ignore: cast_nullable_to_non_nullable
                      as String,
            hashSha256: null == hashSha256
                ? _value.hashSha256
                : hashSha256 // ignore: cast_nullable_to_non_nullable
                      as String,
            sizeBytes: null == sizeBytes
                ? _value.sizeBytes
                : sizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            capturedAt: null == capturedAt
                ? _value.capturedAt
                : capturedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            capturedBy: null == capturedBy
                ? _value.capturedBy
                : capturedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isEncrypted: null == isEncrypted
                ? _value.isEncrypted
                : isEncrypted // ignore: cast_nullable_to_non_nullable
                      as bool,
            encryptionKeyId: freezed == encryptionKeyId
                ? _value.encryptionKeyId
                : encryptionKeyId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EvidenceImplCopyWith<$Res>
    implements $EvidenceCopyWith<$Res> {
  factory _$$EvidenceImplCopyWith(
    _$EvidenceImpl value,
    $Res Function(_$EvidenceImpl) then,
  ) = __$$EvidenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String assessmentId,
    EvidenceType type,
    String name,
    String description,
    String filePath,
    String hashSha256,
    int sizeBytes,
    DateTime capturedAt,
    String capturedBy,
    Map<String, dynamic> metadata,
    List<String> tags,
    bool isEncrypted,
    String? encryptionKeyId,
  });
}

/// @nodoc
class __$$EvidenceImplCopyWithImpl<$Res>
    extends _$EvidenceCopyWithImpl<$Res, _$EvidenceImpl>
    implements _$$EvidenceImplCopyWith<$Res> {
  __$$EvidenceImplCopyWithImpl(
    _$EvidenceImpl _value,
    $Res Function(_$EvidenceImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assessmentId = null,
    Object? type = null,
    Object? name = null,
    Object? description = null,
    Object? filePath = null,
    Object? hashSha256 = null,
    Object? sizeBytes = null,
    Object? capturedAt = null,
    Object? capturedBy = null,
    Object? metadata = null,
    Object? tags = null,
    Object? isEncrypted = null,
    Object? encryptionKeyId = freezed,
  }) {
    return _then(
      _$EvidenceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        assessmentId: null == assessmentId
            ? _value.assessmentId
            : assessmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as EvidenceType,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        filePath: null == filePath
            ? _value.filePath
            : filePath // ignore: cast_nullable_to_non_nullable
                  as String,
        hashSha256: null == hashSha256
            ? _value.hashSha256
            : hashSha256 // ignore: cast_nullable_to_non_nullable
                  as String,
        sizeBytes: null == sizeBytes
            ? _value.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        capturedAt: null == capturedAt
            ? _value.capturedAt
            : capturedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        capturedBy: null == capturedBy
            ? _value.capturedBy
            : capturedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isEncrypted: null == isEncrypted
            ? _value.isEncrypted
            : isEncrypted // ignore: cast_nullable_to_non_nullable
                  as bool,
        encryptionKeyId: freezed == encryptionKeyId
            ? _value.encryptionKeyId
            : encryptionKeyId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EvidenceImpl implements _Evidence {
  const _$EvidenceImpl({
    required this.id,
    required this.assessmentId,
    required this.type,
    required this.name,
    required this.description,
    required this.filePath,
    required this.hashSha256,
    required this.sizeBytes,
    required this.capturedAt,
    required this.capturedBy,
    final Map<String, dynamic> metadata = const {},
    final List<String> tags = const [],
    this.isEncrypted = false,
    this.encryptionKeyId,
  }) : _metadata = metadata,
       _tags = tags;

  factory _$EvidenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvidenceImplFromJson(json);

  @override
  final String id;
  @override
  final String assessmentId;
  @override
  final EvidenceType type;
  @override
  final String name;
  @override
  final String description;
  @override
  final String filePath;
  @override
  final String hashSha256;
  @override
  final int sizeBytes;
  @override
  final DateTime capturedAt;
  @override
  final String capturedBy;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isEncrypted;
  @override
  final String? encryptionKeyId;

  @override
  String toString() {
    return 'Evidence(id: $id, assessmentId: $assessmentId, type: $type, name: $name, description: $description, filePath: $filePath, hashSha256: $hashSha256, sizeBytes: $sizeBytes, capturedAt: $capturedAt, capturedBy: $capturedBy, metadata: $metadata, tags: $tags, isEncrypted: $isEncrypted, encryptionKeyId: $encryptionKeyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvidenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.hashSha256, hashSha256) ||
                other.hashSha256 == hashSha256) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.capturedBy, capturedBy) ||
                other.capturedBy == capturedBy) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isEncrypted, isEncrypted) ||
                other.isEncrypted == isEncrypted) &&
            (identical(other.encryptionKeyId, encryptionKeyId) ||
                other.encryptionKeyId == encryptionKeyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
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
    const DeepCollectionEquality().hash(_metadata),
    const DeepCollectionEquality().hash(_tags),
    isEncrypted,
    encryptionKeyId,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EvidenceImplCopyWith<_$EvidenceImpl> get copyWith =>
      __$$EvidenceImplCopyWithImpl<_$EvidenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvidenceImplToJson(this);
  }
}

abstract class _Evidence implements Evidence {
  const factory _Evidence({
    required final String id,
    required final String assessmentId,
    required final EvidenceType type,
    required final String name,
    required final String description,
    required final String filePath,
    required final String hashSha256,
    required final int sizeBytes,
    required final DateTime capturedAt,
    required final String capturedBy,
    final Map<String, dynamic> metadata,
    final List<String> tags,
    final bool isEncrypted,
    final String? encryptionKeyId,
  }) = _$EvidenceImpl;

  factory _Evidence.fromJson(Map<String, dynamic> json) =
      _$EvidenceImpl.fromJson;

  @override
  String get id;
  @override
  String get assessmentId;
  @override
  EvidenceType get type;
  @override
  String get name;
  @override
  String get description;
  @override
  String get filePath;
  @override
  String get hashSha256;
  @override
  int get sizeBytes;
  @override
  DateTime get capturedAt;
  @override
  String get capturedBy;
  @override
  Map<String, dynamic> get metadata;
  @override
  List<String> get tags;
  @override
  bool get isEncrypted;
  @override
  String? get encryptionKeyId;
  @override
  @JsonKey(ignore: true)
  _$$EvidenceImplCopyWith<_$EvidenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Finding _$FindingFromJson(Map<String, dynamic> json) {
  return _Finding.fromJson(json);
}

/// @nodoc
mixin _$Finding {
  String get id => throw _privateConstructorUsedError;
  String get assessmentId => throw _privateConstructorUsedError;
  FindingType get type => throw _privateConstructorUsedError;
  Severity get severity => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  String get affectedTarget => throw _privateConstructorUsedError;
  Map<String, dynamic> get evidence => throw _privateConstructorUsedError;
  List<String> get evidenceIds => throw _privateConstructorUsedError;
  CvssVector get cvss => throw _privateConstructorUsedError;
  DateTime get discoveredAt => throw _privateConstructorUsedError;
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  bool get falsePositive => throw _privateConstructorUsedError;
  String get references => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindingCopyWith<Finding> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindingCopyWith<$Res> {
  factory $FindingCopyWith(Finding value, $Res Function(Finding) then) =
      _$FindingCopyWithImpl<$Res, Finding>;
  @useResult
  $Res call({
    String id,
    String assessmentId,
    FindingType type,
    Severity severity,
    String title,
    String description,
    String recommendation,
    String affectedTarget,
    Map<String, dynamic> evidence,
    List<String> evidenceIds,
    CvssVector cvss,
    DateTime discoveredAt,
    DateTime? verifiedAt,
    bool verified,
    bool falsePositive,
    String references,
    Map<String, dynamic> metadata,
  });

  $CvssVectorCopyWith<$Res> get cvss;
}

/// @nodoc
class _$FindingCopyWithImpl<$Res, $Val extends Finding>
    implements $FindingCopyWith<$Res> {
  _$FindingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assessmentId = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? recommendation = null,
    Object? affectedTarget = null,
    Object? evidence = null,
    Object? evidenceIds = null,
    Object? cvss = null,
    Object? discoveredAt = null,
    Object? verifiedAt = freezed,
    Object? verified = null,
    Object? falsePositive = null,
    Object? references = null,
    Object? metadata = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            assessmentId: null == assessmentId
                ? _value.assessmentId
                : assessmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as FindingType,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as Severity,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            affectedTarget: null == affectedTarget
                ? _value.affectedTarget
                : affectedTarget // ignore: cast_nullable_to_non_nullable
                      as String,
            evidence: null == evidence
                ? _value.evidence
                : evidence // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            evidenceIds: null == evidenceIds
                ? _value.evidenceIds
                : evidenceIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            cvss: null == cvss
                ? _value.cvss
                : cvss // ignore: cast_nullable_to_non_nullable
                      as CvssVector,
            discoveredAt: null == discoveredAt
                ? _value.discoveredAt
                : discoveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            verifiedAt: freezed == verifiedAt
                ? _value.verifiedAt
                : verifiedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            falsePositive: null == falsePositive
                ? _value.falsePositive
                : falsePositive // ignore: cast_nullable_to_non_nullable
                      as bool,
            references: null == references
                ? _value.references
                : references // ignore: cast_nullable_to_non_nullable
                      as String,
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
  $CvssVectorCopyWith<$Res> get cvss {
    return $CvssVectorCopyWith<$Res>(_value.cvss, (value) {
      return _then(_value.copyWith(cvss: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FindingImplCopyWith<$Res> implements $FindingCopyWith<$Res> {
  factory _$$FindingImplCopyWith(
    _$FindingImpl value,
    $Res Function(_$FindingImpl) then,
  ) = __$$FindingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String assessmentId,
    FindingType type,
    Severity severity,
    String title,
    String description,
    String recommendation,
    String affectedTarget,
    Map<String, dynamic> evidence,
    List<String> evidenceIds,
    CvssVector cvss,
    DateTime discoveredAt,
    DateTime? verifiedAt,
    bool verified,
    bool falsePositive,
    String references,
    Map<String, dynamic> metadata,
  });

  @override
  $CvssVectorCopyWith<$Res> get cvss;
}

/// @nodoc
class __$$FindingImplCopyWithImpl<$Res>
    extends _$FindingCopyWithImpl<$Res, _$FindingImpl>
    implements _$$FindingImplCopyWith<$Res> {
  __$$FindingImplCopyWithImpl(
    _$FindingImpl _value,
    $Res Function(_$FindingImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assessmentId = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? recommendation = null,
    Object? affectedTarget = null,
    Object? evidence = null,
    Object? evidenceIds = null,
    Object? cvss = null,
    Object? discoveredAt = null,
    Object? verifiedAt = freezed,
    Object? verified = null,
    Object? falsePositive = null,
    Object? references = null,
    Object? metadata = null,
  }) {
    return _then(
      _$FindingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        assessmentId: null == assessmentId
            ? _value.assessmentId
            : assessmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as FindingType,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as Severity,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        affectedTarget: null == affectedTarget
            ? _value.affectedTarget
            : affectedTarget // ignore: cast_nullable_to_non_nullable
                  as String,
        evidence: null == evidence
            ? _value._evidence
            : evidence // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        evidenceIds: null == evidenceIds
            ? _value._evidenceIds
            : evidenceIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        cvss: null == cvss
            ? _value.cvss
            : cvss // ignore: cast_nullable_to_non_nullable
                  as CvssVector,
        discoveredAt: null == discoveredAt
            ? _value.discoveredAt
            : discoveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        verifiedAt: freezed == verifiedAt
            ? _value.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        falsePositive: null == falsePositive
            ? _value.falsePositive
            : falsePositive // ignore: cast_nullable_to_non_nullable
                  as bool,
        references: null == references
            ? _value.references
            : references // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$FindingImpl implements _Finding {
  const _$FindingImpl({
    required this.id,
    required this.assessmentId,
    required this.type,
    required this.severity,
    required this.title,
    required this.description,
    required this.recommendation,
    required this.affectedTarget,
    final Map<String, dynamic> evidence = const {},
    final List<String> evidenceIds = const [],
    required this.cvss,
    required this.discoveredAt,
    required this.verifiedAt,
    this.verified = false,
    this.falsePositive = false,
    this.references = '',
    final Map<String, dynamic> metadata = const {},
  }) : _evidence = evidence,
       _evidenceIds = evidenceIds,
       _metadata = metadata;

  factory _$FindingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindingImplFromJson(json);

  @override
  final String id;
  @override
  final String assessmentId;
  @override
  final FindingType type;
  @override
  final Severity severity;
  @override
  final String title;
  @override
  final String description;
  @override
  final String recommendation;
  @override
  final String affectedTarget;
  final Map<String, dynamic> _evidence;
  @override
  @JsonKey()
  Map<String, dynamic> get evidence {
    if (_evidence is EqualUnmodifiableMapView) return _evidence;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_evidence);
  }

  final List<String> _evidenceIds;
  @override
  @JsonKey()
  List<String> get evidenceIds {
    if (_evidenceIds is EqualUnmodifiableListView) return _evidenceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceIds);
  }

  @override
  final CvssVector cvss;
  @override
  final DateTime discoveredAt;
  @override
  final DateTime? verifiedAt;
  @override
  @JsonKey()
  final bool verified;
  @override
  @JsonKey()
  final bool falsePositive;
  @override
  @JsonKey()
  final String references;
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
    return 'Finding(id: $id, assessmentId: $assessmentId, type: $type, severity: $severity, title: $title, description: $description, recommendation: $recommendation, affectedTarget: $affectedTarget, evidence: $evidence, evidenceIds: $evidenceIds, cvss: $cvss, discoveredAt: $discoveredAt, verifiedAt: $verifiedAt, verified: $verified, falsePositive: $falsePositive, references: $references, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.affectedTarget, affectedTarget) ||
                other.affectedTarget == affectedTarget) &&
            const DeepCollectionEquality().equals(other._evidence, _evidence) &&
            const DeepCollectionEquality().equals(
              other._evidenceIds,
              _evidenceIds,
            ) &&
            (identical(other.cvss, cvss) || other.cvss == cvss) &&
            (identical(other.discoveredAt, discoveredAt) ||
                other.discoveredAt == discoveredAt) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.falsePositive, falsePositive) ||
                other.falsePositive == falsePositive) &&
            (identical(other.references, references) ||
                other.references == references) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    assessmentId,
    type,
    severity,
    title,
    description,
    recommendation,
    affectedTarget,
    const DeepCollectionEquality().hash(_evidence),
    const DeepCollectionEquality().hash(_evidenceIds),
    cvss,
    discoveredAt,
    verifiedAt,
    verified,
    falsePositive,
    references,
    const DeepCollectionEquality().hash(_metadata),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindingImplCopyWith<_$FindingImpl> get copyWith =>
      __$$FindingImplCopyWithImpl<_$FindingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindingImplToJson(this);
  }
}

abstract class _Finding implements Finding {
  const factory _Finding({
    required final String id,
    required final String assessmentId,
    required final FindingType type,
    required final Severity severity,
    required final String title,
    required final String description,
    required final String recommendation,
    required final String affectedTarget,
    final Map<String, dynamic> evidence,
    final List<String> evidenceIds,
    required final CvssVector cvss,
    required final DateTime discoveredAt,
    required final DateTime? verifiedAt,
    final bool verified,
    final bool falsePositive,
    final String references,
    final Map<String, dynamic> metadata,
  }) = _$FindingImpl;

  factory _Finding.fromJson(Map<String, dynamic> json) = _$FindingImpl.fromJson;

  @override
  String get id;
  @override
  String get assessmentId;
  @override
  FindingType get type;
  @override
  Severity get severity;
  @override
  String get title;
  @override
  String get description;
  @override
  String get recommendation;
  @override
  String get affectedTarget;
  @override
  Map<String, dynamic> get evidence;
  @override
  List<String> get evidenceIds;
  @override
  CvssVector get cvss;
  @override
  DateTime get discoveredAt;
  @override
  DateTime? get verifiedAt;
  @override
  bool get verified;
  @override
  bool get falsePositive;
  @override
  String get references;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$FindingImplCopyWith<_$FindingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
