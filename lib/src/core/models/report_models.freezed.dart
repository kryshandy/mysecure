// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get assessmentId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ReportType get type => throw _privateConstructorUsedError;
  ReportStatus get status => throw _privateConstructorUsedError;
  ReportFormat get format => throw _privateConstructorUsedError;
  ReportTemplate get template => throw _privateConstructorUsedError;
  ReportContent get content => throw _privateConstructorUsedError;
  ReportMetadata get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get generatedAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  List<String> get attachedEvidenceIds => throw _privateConstructorUsedError;
  Map<String, dynamic> get customData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call({
    String id,
    String projectId,
    String assessmentId,
    String title,
    ReportType type,
    ReportStatus status,
    ReportFormat format,
    ReportTemplate template,
    ReportContent content,
    ReportMetadata metadata,
    DateTime createdAt,
    DateTime? generatedAt,
    DateTime? deliveredAt,
    List<String> attachedEvidenceIds,
    Map<String, dynamic> customData,
  });

  $ReportContentCopyWith<$Res> get content;
  $ReportMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? assessmentId = null,
    Object? title = null,
    Object? type = null,
    Object? status = null,
    Object? format = null,
    Object? template = null,
    Object? content = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? generatedAt = freezed,
    Object? deliveredAt = freezed,
    Object? attachedEvidenceIds = null,
    Object? customData = null,
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
            assessmentId: null == assessmentId
                ? _value.assessmentId
                : assessmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ReportType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ReportStatus,
            format: null == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as ReportFormat,
            template: null == template
                ? _value.template
                : template // ignore: cast_nullable_to_non_nullable
                      as ReportTemplate,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as ReportContent,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as ReportMetadata,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            generatedAt: freezed == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deliveredAt: freezed == deliveredAt
                ? _value.deliveredAt
                : deliveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            attachedEvidenceIds: null == attachedEvidenceIds
                ? _value.attachedEvidenceIds
                : attachedEvidenceIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            customData: null == customData
                ? _value.customData
                : customData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportContentCopyWith<$Res> get content {
    return $ReportContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportMetadataCopyWith<$Res> get metadata {
    return $ReportMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
    _$ReportImpl value,
    $Res Function(_$ReportImpl) then,
  ) = __$$ReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String projectId,
    String assessmentId,
    String title,
    ReportType type,
    ReportStatus status,
    ReportFormat format,
    ReportTemplate template,
    ReportContent content,
    ReportMetadata metadata,
    DateTime createdAt,
    DateTime? generatedAt,
    DateTime? deliveredAt,
    List<String> attachedEvidenceIds,
    Map<String, dynamic> customData,
  });

  @override
  $ReportContentCopyWith<$Res> get content;
  @override
  $ReportMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
    _$ReportImpl _value,
    $Res Function(_$ReportImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? assessmentId = null,
    Object? title = null,
    Object? type = null,
    Object? status = null,
    Object? format = null,
    Object? template = null,
    Object? content = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? generatedAt = freezed,
    Object? deliveredAt = freezed,
    Object? attachedEvidenceIds = null,
    Object? customData = null,
  }) {
    return _then(
      _$ReportImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        assessmentId: null == assessmentId
            ? _value.assessmentId
            : assessmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ReportType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ReportStatus,
        format: null == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as ReportFormat,
        template: null == template
            ? _value.template
            : template // ignore: cast_nullable_to_non_nullable
                  as ReportTemplate,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as ReportContent,
        metadata: null == metadata
            ? _value.metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as ReportMetadata,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        generatedAt: freezed == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deliveredAt: freezed == deliveredAt
            ? _value.deliveredAt
            : deliveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        attachedEvidenceIds: null == attachedEvidenceIds
            ? _value._attachedEvidenceIds
            : attachedEvidenceIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        customData: null == customData
            ? _value._customData
            : customData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportImpl implements _Report {
  const _$ReportImpl({
    required this.id,
    required this.projectId,
    required this.assessmentId,
    required this.title,
    required this.type,
    required this.status,
    required this.format,
    required this.template,
    required this.content,
    required this.metadata,
    required this.createdAt,
    required this.generatedAt,
    required this.deliveredAt,
    final List<String> attachedEvidenceIds = const [],
    final Map<String, dynamic> customData = const {},
  }) : _attachedEvidenceIds = attachedEvidenceIds,
       _customData = customData;

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String assessmentId;
  @override
  final String title;
  @override
  final ReportType type;
  @override
  final ReportStatus status;
  @override
  final ReportFormat format;
  @override
  final ReportTemplate template;
  @override
  final ReportContent content;
  @override
  final ReportMetadata metadata;
  @override
  final DateTime createdAt;
  @override
  final DateTime? generatedAt;
  @override
  final DateTime? deliveredAt;
  final List<String> _attachedEvidenceIds;
  @override
  @JsonKey()
  List<String> get attachedEvidenceIds {
    if (_attachedEvidenceIds is EqualUnmodifiableListView)
      return _attachedEvidenceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachedEvidenceIds);
  }

  final Map<String, dynamic> _customData;
  @override
  @JsonKey()
  Map<String, dynamic> get customData {
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customData);
  }

  @override
  String toString() {
    return 'Report(id: $id, projectId: $projectId, assessmentId: $assessmentId, title: $title, type: $type, status: $status, format: $format, template: $template, content: $content, metadata: $metadata, createdAt: $createdAt, generatedAt: $generatedAt, deliveredAt: $deliveredAt, attachedEvidenceIds: $attachedEvidenceIds, customData: $customData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            const DeepCollectionEquality().equals(
              other._attachedEvidenceIds,
              _attachedEvidenceIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._customData,
              _customData,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    projectId,
    assessmentId,
    title,
    type,
    status,
    format,
    template,
    content,
    metadata,
    createdAt,
    generatedAt,
    deliveredAt,
    const DeepCollectionEquality().hash(_attachedEvidenceIds),
    const DeepCollectionEquality().hash(_customData),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportImplToJson(this);
  }
}

abstract class _Report implements Report {
  const factory _Report({
    required final String id,
    required final String projectId,
    required final String assessmentId,
    required final String title,
    required final ReportType type,
    required final ReportStatus status,
    required final ReportFormat format,
    required final ReportTemplate template,
    required final ReportContent content,
    required final ReportMetadata metadata,
    required final DateTime createdAt,
    required final DateTime? generatedAt,
    required final DateTime? deliveredAt,
    final List<String> attachedEvidenceIds,
    final Map<String, dynamic> customData,
  }) = _$ReportImpl;

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get assessmentId;
  @override
  String get title;
  @override
  ReportType get type;
  @override
  ReportStatus get status;
  @override
  ReportFormat get format;
  @override
  ReportTemplate get template;
  @override
  ReportContent get content;
  @override
  ReportMetadata get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime? get generatedAt;
  @override
  DateTime? get deliveredAt;
  @override
  List<String> get attachedEvidenceIds;
  @override
  Map<String, dynamic> get customData;
  @override
  @JsonKey(ignore: true)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportContent _$ReportContentFromJson(Map<String, dynamic> json) {
  return _ReportContent.fromJson(json);
}

/// @nodoc
mixin _$ReportContent {
  ExecutiveSummary get executiveSummary => throw _privateConstructorUsedError;
  Methodology get methodology => throw _privateConstructorUsedError;
  ScopeDocumentation get scope => throw _privateConstructorUsedError;
  List<TechnicalFinding> get findings => throw _privateConstructorUsedError;
  RiskAssessment get riskAssessment => throw _privateConstructorUsedError;
  RemediationRoadmap get remediation => throw _privateConstructorUsedError;
  Appendices get appendices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportContentCopyWith<ReportContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportContentCopyWith<$Res> {
  factory $ReportContentCopyWith(
    ReportContent value,
    $Res Function(ReportContent) then,
  ) = _$ReportContentCopyWithImpl<$Res, ReportContent>;
  @useResult
  $Res call({
    ExecutiveSummary executiveSummary,
    Methodology methodology,
    ScopeDocumentation scope,
    List<TechnicalFinding> findings,
    RiskAssessment riskAssessment,
    RemediationRoadmap remediation,
    Appendices appendices,
  });

  $ExecutiveSummaryCopyWith<$Res> get executiveSummary;
  $MethodologyCopyWith<$Res> get methodology;
  $ScopeDocumentationCopyWith<$Res> get scope;
  $RiskAssessmentCopyWith<$Res> get riskAssessment;
  $RemediationRoadmapCopyWith<$Res> get remediation;
  $AppendicesCopyWith<$Res> get appendices;
}

/// @nodoc
class _$ReportContentCopyWithImpl<$Res, $Val extends ReportContent>
    implements $ReportContentCopyWith<$Res> {
  _$ReportContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executiveSummary = null,
    Object? methodology = null,
    Object? scope = null,
    Object? findings = null,
    Object? riskAssessment = null,
    Object? remediation = null,
    Object? appendices = null,
  }) {
    return _then(
      _value.copyWith(
            executiveSummary: null == executiveSummary
                ? _value.executiveSummary
                : executiveSummary // ignore: cast_nullable_to_non_nullable
                      as ExecutiveSummary,
            methodology: null == methodology
                ? _value.methodology
                : methodology // ignore: cast_nullable_to_non_nullable
                      as Methodology,
            scope: null == scope
                ? _value.scope
                : scope // ignore: cast_nullable_to_non_nullable
                      as ScopeDocumentation,
            findings: null == findings
                ? _value.findings
                : findings // ignore: cast_nullable_to_non_nullable
                      as List<TechnicalFinding>,
            riskAssessment: null == riskAssessment
                ? _value.riskAssessment
                : riskAssessment // ignore: cast_nullable_to_non_nullable
                      as RiskAssessment,
            remediation: null == remediation
                ? _value.remediation
                : remediation // ignore: cast_nullable_to_non_nullable
                      as RemediationRoadmap,
            appendices: null == appendices
                ? _value.appendices
                : appendices // ignore: cast_nullable_to_non_nullable
                      as Appendices,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ExecutiveSummaryCopyWith<$Res> get executiveSummary {
    return $ExecutiveSummaryCopyWith<$Res>(_value.executiveSummary, (value) {
      return _then(_value.copyWith(executiveSummary: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MethodologyCopyWith<$Res> get methodology {
    return $MethodologyCopyWith<$Res>(_value.methodology, (value) {
      return _then(_value.copyWith(methodology: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScopeDocumentationCopyWith<$Res> get scope {
    return $ScopeDocumentationCopyWith<$Res>(_value.scope, (value) {
      return _then(_value.copyWith(scope: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RiskAssessmentCopyWith<$Res> get riskAssessment {
    return $RiskAssessmentCopyWith<$Res>(_value.riskAssessment, (value) {
      return _then(_value.copyWith(riskAssessment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RemediationRoadmapCopyWith<$Res> get remediation {
    return $RemediationRoadmapCopyWith<$Res>(_value.remediation, (value) {
      return _then(_value.copyWith(remediation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppendicesCopyWith<$Res> get appendices {
    return $AppendicesCopyWith<$Res>(_value.appendices, (value) {
      return _then(_value.copyWith(appendices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportContentImplCopyWith<$Res>
    implements $ReportContentCopyWith<$Res> {
  factory _$$ReportContentImplCopyWith(
    _$ReportContentImpl value,
    $Res Function(_$ReportContentImpl) then,
  ) = __$$ReportContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ExecutiveSummary executiveSummary,
    Methodology methodology,
    ScopeDocumentation scope,
    List<TechnicalFinding> findings,
    RiskAssessment riskAssessment,
    RemediationRoadmap remediation,
    Appendices appendices,
  });

  @override
  $ExecutiveSummaryCopyWith<$Res> get executiveSummary;
  @override
  $MethodologyCopyWith<$Res> get methodology;
  @override
  $ScopeDocumentationCopyWith<$Res> get scope;
  @override
  $RiskAssessmentCopyWith<$Res> get riskAssessment;
  @override
  $RemediationRoadmapCopyWith<$Res> get remediation;
  @override
  $AppendicesCopyWith<$Res> get appendices;
}

/// @nodoc
class __$$ReportContentImplCopyWithImpl<$Res>
    extends _$ReportContentCopyWithImpl<$Res, _$ReportContentImpl>
    implements _$$ReportContentImplCopyWith<$Res> {
  __$$ReportContentImplCopyWithImpl(
    _$ReportContentImpl _value,
    $Res Function(_$ReportContentImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executiveSummary = null,
    Object? methodology = null,
    Object? scope = null,
    Object? findings = null,
    Object? riskAssessment = null,
    Object? remediation = null,
    Object? appendices = null,
  }) {
    return _then(
      _$ReportContentImpl(
        executiveSummary: null == executiveSummary
            ? _value.executiveSummary
            : executiveSummary // ignore: cast_nullable_to_non_nullable
                  as ExecutiveSummary,
        methodology: null == methodology
            ? _value.methodology
            : methodology // ignore: cast_nullable_to_non_nullable
                  as Methodology,
        scope: null == scope
            ? _value.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as ScopeDocumentation,
        findings: null == findings
            ? _value._findings
            : findings // ignore: cast_nullable_to_non_nullable
                  as List<TechnicalFinding>,
        riskAssessment: null == riskAssessment
            ? _value.riskAssessment
            : riskAssessment // ignore: cast_nullable_to_non_nullable
                  as RiskAssessment,
        remediation: null == remediation
            ? _value.remediation
            : remediation // ignore: cast_nullable_to_non_nullable
                  as RemediationRoadmap,
        appendices: null == appendices
            ? _value.appendices
            : appendices // ignore: cast_nullable_to_non_nullable
                  as Appendices,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportContentImpl implements _ReportContent {
  const _$ReportContentImpl({
    required this.executiveSummary,
    required this.methodology,
    required this.scope,
    required final List<TechnicalFinding> findings,
    required this.riskAssessment,
    required this.remediation,
    required this.appendices,
  }) : _findings = findings;

  factory _$ReportContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportContentImplFromJson(json);

  @override
  final ExecutiveSummary executiveSummary;
  @override
  final Methodology methodology;
  @override
  final ScopeDocumentation scope;
  final List<TechnicalFinding> _findings;
  @override
  List<TechnicalFinding> get findings {
    if (_findings is EqualUnmodifiableListView) return _findings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_findings);
  }

  @override
  final RiskAssessment riskAssessment;
  @override
  final RemediationRoadmap remediation;
  @override
  final Appendices appendices;

  @override
  String toString() {
    return 'ReportContent(executiveSummary: $executiveSummary, methodology: $methodology, scope: $scope, findings: $findings, riskAssessment: $riskAssessment, remediation: $remediation, appendices: $appendices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportContentImpl &&
            (identical(other.executiveSummary, executiveSummary) ||
                other.executiveSummary == executiveSummary) &&
            (identical(other.methodology, methodology) ||
                other.methodology == methodology) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other._findings, _findings) &&
            (identical(other.riskAssessment, riskAssessment) ||
                other.riskAssessment == riskAssessment) &&
            (identical(other.remediation, remediation) ||
                other.remediation == remediation) &&
            (identical(other.appendices, appendices) ||
                other.appendices == appendices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    executiveSummary,
    methodology,
    scope,
    const DeepCollectionEquality().hash(_findings),
    riskAssessment,
    remediation,
    appendices,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportContentImplCopyWith<_$ReportContentImpl> get copyWith =>
      __$$ReportContentImplCopyWithImpl<_$ReportContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportContentImplToJson(this);
  }
}

abstract class _ReportContent implements ReportContent {
  const factory _ReportContent({
    required final ExecutiveSummary executiveSummary,
    required final Methodology methodology,
    required final ScopeDocumentation scope,
    required final List<TechnicalFinding> findings,
    required final RiskAssessment riskAssessment,
    required final RemediationRoadmap remediation,
    required final Appendices appendices,
  }) = _$ReportContentImpl;

  factory _ReportContent.fromJson(Map<String, dynamic> json) =
      _$ReportContentImpl.fromJson;

  @override
  ExecutiveSummary get executiveSummary;
  @override
  Methodology get methodology;
  @override
  ScopeDocumentation get scope;
  @override
  List<TechnicalFinding> get findings;
  @override
  RiskAssessment get riskAssessment;
  @override
  RemediationRoadmap get remediation;
  @override
  Appendices get appendices;
  @override
  @JsonKey(ignore: true)
  _$$ReportContentImplCopyWith<_$ReportContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExecutiveSummary _$ExecutiveSummaryFromJson(Map<String, dynamic> json) {
  return _ExecutiveSummary.fromJson(json);
}

/// @nodoc
mixin _$ExecutiveSummary {
  String get overview => throw _privateConstructorUsedError;
  int get totalFindings => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
  Map<Severity, int> get findingsBySeverity =>
      throw _privateConstructorUsedError;
  double get overallRiskScore => throw _privateConstructorUsedError;
  String get riskRating => throw _privateConstructorUsedError;
  List<KeyMetric> get keyMetrics => throw _privateConstructorUsedError;
  List<String> get criticalRecommendations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExecutiveSummaryCopyWith<ExecutiveSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExecutiveSummaryCopyWith<$Res> {
  factory $ExecutiveSummaryCopyWith(
    ExecutiveSummary value,
    $Res Function(ExecutiveSummary) then,
  ) = _$ExecutiveSummaryCopyWithImpl<$Res, ExecutiveSummary>;
  @useResult
  $Res call({
    String overview,
    int totalFindings,
    @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
    Map<Severity, int> findingsBySeverity,
    double overallRiskScore,
    String riskRating,
    List<KeyMetric> keyMetrics,
    List<String> criticalRecommendations,
  });
}

/// @nodoc
class _$ExecutiveSummaryCopyWithImpl<$Res, $Val extends ExecutiveSummary>
    implements $ExecutiveSummaryCopyWith<$Res> {
  _$ExecutiveSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = null,
    Object? totalFindings = null,
    Object? findingsBySeverity = null,
    Object? overallRiskScore = null,
    Object? riskRating = null,
    Object? keyMetrics = null,
    Object? criticalRecommendations = null,
  }) {
    return _then(
      _value.copyWith(
            overview: null == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                      as String,
            totalFindings: null == totalFindings
                ? _value.totalFindings
                : totalFindings // ignore: cast_nullable_to_non_nullable
                      as int,
            findingsBySeverity: null == findingsBySeverity
                ? _value.findingsBySeverity
                : findingsBySeverity // ignore: cast_nullable_to_non_nullable
                      as Map<Severity, int>,
            overallRiskScore: null == overallRiskScore
                ? _value.overallRiskScore
                : overallRiskScore // ignore: cast_nullable_to_non_nullable
                      as double,
            riskRating: null == riskRating
                ? _value.riskRating
                : riskRating // ignore: cast_nullable_to_non_nullable
                      as String,
            keyMetrics: null == keyMetrics
                ? _value.keyMetrics
                : keyMetrics // ignore: cast_nullable_to_non_nullable
                      as List<KeyMetric>,
            criticalRecommendations: null == criticalRecommendations
                ? _value.criticalRecommendations
                : criticalRecommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExecutiveSummaryImplCopyWith<$Res>
    implements $ExecutiveSummaryCopyWith<$Res> {
  factory _$$ExecutiveSummaryImplCopyWith(
    _$ExecutiveSummaryImpl value,
    $Res Function(_$ExecutiveSummaryImpl) then,
  ) = __$$ExecutiveSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String overview,
    int totalFindings,
    @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
    Map<Severity, int> findingsBySeverity,
    double overallRiskScore,
    String riskRating,
    List<KeyMetric> keyMetrics,
    List<String> criticalRecommendations,
  });
}

/// @nodoc
class __$$ExecutiveSummaryImplCopyWithImpl<$Res>
    extends _$ExecutiveSummaryCopyWithImpl<$Res, _$ExecutiveSummaryImpl>
    implements _$$ExecutiveSummaryImplCopyWith<$Res> {
  __$$ExecutiveSummaryImplCopyWithImpl(
    _$ExecutiveSummaryImpl _value,
    $Res Function(_$ExecutiveSummaryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = null,
    Object? totalFindings = null,
    Object? findingsBySeverity = null,
    Object? overallRiskScore = null,
    Object? riskRating = null,
    Object? keyMetrics = null,
    Object? criticalRecommendations = null,
  }) {
    return _then(
      _$ExecutiveSummaryImpl(
        overview: null == overview
            ? _value.overview
            : overview // ignore: cast_nullable_to_non_nullable
                  as String,
        totalFindings: null == totalFindings
            ? _value.totalFindings
            : totalFindings // ignore: cast_nullable_to_non_nullable
                  as int,
        findingsBySeverity: null == findingsBySeverity
            ? _value._findingsBySeverity
            : findingsBySeverity // ignore: cast_nullable_to_non_nullable
                  as Map<Severity, int>,
        overallRiskScore: null == overallRiskScore
            ? _value.overallRiskScore
            : overallRiskScore // ignore: cast_nullable_to_non_nullable
                  as double,
        riskRating: null == riskRating
            ? _value.riskRating
            : riskRating // ignore: cast_nullable_to_non_nullable
                  as String,
        keyMetrics: null == keyMetrics
            ? _value._keyMetrics
            : keyMetrics // ignore: cast_nullable_to_non_nullable
                  as List<KeyMetric>,
        criticalRecommendations: null == criticalRecommendations
            ? _value._criticalRecommendations
            : criticalRecommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExecutiveSummaryImpl implements _ExecutiveSummary {
  const _$ExecutiveSummaryImpl({
    required this.overview,
    required this.totalFindings,
    @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
    required final Map<Severity, int> findingsBySeverity,
    required this.overallRiskScore,
    required this.riskRating,
    required final List<KeyMetric> keyMetrics,
    required final List<String> criticalRecommendations,
  }) : _findingsBySeverity = findingsBySeverity,
       _keyMetrics = keyMetrics,
       _criticalRecommendations = criticalRecommendations;

  factory _$ExecutiveSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExecutiveSummaryImplFromJson(json);

  @override
  final String overview;
  @override
  final int totalFindings;
  final Map<Severity, int> _findingsBySeverity;
  @override
  @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
  Map<Severity, int> get findingsBySeverity {
    if (_findingsBySeverity is EqualUnmodifiableMapView)
      return _findingsBySeverity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_findingsBySeverity);
  }

  @override
  final double overallRiskScore;
  @override
  final String riskRating;
  final List<KeyMetric> _keyMetrics;
  @override
  List<KeyMetric> get keyMetrics {
    if (_keyMetrics is EqualUnmodifiableListView) return _keyMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyMetrics);
  }

  final List<String> _criticalRecommendations;
  @override
  List<String> get criticalRecommendations {
    if (_criticalRecommendations is EqualUnmodifiableListView)
      return _criticalRecommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_criticalRecommendations);
  }

  @override
  String toString() {
    return 'ExecutiveSummary(overview: $overview, totalFindings: $totalFindings, findingsBySeverity: $findingsBySeverity, overallRiskScore: $overallRiskScore, riskRating: $riskRating, keyMetrics: $keyMetrics, criticalRecommendations: $criticalRecommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExecutiveSummaryImpl &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.totalFindings, totalFindings) ||
                other.totalFindings == totalFindings) &&
            const DeepCollectionEquality().equals(
              other._findingsBySeverity,
              _findingsBySeverity,
            ) &&
            (identical(other.overallRiskScore, overallRiskScore) ||
                other.overallRiskScore == overallRiskScore) &&
            (identical(other.riskRating, riskRating) ||
                other.riskRating == riskRating) &&
            const DeepCollectionEquality().equals(
              other._keyMetrics,
              _keyMetrics,
            ) &&
            const DeepCollectionEquality().equals(
              other._criticalRecommendations,
              _criticalRecommendations,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    overview,
    totalFindings,
    const DeepCollectionEquality().hash(_findingsBySeverity),
    overallRiskScore,
    riskRating,
    const DeepCollectionEquality().hash(_keyMetrics),
    const DeepCollectionEquality().hash(_criticalRecommendations),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExecutiveSummaryImplCopyWith<_$ExecutiveSummaryImpl> get copyWith =>
      __$$ExecutiveSummaryImplCopyWithImpl<_$ExecutiveSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExecutiveSummaryImplToJson(this);
  }
}

abstract class _ExecutiveSummary implements ExecutiveSummary {
  const factory _ExecutiveSummary({
    required final String overview,
    required final int totalFindings,
    @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
    required final Map<Severity, int> findingsBySeverity,
    required final double overallRiskScore,
    required final String riskRating,
    required final List<KeyMetric> keyMetrics,
    required final List<String> criticalRecommendations,
  }) = _$ExecutiveSummaryImpl;

  factory _ExecutiveSummary.fromJson(Map<String, dynamic> json) =
      _$ExecutiveSummaryImpl.fromJson;

  @override
  String get overview;
  @override
  int get totalFindings;
  @override
  @JsonKey(fromJson: _severityCountsFromJson, toJson: _severityCountsToJson)
  Map<Severity, int> get findingsBySeverity;
  @override
  double get overallRiskScore;
  @override
  String get riskRating;
  @override
  List<KeyMetric> get keyMetrics;
  @override
  List<String> get criticalRecommendations;
  @override
  @JsonKey(ignore: true)
  _$$ExecutiveSummaryImplCopyWith<_$ExecutiveSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyMetric _$KeyMetricFromJson(Map<String, dynamic> json) {
  return _KeyMetric.fromJson(json);
}

/// @nodoc
mixin _$KeyMetric {
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  MetricTrend get trend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyMetricCopyWith<KeyMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyMetricCopyWith<$Res> {
  factory $KeyMetricCopyWith(KeyMetric value, $Res Function(KeyMetric) then) =
      _$KeyMetricCopyWithImpl<$Res, KeyMetric>;
  @useResult
  $Res call({String name, String value, String unit, MetricTrend trend});
}

/// @nodoc
class _$KeyMetricCopyWithImpl<$Res, $Val extends KeyMetric>
    implements $KeyMetricCopyWith<$Res> {
  _$KeyMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? unit = null,
    Object? trend = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            trend: null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                      as MetricTrend,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KeyMetricImplCopyWith<$Res>
    implements $KeyMetricCopyWith<$Res> {
  factory _$$KeyMetricImplCopyWith(
    _$KeyMetricImpl value,
    $Res Function(_$KeyMetricImpl) then,
  ) = __$$KeyMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String value, String unit, MetricTrend trend});
}

/// @nodoc
class __$$KeyMetricImplCopyWithImpl<$Res>
    extends _$KeyMetricCopyWithImpl<$Res, _$KeyMetricImpl>
    implements _$$KeyMetricImplCopyWith<$Res> {
  __$$KeyMetricImplCopyWithImpl(
    _$KeyMetricImpl _value,
    $Res Function(_$KeyMetricImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? unit = null,
    Object? trend = null,
  }) {
    return _then(
      _$KeyMetricImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        trend: null == trend
            ? _value.trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as MetricTrend,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KeyMetricImpl implements _KeyMetric {
  const _$KeyMetricImpl({
    required this.name,
    required this.value,
    required this.unit,
    required this.trend,
  });

  factory _$KeyMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeyMetricImplFromJson(json);

  @override
  final String name;
  @override
  final String value;
  @override
  final String unit;
  @override
  final MetricTrend trend;

  @override
  String toString() {
    return 'KeyMetric(name: $name, value: $value, unit: $unit, trend: $trend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyMetricImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.trend, trend) || other.trend == trend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, unit, trend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyMetricImplCopyWith<_$KeyMetricImpl> get copyWith =>
      __$$KeyMetricImplCopyWithImpl<_$KeyMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeyMetricImplToJson(this);
  }
}

abstract class _KeyMetric implements KeyMetric {
  const factory _KeyMetric({
    required final String name,
    required final String value,
    required final String unit,
    required final MetricTrend trend,
  }) = _$KeyMetricImpl;

  factory _KeyMetric.fromJson(Map<String, dynamic> json) =
      _$KeyMetricImpl.fromJson;

  @override
  String get name;
  @override
  String get value;
  @override
  String get unit;
  @override
  MetricTrend get trend;
  @override
  @JsonKey(ignore: true)
  _$$KeyMetricImplCopyWith<_$KeyMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Methodology _$MethodologyFromJson(Map<String, dynamic> json) {
  return _Methodology.fromJson(json);
}

/// @nodoc
mixin _$Methodology {
  String get description => throw _privateConstructorUsedError;
  List<String> get standards => throw _privateConstructorUsedError;
  List<String> get tools => throw _privateConstructorUsedError;
  List<String> get techniques => throw _privateConstructorUsedError;
  List<String> get exclusions => throw _privateConstructorUsedError;
  DateTime get assessmentPeriodStart => throw _privateConstructorUsedError;
  DateTime get assessmentPeriodEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MethodologyCopyWith<Methodology> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodologyCopyWith<$Res> {
  factory $MethodologyCopyWith(
    Methodology value,
    $Res Function(Methodology) then,
  ) = _$MethodologyCopyWithImpl<$Res, Methodology>;
  @useResult
  $Res call({
    String description,
    List<String> standards,
    List<String> tools,
    List<String> techniques,
    List<String> exclusions,
    DateTime assessmentPeriodStart,
    DateTime assessmentPeriodEnd,
  });
}

/// @nodoc
class _$MethodologyCopyWithImpl<$Res, $Val extends Methodology>
    implements $MethodologyCopyWith<$Res> {
  _$MethodologyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? standards = null,
    Object? tools = null,
    Object? techniques = null,
    Object? exclusions = null,
    Object? assessmentPeriodStart = null,
    Object? assessmentPeriodEnd = null,
  }) {
    return _then(
      _value.copyWith(
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            standards: null == standards
                ? _value.standards
                : standards // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            tools: null == tools
                ? _value.tools
                : tools // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            techniques: null == techniques
                ? _value.techniques
                : techniques // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            exclusions: null == exclusions
                ? _value.exclusions
                : exclusions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            assessmentPeriodStart: null == assessmentPeriodStart
                ? _value.assessmentPeriodStart
                : assessmentPeriodStart // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            assessmentPeriodEnd: null == assessmentPeriodEnd
                ? _value.assessmentPeriodEnd
                : assessmentPeriodEnd // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MethodologyImplCopyWith<$Res>
    implements $MethodologyCopyWith<$Res> {
  factory _$$MethodologyImplCopyWith(
    _$MethodologyImpl value,
    $Res Function(_$MethodologyImpl) then,
  ) = __$$MethodologyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String description,
    List<String> standards,
    List<String> tools,
    List<String> techniques,
    List<String> exclusions,
    DateTime assessmentPeriodStart,
    DateTime assessmentPeriodEnd,
  });
}

/// @nodoc
class __$$MethodologyImplCopyWithImpl<$Res>
    extends _$MethodologyCopyWithImpl<$Res, _$MethodologyImpl>
    implements _$$MethodologyImplCopyWith<$Res> {
  __$$MethodologyImplCopyWithImpl(
    _$MethodologyImpl _value,
    $Res Function(_$MethodologyImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? standards = null,
    Object? tools = null,
    Object? techniques = null,
    Object? exclusions = null,
    Object? assessmentPeriodStart = null,
    Object? assessmentPeriodEnd = null,
  }) {
    return _then(
      _$MethodologyImpl(
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        standards: null == standards
            ? _value._standards
            : standards // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tools: null == tools
            ? _value._tools
            : tools // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        techniques: null == techniques
            ? _value._techniques
            : techniques // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        exclusions: null == exclusions
            ? _value._exclusions
            : exclusions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        assessmentPeriodStart: null == assessmentPeriodStart
            ? _value.assessmentPeriodStart
            : assessmentPeriodStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        assessmentPeriodEnd: null == assessmentPeriodEnd
            ? _value.assessmentPeriodEnd
            : assessmentPeriodEnd // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MethodologyImpl implements _Methodology {
  const _$MethodologyImpl({
    required this.description,
    required final List<String> standards,
    required final List<String> tools,
    required final List<String> techniques,
    required final List<String> exclusions,
    required this.assessmentPeriodStart,
    required this.assessmentPeriodEnd,
  }) : _standards = standards,
       _tools = tools,
       _techniques = techniques,
       _exclusions = exclusions;

  factory _$MethodologyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MethodologyImplFromJson(json);

  @override
  final String description;
  final List<String> _standards;
  @override
  List<String> get standards {
    if (_standards is EqualUnmodifiableListView) return _standards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_standards);
  }

  final List<String> _tools;
  @override
  List<String> get tools {
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tools);
  }

  final List<String> _techniques;
  @override
  List<String> get techniques {
    if (_techniques is EqualUnmodifiableListView) return _techniques;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_techniques);
  }

  final List<String> _exclusions;
  @override
  List<String> get exclusions {
    if (_exclusions is EqualUnmodifiableListView) return _exclusions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exclusions);
  }

  @override
  final DateTime assessmentPeriodStart;
  @override
  final DateTime assessmentPeriodEnd;

  @override
  String toString() {
    return 'Methodology(description: $description, standards: $standards, tools: $tools, techniques: $techniques, exclusions: $exclusions, assessmentPeriodStart: $assessmentPeriodStart, assessmentPeriodEnd: $assessmentPeriodEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MethodologyImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._standards,
              _standards,
            ) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            const DeepCollectionEquality().equals(
              other._techniques,
              _techniques,
            ) &&
            const DeepCollectionEquality().equals(
              other._exclusions,
              _exclusions,
            ) &&
            (identical(other.assessmentPeriodStart, assessmentPeriodStart) ||
                other.assessmentPeriodStart == assessmentPeriodStart) &&
            (identical(other.assessmentPeriodEnd, assessmentPeriodEnd) ||
                other.assessmentPeriodEnd == assessmentPeriodEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    const DeepCollectionEquality().hash(_standards),
    const DeepCollectionEquality().hash(_tools),
    const DeepCollectionEquality().hash(_techniques),
    const DeepCollectionEquality().hash(_exclusions),
    assessmentPeriodStart,
    assessmentPeriodEnd,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MethodologyImplCopyWith<_$MethodologyImpl> get copyWith =>
      __$$MethodologyImplCopyWithImpl<_$MethodologyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MethodologyImplToJson(this);
  }
}

abstract class _Methodology implements Methodology {
  const factory _Methodology({
    required final String description,
    required final List<String> standards,
    required final List<String> tools,
    required final List<String> techniques,
    required final List<String> exclusions,
    required final DateTime assessmentPeriodStart,
    required final DateTime assessmentPeriodEnd,
  }) = _$MethodologyImpl;

  factory _Methodology.fromJson(Map<String, dynamic> json) =
      _$MethodologyImpl.fromJson;

  @override
  String get description;
  @override
  List<String> get standards;
  @override
  List<String> get tools;
  @override
  List<String> get techniques;
  @override
  List<String> get exclusions;
  @override
  DateTime get assessmentPeriodStart;
  @override
  DateTime get assessmentPeriodEnd;
  @override
  @JsonKey(ignore: true)
  _$$MethodologyImplCopyWith<_$MethodologyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScopeDocumentation _$ScopeDocumentationFromJson(Map<String, dynamic> json) {
  return _ScopeDocumentation.fromJson(json);
}

/// @nodoc
mixin _$ScopeDocumentation {
  List<String> get inScope => throw _privateConstructorUsedError;
  List<String> get outOfScope => throw _privateConstructorUsedError;
  List<String> get limitations => throw _privateConstructorUsedError;
  String get assumptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScopeDocumentationCopyWith<ScopeDocumentation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScopeDocumentationCopyWith<$Res> {
  factory $ScopeDocumentationCopyWith(
    ScopeDocumentation value,
    $Res Function(ScopeDocumentation) then,
  ) = _$ScopeDocumentationCopyWithImpl<$Res, ScopeDocumentation>;
  @useResult
  $Res call({
    List<String> inScope,
    List<String> outOfScope,
    List<String> limitations,
    String assumptions,
  });
}

/// @nodoc
class _$ScopeDocumentationCopyWithImpl<$Res, $Val extends ScopeDocumentation>
    implements $ScopeDocumentationCopyWith<$Res> {
  _$ScopeDocumentationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inScope = null,
    Object? outOfScope = null,
    Object? limitations = null,
    Object? assumptions = null,
  }) {
    return _then(
      _value.copyWith(
            inScope: null == inScope
                ? _value.inScope
                : inScope // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            outOfScope: null == outOfScope
                ? _value.outOfScope
                : outOfScope // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            limitations: null == limitations
                ? _value.limitations
                : limitations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            assumptions: null == assumptions
                ? _value.assumptions
                : assumptions // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScopeDocumentationImplCopyWith<$Res>
    implements $ScopeDocumentationCopyWith<$Res> {
  factory _$$ScopeDocumentationImplCopyWith(
    _$ScopeDocumentationImpl value,
    $Res Function(_$ScopeDocumentationImpl) then,
  ) = __$$ScopeDocumentationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> inScope,
    List<String> outOfScope,
    List<String> limitations,
    String assumptions,
  });
}

/// @nodoc
class __$$ScopeDocumentationImplCopyWithImpl<$Res>
    extends _$ScopeDocumentationCopyWithImpl<$Res, _$ScopeDocumentationImpl>
    implements _$$ScopeDocumentationImplCopyWith<$Res> {
  __$$ScopeDocumentationImplCopyWithImpl(
    _$ScopeDocumentationImpl _value,
    $Res Function(_$ScopeDocumentationImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inScope = null,
    Object? outOfScope = null,
    Object? limitations = null,
    Object? assumptions = null,
  }) {
    return _then(
      _$ScopeDocumentationImpl(
        inScope: null == inScope
            ? _value._inScope
            : inScope // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        outOfScope: null == outOfScope
            ? _value._outOfScope
            : outOfScope // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        limitations: null == limitations
            ? _value._limitations
            : limitations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        assumptions: null == assumptions
            ? _value.assumptions
            : assumptions // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScopeDocumentationImpl implements _ScopeDocumentation {
  const _$ScopeDocumentationImpl({
    required final List<String> inScope,
    required final List<String> outOfScope,
    required final List<String> limitations,
    required this.assumptions,
  }) : _inScope = inScope,
       _outOfScope = outOfScope,
       _limitations = limitations;

  factory _$ScopeDocumentationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScopeDocumentationImplFromJson(json);

  final List<String> _inScope;
  @override
  List<String> get inScope {
    if (_inScope is EqualUnmodifiableListView) return _inScope;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inScope);
  }

  final List<String> _outOfScope;
  @override
  List<String> get outOfScope {
    if (_outOfScope is EqualUnmodifiableListView) return _outOfScope;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outOfScope);
  }

  final List<String> _limitations;
  @override
  List<String> get limitations {
    if (_limitations is EqualUnmodifiableListView) return _limitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_limitations);
  }

  @override
  final String assumptions;

  @override
  String toString() {
    return 'ScopeDocumentation(inScope: $inScope, outOfScope: $outOfScope, limitations: $limitations, assumptions: $assumptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScopeDocumentationImpl &&
            const DeepCollectionEquality().equals(other._inScope, _inScope) &&
            const DeepCollectionEquality().equals(
              other._outOfScope,
              _outOfScope,
            ) &&
            const DeepCollectionEquality().equals(
              other._limitations,
              _limitations,
            ) &&
            (identical(other.assumptions, assumptions) ||
                other.assumptions == assumptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_inScope),
    const DeepCollectionEquality().hash(_outOfScope),
    const DeepCollectionEquality().hash(_limitations),
    assumptions,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScopeDocumentationImplCopyWith<_$ScopeDocumentationImpl> get copyWith =>
      __$$ScopeDocumentationImplCopyWithImpl<_$ScopeDocumentationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScopeDocumentationImplToJson(this);
  }
}

abstract class _ScopeDocumentation implements ScopeDocumentation {
  const factory _ScopeDocumentation({
    required final List<String> inScope,
    required final List<String> outOfScope,
    required final List<String> limitations,
    required final String assumptions,
  }) = _$ScopeDocumentationImpl;

  factory _ScopeDocumentation.fromJson(Map<String, dynamic> json) =
      _$ScopeDocumentationImpl.fromJson;

  @override
  List<String> get inScope;
  @override
  List<String> get outOfScope;
  @override
  List<String> get limitations;
  @override
  String get assumptions;
  @override
  @JsonKey(ignore: true)
  _$$ScopeDocumentationImplCopyWith<_$ScopeDocumentationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TechnicalFinding _$TechnicalFindingFromJson(Map<String, dynamic> json) {
  return _TechnicalFinding.fromJson(json);
}

/// @nodoc
mixin _$TechnicalFinding {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Severity get severity => throw _privateConstructorUsedError;
  CvssVector get cvss => throw _privateConstructorUsedError;
  String get affectedComponent => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get impact => throw _privateConstructorUsedError;
  String get likelihood => throw _privateConstructorUsedError;
  String get reproductionSteps => throw _privateConstructorUsedError;
  String get evidence => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  List<String> get references => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TechnicalFindingCopyWith<TechnicalFinding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnicalFindingCopyWith<$Res> {
  factory $TechnicalFindingCopyWith(
    TechnicalFinding value,
    $Res Function(TechnicalFinding) then,
  ) = _$TechnicalFindingCopyWithImpl<$Res, TechnicalFinding>;
  @useResult
  $Res call({
    String id,
    String title,
    Severity severity,
    CvssVector cvss,
    String affectedComponent,
    String description,
    String impact,
    String likelihood,
    String reproductionSteps,
    String evidence,
    String recommendation,
    List<String> references,
    Map<String, dynamic> metadata,
    List<String> tags,
  });

  $CvssVectorCopyWith<$Res> get cvss;
}

/// @nodoc
class _$TechnicalFindingCopyWithImpl<$Res, $Val extends TechnicalFinding>
    implements $TechnicalFindingCopyWith<$Res> {
  _$TechnicalFindingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? severity = null,
    Object? cvss = null,
    Object? affectedComponent = null,
    Object? description = null,
    Object? impact = null,
    Object? likelihood = null,
    Object? reproductionSteps = null,
    Object? evidence = null,
    Object? recommendation = null,
    Object? references = null,
    Object? metadata = null,
    Object? tags = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as Severity,
            cvss: null == cvss
                ? _value.cvss
                : cvss // ignore: cast_nullable_to_non_nullable
                      as CvssVector,
            affectedComponent: null == affectedComponent
                ? _value.affectedComponent
                : affectedComponent // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            impact: null == impact
                ? _value.impact
                : impact // ignore: cast_nullable_to_non_nullable
                      as String,
            likelihood: null == likelihood
                ? _value.likelihood
                : likelihood // ignore: cast_nullable_to_non_nullable
                      as String,
            reproductionSteps: null == reproductionSteps
                ? _value.reproductionSteps
                : reproductionSteps // ignore: cast_nullable_to_non_nullable
                      as String,
            evidence: null == evidence
                ? _value.evidence
                : evidence // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            references: null == references
                ? _value.references
                : references // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
abstract class _$$TechnicalFindingImplCopyWith<$Res>
    implements $TechnicalFindingCopyWith<$Res> {
  factory _$$TechnicalFindingImplCopyWith(
    _$TechnicalFindingImpl value,
    $Res Function(_$TechnicalFindingImpl) then,
  ) = __$$TechnicalFindingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    Severity severity,
    CvssVector cvss,
    String affectedComponent,
    String description,
    String impact,
    String likelihood,
    String reproductionSteps,
    String evidence,
    String recommendation,
    List<String> references,
    Map<String, dynamic> metadata,
    List<String> tags,
  });

  @override
  $CvssVectorCopyWith<$Res> get cvss;
}

/// @nodoc
class __$$TechnicalFindingImplCopyWithImpl<$Res>
    extends _$TechnicalFindingCopyWithImpl<$Res, _$TechnicalFindingImpl>
    implements _$$TechnicalFindingImplCopyWith<$Res> {
  __$$TechnicalFindingImplCopyWithImpl(
    _$TechnicalFindingImpl _value,
    $Res Function(_$TechnicalFindingImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? severity = null,
    Object? cvss = null,
    Object? affectedComponent = null,
    Object? description = null,
    Object? impact = null,
    Object? likelihood = null,
    Object? reproductionSteps = null,
    Object? evidence = null,
    Object? recommendation = null,
    Object? references = null,
    Object? metadata = null,
    Object? tags = null,
  }) {
    return _then(
      _$TechnicalFindingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as Severity,
        cvss: null == cvss
            ? _value.cvss
            : cvss // ignore: cast_nullable_to_non_nullable
                  as CvssVector,
        affectedComponent: null == affectedComponent
            ? _value.affectedComponent
            : affectedComponent // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        impact: null == impact
            ? _value.impact
            : impact // ignore: cast_nullable_to_non_nullable
                  as String,
        likelihood: null == likelihood
            ? _value.likelihood
            : likelihood // ignore: cast_nullable_to_non_nullable
                  as String,
        reproductionSteps: null == reproductionSteps
            ? _value.reproductionSteps
            : reproductionSteps // ignore: cast_nullable_to_non_nullable
                  as String,
        evidence: null == evidence
            ? _value.evidence
            : evidence // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        references: null == references
            ? _value._references
            : references // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TechnicalFindingImpl implements _TechnicalFinding {
  const _$TechnicalFindingImpl({
    required this.id,
    required this.title,
    required this.severity,
    required this.cvss,
    required this.affectedComponent,
    required this.description,
    required this.impact,
    required this.likelihood,
    required this.reproductionSteps,
    required this.evidence,
    required this.recommendation,
    required final List<String> references,
    required final Map<String, dynamic> metadata,
    final List<String> tags = const [],
  }) : _references = references,
       _metadata = metadata,
       _tags = tags;

  factory _$TechnicalFindingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechnicalFindingImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final Severity severity;
  @override
  final CvssVector cvss;
  @override
  final String affectedComponent;
  @override
  final String description;
  @override
  final String impact;
  @override
  final String likelihood;
  @override
  final String reproductionSteps;
  @override
  final String evidence;
  @override
  final String recommendation;
  final List<String> _references;
  @override
  List<String> get references {
    if (_references is EqualUnmodifiableListView) return _references;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_references);
  }

  final Map<String, dynamic> _metadata;
  @override
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
  String toString() {
    return 'TechnicalFinding(id: $id, title: $title, severity: $severity, cvss: $cvss, affectedComponent: $affectedComponent, description: $description, impact: $impact, likelihood: $likelihood, reproductionSteps: $reproductionSteps, evidence: $evidence, recommendation: $recommendation, references: $references, metadata: $metadata, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnicalFindingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.cvss, cvss) || other.cvss == cvss) &&
            (identical(other.affectedComponent, affectedComponent) ||
                other.affectedComponent == affectedComponent) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.impact, impact) || other.impact == impact) &&
            (identical(other.likelihood, likelihood) ||
                other.likelihood == likelihood) &&
            (identical(other.reproductionSteps, reproductionSteps) ||
                other.reproductionSteps == reproductionSteps) &&
            (identical(other.evidence, evidence) ||
                other.evidence == evidence) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            const DeepCollectionEquality().equals(
              other._references,
              _references,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    severity,
    cvss,
    affectedComponent,
    description,
    impact,
    likelihood,
    reproductionSteps,
    evidence,
    recommendation,
    const DeepCollectionEquality().hash(_references),
    const DeepCollectionEquality().hash(_metadata),
    const DeepCollectionEquality().hash(_tags),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnicalFindingImplCopyWith<_$TechnicalFindingImpl> get copyWith =>
      __$$TechnicalFindingImplCopyWithImpl<_$TechnicalFindingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TechnicalFindingImplToJson(this);
  }
}

abstract class _TechnicalFinding implements TechnicalFinding {
  const factory _TechnicalFinding({
    required final String id,
    required final String title,
    required final Severity severity,
    required final CvssVector cvss,
    required final String affectedComponent,
    required final String description,
    required final String impact,
    required final String likelihood,
    required final String reproductionSteps,
    required final String evidence,
    required final String recommendation,
    required final List<String> references,
    required final Map<String, dynamic> metadata,
    final List<String> tags,
  }) = _$TechnicalFindingImpl;

  factory _TechnicalFinding.fromJson(Map<String, dynamic> json) =
      _$TechnicalFindingImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  Severity get severity;
  @override
  CvssVector get cvss;
  @override
  String get affectedComponent;
  @override
  String get description;
  @override
  String get impact;
  @override
  String get likelihood;
  @override
  String get reproductionSteps;
  @override
  String get evidence;
  @override
  String get recommendation;
  @override
  List<String> get references;
  @override
  Map<String, dynamic> get metadata;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$TechnicalFindingImplCopyWith<_$TechnicalFindingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskAssessment _$RiskAssessmentFromJson(Map<String, dynamic> json) {
  return _RiskAssessment.fromJson(json);
}

/// @nodoc
mixin _$RiskAssessment {
  double get overallScore => throw _privateConstructorUsedError;
  String get overallRating => throw _privateConstructorUsedError;
  Map<String, double> get categoryScores => throw _privateConstructorUsedError;
  Map<String, String> get categoryRatings => throw _privateConstructorUsedError;
  List<RiskFactor> get riskFactors => throw _privateConstructorUsedError;
  String get riskAppetiteAlignment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RiskAssessmentCopyWith<RiskAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskAssessmentCopyWith<$Res> {
  factory $RiskAssessmentCopyWith(
    RiskAssessment value,
    $Res Function(RiskAssessment) then,
  ) = _$RiskAssessmentCopyWithImpl<$Res, RiskAssessment>;
  @useResult
  $Res call({
    double overallScore,
    String overallRating,
    Map<String, double> categoryScores,
    Map<String, String> categoryRatings,
    List<RiskFactor> riskFactors,
    String riskAppetiteAlignment,
  });
}

/// @nodoc
class _$RiskAssessmentCopyWithImpl<$Res, $Val extends RiskAssessment>
    implements $RiskAssessmentCopyWith<$Res> {
  _$RiskAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? overallRating = null,
    Object? categoryScores = null,
    Object? categoryRatings = null,
    Object? riskFactors = null,
    Object? riskAppetiteAlignment = null,
  }) {
    return _then(
      _value.copyWith(
            overallScore: null == overallScore
                ? _value.overallScore
                : overallScore // ignore: cast_nullable_to_non_nullable
                      as double,
            overallRating: null == overallRating
                ? _value.overallRating
                : overallRating // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryScores: null == categoryScores
                ? _value.categoryScores
                : categoryScores // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            categoryRatings: null == categoryRatings
                ? _value.categoryRatings
                : categoryRatings // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            riskFactors: null == riskFactors
                ? _value.riskFactors
                : riskFactors // ignore: cast_nullable_to_non_nullable
                      as List<RiskFactor>,
            riskAppetiteAlignment: null == riskAppetiteAlignment
                ? _value.riskAppetiteAlignment
                : riskAppetiteAlignment // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RiskAssessmentImplCopyWith<$Res>
    implements $RiskAssessmentCopyWith<$Res> {
  factory _$$RiskAssessmentImplCopyWith(
    _$RiskAssessmentImpl value,
    $Res Function(_$RiskAssessmentImpl) then,
  ) = __$$RiskAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double overallScore,
    String overallRating,
    Map<String, double> categoryScores,
    Map<String, String> categoryRatings,
    List<RiskFactor> riskFactors,
    String riskAppetiteAlignment,
  });
}

/// @nodoc
class __$$RiskAssessmentImplCopyWithImpl<$Res>
    extends _$RiskAssessmentCopyWithImpl<$Res, _$RiskAssessmentImpl>
    implements _$$RiskAssessmentImplCopyWith<$Res> {
  __$$RiskAssessmentImplCopyWithImpl(
    _$RiskAssessmentImpl _value,
    $Res Function(_$RiskAssessmentImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? overallRating = null,
    Object? categoryScores = null,
    Object? categoryRatings = null,
    Object? riskFactors = null,
    Object? riskAppetiteAlignment = null,
  }) {
    return _then(
      _$RiskAssessmentImpl(
        overallScore: null == overallScore
            ? _value.overallScore
            : overallScore // ignore: cast_nullable_to_non_nullable
                  as double,
        overallRating: null == overallRating
            ? _value.overallRating
            : overallRating // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryScores: null == categoryScores
            ? _value._categoryScores
            : categoryScores // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        categoryRatings: null == categoryRatings
            ? _value._categoryRatings
            : categoryRatings // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        riskFactors: null == riskFactors
            ? _value._riskFactors
            : riskFactors // ignore: cast_nullable_to_non_nullable
                  as List<RiskFactor>,
        riskAppetiteAlignment: null == riskAppetiteAlignment
            ? _value.riskAppetiteAlignment
            : riskAppetiteAlignment // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskAssessmentImpl implements _RiskAssessment {
  const _$RiskAssessmentImpl({
    required this.overallScore,
    required this.overallRating,
    required final Map<String, double> categoryScores,
    required final Map<String, String> categoryRatings,
    required final List<RiskFactor> riskFactors,
    required this.riskAppetiteAlignment,
  }) : _categoryScores = categoryScores,
       _categoryRatings = categoryRatings,
       _riskFactors = riskFactors;

  factory _$RiskAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskAssessmentImplFromJson(json);

  @override
  final double overallScore;
  @override
  final String overallRating;
  final Map<String, double> _categoryScores;
  @override
  Map<String, double> get categoryScores {
    if (_categoryScores is EqualUnmodifiableMapView) return _categoryScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryScores);
  }

  final Map<String, String> _categoryRatings;
  @override
  Map<String, String> get categoryRatings {
    if (_categoryRatings is EqualUnmodifiableMapView) return _categoryRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryRatings);
  }

  final List<RiskFactor> _riskFactors;
  @override
  List<RiskFactor> get riskFactors {
    if (_riskFactors is EqualUnmodifiableListView) return _riskFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_riskFactors);
  }

  @override
  final String riskAppetiteAlignment;

  @override
  String toString() {
    return 'RiskAssessment(overallScore: $overallScore, overallRating: $overallRating, categoryScores: $categoryScores, categoryRatings: $categoryRatings, riskFactors: $riskFactors, riskAppetiteAlignment: $riskAppetiteAlignment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskAssessmentImpl &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.overallRating, overallRating) ||
                other.overallRating == overallRating) &&
            const DeepCollectionEquality().equals(
              other._categoryScores,
              _categoryScores,
            ) &&
            const DeepCollectionEquality().equals(
              other._categoryRatings,
              _categoryRatings,
            ) &&
            const DeepCollectionEquality().equals(
              other._riskFactors,
              _riskFactors,
            ) &&
            (identical(other.riskAppetiteAlignment, riskAppetiteAlignment) ||
                other.riskAppetiteAlignment == riskAppetiteAlignment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    overallScore,
    overallRating,
    const DeepCollectionEquality().hash(_categoryScores),
    const DeepCollectionEquality().hash(_categoryRatings),
    const DeepCollectionEquality().hash(_riskFactors),
    riskAppetiteAlignment,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith =>
      __$$RiskAssessmentImplCopyWithImpl<_$RiskAssessmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskAssessmentImplToJson(this);
  }
}

abstract class _RiskAssessment implements RiskAssessment {
  const factory _RiskAssessment({
    required final double overallScore,
    required final String overallRating,
    required final Map<String, double> categoryScores,
    required final Map<String, String> categoryRatings,
    required final List<RiskFactor> riskFactors,
    required final String riskAppetiteAlignment,
  }) = _$RiskAssessmentImpl;

  factory _RiskAssessment.fromJson(Map<String, dynamic> json) =
      _$RiskAssessmentImpl.fromJson;

  @override
  double get overallScore;
  @override
  String get overallRating;
  @override
  Map<String, double> get categoryScores;
  @override
  Map<String, String> get categoryRatings;
  @override
  List<RiskFactor> get riskFactors;
  @override
  String get riskAppetiteAlignment;
  @override
  @JsonKey(ignore: true)
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskFactor _$RiskFactorFromJson(Map<String, dynamic> json) {
  return _RiskFactor.fromJson(json);
}

/// @nodoc
mixin _$RiskFactor {
  String get name => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get contributingFindings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RiskFactorCopyWith<RiskFactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskFactorCopyWith<$Res> {
  factory $RiskFactorCopyWith(
    RiskFactor value,
    $Res Function(RiskFactor) then,
  ) = _$RiskFactorCopyWithImpl<$Res, RiskFactor>;
  @useResult
  $Res call({
    String name,
    double score,
    String rating,
    String description,
    List<String> contributingFindings,
  });
}

/// @nodoc
class _$RiskFactorCopyWithImpl<$Res, $Val extends RiskFactor>
    implements $RiskFactorCopyWith<$Res> {
  _$RiskFactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? rating = null,
    Object? description = null,
    Object? contributingFindings = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            contributingFindings: null == contributingFindings
                ? _value.contributingFindings
                : contributingFindings // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RiskFactorImplCopyWith<$Res>
    implements $RiskFactorCopyWith<$Res> {
  factory _$$RiskFactorImplCopyWith(
    _$RiskFactorImpl value,
    $Res Function(_$RiskFactorImpl) then,
  ) = __$$RiskFactorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    double score,
    String rating,
    String description,
    List<String> contributingFindings,
  });
}

/// @nodoc
class __$$RiskFactorImplCopyWithImpl<$Res>
    extends _$RiskFactorCopyWithImpl<$Res, _$RiskFactorImpl>
    implements _$$RiskFactorImplCopyWith<$Res> {
  __$$RiskFactorImplCopyWithImpl(
    _$RiskFactorImpl _value,
    $Res Function(_$RiskFactorImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? rating = null,
    Object? description = null,
    Object? contributingFindings = null,
  }) {
    return _then(
      _$RiskFactorImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        contributingFindings: null == contributingFindings
            ? _value._contributingFindings
            : contributingFindings // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskFactorImpl implements _RiskFactor {
  const _$RiskFactorImpl({
    required this.name,
    required this.score,
    required this.rating,
    required this.description,
    required final List<String> contributingFindings,
  }) : _contributingFindings = contributingFindings;

  factory _$RiskFactorImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskFactorImplFromJson(json);

  @override
  final String name;
  @override
  final double score;
  @override
  final String rating;
  @override
  final String description;
  final List<String> _contributingFindings;
  @override
  List<String> get contributingFindings {
    if (_contributingFindings is EqualUnmodifiableListView)
      return _contributingFindings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributingFindings);
  }

  @override
  String toString() {
    return 'RiskFactor(name: $name, score: $score, rating: $rating, description: $description, contributingFindings: $contributingFindings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskFactorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._contributingFindings,
              _contributingFindings,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    score,
    rating,
    description,
    const DeepCollectionEquality().hash(_contributingFindings),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskFactorImplCopyWith<_$RiskFactorImpl> get copyWith =>
      __$$RiskFactorImplCopyWithImpl<_$RiskFactorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskFactorImplToJson(this);
  }
}

abstract class _RiskFactor implements RiskFactor {
  const factory _RiskFactor({
    required final String name,
    required final double score,
    required final String rating,
    required final String description,
    required final List<String> contributingFindings,
  }) = _$RiskFactorImpl;

  factory _RiskFactor.fromJson(Map<String, dynamic> json) =
      _$RiskFactorImpl.fromJson;

  @override
  String get name;
  @override
  double get score;
  @override
  String get rating;
  @override
  String get description;
  @override
  List<String> get contributingFindings;
  @override
  @JsonKey(ignore: true)
  _$$RiskFactorImplCopyWith<_$RiskFactorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RemediationRoadmap _$RemediationRoadmapFromJson(Map<String, dynamic> json) {
  return _RemediationRoadmap.fromJson(json);
}

/// @nodoc
mixin _$RemediationRoadmap {
  List<RemediationAction> get immediate => throw _privateConstructorUsedError;
  List<RemediationAction> get shortTerm => throw _privateConstructorUsedError;
  List<RemediationAction> get mediumTerm => throw _privateConstructorUsedError;
  List<RemediationAction> get longTerm => throw _privateConstructorUsedError;
  String get prioritizationMethodology => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemediationRoadmapCopyWith<RemediationRoadmap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemediationRoadmapCopyWith<$Res> {
  factory $RemediationRoadmapCopyWith(
    RemediationRoadmap value,
    $Res Function(RemediationRoadmap) then,
  ) = _$RemediationRoadmapCopyWithImpl<$Res, RemediationRoadmap>;
  @useResult
  $Res call({
    List<RemediationAction> immediate,
    List<RemediationAction> shortTerm,
    List<RemediationAction> mediumTerm,
    List<RemediationAction> longTerm,
    String prioritizationMethodology,
  });
}

/// @nodoc
class _$RemediationRoadmapCopyWithImpl<$Res, $Val extends RemediationRoadmap>
    implements $RemediationRoadmapCopyWith<$Res> {
  _$RemediationRoadmapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immediate = null,
    Object? shortTerm = null,
    Object? mediumTerm = null,
    Object? longTerm = null,
    Object? prioritizationMethodology = null,
  }) {
    return _then(
      _value.copyWith(
            immediate: null == immediate
                ? _value.immediate
                : immediate // ignore: cast_nullable_to_non_nullable
                      as List<RemediationAction>,
            shortTerm: null == shortTerm
                ? _value.shortTerm
                : shortTerm // ignore: cast_nullable_to_non_nullable
                      as List<RemediationAction>,
            mediumTerm: null == mediumTerm
                ? _value.mediumTerm
                : mediumTerm // ignore: cast_nullable_to_non_nullable
                      as List<RemediationAction>,
            longTerm: null == longTerm
                ? _value.longTerm
                : longTerm // ignore: cast_nullable_to_non_nullable
                      as List<RemediationAction>,
            prioritizationMethodology: null == prioritizationMethodology
                ? _value.prioritizationMethodology
                : prioritizationMethodology // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RemediationRoadmapImplCopyWith<$Res>
    implements $RemediationRoadmapCopyWith<$Res> {
  factory _$$RemediationRoadmapImplCopyWith(
    _$RemediationRoadmapImpl value,
    $Res Function(_$RemediationRoadmapImpl) then,
  ) = __$$RemediationRoadmapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<RemediationAction> immediate,
    List<RemediationAction> shortTerm,
    List<RemediationAction> mediumTerm,
    List<RemediationAction> longTerm,
    String prioritizationMethodology,
  });
}

/// @nodoc
class __$$RemediationRoadmapImplCopyWithImpl<$Res>
    extends _$RemediationRoadmapCopyWithImpl<$Res, _$RemediationRoadmapImpl>
    implements _$$RemediationRoadmapImplCopyWith<$Res> {
  __$$RemediationRoadmapImplCopyWithImpl(
    _$RemediationRoadmapImpl _value,
    $Res Function(_$RemediationRoadmapImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immediate = null,
    Object? shortTerm = null,
    Object? mediumTerm = null,
    Object? longTerm = null,
    Object? prioritizationMethodology = null,
  }) {
    return _then(
      _$RemediationRoadmapImpl(
        immediate: null == immediate
            ? _value._immediate
            : immediate // ignore: cast_nullable_to_non_nullable
                  as List<RemediationAction>,
        shortTerm: null == shortTerm
            ? _value._shortTerm
            : shortTerm // ignore: cast_nullable_to_non_nullable
                  as List<RemediationAction>,
        mediumTerm: null == mediumTerm
            ? _value._mediumTerm
            : mediumTerm // ignore: cast_nullable_to_non_nullable
                  as List<RemediationAction>,
        longTerm: null == longTerm
            ? _value._longTerm
            : longTerm // ignore: cast_nullable_to_non_nullable
                  as List<RemediationAction>,
        prioritizationMethodology: null == prioritizationMethodology
            ? _value.prioritizationMethodology
            : prioritizationMethodology // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RemediationRoadmapImpl implements _RemediationRoadmap {
  const _$RemediationRoadmapImpl({
    required final List<RemediationAction> immediate,
    required final List<RemediationAction> shortTerm,
    required final List<RemediationAction> mediumTerm,
    required final List<RemediationAction> longTerm,
    required this.prioritizationMethodology,
  }) : _immediate = immediate,
       _shortTerm = shortTerm,
       _mediumTerm = mediumTerm,
       _longTerm = longTerm;

  factory _$RemediationRoadmapImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemediationRoadmapImplFromJson(json);

  final List<RemediationAction> _immediate;
  @override
  List<RemediationAction> get immediate {
    if (_immediate is EqualUnmodifiableListView) return _immediate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_immediate);
  }

  final List<RemediationAction> _shortTerm;
  @override
  List<RemediationAction> get shortTerm {
    if (_shortTerm is EqualUnmodifiableListView) return _shortTerm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shortTerm);
  }

  final List<RemediationAction> _mediumTerm;
  @override
  List<RemediationAction> get mediumTerm {
    if (_mediumTerm is EqualUnmodifiableListView) return _mediumTerm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediumTerm);
  }

  final List<RemediationAction> _longTerm;
  @override
  List<RemediationAction> get longTerm {
    if (_longTerm is EqualUnmodifiableListView) return _longTerm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_longTerm);
  }

  @override
  final String prioritizationMethodology;

  @override
  String toString() {
    return 'RemediationRoadmap(immediate: $immediate, shortTerm: $shortTerm, mediumTerm: $mediumTerm, longTerm: $longTerm, prioritizationMethodology: $prioritizationMethodology)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemediationRoadmapImpl &&
            const DeepCollectionEquality().equals(
              other._immediate,
              _immediate,
            ) &&
            const DeepCollectionEquality().equals(
              other._shortTerm,
              _shortTerm,
            ) &&
            const DeepCollectionEquality().equals(
              other._mediumTerm,
              _mediumTerm,
            ) &&
            const DeepCollectionEquality().equals(other._longTerm, _longTerm) &&
            (identical(
                  other.prioritizationMethodology,
                  prioritizationMethodology,
                ) ||
                other.prioritizationMethodology == prioritizationMethodology));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_immediate),
    const DeepCollectionEquality().hash(_shortTerm),
    const DeepCollectionEquality().hash(_mediumTerm),
    const DeepCollectionEquality().hash(_longTerm),
    prioritizationMethodology,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemediationRoadmapImplCopyWith<_$RemediationRoadmapImpl> get copyWith =>
      __$$RemediationRoadmapImplCopyWithImpl<_$RemediationRoadmapImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RemediationRoadmapImplToJson(this);
  }
}

abstract class _RemediationRoadmap implements RemediationRoadmap {
  const factory _RemediationRoadmap({
    required final List<RemediationAction> immediate,
    required final List<RemediationAction> shortTerm,
    required final List<RemediationAction> mediumTerm,
    required final List<RemediationAction> longTerm,
    required final String prioritizationMethodology,
  }) = _$RemediationRoadmapImpl;

  factory _RemediationRoadmap.fromJson(Map<String, dynamic> json) =
      _$RemediationRoadmapImpl.fromJson;

  @override
  List<RemediationAction> get immediate;
  @override
  List<RemediationAction> get shortTerm;
  @override
  List<RemediationAction> get mediumTerm;
  @override
  List<RemediationAction> get longTerm;
  @override
  String get prioritizationMethodology;
  @override
  @JsonKey(ignore: true)
  _$$RemediationRoadmapImplCopyWith<_$RemediationRoadmapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RemediationAction _$RemediationActionFromJson(Map<String, dynamic> json) {
  return _RemediationAction.fromJson(json);
}

/// @nodoc
mixin _$RemediationAction {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  Effort get effort => throw _privateConstructorUsedError;
  List<String> get relatedFindingIds => throw _privateConstructorUsedError;
  String get responsibleParty => throw _privateConstructorUsedError;
  DateTime? get targetDate => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemediationActionCopyWith<RemediationAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemediationActionCopyWith<$Res> {
  factory $RemediationActionCopyWith(
    RemediationAction value,
    $Res Function(RemediationAction) then,
  ) = _$RemediationActionCopyWithImpl<$Res, RemediationAction>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    Priority priority,
    Effort effort,
    List<String> relatedFindingIds,
    String responsibleParty,
    DateTime? targetDate,
    bool completed,
  });
}

/// @nodoc
class _$RemediationActionCopyWithImpl<$Res, $Val extends RemediationAction>
    implements $RemediationActionCopyWith<$Res> {
  _$RemediationActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? effort = null,
    Object? relatedFindingIds = null,
    Object? responsibleParty = null,
    Object? targetDate = freezed,
    Object? completed = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as Priority,
            effort: null == effort
                ? _value.effort
                : effort // ignore: cast_nullable_to_non_nullable
                      as Effort,
            relatedFindingIds: null == relatedFindingIds
                ? _value.relatedFindingIds
                : relatedFindingIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            responsibleParty: null == responsibleParty
                ? _value.responsibleParty
                : responsibleParty // ignore: cast_nullable_to_non_nullable
                      as String,
            targetDate: freezed == targetDate
                ? _value.targetDate
                : targetDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RemediationActionImplCopyWith<$Res>
    implements $RemediationActionCopyWith<$Res> {
  factory _$$RemediationActionImplCopyWith(
    _$RemediationActionImpl value,
    $Res Function(_$RemediationActionImpl) then,
  ) = __$$RemediationActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    Priority priority,
    Effort effort,
    List<String> relatedFindingIds,
    String responsibleParty,
    DateTime? targetDate,
    bool completed,
  });
}

/// @nodoc
class __$$RemediationActionImplCopyWithImpl<$Res>
    extends _$RemediationActionCopyWithImpl<$Res, _$RemediationActionImpl>
    implements _$$RemediationActionImplCopyWith<$Res> {
  __$$RemediationActionImplCopyWithImpl(
    _$RemediationActionImpl _value,
    $Res Function(_$RemediationActionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? priority = null,
    Object? effort = null,
    Object? relatedFindingIds = null,
    Object? responsibleParty = null,
    Object? targetDate = freezed,
    Object? completed = null,
  }) {
    return _then(
      _$RemediationActionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as Priority,
        effort: null == effort
            ? _value.effort
            : effort // ignore: cast_nullable_to_non_nullable
                  as Effort,
        relatedFindingIds: null == relatedFindingIds
            ? _value._relatedFindingIds
            : relatedFindingIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        responsibleParty: null == responsibleParty
            ? _value.responsibleParty
            : responsibleParty // ignore: cast_nullable_to_non_nullable
                  as String,
        targetDate: freezed == targetDate
            ? _value.targetDate
            : targetDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RemediationActionImpl implements _RemediationAction {
  const _$RemediationActionImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.effort,
    required final List<String> relatedFindingIds,
    required this.responsibleParty,
    required this.targetDate,
    this.completed = false,
  }) : _relatedFindingIds = relatedFindingIds;

  factory _$RemediationActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemediationActionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final Priority priority;
  @override
  final Effort effort;
  final List<String> _relatedFindingIds;
  @override
  List<String> get relatedFindingIds {
    if (_relatedFindingIds is EqualUnmodifiableListView)
      return _relatedFindingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedFindingIds);
  }

  @override
  final String responsibleParty;
  @override
  final DateTime? targetDate;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString() {
    return 'RemediationAction(id: $id, title: $title, description: $description, priority: $priority, effort: $effort, relatedFindingIds: $relatedFindingIds, responsibleParty: $responsibleParty, targetDate: $targetDate, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemediationActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            const DeepCollectionEquality().equals(
              other._relatedFindingIds,
              _relatedFindingIds,
            ) &&
            (identical(other.responsibleParty, responsibleParty) ||
                other.responsibleParty == responsibleParty) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    priority,
    effort,
    const DeepCollectionEquality().hash(_relatedFindingIds),
    responsibleParty,
    targetDate,
    completed,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemediationActionImplCopyWith<_$RemediationActionImpl> get copyWith =>
      __$$RemediationActionImplCopyWithImpl<_$RemediationActionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RemediationActionImplToJson(this);
  }
}

abstract class _RemediationAction implements RemediationAction {
  const factory _RemediationAction({
    required final String id,
    required final String title,
    required final String description,
    required final Priority priority,
    required final Effort effort,
    required final List<String> relatedFindingIds,
    required final String responsibleParty,
    required final DateTime? targetDate,
    final bool completed,
  }) = _$RemediationActionImpl;

  factory _RemediationAction.fromJson(Map<String, dynamic> json) =
      _$RemediationActionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  Priority get priority;
  @override
  Effort get effort;
  @override
  List<String> get relatedFindingIds;
  @override
  String get responsibleParty;
  @override
  DateTime? get targetDate;
  @override
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$RemediationActionImplCopyWith<_$RemediationActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Appendices _$AppendicesFromJson(Map<String, dynamic> json) {
  return _Appendices.fromJson(json);
}

/// @nodoc
mixin _$Appendices {
  Map<String, String> get rawOutputs => throw _privateConstructorUsedError;
  List<String> get toolVersions => throw _privateConstructorUsedError;
  List<String> get allEvidence => throw _privateConstructorUsedError;
  String get glossary => throw _privateConstructorUsedError;
  String get references => throw _privateConstructorUsedError;
  Map<String, dynamic> get customSections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppendicesCopyWith<Appendices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppendicesCopyWith<$Res> {
  factory $AppendicesCopyWith(
    Appendices value,
    $Res Function(Appendices) then,
  ) = _$AppendicesCopyWithImpl<$Res, Appendices>;
  @useResult
  $Res call({
    Map<String, String> rawOutputs,
    List<String> toolVersions,
    List<String> allEvidence,
    String glossary,
    String references,
    Map<String, dynamic> customSections,
  });
}

/// @nodoc
class _$AppendicesCopyWithImpl<$Res, $Val extends Appendices>
    implements $AppendicesCopyWith<$Res> {
  _$AppendicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawOutputs = null,
    Object? toolVersions = null,
    Object? allEvidence = null,
    Object? glossary = null,
    Object? references = null,
    Object? customSections = null,
  }) {
    return _then(
      _value.copyWith(
            rawOutputs: null == rawOutputs
                ? _value.rawOutputs
                : rawOutputs // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            toolVersions: null == toolVersions
                ? _value.toolVersions
                : toolVersions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            allEvidence: null == allEvidence
                ? _value.allEvidence
                : allEvidence // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            glossary: null == glossary
                ? _value.glossary
                : glossary // ignore: cast_nullable_to_non_nullable
                      as String,
            references: null == references
                ? _value.references
                : references // ignore: cast_nullable_to_non_nullable
                      as String,
            customSections: null == customSections
                ? _value.customSections
                : customSections // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppendicesImplCopyWith<$Res>
    implements $AppendicesCopyWith<$Res> {
  factory _$$AppendicesImplCopyWith(
    _$AppendicesImpl value,
    $Res Function(_$AppendicesImpl) then,
  ) = __$$AppendicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, String> rawOutputs,
    List<String> toolVersions,
    List<String> allEvidence,
    String glossary,
    String references,
    Map<String, dynamic> customSections,
  });
}

/// @nodoc
class __$$AppendicesImplCopyWithImpl<$Res>
    extends _$AppendicesCopyWithImpl<$Res, _$AppendicesImpl>
    implements _$$AppendicesImplCopyWith<$Res> {
  __$$AppendicesImplCopyWithImpl(
    _$AppendicesImpl _value,
    $Res Function(_$AppendicesImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawOutputs = null,
    Object? toolVersions = null,
    Object? allEvidence = null,
    Object? glossary = null,
    Object? references = null,
    Object? customSections = null,
  }) {
    return _then(
      _$AppendicesImpl(
        rawOutputs: null == rawOutputs
            ? _value._rawOutputs
            : rawOutputs // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        toolVersions: null == toolVersions
            ? _value._toolVersions
            : toolVersions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        allEvidence: null == allEvidence
            ? _value._allEvidence
            : allEvidence // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        glossary: null == glossary
            ? _value.glossary
            : glossary // ignore: cast_nullable_to_non_nullable
                  as String,
        references: null == references
            ? _value.references
            : references // ignore: cast_nullable_to_non_nullable
                  as String,
        customSections: null == customSections
            ? _value._customSections
            : customSections // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppendicesImpl implements _Appendices {
  const _$AppendicesImpl({
    final Map<String, String> rawOutputs = const {},
    final List<String> toolVersions = const [],
    final List<String> allEvidence = const [],
    this.glossary = '',
    this.references = '',
    final Map<String, dynamic> customSections = const {},
  }) : _rawOutputs = rawOutputs,
       _toolVersions = toolVersions,
       _allEvidence = allEvidence,
       _customSections = customSections;

  factory _$AppendicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppendicesImplFromJson(json);

  final Map<String, String> _rawOutputs;
  @override
  @JsonKey()
  Map<String, String> get rawOutputs {
    if (_rawOutputs is EqualUnmodifiableMapView) return _rawOutputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawOutputs);
  }

  final List<String> _toolVersions;
  @override
  @JsonKey()
  List<String> get toolVersions {
    if (_toolVersions is EqualUnmodifiableListView) return _toolVersions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toolVersions);
  }

  final List<String> _allEvidence;
  @override
  @JsonKey()
  List<String> get allEvidence {
    if (_allEvidence is EqualUnmodifiableListView) return _allEvidence;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allEvidence);
  }

  @override
  @JsonKey()
  final String glossary;
  @override
  @JsonKey()
  final String references;
  final Map<String, dynamic> _customSections;
  @override
  @JsonKey()
  Map<String, dynamic> get customSections {
    if (_customSections is EqualUnmodifiableMapView) return _customSections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customSections);
  }

  @override
  String toString() {
    return 'Appendices(rawOutputs: $rawOutputs, toolVersions: $toolVersions, allEvidence: $allEvidence, glossary: $glossary, references: $references, customSections: $customSections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppendicesImpl &&
            const DeepCollectionEquality().equals(
              other._rawOutputs,
              _rawOutputs,
            ) &&
            const DeepCollectionEquality().equals(
              other._toolVersions,
              _toolVersions,
            ) &&
            const DeepCollectionEquality().equals(
              other._allEvidence,
              _allEvidence,
            ) &&
            (identical(other.glossary, glossary) ||
                other.glossary == glossary) &&
            (identical(other.references, references) ||
                other.references == references) &&
            const DeepCollectionEquality().equals(
              other._customSections,
              _customSections,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_rawOutputs),
    const DeepCollectionEquality().hash(_toolVersions),
    const DeepCollectionEquality().hash(_allEvidence),
    glossary,
    references,
    const DeepCollectionEquality().hash(_customSections),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppendicesImplCopyWith<_$AppendicesImpl> get copyWith =>
      __$$AppendicesImplCopyWithImpl<_$AppendicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppendicesImplToJson(this);
  }
}

abstract class _Appendices implements Appendices {
  const factory _Appendices({
    final Map<String, String> rawOutputs,
    final List<String> toolVersions,
    final List<String> allEvidence,
    final String glossary,
    final String references,
    final Map<String, dynamic> customSections,
  }) = _$AppendicesImpl;

  factory _Appendices.fromJson(Map<String, dynamic> json) =
      _$AppendicesImpl.fromJson;

  @override
  Map<String, String> get rawOutputs;
  @override
  List<String> get toolVersions;
  @override
  List<String> get allEvidence;
  @override
  String get glossary;
  @override
  String get references;
  @override
  Map<String, dynamic> get customSections;
  @override
  @JsonKey(ignore: true)
  _$$AppendicesImplCopyWith<_$AppendicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportMetadata _$ReportMetadataFromJson(Map<String, dynamic> json) {
  return _ReportMetadata.fromJson(json);
}

/// @nodoc
mixin _$ReportMetadata {
  String get generatedBy => throw _privateConstructorUsedError;
  String get generatorVersion => throw _privateConstructorUsedError;
  Map<String, String> get toolVersions => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  int get wordCount => throw _privateConstructorUsedError;
  String get classification => throw _privateConstructorUsedError;
  Map<String, dynamic> get customFields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportMetadataCopyWith<ReportMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportMetadataCopyWith<$Res> {
  factory $ReportMetadataCopyWith(
    ReportMetadata value,
    $Res Function(ReportMetadata) then,
  ) = _$ReportMetadataCopyWithImpl<$Res, ReportMetadata>;
  @useResult
  $Res call({
    String generatedBy,
    String generatorVersion,
    Map<String, String> toolVersions,
    int pageCount,
    int wordCount,
    String classification,
    Map<String, dynamic> customFields,
  });
}

/// @nodoc
class _$ReportMetadataCopyWithImpl<$Res, $Val extends ReportMetadata>
    implements $ReportMetadataCopyWith<$Res> {
  _$ReportMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedBy = null,
    Object? generatorVersion = null,
    Object? toolVersions = null,
    Object? pageCount = null,
    Object? wordCount = null,
    Object? classification = null,
    Object? customFields = null,
  }) {
    return _then(
      _value.copyWith(
            generatedBy: null == generatedBy
                ? _value.generatedBy
                : generatedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            generatorVersion: null == generatorVersion
                ? _value.generatorVersion
                : generatorVersion // ignore: cast_nullable_to_non_nullable
                      as String,
            toolVersions: null == toolVersions
                ? _value.toolVersions
                : toolVersions // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            pageCount: null == pageCount
                ? _value.pageCount
                : pageCount // ignore: cast_nullable_to_non_nullable
                      as int,
            wordCount: null == wordCount
                ? _value.wordCount
                : wordCount // ignore: cast_nullable_to_non_nullable
                      as int,
            classification: null == classification
                ? _value.classification
                : classification // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$ReportMetadataImplCopyWith<$Res>
    implements $ReportMetadataCopyWith<$Res> {
  factory _$$ReportMetadataImplCopyWith(
    _$ReportMetadataImpl value,
    $Res Function(_$ReportMetadataImpl) then,
  ) = __$$ReportMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String generatedBy,
    String generatorVersion,
    Map<String, String> toolVersions,
    int pageCount,
    int wordCount,
    String classification,
    Map<String, dynamic> customFields,
  });
}

/// @nodoc
class __$$ReportMetadataImplCopyWithImpl<$Res>
    extends _$ReportMetadataCopyWithImpl<$Res, _$ReportMetadataImpl>
    implements _$$ReportMetadataImplCopyWith<$Res> {
  __$$ReportMetadataImplCopyWithImpl(
    _$ReportMetadataImpl _value,
    $Res Function(_$ReportMetadataImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedBy = null,
    Object? generatorVersion = null,
    Object? toolVersions = null,
    Object? pageCount = null,
    Object? wordCount = null,
    Object? classification = null,
    Object? customFields = null,
  }) {
    return _then(
      _$ReportMetadataImpl(
        generatedBy: null == generatedBy
            ? _value.generatedBy
            : generatedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        generatorVersion: null == generatorVersion
            ? _value.generatorVersion
            : generatorVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        toolVersions: null == toolVersions
            ? _value._toolVersions
            : toolVersions // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        pageCount: null == pageCount
            ? _value.pageCount
            : pageCount // ignore: cast_nullable_to_non_nullable
                  as int,
        wordCount: null == wordCount
            ? _value.wordCount
            : wordCount // ignore: cast_nullable_to_non_nullable
                  as int,
        classification: null == classification
            ? _value.classification
            : classification // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$ReportMetadataImpl implements _ReportMetadata {
  const _$ReportMetadataImpl({
    required this.generatedBy,
    required this.generatorVersion,
    required final Map<String, String> toolVersions,
    required this.pageCount,
    required this.wordCount,
    required this.classification,
    final Map<String, dynamic> customFields = const {},
  }) : _toolVersions = toolVersions,
       _customFields = customFields;

  factory _$ReportMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportMetadataImplFromJson(json);

  @override
  final String generatedBy;
  @override
  final String generatorVersion;
  final Map<String, String> _toolVersions;
  @override
  Map<String, String> get toolVersions {
    if (_toolVersions is EqualUnmodifiableMapView) return _toolVersions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_toolVersions);
  }

  @override
  final int pageCount;
  @override
  final int wordCount;
  @override
  final String classification;
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
    return 'ReportMetadata(generatedBy: $generatedBy, generatorVersion: $generatorVersion, toolVersions: $toolVersions, pageCount: $pageCount, wordCount: $wordCount, classification: $classification, customFields: $customFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportMetadataImpl &&
            (identical(other.generatedBy, generatedBy) ||
                other.generatedBy == generatedBy) &&
            (identical(other.generatorVersion, generatorVersion) ||
                other.generatorVersion == generatorVersion) &&
            const DeepCollectionEquality().equals(
              other._toolVersions,
              _toolVersions,
            ) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.wordCount, wordCount) ||
                other.wordCount == wordCount) &&
            (identical(other.classification, classification) ||
                other.classification == classification) &&
            const DeepCollectionEquality().equals(
              other._customFields,
              _customFields,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    generatedBy,
    generatorVersion,
    const DeepCollectionEquality().hash(_toolVersions),
    pageCount,
    wordCount,
    classification,
    const DeepCollectionEquality().hash(_customFields),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportMetadataImplCopyWith<_$ReportMetadataImpl> get copyWith =>
      __$$ReportMetadataImplCopyWithImpl<_$ReportMetadataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportMetadataImplToJson(this);
  }
}

abstract class _ReportMetadata implements ReportMetadata {
  const factory _ReportMetadata({
    required final String generatedBy,
    required final String generatorVersion,
    required final Map<String, String> toolVersions,
    required final int pageCount,
    required final int wordCount,
    required final String classification,
    final Map<String, dynamic> customFields,
  }) = _$ReportMetadataImpl;

  factory _ReportMetadata.fromJson(Map<String, dynamic> json) =
      _$ReportMetadataImpl.fromJson;

  @override
  String get generatedBy;
  @override
  String get generatorVersion;
  @override
  Map<String, String> get toolVersions;
  @override
  int get pageCount;
  @override
  int get wordCount;
  @override
  String get classification;
  @override
  Map<String, dynamic> get customFields;
  @override
  @JsonKey(ignore: true)
  _$$ReportMetadataImplCopyWith<_$ReportMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
