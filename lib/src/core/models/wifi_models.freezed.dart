// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccessPoint _$AccessPointFromJson(Map<String, dynamic> json) {
  return _AccessPoint.fromJson(json);
}

/// @nodoc
mixin _$AccessPoint {
  String get id => throw _privateConstructorUsedError;
  String get bssid => throw _privateConstructorUsedError;
  String get ssid => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  int get channel => throw _privateConstructorUsedError;
  int get signalLevel => throw _privateConstructorUsedError;
  int get noiseLevel => throw _privateConstructorUsedError;
  SecurityProtocol get security => throw _privateConstructorUsedError;
  List<SecurityProtocol> get supportedProtocols =>
      throw _privateConstructorUsedError;
  bool get wpsEnabled => throw _privateConstructorUsedError;
  String? get wpsManufacturer => throw _privateConstructorUsedError;
  String? get wpsModel => throw _privateConstructorUsedError;
  int get beaconInterval => throw _privateConstructorUsedError;
  int get capabilityMask => throw _privateConstructorUsedError;
  DateTime get firstSeen => throw _privateConstructorUsedError;
  DateTime get lastSeen => throw _privateConstructorUsedError;
  int get packetCount => throw _privateConstructorUsedError;
  Map<String, dynamic> get vendorIEs => throw _privateConstructorUsedError;
  List<ClientDevice> get associatedClients =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessPointCopyWith<AccessPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessPointCopyWith<$Res> {
  factory $AccessPointCopyWith(
    AccessPoint value,
    $Res Function(AccessPoint) then,
  ) = _$AccessPointCopyWithImpl<$Res, AccessPoint>;
  @useResult
  $Res call({
    String id,
    String bssid,
    String ssid,
    int frequency,
    int channel,
    int signalLevel,
    int noiseLevel,
    SecurityProtocol security,
    List<SecurityProtocol> supportedProtocols,
    bool wpsEnabled,
    String? wpsManufacturer,
    String? wpsModel,
    int beaconInterval,
    int capabilityMask,
    DateTime firstSeen,
    DateTime lastSeen,
    int packetCount,
    Map<String, dynamic> vendorIEs,
    List<ClientDevice> associatedClients,
  });
}

/// @nodoc
class _$AccessPointCopyWithImpl<$Res, $Val extends AccessPoint>
    implements $AccessPointCopyWith<$Res> {
  _$AccessPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? frequency = null,
    Object? channel = null,
    Object? signalLevel = null,
    Object? noiseLevel = null,
    Object? security = null,
    Object? supportedProtocols = null,
    Object? wpsEnabled = null,
    Object? wpsManufacturer = freezed,
    Object? wpsModel = freezed,
    Object? beaconInterval = null,
    Object? capabilityMask = null,
    Object? firstSeen = null,
    Object? lastSeen = null,
    Object? packetCount = null,
    Object? vendorIEs = null,
    Object? associatedClients = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            bssid: null == bssid
                ? _value.bssid
                : bssid // ignore: cast_nullable_to_non_nullable
                      as String,
            ssid: null == ssid
                ? _value.ssid
                : ssid // ignore: cast_nullable_to_non_nullable
                      as String,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as int,
            channel: null == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as int,
            signalLevel: null == signalLevel
                ? _value.signalLevel
                : signalLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            noiseLevel: null == noiseLevel
                ? _value.noiseLevel
                : noiseLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            security: null == security
                ? _value.security
                : security // ignore: cast_nullable_to_non_nullable
                      as SecurityProtocol,
            supportedProtocols: null == supportedProtocols
                ? _value.supportedProtocols
                : supportedProtocols // ignore: cast_nullable_to_non_nullable
                      as List<SecurityProtocol>,
            wpsEnabled: null == wpsEnabled
                ? _value.wpsEnabled
                : wpsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            wpsManufacturer: freezed == wpsManufacturer
                ? _value.wpsManufacturer
                : wpsManufacturer // ignore: cast_nullable_to_non_nullable
                      as String?,
            wpsModel: freezed == wpsModel
                ? _value.wpsModel
                : wpsModel // ignore: cast_nullable_to_non_nullable
                      as String?,
            beaconInterval: null == beaconInterval
                ? _value.beaconInterval
                : beaconInterval // ignore: cast_nullable_to_non_nullable
                      as int,
            capabilityMask: null == capabilityMask
                ? _value.capabilityMask
                : capabilityMask // ignore: cast_nullable_to_non_nullable
                      as int,
            firstSeen: null == firstSeen
                ? _value.firstSeen
                : firstSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastSeen: null == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            packetCount: null == packetCount
                ? _value.packetCount
                : packetCount // ignore: cast_nullable_to_non_nullable
                      as int,
            vendorIEs: null == vendorIEs
                ? _value.vendorIEs
                : vendorIEs // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            associatedClients: null == associatedClients
                ? _value.associatedClients
                : associatedClients // ignore: cast_nullable_to_non_nullable
                      as List<ClientDevice>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccessPointImplCopyWith<$Res>
    implements $AccessPointCopyWith<$Res> {
  factory _$$AccessPointImplCopyWith(
    _$AccessPointImpl value,
    $Res Function(_$AccessPointImpl) then,
  ) = __$$AccessPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String bssid,
    String ssid,
    int frequency,
    int channel,
    int signalLevel,
    int noiseLevel,
    SecurityProtocol security,
    List<SecurityProtocol> supportedProtocols,
    bool wpsEnabled,
    String? wpsManufacturer,
    String? wpsModel,
    int beaconInterval,
    int capabilityMask,
    DateTime firstSeen,
    DateTime lastSeen,
    int packetCount,
    Map<String, dynamic> vendorIEs,
    List<ClientDevice> associatedClients,
  });
}

/// @nodoc
class __$$AccessPointImplCopyWithImpl<$Res>
    extends _$AccessPointCopyWithImpl<$Res, _$AccessPointImpl>
    implements _$$AccessPointImplCopyWith<$Res> {
  __$$AccessPointImplCopyWithImpl(
    _$AccessPointImpl _value,
    $Res Function(_$AccessPointImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? frequency = null,
    Object? channel = null,
    Object? signalLevel = null,
    Object? noiseLevel = null,
    Object? security = null,
    Object? supportedProtocols = null,
    Object? wpsEnabled = null,
    Object? wpsManufacturer = freezed,
    Object? wpsModel = freezed,
    Object? beaconInterval = null,
    Object? capabilityMask = null,
    Object? firstSeen = null,
    Object? lastSeen = null,
    Object? packetCount = null,
    Object? vendorIEs = null,
    Object? associatedClients = null,
  }) {
    return _then(
      _$AccessPointImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        bssid: null == bssid
            ? _value.bssid
            : bssid // ignore: cast_nullable_to_non_nullable
                  as String,
        ssid: null == ssid
            ? _value.ssid
            : ssid // ignore: cast_nullable_to_non_nullable
                  as String,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as int,
        channel: null == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as int,
        signalLevel: null == signalLevel
            ? _value.signalLevel
            : signalLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        noiseLevel: null == noiseLevel
            ? _value.noiseLevel
            : noiseLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        security: null == security
            ? _value.security
            : security // ignore: cast_nullable_to_non_nullable
                  as SecurityProtocol,
        supportedProtocols: null == supportedProtocols
            ? _value._supportedProtocols
            : supportedProtocols // ignore: cast_nullable_to_non_nullable
                  as List<SecurityProtocol>,
        wpsEnabled: null == wpsEnabled
            ? _value.wpsEnabled
            : wpsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        wpsManufacturer: freezed == wpsManufacturer
            ? _value.wpsManufacturer
            : wpsManufacturer // ignore: cast_nullable_to_non_nullable
                  as String?,
        wpsModel: freezed == wpsModel
            ? _value.wpsModel
            : wpsModel // ignore: cast_nullable_to_non_nullable
                  as String?,
        beaconInterval: null == beaconInterval
            ? _value.beaconInterval
            : beaconInterval // ignore: cast_nullable_to_non_nullable
                  as int,
        capabilityMask: null == capabilityMask
            ? _value.capabilityMask
            : capabilityMask // ignore: cast_nullable_to_non_nullable
                  as int,
        firstSeen: null == firstSeen
            ? _value.firstSeen
            : firstSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastSeen: null == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        packetCount: null == packetCount
            ? _value.packetCount
            : packetCount // ignore: cast_nullable_to_non_nullable
                  as int,
        vendorIEs: null == vendorIEs
            ? _value._vendorIEs
            : vendorIEs // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        associatedClients: null == associatedClients
            ? _value._associatedClients
            : associatedClients // ignore: cast_nullable_to_non_nullable
                  as List<ClientDevice>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessPointImpl implements _AccessPoint {
  const _$AccessPointImpl({
    required this.id,
    required this.bssid,
    required this.ssid,
    required this.frequency,
    required this.channel,
    required this.signalLevel,
    required this.noiseLevel,
    required this.security,
    required final List<SecurityProtocol> supportedProtocols,
    required this.wpsEnabled,
    required this.wpsManufacturer,
    required this.wpsModel,
    required this.beaconInterval,
    required this.capabilityMask,
    required this.firstSeen,
    required this.lastSeen,
    required this.packetCount,
    required final Map<String, dynamic> vendorIEs,
    final List<ClientDevice> associatedClients = const [],
  }) : _supportedProtocols = supportedProtocols,
       _vendorIEs = vendorIEs,
       _associatedClients = associatedClients;

  factory _$AccessPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessPointImplFromJson(json);

  @override
  final String id;
  @override
  final String bssid;
  @override
  final String ssid;
  @override
  final int frequency;
  @override
  final int channel;
  @override
  final int signalLevel;
  @override
  final int noiseLevel;
  @override
  final SecurityProtocol security;
  final List<SecurityProtocol> _supportedProtocols;
  @override
  List<SecurityProtocol> get supportedProtocols {
    if (_supportedProtocols is EqualUnmodifiableListView)
      return _supportedProtocols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedProtocols);
  }

  @override
  final bool wpsEnabled;
  @override
  final String? wpsManufacturer;
  @override
  final String? wpsModel;
  @override
  final int beaconInterval;
  @override
  final int capabilityMask;
  @override
  final DateTime firstSeen;
  @override
  final DateTime lastSeen;
  @override
  final int packetCount;
  final Map<String, dynamic> _vendorIEs;
  @override
  Map<String, dynamic> get vendorIEs {
    if (_vendorIEs is EqualUnmodifiableMapView) return _vendorIEs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_vendorIEs);
  }

  final List<ClientDevice> _associatedClients;
  @override
  @JsonKey()
  List<ClientDevice> get associatedClients {
    if (_associatedClients is EqualUnmodifiableListView)
      return _associatedClients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_associatedClients);
  }

  @override
  String toString() {
    return 'AccessPoint(id: $id, bssid: $bssid, ssid: $ssid, frequency: $frequency, channel: $channel, signalLevel: $signalLevel, noiseLevel: $noiseLevel, security: $security, supportedProtocols: $supportedProtocols, wpsEnabled: $wpsEnabled, wpsManufacturer: $wpsManufacturer, wpsModel: $wpsModel, beaconInterval: $beaconInterval, capabilityMask: $capabilityMask, firstSeen: $firstSeen, lastSeen: $lastSeen, packetCount: $packetCount, vendorIEs: $vendorIEs, associatedClients: $associatedClients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessPointImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bssid, bssid) || other.bssid == bssid) &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.signalLevel, signalLevel) ||
                other.signalLevel == signalLevel) &&
            (identical(other.noiseLevel, noiseLevel) ||
                other.noiseLevel == noiseLevel) &&
            (identical(other.security, security) ||
                other.security == security) &&
            const DeepCollectionEquality().equals(
              other._supportedProtocols,
              _supportedProtocols,
            ) &&
            (identical(other.wpsEnabled, wpsEnabled) ||
                other.wpsEnabled == wpsEnabled) &&
            (identical(other.wpsManufacturer, wpsManufacturer) ||
                other.wpsManufacturer == wpsManufacturer) &&
            (identical(other.wpsModel, wpsModel) ||
                other.wpsModel == wpsModel) &&
            (identical(other.beaconInterval, beaconInterval) ||
                other.beaconInterval == beaconInterval) &&
            (identical(other.capabilityMask, capabilityMask) ||
                other.capabilityMask == capabilityMask) &&
            (identical(other.firstSeen, firstSeen) ||
                other.firstSeen == firstSeen) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.packetCount, packetCount) ||
                other.packetCount == packetCount) &&
            const DeepCollectionEquality().equals(
              other._vendorIEs,
              _vendorIEs,
            ) &&
            const DeepCollectionEquality().equals(
              other._associatedClients,
              _associatedClients,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    bssid,
    ssid,
    frequency,
    channel,
    signalLevel,
    noiseLevel,
    security,
    const DeepCollectionEquality().hash(_supportedProtocols),
    wpsEnabled,
    wpsManufacturer,
    wpsModel,
    beaconInterval,
    capabilityMask,
    firstSeen,
    lastSeen,
    packetCount,
    const DeepCollectionEquality().hash(_vendorIEs),
    const DeepCollectionEquality().hash(_associatedClients),
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessPointImplCopyWith<_$AccessPointImpl> get copyWith =>
      __$$AccessPointImplCopyWithImpl<_$AccessPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessPointImplToJson(this);
  }
}

abstract class _AccessPoint implements AccessPoint {
  const factory _AccessPoint({
    required final String id,
    required final String bssid,
    required final String ssid,
    required final int frequency,
    required final int channel,
    required final int signalLevel,
    required final int noiseLevel,
    required final SecurityProtocol security,
    required final List<SecurityProtocol> supportedProtocols,
    required final bool wpsEnabled,
    required final String? wpsManufacturer,
    required final String? wpsModel,
    required final int beaconInterval,
    required final int capabilityMask,
    required final DateTime firstSeen,
    required final DateTime lastSeen,
    required final int packetCount,
    required final Map<String, dynamic> vendorIEs,
    final List<ClientDevice> associatedClients,
  }) = _$AccessPointImpl;

  factory _AccessPoint.fromJson(Map<String, dynamic> json) =
      _$AccessPointImpl.fromJson;

  @override
  String get id;
  @override
  String get bssid;
  @override
  String get ssid;
  @override
  int get frequency;
  @override
  int get channel;
  @override
  int get signalLevel;
  @override
  int get noiseLevel;
  @override
  SecurityProtocol get security;
  @override
  List<SecurityProtocol> get supportedProtocols;
  @override
  bool get wpsEnabled;
  @override
  String? get wpsManufacturer;
  @override
  String? get wpsModel;
  @override
  int get beaconInterval;
  @override
  int get capabilityMask;
  @override
  DateTime get firstSeen;
  @override
  DateTime get lastSeen;
  @override
  int get packetCount;
  @override
  Map<String, dynamic> get vendorIEs;
  @override
  List<ClientDevice> get associatedClients;
  @override
  @JsonKey(ignore: true)
  _$$AccessPointImplCopyWith<_$AccessPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientDevice _$ClientDeviceFromJson(Map<String, dynamic> json) {
  return _ClientDevice.fromJson(json);
}

/// @nodoc
mixin _$ClientDevice {
  String get id => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String? get hostname => throw _privateConstructorUsedError;
  String? get vendor => throw _privateConstructorUsedError;
  int get signalLevel => throw _privateConstructorUsedError;
  int get dataFrames => throw _privateConstructorUsedError;
  DateTime get firstSeen => throw _privateConstructorUsedError;
  DateTime get lastSeen => throw _privateConstructorUsedError;
  String get associatedBssid => throw _privateConstructorUsedError;
  List<ProbeRequest> get probeRequests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientDeviceCopyWith<ClientDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientDeviceCopyWith<$Res> {
  factory $ClientDeviceCopyWith(
    ClientDevice value,
    $Res Function(ClientDevice) then,
  ) = _$ClientDeviceCopyWithImpl<$Res, ClientDevice>;
  @useResult
  $Res call({
    String id,
    String macAddress,
    String? hostname,
    String? vendor,
    int signalLevel,
    int dataFrames,
    DateTime firstSeen,
    DateTime lastSeen,
    String associatedBssid,
    List<ProbeRequest> probeRequests,
  });
}

/// @nodoc
class _$ClientDeviceCopyWithImpl<$Res, $Val extends ClientDevice>
    implements $ClientDeviceCopyWith<$Res> {
  _$ClientDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? macAddress = null,
    Object? hostname = freezed,
    Object? vendor = freezed,
    Object? signalLevel = null,
    Object? dataFrames = null,
    Object? firstSeen = null,
    Object? lastSeen = null,
    Object? associatedBssid = null,
    Object? probeRequests = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            macAddress: null == macAddress
                ? _value.macAddress
                : macAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            hostname: freezed == hostname
                ? _value.hostname
                : hostname // ignore: cast_nullable_to_non_nullable
                      as String?,
            vendor: freezed == vendor
                ? _value.vendor
                : vendor // ignore: cast_nullable_to_non_nullable
                      as String?,
            signalLevel: null == signalLevel
                ? _value.signalLevel
                : signalLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            dataFrames: null == dataFrames
                ? _value.dataFrames
                : dataFrames // ignore: cast_nullable_to_non_nullable
                      as int,
            firstSeen: null == firstSeen
                ? _value.firstSeen
                : firstSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastSeen: null == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            associatedBssid: null == associatedBssid
                ? _value.associatedBssid
                : associatedBssid // ignore: cast_nullable_to_non_nullable
                      as String,
            probeRequests: null == probeRequests
                ? _value.probeRequests
                : probeRequests // ignore: cast_nullable_to_non_nullable
                      as List<ProbeRequest>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClientDeviceImplCopyWith<$Res>
    implements $ClientDeviceCopyWith<$Res> {
  factory _$$ClientDeviceImplCopyWith(
    _$ClientDeviceImpl value,
    $Res Function(_$ClientDeviceImpl) then,
  ) = __$$ClientDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String macAddress,
    String? hostname,
    String? vendor,
    int signalLevel,
    int dataFrames,
    DateTime firstSeen,
    DateTime lastSeen,
    String associatedBssid,
    List<ProbeRequest> probeRequests,
  });
}

/// @nodoc
class __$$ClientDeviceImplCopyWithImpl<$Res>
    extends _$ClientDeviceCopyWithImpl<$Res, _$ClientDeviceImpl>
    implements _$$ClientDeviceImplCopyWith<$Res> {
  __$$ClientDeviceImplCopyWithImpl(
    _$ClientDeviceImpl _value,
    $Res Function(_$ClientDeviceImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? macAddress = null,
    Object? hostname = freezed,
    Object? vendor = freezed,
    Object? signalLevel = null,
    Object? dataFrames = null,
    Object? firstSeen = null,
    Object? lastSeen = null,
    Object? associatedBssid = null,
    Object? probeRequests = null,
  }) {
    return _then(
      _$ClientDeviceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        macAddress: null == macAddress
            ? _value.macAddress
            : macAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        hostname: freezed == hostname
            ? _value.hostname
            : hostname // ignore: cast_nullable_to_non_nullable
                  as String?,
        vendor: freezed == vendor
            ? _value.vendor
            : vendor // ignore: cast_nullable_to_non_nullable
                  as String?,
        signalLevel: null == signalLevel
            ? _value.signalLevel
            : signalLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        dataFrames: null == dataFrames
            ? _value.dataFrames
            : dataFrames // ignore: cast_nullable_to_non_nullable
                  as int,
        firstSeen: null == firstSeen
            ? _value.firstSeen
            : firstSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastSeen: null == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        associatedBssid: null == associatedBssid
            ? _value.associatedBssid
            : associatedBssid // ignore: cast_nullable_to_non_nullable
                  as String,
        probeRequests: null == probeRequests
            ? _value._probeRequests
            : probeRequests // ignore: cast_nullable_to_non_nullable
                  as List<ProbeRequest>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientDeviceImpl implements _ClientDevice {
  const _$ClientDeviceImpl({
    required this.id,
    required this.macAddress,
    required this.hostname,
    required this.vendor,
    required this.signalLevel,
    required this.dataFrames,
    required this.firstSeen,
    required this.lastSeen,
    required this.associatedBssid,
    final List<ProbeRequest> probeRequests = const [],
  }) : _probeRequests = probeRequests;

  factory _$ClientDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientDeviceImplFromJson(json);

  @override
  final String id;
  @override
  final String macAddress;
  @override
  final String? hostname;
  @override
  final String? vendor;
  @override
  final int signalLevel;
  @override
  final int dataFrames;
  @override
  final DateTime firstSeen;
  @override
  final DateTime lastSeen;
  @override
  final String associatedBssid;
  final List<ProbeRequest> _probeRequests;
  @override
  @JsonKey()
  List<ProbeRequest> get probeRequests {
    if (_probeRequests is EqualUnmodifiableListView) return _probeRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_probeRequests);
  }

  @override
  String toString() {
    return 'ClientDevice(id: $id, macAddress: $macAddress, hostname: $hostname, vendor: $vendor, signalLevel: $signalLevel, dataFrames: $dataFrames, firstSeen: $firstSeen, lastSeen: $lastSeen, associatedBssid: $associatedBssid, probeRequests: $probeRequests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientDeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.hostname, hostname) ||
                other.hostname == hostname) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.signalLevel, signalLevel) ||
                other.signalLevel == signalLevel) &&
            (identical(other.dataFrames, dataFrames) ||
                other.dataFrames == dataFrames) &&
            (identical(other.firstSeen, firstSeen) ||
                other.firstSeen == firstSeen) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.associatedBssid, associatedBssid) ||
                other.associatedBssid == associatedBssid) &&
            const DeepCollectionEquality().equals(
              other._probeRequests,
              _probeRequests,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    macAddress,
    hostname,
    vendor,
    signalLevel,
    dataFrames,
    firstSeen,
    lastSeen,
    associatedBssid,
    const DeepCollectionEquality().hash(_probeRequests),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientDeviceImplCopyWith<_$ClientDeviceImpl> get copyWith =>
      __$$ClientDeviceImplCopyWithImpl<_$ClientDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientDeviceImplToJson(this);
  }
}

abstract class _ClientDevice implements ClientDevice {
  const factory _ClientDevice({
    required final String id,
    required final String macAddress,
    required final String? hostname,
    required final String? vendor,
    required final int signalLevel,
    required final int dataFrames,
    required final DateTime firstSeen,
    required final DateTime lastSeen,
    required final String associatedBssid,
    final List<ProbeRequest> probeRequests,
  }) = _$ClientDeviceImpl;

  factory _ClientDevice.fromJson(Map<String, dynamic> json) =
      _$ClientDeviceImpl.fromJson;

  @override
  String get id;
  @override
  String get macAddress;
  @override
  String? get hostname;
  @override
  String? get vendor;
  @override
  int get signalLevel;
  @override
  int get dataFrames;
  @override
  DateTime get firstSeen;
  @override
  DateTime get lastSeen;
  @override
  String get associatedBssid;
  @override
  List<ProbeRequest> get probeRequests;
  @override
  @JsonKey(ignore: true)
  _$$ClientDeviceImplCopyWith<_$ClientDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProbeRequest _$ProbeRequestFromJson(Map<String, dynamic> json) {
  return _ProbeRequest.fromJson(json);
}

/// @nodoc
mixin _$ProbeRequest {
  String get ssid => throw _privateConstructorUsedError;
  int get signalLevel => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProbeRequestCopyWith<ProbeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProbeRequestCopyWith<$Res> {
  factory $ProbeRequestCopyWith(
    ProbeRequest value,
    $Res Function(ProbeRequest) then,
  ) = _$ProbeRequestCopyWithImpl<$Res, ProbeRequest>;
  @useResult
  $Res call({String ssid, int signalLevel, DateTime timestamp});
}

/// @nodoc
class _$ProbeRequestCopyWithImpl<$Res, $Val extends ProbeRequest>
    implements $ProbeRequestCopyWith<$Res> {
  _$ProbeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = null,
    Object? signalLevel = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            ssid: null == ssid
                ? _value.ssid
                : ssid // ignore: cast_nullable_to_non_nullable
                      as String,
            signalLevel: null == signalLevel
                ? _value.signalLevel
                : signalLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProbeRequestImplCopyWith<$Res>
    implements $ProbeRequestCopyWith<$Res> {
  factory _$$ProbeRequestImplCopyWith(
    _$ProbeRequestImpl value,
    $Res Function(_$ProbeRequestImpl) then,
  ) = __$$ProbeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ssid, int signalLevel, DateTime timestamp});
}

/// @nodoc
class __$$ProbeRequestImplCopyWithImpl<$Res>
    extends _$ProbeRequestCopyWithImpl<$Res, _$ProbeRequestImpl>
    implements _$$ProbeRequestImplCopyWith<$Res> {
  __$$ProbeRequestImplCopyWithImpl(
    _$ProbeRequestImpl _value,
    $Res Function(_$ProbeRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = null,
    Object? signalLevel = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$ProbeRequestImpl(
        ssid: null == ssid
            ? _value.ssid
            : ssid // ignore: cast_nullable_to_non_nullable
                  as String,
        signalLevel: null == signalLevel
            ? _value.signalLevel
            : signalLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProbeRequestImpl implements _ProbeRequest {
  const _$ProbeRequestImpl({
    required this.ssid,
    required this.signalLevel,
    required this.timestamp,
  });

  factory _$ProbeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProbeRequestImplFromJson(json);

  @override
  final String ssid;
  @override
  final int signalLevel;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'ProbeRequest(ssid: $ssid, signalLevel: $signalLevel, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProbeRequestImpl &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.signalLevel, signalLevel) ||
                other.signalLevel == signalLevel) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ssid, signalLevel, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProbeRequestImplCopyWith<_$ProbeRequestImpl> get copyWith =>
      __$$ProbeRequestImplCopyWithImpl<_$ProbeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProbeRequestImplToJson(this);
  }
}

abstract class _ProbeRequest implements ProbeRequest {
  const factory _ProbeRequest({
    required final String ssid,
    required final int signalLevel,
    required final DateTime timestamp,
  }) = _$ProbeRequestImpl;

  factory _ProbeRequest.fromJson(Map<String, dynamic> json) =
      _$ProbeRequestImpl.fromJson;

  @override
  String get ssid;
  @override
  int get signalLevel;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ProbeRequestImplCopyWith<_$ProbeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HandshakeCapture _$HandshakeCaptureFromJson(Map<String, dynamic> json) {
  return _HandshakeCapture.fromJson(json);
}

/// @nodoc
mixin _$HandshakeCapture {
  String get id => throw _privateConstructorUsedError;
  String get accessPointId => throw _privateConstructorUsedError;
  String get bssid => throw _privateConstructorUsedError;
  String get ssid => throw _privateConstructorUsedError;
  HandshakeType get type => throw _privateConstructorUsedError;
  List<int> get eapolFrames => throw _privateConstructorUsedError;
  DateTime get capturedAt => throw _privateConstructorUsedError;
  int get frameCount => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HandshakeCaptureCopyWith<HandshakeCapture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandshakeCaptureCopyWith<$Res> {
  factory $HandshakeCaptureCopyWith(
    HandshakeCapture value,
    $Res Function(HandshakeCapture) then,
  ) = _$HandshakeCaptureCopyWithImpl<$Res, HandshakeCapture>;
  @useResult
  $Res call({
    String id,
    String accessPointId,
    String bssid,
    String ssid,
    HandshakeType type,
    List<int> eapolFrames,
    DateTime capturedAt,
    int frameCount,
    bool isComplete,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class _$HandshakeCaptureCopyWithImpl<$Res, $Val extends HandshakeCapture>
    implements $HandshakeCaptureCopyWith<$Res> {
  _$HandshakeCaptureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? type = null,
    Object? eapolFrames = null,
    Object? capturedAt = null,
    Object? frameCount = null,
    Object? isComplete = null,
    Object? metadata = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            accessPointId: null == accessPointId
                ? _value.accessPointId
                : accessPointId // ignore: cast_nullable_to_non_nullable
                      as String,
            bssid: null == bssid
                ? _value.bssid
                : bssid // ignore: cast_nullable_to_non_nullable
                      as String,
            ssid: null == ssid
                ? _value.ssid
                : ssid // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as HandshakeType,
            eapolFrames: null == eapolFrames
                ? _value.eapolFrames
                : eapolFrames // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            capturedAt: null == capturedAt
                ? _value.capturedAt
                : capturedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            frameCount: null == frameCount
                ? _value.frameCount
                : frameCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isComplete: null == isComplete
                ? _value.isComplete
                : isComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HandshakeCaptureImplCopyWith<$Res>
    implements $HandshakeCaptureCopyWith<$Res> {
  factory _$$HandshakeCaptureImplCopyWith(
    _$HandshakeCaptureImpl value,
    $Res Function(_$HandshakeCaptureImpl) then,
  ) = __$$HandshakeCaptureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String accessPointId,
    String bssid,
    String ssid,
    HandshakeType type,
    List<int> eapolFrames,
    DateTime capturedAt,
    int frameCount,
    bool isComplete,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class __$$HandshakeCaptureImplCopyWithImpl<$Res>
    extends _$HandshakeCaptureCopyWithImpl<$Res, _$HandshakeCaptureImpl>
    implements _$$HandshakeCaptureImplCopyWith<$Res> {
  __$$HandshakeCaptureImplCopyWithImpl(
    _$HandshakeCaptureImpl _value,
    $Res Function(_$HandshakeCaptureImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? type = null,
    Object? eapolFrames = null,
    Object? capturedAt = null,
    Object? frameCount = null,
    Object? isComplete = null,
    Object? metadata = null,
  }) {
    return _then(
      _$HandshakeCaptureImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        accessPointId: null == accessPointId
            ? _value.accessPointId
            : accessPointId // ignore: cast_nullable_to_non_nullable
                  as String,
        bssid: null == bssid
            ? _value.bssid
            : bssid // ignore: cast_nullable_to_non_nullable
                  as String,
        ssid: null == ssid
            ? _value.ssid
            : ssid // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as HandshakeType,
        eapolFrames: null == eapolFrames
            ? _value._eapolFrames
            : eapolFrames // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        capturedAt: null == capturedAt
            ? _value.capturedAt
            : capturedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        frameCount: null == frameCount
            ? _value.frameCount
            : frameCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isComplete: null == isComplete
            ? _value.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$HandshakeCaptureImpl implements _HandshakeCapture {
  const _$HandshakeCaptureImpl({
    required this.id,
    required this.accessPointId,
    required this.bssid,
    required this.ssid,
    required this.type,
    required final List<int> eapolFrames,
    required this.capturedAt,
    required this.frameCount,
    required this.isComplete,
    required final Map<String, dynamic> metadata,
  }) : _eapolFrames = eapolFrames,
       _metadata = metadata;

  factory _$HandshakeCaptureImpl.fromJson(Map<String, dynamic> json) =>
      _$$HandshakeCaptureImplFromJson(json);

  @override
  final String id;
  @override
  final String accessPointId;
  @override
  final String bssid;
  @override
  final String ssid;
  @override
  final HandshakeType type;
  final List<int> _eapolFrames;
  @override
  List<int> get eapolFrames {
    if (_eapolFrames is EqualUnmodifiableListView) return _eapolFrames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eapolFrames);
  }

  @override
  final DateTime capturedAt;
  @override
  final int frameCount;
  @override
  final bool isComplete;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'HandshakeCapture(id: $id, accessPointId: $accessPointId, bssid: $bssid, ssid: $ssid, type: $type, eapolFrames: $eapolFrames, capturedAt: $capturedAt, frameCount: $frameCount, isComplete: $isComplete, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandshakeCaptureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accessPointId, accessPointId) ||
                other.accessPointId == accessPointId) &&
            (identical(other.bssid, bssid) || other.bssid == bssid) &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._eapolFrames,
              _eapolFrames,
            ) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.frameCount, frameCount) ||
                other.frameCount == frameCount) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    accessPointId,
    bssid,
    ssid,
    type,
    const DeepCollectionEquality().hash(_eapolFrames),
    capturedAt,
    frameCount,
    isComplete,
    const DeepCollectionEquality().hash(_metadata),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HandshakeCaptureImplCopyWith<_$HandshakeCaptureImpl> get copyWith =>
      __$$HandshakeCaptureImplCopyWithImpl<_$HandshakeCaptureImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HandshakeCaptureImplToJson(this);
  }
}

abstract class _HandshakeCapture implements HandshakeCapture {
  const factory _HandshakeCapture({
    required final String id,
    required final String accessPointId,
    required final String bssid,
    required final String ssid,
    required final HandshakeType type,
    required final List<int> eapolFrames,
    required final DateTime capturedAt,
    required final int frameCount,
    required final bool isComplete,
    required final Map<String, dynamic> metadata,
  }) = _$HandshakeCaptureImpl;

  factory _HandshakeCapture.fromJson(Map<String, dynamic> json) =
      _$HandshakeCaptureImpl.fromJson;

  @override
  String get id;
  @override
  String get accessPointId;
  @override
  String get bssid;
  @override
  String get ssid;
  @override
  HandshakeType get type;
  @override
  List<int> get eapolFrames;
  @override
  DateTime get capturedAt;
  @override
  int get frameCount;
  @override
  bool get isComplete;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$HandshakeCaptureImplCopyWith<_$HandshakeCaptureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PmkidCapture _$PmkidCaptureFromJson(Map<String, dynamic> json) {
  return _PmkidCapture.fromJson(json);
}

/// @nodoc
mixin _$PmkidCapture {
  String get id => throw _privateConstructorUsedError;
  String get accessPointId => throw _privateConstructorUsedError;
  String get bssid => throw _privateConstructorUsedError;
  String get ssid => throw _privateConstructorUsedError;
  List<int> get pmkidData => throw _privateConstructorUsedError;
  DateTime get capturedAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PmkidCaptureCopyWith<PmkidCapture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PmkidCaptureCopyWith<$Res> {
  factory $PmkidCaptureCopyWith(
    PmkidCapture value,
    $Res Function(PmkidCapture) then,
  ) = _$PmkidCaptureCopyWithImpl<$Res, PmkidCapture>;
  @useResult
  $Res call({
    String id,
    String accessPointId,
    String bssid,
    String ssid,
    List<int> pmkidData,
    DateTime capturedAt,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class _$PmkidCaptureCopyWithImpl<$Res, $Val extends PmkidCapture>
    implements $PmkidCaptureCopyWith<$Res> {
  _$PmkidCaptureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? pmkidData = null,
    Object? capturedAt = null,
    Object? metadata = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            accessPointId: null == accessPointId
                ? _value.accessPointId
                : accessPointId // ignore: cast_nullable_to_non_nullable
                      as String,
            bssid: null == bssid
                ? _value.bssid
                : bssid // ignore: cast_nullable_to_non_nullable
                      as String,
            ssid: null == ssid
                ? _value.ssid
                : ssid // ignore: cast_nullable_to_non_nullable
                      as String,
            pmkidData: null == pmkidData
                ? _value.pmkidData
                : pmkidData // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            capturedAt: null == capturedAt
                ? _value.capturedAt
                : capturedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PmkidCaptureImplCopyWith<$Res>
    implements $PmkidCaptureCopyWith<$Res> {
  factory _$$PmkidCaptureImplCopyWith(
    _$PmkidCaptureImpl value,
    $Res Function(_$PmkidCaptureImpl) then,
  ) = __$$PmkidCaptureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String accessPointId,
    String bssid,
    String ssid,
    List<int> pmkidData,
    DateTime capturedAt,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class __$$PmkidCaptureImplCopyWithImpl<$Res>
    extends _$PmkidCaptureCopyWithImpl<$Res, _$PmkidCaptureImpl>
    implements _$$PmkidCaptureImplCopyWith<$Res> {
  __$$PmkidCaptureImplCopyWithImpl(
    _$PmkidCaptureImpl _value,
    $Res Function(_$PmkidCaptureImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? pmkidData = null,
    Object? capturedAt = null,
    Object? metadata = null,
  }) {
    return _then(
      _$PmkidCaptureImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        accessPointId: null == accessPointId
            ? _value.accessPointId
            : accessPointId // ignore: cast_nullable_to_non_nullable
                  as String,
        bssid: null == bssid
            ? _value.bssid
            : bssid // ignore: cast_nullable_to_non_nullable
                  as String,
        ssid: null == ssid
            ? _value.ssid
            : ssid // ignore: cast_nullable_to_non_nullable
                  as String,
        pmkidData: null == pmkidData
            ? _value._pmkidData
            : pmkidData // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        capturedAt: null == capturedAt
            ? _value.capturedAt
            : capturedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$PmkidCaptureImpl implements _PmkidCapture {
  const _$PmkidCaptureImpl({
    required this.id,
    required this.accessPointId,
    required this.bssid,
    required this.ssid,
    required final List<int> pmkidData,
    required this.capturedAt,
    required final Map<String, dynamic> metadata,
  }) : _pmkidData = pmkidData,
       _metadata = metadata;

  factory _$PmkidCaptureImpl.fromJson(Map<String, dynamic> json) =>
      _$$PmkidCaptureImplFromJson(json);

  @override
  final String id;
  @override
  final String accessPointId;
  @override
  final String bssid;
  @override
  final String ssid;
  final List<int> _pmkidData;
  @override
  List<int> get pmkidData {
    if (_pmkidData is EqualUnmodifiableListView) return _pmkidData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pmkidData);
  }

  @override
  final DateTime capturedAt;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'PmkidCapture(id: $id, accessPointId: $accessPointId, bssid: $bssid, ssid: $ssid, pmkidData: $pmkidData, capturedAt: $capturedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PmkidCaptureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accessPointId, accessPointId) ||
                other.accessPointId == accessPointId) &&
            (identical(other.bssid, bssid) || other.bssid == bssid) &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            const DeepCollectionEquality().equals(
              other._pmkidData,
              _pmkidData,
            ) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    accessPointId,
    bssid,
    ssid,
    const DeepCollectionEquality().hash(_pmkidData),
    capturedAt,
    const DeepCollectionEquality().hash(_metadata),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PmkidCaptureImplCopyWith<_$PmkidCaptureImpl> get copyWith =>
      __$$PmkidCaptureImplCopyWithImpl<_$PmkidCaptureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PmkidCaptureImplToJson(this);
  }
}

abstract class _PmkidCapture implements PmkidCapture {
  const factory _PmkidCapture({
    required final String id,
    required final String accessPointId,
    required final String bssid,
    required final String ssid,
    required final List<int> pmkidData,
    required final DateTime capturedAt,
    required final Map<String, dynamic> metadata,
  }) = _$PmkidCaptureImpl;

  factory _PmkidCapture.fromJson(Map<String, dynamic> json) =
      _$PmkidCaptureImpl.fromJson;

  @override
  String get id;
  @override
  String get accessPointId;
  @override
  String get bssid;
  @override
  String get ssid;
  @override
  List<int> get pmkidData;
  @override
  DateTime get capturedAt;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$PmkidCaptureImplCopyWith<_$PmkidCaptureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WpsPin _$WpsPinFromJson(Map<String, dynamic> json) {
  return _WpsPin.fromJson(json);
}

/// @nodoc
mixin _$WpsPin {
  String get id => throw _privateConstructorUsedError;
  String get accessPointId => throw _privateConstructorUsedError;
  String get bssid => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;
  WpsMethod get method => throw _privateConstructorUsedError;
  DateTime get recoveredAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WpsPinCopyWith<WpsPin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WpsPinCopyWith<$Res> {
  factory $WpsPinCopyWith(WpsPin value, $Res Function(WpsPin) then) =
      _$WpsPinCopyWithImpl<$Res, WpsPin>;
  @useResult
  $Res call({
    String id,
    String accessPointId,
    String bssid,
    String pin,
    WpsMethod method,
    DateTime recoveredAt,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class _$WpsPinCopyWithImpl<$Res, $Val extends WpsPin>
    implements $WpsPinCopyWith<$Res> {
  _$WpsPinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? bssid = null,
    Object? pin = null,
    Object? method = null,
    Object? recoveredAt = null,
    Object? metadata = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            accessPointId: null == accessPointId
                ? _value.accessPointId
                : accessPointId // ignore: cast_nullable_to_non_nullable
                      as String,
            bssid: null == bssid
                ? _value.bssid
                : bssid // ignore: cast_nullable_to_non_nullable
                      as String,
            pin: null == pin
                ? _value.pin
                : pin // ignore: cast_nullable_to_non_nullable
                      as String,
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as WpsMethod,
            recoveredAt: null == recoveredAt
                ? _value.recoveredAt
                : recoveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WpsPinImplCopyWith<$Res> implements $WpsPinCopyWith<$Res> {
  factory _$$WpsPinImplCopyWith(
    _$WpsPinImpl value,
    $Res Function(_$WpsPinImpl) then,
  ) = __$$WpsPinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String accessPointId,
    String bssid,
    String pin,
    WpsMethod method,
    DateTime recoveredAt,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class __$$WpsPinImplCopyWithImpl<$Res>
    extends _$WpsPinCopyWithImpl<$Res, _$WpsPinImpl>
    implements _$$WpsPinImplCopyWith<$Res> {
  __$$WpsPinImplCopyWithImpl(
    _$WpsPinImpl _value,
    $Res Function(_$WpsPinImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? bssid = null,
    Object? pin = null,
    Object? method = null,
    Object? recoveredAt = null,
    Object? metadata = null,
  }) {
    return _then(
      _$WpsPinImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        accessPointId: null == accessPointId
            ? _value.accessPointId
            : accessPointId // ignore: cast_nullable_to_non_nullable
                  as String,
        bssid: null == bssid
            ? _value.bssid
            : bssid // ignore: cast_nullable_to_non_nullable
                  as String,
        pin: null == pin
            ? _value.pin
            : pin // ignore: cast_nullable_to_non_nullable
                  as String,
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as WpsMethod,
        recoveredAt: null == recoveredAt
            ? _value.recoveredAt
            : recoveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$WpsPinImpl implements _WpsPin {
  const _$WpsPinImpl({
    required this.id,
    required this.accessPointId,
    required this.bssid,
    required this.pin,
    required this.method,
    required this.recoveredAt,
    required final Map<String, dynamic> metadata,
  }) : _metadata = metadata;

  factory _$WpsPinImpl.fromJson(Map<String, dynamic> json) =>
      _$$WpsPinImplFromJson(json);

  @override
  final String id;
  @override
  final String accessPointId;
  @override
  final String bssid;
  @override
  final String pin;
  @override
  final WpsMethod method;
  @override
  final DateTime recoveredAt;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'WpsPin(id: $id, accessPointId: $accessPointId, bssid: $bssid, pin: $pin, method: $method, recoveredAt: $recoveredAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WpsPinImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accessPointId, accessPointId) ||
                other.accessPointId == accessPointId) &&
            (identical(other.bssid, bssid) || other.bssid == bssid) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.recoveredAt, recoveredAt) ||
                other.recoveredAt == recoveredAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    accessPointId,
    bssid,
    pin,
    method,
    recoveredAt,
    const DeepCollectionEquality().hash(_metadata),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WpsPinImplCopyWith<_$WpsPinImpl> get copyWith =>
      __$$WpsPinImplCopyWithImpl<_$WpsPinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WpsPinImplToJson(this);
  }
}

abstract class _WpsPin implements WpsPin {
  const factory _WpsPin({
    required final String id,
    required final String accessPointId,
    required final String bssid,
    required final String pin,
    required final WpsMethod method,
    required final DateTime recoveredAt,
    required final Map<String, dynamic> metadata,
  }) = _$WpsPinImpl;

  factory _WpsPin.fromJson(Map<String, dynamic> json) = _$WpsPinImpl.fromJson;

  @override
  String get id;
  @override
  String get accessPointId;
  @override
  String get bssid;
  @override
  String get pin;
  @override
  WpsMethod get method;
  @override
  DateTime get recoveredAt;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$WpsPinImplCopyWith<_$WpsPinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScanSession _$ScanSessionFromJson(Map<String, dynamic> json) {
  return _ScanSession.fromJson(json);
}

/// @nodoc
mixin _$ScanSession {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ScanMode get mode => throw _privateConstructorUsedError;
  ScanStatus get status => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  ScanConfig get config => throw _privateConstructorUsedError;
  ScanStatistics get statistics => throw _privateConstructorUsedError;
  String? get assessmentId => throw _privateConstructorUsedError;
  List<String> get accessPointIds => throw _privateConstructorUsedError;
  List<String> get handshakeIds => throw _privateConstructorUsedError;
  List<String> get pmkidIds => throw _privateConstructorUsedError;
  List<String> get wpsPinIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanSessionCopyWith<ScanSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanSessionCopyWith<$Res> {
  factory $ScanSessionCopyWith(
    ScanSession value,
    $Res Function(ScanSession) then,
  ) = _$ScanSessionCopyWithImpl<$Res, ScanSession>;
  @useResult
  $Res call({
    String id,
    String name,
    ScanMode mode,
    ScanStatus status,
    DateTime startedAt,
    DateTime? completedAt,
    ScanConfig config,
    ScanStatistics statistics,
    String? assessmentId,
    List<String> accessPointIds,
    List<String> handshakeIds,
    List<String> pmkidIds,
    List<String> wpsPinIds,
  });

  $ScanConfigCopyWith<$Res> get config;
  $ScanStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class _$ScanSessionCopyWithImpl<$Res, $Val extends ScanSession>
    implements $ScanSessionCopyWith<$Res> {
  _$ScanSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mode = null,
    Object? status = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? config = null,
    Object? statistics = null,
    Object? assessmentId = freezed,
    Object? accessPointIds = null,
    Object? handshakeIds = null,
    Object? pmkidIds = null,
    Object? wpsPinIds = null,
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
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as ScanMode,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ScanStatus,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as ScanConfig,
            statistics: null == statistics
                ? _value.statistics
                : statistics // ignore: cast_nullable_to_non_nullable
                      as ScanStatistics,
            assessmentId: freezed == assessmentId
                ? _value.assessmentId
                : assessmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            accessPointIds: null == accessPointIds
                ? _value.accessPointIds
                : accessPointIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            handshakeIds: null == handshakeIds
                ? _value.handshakeIds
                : handshakeIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            pmkidIds: null == pmkidIds
                ? _value.pmkidIds
                : pmkidIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            wpsPinIds: null == wpsPinIds
                ? _value.wpsPinIds
                : wpsPinIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ScanConfigCopyWith<$Res> get config {
    return $ScanConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScanStatisticsCopyWith<$Res> get statistics {
    return $ScanStatisticsCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScanSessionImplCopyWith<$Res>
    implements $ScanSessionCopyWith<$Res> {
  factory _$$ScanSessionImplCopyWith(
    _$ScanSessionImpl value,
    $Res Function(_$ScanSessionImpl) then,
  ) = __$$ScanSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    ScanMode mode,
    ScanStatus status,
    DateTime startedAt,
    DateTime? completedAt,
    ScanConfig config,
    ScanStatistics statistics,
    String? assessmentId,
    List<String> accessPointIds,
    List<String> handshakeIds,
    List<String> pmkidIds,
    List<String> wpsPinIds,
  });

  @override
  $ScanConfigCopyWith<$Res> get config;
  @override
  $ScanStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class __$$ScanSessionImplCopyWithImpl<$Res>
    extends _$ScanSessionCopyWithImpl<$Res, _$ScanSessionImpl>
    implements _$$ScanSessionImplCopyWith<$Res> {
  __$$ScanSessionImplCopyWithImpl(
    _$ScanSessionImpl _value,
    $Res Function(_$ScanSessionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? mode = null,
    Object? status = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? config = null,
    Object? statistics = null,
    Object? assessmentId = freezed,
    Object? accessPointIds = null,
    Object? handshakeIds = null,
    Object? pmkidIds = null,
    Object? wpsPinIds = null,
  }) {
    return _then(
      _$ScanSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as ScanMode,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ScanStatus,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        config: null == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as ScanConfig,
        statistics: null == statistics
            ? _value.statistics
            : statistics // ignore: cast_nullable_to_non_nullable
                  as ScanStatistics,
        assessmentId: freezed == assessmentId
            ? _value.assessmentId
            : assessmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        accessPointIds: null == accessPointIds
            ? _value._accessPointIds
            : accessPointIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        handshakeIds: null == handshakeIds
            ? _value._handshakeIds
            : handshakeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        pmkidIds: null == pmkidIds
            ? _value._pmkidIds
            : pmkidIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        wpsPinIds: null == wpsPinIds
            ? _value._wpsPinIds
            : wpsPinIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanSessionImpl implements _ScanSession {
  const _$ScanSessionImpl({
    required this.id,
    required this.name,
    required this.mode,
    required this.status,
    required this.startedAt,
    required this.completedAt,
    required this.config,
    required this.statistics,
    this.assessmentId,
    final List<String> accessPointIds = const [],
    final List<String> handshakeIds = const [],
    final List<String> pmkidIds = const [],
    final List<String> wpsPinIds = const [],
  }) : _accessPointIds = accessPointIds,
       _handshakeIds = handshakeIds,
       _pmkidIds = pmkidIds,
       _wpsPinIds = wpsPinIds;

  factory _$ScanSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ScanMode mode;
  @override
  final ScanStatus status;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  @override
  final ScanConfig config;
  @override
  final ScanStatistics statistics;
  @override
  final String? assessmentId;
  final List<String> _accessPointIds;
  @override
  @JsonKey()
  List<String> get accessPointIds {
    if (_accessPointIds is EqualUnmodifiableListView) return _accessPointIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessPointIds);
  }

  final List<String> _handshakeIds;
  @override
  @JsonKey()
  List<String> get handshakeIds {
    if (_handshakeIds is EqualUnmodifiableListView) return _handshakeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_handshakeIds);
  }

  final List<String> _pmkidIds;
  @override
  @JsonKey()
  List<String> get pmkidIds {
    if (_pmkidIds is EqualUnmodifiableListView) return _pmkidIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pmkidIds);
  }

  final List<String> _wpsPinIds;
  @override
  @JsonKey()
  List<String> get wpsPinIds {
    if (_wpsPinIds is EqualUnmodifiableListView) return _wpsPinIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wpsPinIds);
  }

  @override
  String toString() {
    return 'ScanSession(id: $id, name: $name, mode: $mode, status: $status, startedAt: $startedAt, completedAt: $completedAt, config: $config, statistics: $statistics, assessmentId: $assessmentId, accessPointIds: $accessPointIds, handshakeIds: $handshakeIds, pmkidIds: $pmkidIds, wpsPinIds: $wpsPinIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            const DeepCollectionEquality().equals(
              other._accessPointIds,
              _accessPointIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._handshakeIds,
              _handshakeIds,
            ) &&
            const DeepCollectionEquality().equals(other._pmkidIds, _pmkidIds) &&
            const DeepCollectionEquality().equals(
              other._wpsPinIds,
              _wpsPinIds,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    mode,
    status,
    startedAt,
    completedAt,
    config,
    statistics,
    assessmentId,
    const DeepCollectionEquality().hash(_accessPointIds),
    const DeepCollectionEquality().hash(_handshakeIds),
    const DeepCollectionEquality().hash(_pmkidIds),
    const DeepCollectionEquality().hash(_wpsPinIds),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanSessionImplCopyWith<_$ScanSessionImpl> get copyWith =>
      __$$ScanSessionImplCopyWithImpl<_$ScanSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanSessionImplToJson(this);
  }
}

abstract class _ScanSession implements ScanSession {
  const factory _ScanSession({
    required final String id,
    required final String name,
    required final ScanMode mode,
    required final ScanStatus status,
    required final DateTime startedAt,
    required final DateTime? completedAt,
    required final ScanConfig config,
    required final ScanStatistics statistics,
    final String? assessmentId,
    final List<String> accessPointIds,
    final List<String> handshakeIds,
    final List<String> pmkidIds,
    final List<String> wpsPinIds,
  }) = _$ScanSessionImpl;

  factory _ScanSession.fromJson(Map<String, dynamic> json) =
      _$ScanSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ScanMode get mode;
  @override
  ScanStatus get status;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  ScanConfig get config;
  @override
  ScanStatistics get statistics;
  @override
  String? get assessmentId;
  @override
  List<String> get accessPointIds;
  @override
  List<String> get handshakeIds;
  @override
  List<String> get pmkidIds;
  @override
  List<String> get wpsPinIds;
  @override
  @JsonKey(ignore: true)
  _$$ScanSessionImplCopyWith<_$ScanSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScanConfig _$ScanConfigFromJson(Map<String, dynamic> json) {
  return _ScanConfig.fromJson(json);
}

/// @nodoc
mixin _$ScanConfig {
  bool get enablePassiveScan => throw _privateConstructorUsedError;
  bool get enableActiveScan => throw _privateConstructorUsedError;
  bool get enableDeauth => throw _privateConstructorUsedError;
  bool get enablePmkid => throw _privateConstructorUsedError;
  bool get enableWps => throw _privateConstructorUsedError;
  List<String> get targetBssids => throw _privateConstructorUsedError;
  List<int> get targetChannels => throw _privateConstructorUsedError;
  int get dwellTimeMs => throw _privateConstructorUsedError;
  int get scanCycles => throw _privateConstructorUsedError;
  bool get hopChannels => throw _privateConstructorUsedError;
  String get interface => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanConfigCopyWith<ScanConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanConfigCopyWith<$Res> {
  factory $ScanConfigCopyWith(
    ScanConfig value,
    $Res Function(ScanConfig) then,
  ) = _$ScanConfigCopyWithImpl<$Res, ScanConfig>;
  @useResult
  $Res call({
    bool enablePassiveScan,
    bool enableActiveScan,
    bool enableDeauth,
    bool enablePmkid,
    bool enableWps,
    List<String> targetBssids,
    List<int> targetChannels,
    int dwellTimeMs,
    int scanCycles,
    bool hopChannels,
    String interface,
  });
}

/// @nodoc
class _$ScanConfigCopyWithImpl<$Res, $Val extends ScanConfig>
    implements $ScanConfigCopyWith<$Res> {
  _$ScanConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enablePassiveScan = null,
    Object? enableActiveScan = null,
    Object? enableDeauth = null,
    Object? enablePmkid = null,
    Object? enableWps = null,
    Object? targetBssids = null,
    Object? targetChannels = null,
    Object? dwellTimeMs = null,
    Object? scanCycles = null,
    Object? hopChannels = null,
    Object? interface = null,
  }) {
    return _then(
      _value.copyWith(
            enablePassiveScan: null == enablePassiveScan
                ? _value.enablePassiveScan
                : enablePassiveScan // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableActiveScan: null == enableActiveScan
                ? _value.enableActiveScan
                : enableActiveScan // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableDeauth: null == enableDeauth
                ? _value.enableDeauth
                : enableDeauth // ignore: cast_nullable_to_non_nullable
                      as bool,
            enablePmkid: null == enablePmkid
                ? _value.enablePmkid
                : enablePmkid // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableWps: null == enableWps
                ? _value.enableWps
                : enableWps // ignore: cast_nullable_to_non_nullable
                      as bool,
            targetBssids: null == targetBssids
                ? _value.targetBssids
                : targetBssids // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetChannels: null == targetChannels
                ? _value.targetChannels
                : targetChannels // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            dwellTimeMs: null == dwellTimeMs
                ? _value.dwellTimeMs
                : dwellTimeMs // ignore: cast_nullable_to_non_nullable
                      as int,
            scanCycles: null == scanCycles
                ? _value.scanCycles
                : scanCycles // ignore: cast_nullable_to_non_nullable
                      as int,
            hopChannels: null == hopChannels
                ? _value.hopChannels
                : hopChannels // ignore: cast_nullable_to_non_nullable
                      as bool,
            interface: null == interface
                ? _value.interface
                : interface // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScanConfigImplCopyWith<$Res>
    implements $ScanConfigCopyWith<$Res> {
  factory _$$ScanConfigImplCopyWith(
    _$ScanConfigImpl value,
    $Res Function(_$ScanConfigImpl) then,
  ) = __$$ScanConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enablePassiveScan,
    bool enableActiveScan,
    bool enableDeauth,
    bool enablePmkid,
    bool enableWps,
    List<String> targetBssids,
    List<int> targetChannels,
    int dwellTimeMs,
    int scanCycles,
    bool hopChannels,
    String interface,
  });
}

/// @nodoc
class __$$ScanConfigImplCopyWithImpl<$Res>
    extends _$ScanConfigCopyWithImpl<$Res, _$ScanConfigImpl>
    implements _$$ScanConfigImplCopyWith<$Res> {
  __$$ScanConfigImplCopyWithImpl(
    _$ScanConfigImpl _value,
    $Res Function(_$ScanConfigImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enablePassiveScan = null,
    Object? enableActiveScan = null,
    Object? enableDeauth = null,
    Object? enablePmkid = null,
    Object? enableWps = null,
    Object? targetBssids = null,
    Object? targetChannels = null,
    Object? dwellTimeMs = null,
    Object? scanCycles = null,
    Object? hopChannels = null,
    Object? interface = null,
  }) {
    return _then(
      _$ScanConfigImpl(
        enablePassiveScan: null == enablePassiveScan
            ? _value.enablePassiveScan
            : enablePassiveScan // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableActiveScan: null == enableActiveScan
            ? _value.enableActiveScan
            : enableActiveScan // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableDeauth: null == enableDeauth
            ? _value.enableDeauth
            : enableDeauth // ignore: cast_nullable_to_non_nullable
                  as bool,
        enablePmkid: null == enablePmkid
            ? _value.enablePmkid
            : enablePmkid // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableWps: null == enableWps
            ? _value.enableWps
            : enableWps // ignore: cast_nullable_to_non_nullable
                  as bool,
        targetBssids: null == targetBssids
            ? _value._targetBssids
            : targetBssids // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetChannels: null == targetChannels
            ? _value._targetChannels
            : targetChannels // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        dwellTimeMs: null == dwellTimeMs
            ? _value.dwellTimeMs
            : dwellTimeMs // ignore: cast_nullable_to_non_nullable
                  as int,
        scanCycles: null == scanCycles
            ? _value.scanCycles
            : scanCycles // ignore: cast_nullable_to_non_nullable
                  as int,
        hopChannels: null == hopChannels
            ? _value.hopChannels
            : hopChannels // ignore: cast_nullable_to_non_nullable
                  as bool,
        interface: null == interface
            ? _value.interface
            : interface // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanConfigImpl implements _ScanConfig {
  const _$ScanConfigImpl({
    this.enablePassiveScan = true,
    this.enableActiveScan = false,
    this.enableDeauth = false,
    this.enablePmkid = false,
    this.enableWps = false,
    final List<String> targetBssids = const [],
    final List<int> targetChannels = const [],
    this.dwellTimeMs = 30,
    this.scanCycles = 5,
    this.hopChannels = true,
    this.interface = '',
  }) : _targetBssids = targetBssids,
       _targetChannels = targetChannels;

  factory _$ScanConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool enablePassiveScan;
  @override
  @JsonKey()
  final bool enableActiveScan;
  @override
  @JsonKey()
  final bool enableDeauth;
  @override
  @JsonKey()
  final bool enablePmkid;
  @override
  @JsonKey()
  final bool enableWps;
  final List<String> _targetBssids;
  @override
  @JsonKey()
  List<String> get targetBssids {
    if (_targetBssids is EqualUnmodifiableListView) return _targetBssids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetBssids);
  }

  final List<int> _targetChannels;
  @override
  @JsonKey()
  List<int> get targetChannels {
    if (_targetChannels is EqualUnmodifiableListView) return _targetChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetChannels);
  }

  @override
  @JsonKey()
  final int dwellTimeMs;
  @override
  @JsonKey()
  final int scanCycles;
  @override
  @JsonKey()
  final bool hopChannels;
  @override
  @JsonKey()
  final String interface;

  @override
  String toString() {
    return 'ScanConfig(enablePassiveScan: $enablePassiveScan, enableActiveScan: $enableActiveScan, enableDeauth: $enableDeauth, enablePmkid: $enablePmkid, enableWps: $enableWps, targetBssids: $targetBssids, targetChannels: $targetChannels, dwellTimeMs: $dwellTimeMs, scanCycles: $scanCycles, hopChannels: $hopChannels, interface: $interface)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanConfigImpl &&
            (identical(other.enablePassiveScan, enablePassiveScan) ||
                other.enablePassiveScan == enablePassiveScan) &&
            (identical(other.enableActiveScan, enableActiveScan) ||
                other.enableActiveScan == enableActiveScan) &&
            (identical(other.enableDeauth, enableDeauth) ||
                other.enableDeauth == enableDeauth) &&
            (identical(other.enablePmkid, enablePmkid) ||
                other.enablePmkid == enablePmkid) &&
            (identical(other.enableWps, enableWps) ||
                other.enableWps == enableWps) &&
            const DeepCollectionEquality().equals(
              other._targetBssids,
              _targetBssids,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetChannels,
              _targetChannels,
            ) &&
            (identical(other.dwellTimeMs, dwellTimeMs) ||
                other.dwellTimeMs == dwellTimeMs) &&
            (identical(other.scanCycles, scanCycles) ||
                other.scanCycles == scanCycles) &&
            (identical(other.hopChannels, hopChannels) ||
                other.hopChannels == hopChannels) &&
            (identical(other.interface, interface) ||
                other.interface == interface));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    enablePassiveScan,
    enableActiveScan,
    enableDeauth,
    enablePmkid,
    enableWps,
    const DeepCollectionEquality().hash(_targetBssids),
    const DeepCollectionEquality().hash(_targetChannels),
    dwellTimeMs,
    scanCycles,
    hopChannels,
    interface,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanConfigImplCopyWith<_$ScanConfigImpl> get copyWith =>
      __$$ScanConfigImplCopyWithImpl<_$ScanConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanConfigImplToJson(this);
  }
}

abstract class _ScanConfig implements ScanConfig {
  const factory _ScanConfig({
    final bool enablePassiveScan,
    final bool enableActiveScan,
    final bool enableDeauth,
    final bool enablePmkid,
    final bool enableWps,
    final List<String> targetBssids,
    final List<int> targetChannels,
    final int dwellTimeMs,
    final int scanCycles,
    final bool hopChannels,
    final String interface,
  }) = _$ScanConfigImpl;

  factory _ScanConfig.fromJson(Map<String, dynamic> json) =
      _$ScanConfigImpl.fromJson;

  @override
  bool get enablePassiveScan;
  @override
  bool get enableActiveScan;
  @override
  bool get enableDeauth;
  @override
  bool get enablePmkid;
  @override
  bool get enableWps;
  @override
  List<String> get targetBssids;
  @override
  List<int> get targetChannels;
  @override
  int get dwellTimeMs;
  @override
  int get scanCycles;
  @override
  bool get hopChannels;
  @override
  String get interface;
  @override
  @JsonKey(ignore: true)
  _$$ScanConfigImplCopyWith<_$ScanConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScanStatistics _$ScanStatisticsFromJson(Map<String, dynamic> json) {
  return _ScanStatistics.fromJson(json);
}

/// @nodoc
mixin _$ScanStatistics {
  int get totalPackets => throw _privateConstructorUsedError;
  int get beaconFrames => throw _privateConstructorUsedError;
  int get probeRequests => throw _privateConstructorUsedError;
  int get probeResponses => throw _privateConstructorUsedError;
  int get authFrames => throw _privateConstructorUsedError;
  int get assocFrames => throw _privateConstructorUsedError;
  int get deauthFrames => throw _privateConstructorUsedError;
  int get eapolFrames => throw _privateConstructorUsedError;
  int get uniqueAps => throw _privateConstructorUsedError;
  int get uniqueClients => throw _privateConstructorUsedError;
  int get handshakesCaptured => throw _privateConstructorUsedError;
  int get pmkidsCaptured => throw _privateConstructorUsedError;
  int get wpsPinsRecovered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanStatisticsCopyWith<ScanStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanStatisticsCopyWith<$Res> {
  factory $ScanStatisticsCopyWith(
    ScanStatistics value,
    $Res Function(ScanStatistics) then,
  ) = _$ScanStatisticsCopyWithImpl<$Res, ScanStatistics>;
  @useResult
  $Res call({
    int totalPackets,
    int beaconFrames,
    int probeRequests,
    int probeResponses,
    int authFrames,
    int assocFrames,
    int deauthFrames,
    int eapolFrames,
    int uniqueAps,
    int uniqueClients,
    int handshakesCaptured,
    int pmkidsCaptured,
    int wpsPinsRecovered,
  });
}

/// @nodoc
class _$ScanStatisticsCopyWithImpl<$Res, $Val extends ScanStatistics>
    implements $ScanStatisticsCopyWith<$Res> {
  _$ScanStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPackets = null,
    Object? beaconFrames = null,
    Object? probeRequests = null,
    Object? probeResponses = null,
    Object? authFrames = null,
    Object? assocFrames = null,
    Object? deauthFrames = null,
    Object? eapolFrames = null,
    Object? uniqueAps = null,
    Object? uniqueClients = null,
    Object? handshakesCaptured = null,
    Object? pmkidsCaptured = null,
    Object? wpsPinsRecovered = null,
  }) {
    return _then(
      _value.copyWith(
            totalPackets: null == totalPackets
                ? _value.totalPackets
                : totalPackets // ignore: cast_nullable_to_non_nullable
                      as int,
            beaconFrames: null == beaconFrames
                ? _value.beaconFrames
                : beaconFrames // ignore: cast_nullable_to_non_nullable
                      as int,
            probeRequests: null == probeRequests
                ? _value.probeRequests
                : probeRequests // ignore: cast_nullable_to_non_nullable
                      as int,
            probeResponses: null == probeResponses
                ? _value.probeResponses
                : probeResponses // ignore: cast_nullable_to_non_nullable
                      as int,
            authFrames: null == authFrames
                ? _value.authFrames
                : authFrames // ignore: cast_nullable_to_non_nullable
                      as int,
            assocFrames: null == assocFrames
                ? _value.assocFrames
                : assocFrames // ignore: cast_nullable_to_non_nullable
                      as int,
            deauthFrames: null == deauthFrames
                ? _value.deauthFrames
                : deauthFrames // ignore: cast_nullable_to_non_nullable
                      as int,
            eapolFrames: null == eapolFrames
                ? _value.eapolFrames
                : eapolFrames // ignore: cast_nullable_to_non_nullable
                      as int,
            uniqueAps: null == uniqueAps
                ? _value.uniqueAps
                : uniqueAps // ignore: cast_nullable_to_non_nullable
                      as int,
            uniqueClients: null == uniqueClients
                ? _value.uniqueClients
                : uniqueClients // ignore: cast_nullable_to_non_nullable
                      as int,
            handshakesCaptured: null == handshakesCaptured
                ? _value.handshakesCaptured
                : handshakesCaptured // ignore: cast_nullable_to_non_nullable
                      as int,
            pmkidsCaptured: null == pmkidsCaptured
                ? _value.pmkidsCaptured
                : pmkidsCaptured // ignore: cast_nullable_to_non_nullable
                      as int,
            wpsPinsRecovered: null == wpsPinsRecovered
                ? _value.wpsPinsRecovered
                : wpsPinsRecovered // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScanStatisticsImplCopyWith<$Res>
    implements $ScanStatisticsCopyWith<$Res> {
  factory _$$ScanStatisticsImplCopyWith(
    _$ScanStatisticsImpl value,
    $Res Function(_$ScanStatisticsImpl) then,
  ) = __$$ScanStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalPackets,
    int beaconFrames,
    int probeRequests,
    int probeResponses,
    int authFrames,
    int assocFrames,
    int deauthFrames,
    int eapolFrames,
    int uniqueAps,
    int uniqueClients,
    int handshakesCaptured,
    int pmkidsCaptured,
    int wpsPinsRecovered,
  });
}

/// @nodoc
class __$$ScanStatisticsImplCopyWithImpl<$Res>
    extends _$ScanStatisticsCopyWithImpl<$Res, _$ScanStatisticsImpl>
    implements _$$ScanStatisticsImplCopyWith<$Res> {
  __$$ScanStatisticsImplCopyWithImpl(
    _$ScanStatisticsImpl _value,
    $Res Function(_$ScanStatisticsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPackets = null,
    Object? beaconFrames = null,
    Object? probeRequests = null,
    Object? probeResponses = null,
    Object? authFrames = null,
    Object? assocFrames = null,
    Object? deauthFrames = null,
    Object? eapolFrames = null,
    Object? uniqueAps = null,
    Object? uniqueClients = null,
    Object? handshakesCaptured = null,
    Object? pmkidsCaptured = null,
    Object? wpsPinsRecovered = null,
  }) {
    return _then(
      _$ScanStatisticsImpl(
        totalPackets: null == totalPackets
            ? _value.totalPackets
            : totalPackets // ignore: cast_nullable_to_non_nullable
                  as int,
        beaconFrames: null == beaconFrames
            ? _value.beaconFrames
            : beaconFrames // ignore: cast_nullable_to_non_nullable
                  as int,
        probeRequests: null == probeRequests
            ? _value.probeRequests
            : probeRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        probeResponses: null == probeResponses
            ? _value.probeResponses
            : probeResponses // ignore: cast_nullable_to_non_nullable
                  as int,
        authFrames: null == authFrames
            ? _value.authFrames
            : authFrames // ignore: cast_nullable_to_non_nullable
                  as int,
        assocFrames: null == assocFrames
            ? _value.assocFrames
            : assocFrames // ignore: cast_nullable_to_non_nullable
                  as int,
        deauthFrames: null == deauthFrames
            ? _value.deauthFrames
            : deauthFrames // ignore: cast_nullable_to_non_nullable
                  as int,
        eapolFrames: null == eapolFrames
            ? _value.eapolFrames
            : eapolFrames // ignore: cast_nullable_to_non_nullable
                  as int,
        uniqueAps: null == uniqueAps
            ? _value.uniqueAps
            : uniqueAps // ignore: cast_nullable_to_non_nullable
                  as int,
        uniqueClients: null == uniqueClients
            ? _value.uniqueClients
            : uniqueClients // ignore: cast_nullable_to_non_nullable
                  as int,
        handshakesCaptured: null == handshakesCaptured
            ? _value.handshakesCaptured
            : handshakesCaptured // ignore: cast_nullable_to_non_nullable
                  as int,
        pmkidsCaptured: null == pmkidsCaptured
            ? _value.pmkidsCaptured
            : pmkidsCaptured // ignore: cast_nullable_to_non_nullable
                  as int,
        wpsPinsRecovered: null == wpsPinsRecovered
            ? _value.wpsPinsRecovered
            : wpsPinsRecovered // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanStatisticsImpl implements _ScanStatistics {
  const _$ScanStatisticsImpl({
    this.totalPackets = 0,
    this.beaconFrames = 0,
    this.probeRequests = 0,
    this.probeResponses = 0,
    this.authFrames = 0,
    this.assocFrames = 0,
    this.deauthFrames = 0,
    this.eapolFrames = 0,
    this.uniqueAps = 0,
    this.uniqueClients = 0,
    this.handshakesCaptured = 0,
    this.pmkidsCaptured = 0,
    this.wpsPinsRecovered = 0,
  });

  factory _$ScanStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanStatisticsImplFromJson(json);

  @override
  @JsonKey()
  final int totalPackets;
  @override
  @JsonKey()
  final int beaconFrames;
  @override
  @JsonKey()
  final int probeRequests;
  @override
  @JsonKey()
  final int probeResponses;
  @override
  @JsonKey()
  final int authFrames;
  @override
  @JsonKey()
  final int assocFrames;
  @override
  @JsonKey()
  final int deauthFrames;
  @override
  @JsonKey()
  final int eapolFrames;
  @override
  @JsonKey()
  final int uniqueAps;
  @override
  @JsonKey()
  final int uniqueClients;
  @override
  @JsonKey()
  final int handshakesCaptured;
  @override
  @JsonKey()
  final int pmkidsCaptured;
  @override
  @JsonKey()
  final int wpsPinsRecovered;

  @override
  String toString() {
    return 'ScanStatistics(totalPackets: $totalPackets, beaconFrames: $beaconFrames, probeRequests: $probeRequests, probeResponses: $probeResponses, authFrames: $authFrames, assocFrames: $assocFrames, deauthFrames: $deauthFrames, eapolFrames: $eapolFrames, uniqueAps: $uniqueAps, uniqueClients: $uniqueClients, handshakesCaptured: $handshakesCaptured, pmkidsCaptured: $pmkidsCaptured, wpsPinsRecovered: $wpsPinsRecovered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanStatisticsImpl &&
            (identical(other.totalPackets, totalPackets) ||
                other.totalPackets == totalPackets) &&
            (identical(other.beaconFrames, beaconFrames) ||
                other.beaconFrames == beaconFrames) &&
            (identical(other.probeRequests, probeRequests) ||
                other.probeRequests == probeRequests) &&
            (identical(other.probeResponses, probeResponses) ||
                other.probeResponses == probeResponses) &&
            (identical(other.authFrames, authFrames) ||
                other.authFrames == authFrames) &&
            (identical(other.assocFrames, assocFrames) ||
                other.assocFrames == assocFrames) &&
            (identical(other.deauthFrames, deauthFrames) ||
                other.deauthFrames == deauthFrames) &&
            (identical(other.eapolFrames, eapolFrames) ||
                other.eapolFrames == eapolFrames) &&
            (identical(other.uniqueAps, uniqueAps) ||
                other.uniqueAps == uniqueAps) &&
            (identical(other.uniqueClients, uniqueClients) ||
                other.uniqueClients == uniqueClients) &&
            (identical(other.handshakesCaptured, handshakesCaptured) ||
                other.handshakesCaptured == handshakesCaptured) &&
            (identical(other.pmkidsCaptured, pmkidsCaptured) ||
                other.pmkidsCaptured == pmkidsCaptured) &&
            (identical(other.wpsPinsRecovered, wpsPinsRecovered) ||
                other.wpsPinsRecovered == wpsPinsRecovered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalPackets,
    beaconFrames,
    probeRequests,
    probeResponses,
    authFrames,
    assocFrames,
    deauthFrames,
    eapolFrames,
    uniqueAps,
    uniqueClients,
    handshakesCaptured,
    pmkidsCaptured,
    wpsPinsRecovered,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanStatisticsImplCopyWith<_$ScanStatisticsImpl> get copyWith =>
      __$$ScanStatisticsImplCopyWithImpl<_$ScanStatisticsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanStatisticsImplToJson(this);
  }
}

abstract class _ScanStatistics implements ScanStatistics {
  const factory _ScanStatistics({
    final int totalPackets,
    final int beaconFrames,
    final int probeRequests,
    final int probeResponses,
    final int authFrames,
    final int assocFrames,
    final int deauthFrames,
    final int eapolFrames,
    final int uniqueAps,
    final int uniqueClients,
    final int handshakesCaptured,
    final int pmkidsCaptured,
    final int wpsPinsRecovered,
  }) = _$ScanStatisticsImpl;

  factory _ScanStatistics.fromJson(Map<String, dynamic> json) =
      _$ScanStatisticsImpl.fromJson;

  @override
  int get totalPackets;
  @override
  int get beaconFrames;
  @override
  int get probeRequests;
  @override
  int get probeResponses;
  @override
  int get authFrames;
  @override
  int get assocFrames;
  @override
  int get deauthFrames;
  @override
  int get eapolFrames;
  @override
  int get uniqueAps;
  @override
  int get uniqueClients;
  @override
  int get handshakesCaptured;
  @override
  int get pmkidsCaptured;
  @override
  int get wpsPinsRecovered;
  @override
  @JsonKey(ignore: true)
  _$$ScanStatisticsImplCopyWith<_$ScanStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VulnerabilityFinding _$VulnerabilityFindingFromJson(Map<String, dynamic> json) {
  return _VulnerabilityFinding.fromJson(json);
}

/// @nodoc
mixin _$VulnerabilityFinding {
  String get id => throw _privateConstructorUsedError;
  String get accessPointId => throw _privateConstructorUsedError;
  VulnerabilityType get type => throw _privateConstructorUsedError;
  Severity get severity => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  Map<String, dynamic> get evidence => throw _privateConstructorUsedError;
  DateTime get discoveredAt => throw _privateConstructorUsedError;
  CvssVector? get cvssVector => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VulnerabilityFindingCopyWith<VulnerabilityFinding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VulnerabilityFindingCopyWith<$Res> {
  factory $VulnerabilityFindingCopyWith(
    VulnerabilityFinding value,
    $Res Function(VulnerabilityFinding) then,
  ) = _$VulnerabilityFindingCopyWithImpl<$Res, VulnerabilityFinding>;
  @useResult
  $Res call({
    String id,
    String accessPointId,
    VulnerabilityType type,
    Severity severity,
    String title,
    String description,
    String recommendation,
    Map<String, dynamic> evidence,
    DateTime discoveredAt,
    CvssVector? cvssVector,
    bool verified,
  });

  $CvssVectorCopyWith<$Res>? get cvssVector;
}

/// @nodoc
class _$VulnerabilityFindingCopyWithImpl<
  $Res,
  $Val extends VulnerabilityFinding
>
    implements $VulnerabilityFindingCopyWith<$Res> {
  _$VulnerabilityFindingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? recommendation = null,
    Object? evidence = null,
    Object? discoveredAt = null,
    Object? cvssVector = freezed,
    Object? verified = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            accessPointId: null == accessPointId
                ? _value.accessPointId
                : accessPointId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as VulnerabilityType,
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
            evidence: null == evidence
                ? _value.evidence
                : evidence // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            discoveredAt: null == discoveredAt
                ? _value.discoveredAt
                : discoveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            cvssVector: freezed == cvssVector
                ? _value.cvssVector
                : cvssVector // ignore: cast_nullable_to_non_nullable
                      as CvssVector?,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $CvssVectorCopyWith<$Res>? get cvssVector {
    if (_value.cvssVector == null) {
      return null;
    }

    return $CvssVectorCopyWith<$Res>(_value.cvssVector!, (value) {
      return _then(_value.copyWith(cvssVector: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VulnerabilityFindingImplCopyWith<$Res>
    implements $VulnerabilityFindingCopyWith<$Res> {
  factory _$$VulnerabilityFindingImplCopyWith(
    _$VulnerabilityFindingImpl value,
    $Res Function(_$VulnerabilityFindingImpl) then,
  ) = __$$VulnerabilityFindingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String accessPointId,
    VulnerabilityType type,
    Severity severity,
    String title,
    String description,
    String recommendation,
    Map<String, dynamic> evidence,
    DateTime discoveredAt,
    CvssVector? cvssVector,
    bool verified,
  });

  @override
  $CvssVectorCopyWith<$Res>? get cvssVector;
}

/// @nodoc
class __$$VulnerabilityFindingImplCopyWithImpl<$Res>
    extends _$VulnerabilityFindingCopyWithImpl<$Res, _$VulnerabilityFindingImpl>
    implements _$$VulnerabilityFindingImplCopyWith<$Res> {
  __$$VulnerabilityFindingImplCopyWithImpl(
    _$VulnerabilityFindingImpl _value,
    $Res Function(_$VulnerabilityFindingImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accessPointId = null,
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? recommendation = null,
    Object? evidence = null,
    Object? discoveredAt = null,
    Object? cvssVector = freezed,
    Object? verified = null,
  }) {
    return _then(
      _$VulnerabilityFindingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        accessPointId: null == accessPointId
            ? _value.accessPointId
            : accessPointId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as VulnerabilityType,
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
        evidence: null == evidence
            ? _value._evidence
            : evidence // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        discoveredAt: null == discoveredAt
            ? _value.discoveredAt
            : discoveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        cvssVector: freezed == cvssVector
            ? _value.cvssVector
            : cvssVector // ignore: cast_nullable_to_non_nullable
                  as CvssVector?,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VulnerabilityFindingImpl implements _VulnerabilityFinding {
  const _$VulnerabilityFindingImpl({
    required this.id,
    required this.accessPointId,
    required this.type,
    required this.severity,
    required this.title,
    required this.description,
    required this.recommendation,
    required final Map<String, dynamic> evidence,
    required this.discoveredAt,
    required this.cvssVector,
    this.verified = false,
  }) : _evidence = evidence;

  factory _$VulnerabilityFindingImpl.fromJson(Map<String, dynamic> json) =>
      _$$VulnerabilityFindingImplFromJson(json);

  @override
  final String id;
  @override
  final String accessPointId;
  @override
  final VulnerabilityType type;
  @override
  final Severity severity;
  @override
  final String title;
  @override
  final String description;
  @override
  final String recommendation;
  final Map<String, dynamic> _evidence;
  @override
  Map<String, dynamic> get evidence {
    if (_evidence is EqualUnmodifiableMapView) return _evidence;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_evidence);
  }

  @override
  final DateTime discoveredAt;
  @override
  final CvssVector? cvssVector;
  @override
  @JsonKey()
  final bool verified;

  @override
  String toString() {
    return 'VulnerabilityFinding(id: $id, accessPointId: $accessPointId, type: $type, severity: $severity, title: $title, description: $description, recommendation: $recommendation, evidence: $evidence, discoveredAt: $discoveredAt, cvssVector: $cvssVector, verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VulnerabilityFindingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accessPointId, accessPointId) ||
                other.accessPointId == accessPointId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            const DeepCollectionEquality().equals(other._evidence, _evidence) &&
            (identical(other.discoveredAt, discoveredAt) ||
                other.discoveredAt == discoveredAt) &&
            (identical(other.cvssVector, cvssVector) ||
                other.cvssVector == cvssVector) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    accessPointId,
    type,
    severity,
    title,
    description,
    recommendation,
    const DeepCollectionEquality().hash(_evidence),
    discoveredAt,
    cvssVector,
    verified,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VulnerabilityFindingImplCopyWith<_$VulnerabilityFindingImpl>
  get copyWith =>
      __$$VulnerabilityFindingImplCopyWithImpl<_$VulnerabilityFindingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VulnerabilityFindingImplToJson(this);
  }
}

abstract class _VulnerabilityFinding implements VulnerabilityFinding {
  const factory _VulnerabilityFinding({
    required final String id,
    required final String accessPointId,
    required final VulnerabilityType type,
    required final Severity severity,
    required final String title,
    required final String description,
    required final String recommendation,
    required final Map<String, dynamic> evidence,
    required final DateTime discoveredAt,
    required final CvssVector? cvssVector,
    final bool verified,
  }) = _$VulnerabilityFindingImpl;

  factory _VulnerabilityFinding.fromJson(Map<String, dynamic> json) =
      _$VulnerabilityFindingImpl.fromJson;

  @override
  String get id;
  @override
  String get accessPointId;
  @override
  VulnerabilityType get type;
  @override
  Severity get severity;
  @override
  String get title;
  @override
  String get description;
  @override
  String get recommendation;
  @override
  Map<String, dynamic> get evidence;
  @override
  DateTime get discoveredAt;
  @override
  CvssVector? get cvssVector;
  @override
  bool get verified;
  @override
  @JsonKey(ignore: true)
  _$$VulnerabilityFindingImplCopyWith<_$VulnerabilityFindingImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CvssVector _$CvssVectorFromJson(Map<String, dynamic> json) {
  return _CvssVector.fromJson(json);
}

/// @nodoc
mixin _$CvssVector {
  String get vectorString => throw _privateConstructorUsedError;
  double get baseScore => throw _privateConstructorUsedError;
  double get temporalScore => throw _privateConstructorUsedError;
  double get environmentalScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CvssVectorCopyWith<CvssVector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CvssVectorCopyWith<$Res> {
  factory $CvssVectorCopyWith(
    CvssVector value,
    $Res Function(CvssVector) then,
  ) = _$CvssVectorCopyWithImpl<$Res, CvssVector>;
  @useResult
  $Res call({
    String vectorString,
    double baseScore,
    double temporalScore,
    double environmentalScore,
  });
}

/// @nodoc
class _$CvssVectorCopyWithImpl<$Res, $Val extends CvssVector>
    implements $CvssVectorCopyWith<$Res> {
  _$CvssVectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vectorString = null,
    Object? baseScore = null,
    Object? temporalScore = null,
    Object? environmentalScore = null,
  }) {
    return _then(
      _value.copyWith(
            vectorString: null == vectorString
                ? _value.vectorString
                : vectorString // ignore: cast_nullable_to_non_nullable
                      as String,
            baseScore: null == baseScore
                ? _value.baseScore
                : baseScore // ignore: cast_nullable_to_non_nullable
                      as double,
            temporalScore: null == temporalScore
                ? _value.temporalScore
                : temporalScore // ignore: cast_nullable_to_non_nullable
                      as double,
            environmentalScore: null == environmentalScore
                ? _value.environmentalScore
                : environmentalScore // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CvssVectorImplCopyWith<$Res>
    implements $CvssVectorCopyWith<$Res> {
  factory _$$CvssVectorImplCopyWith(
    _$CvssVectorImpl value,
    $Res Function(_$CvssVectorImpl) then,
  ) = __$$CvssVectorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String vectorString,
    double baseScore,
    double temporalScore,
    double environmentalScore,
  });
}

/// @nodoc
class __$$CvssVectorImplCopyWithImpl<$Res>
    extends _$CvssVectorCopyWithImpl<$Res, _$CvssVectorImpl>
    implements _$$CvssVectorImplCopyWith<$Res> {
  __$$CvssVectorImplCopyWithImpl(
    _$CvssVectorImpl _value,
    $Res Function(_$CvssVectorImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vectorString = null,
    Object? baseScore = null,
    Object? temporalScore = null,
    Object? environmentalScore = null,
  }) {
    return _then(
      _$CvssVectorImpl(
        vectorString: null == vectorString
            ? _value.vectorString
            : vectorString // ignore: cast_nullable_to_non_nullable
                  as String,
        baseScore: null == baseScore
            ? _value.baseScore
            : baseScore // ignore: cast_nullable_to_non_nullable
                  as double,
        temporalScore: null == temporalScore
            ? _value.temporalScore
            : temporalScore // ignore: cast_nullable_to_non_nullable
                  as double,
        environmentalScore: null == environmentalScore
            ? _value.environmentalScore
            : environmentalScore // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CvssVectorImpl implements _CvssVector {
  const _$CvssVectorImpl({
    required this.vectorString,
    required this.baseScore,
    required this.temporalScore,
    required this.environmentalScore,
  });

  factory _$CvssVectorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CvssVectorImplFromJson(json);

  @override
  final String vectorString;
  @override
  final double baseScore;
  @override
  final double temporalScore;
  @override
  final double environmentalScore;

  @override
  String toString() {
    return 'CvssVector(vectorString: $vectorString, baseScore: $baseScore, temporalScore: $temporalScore, environmentalScore: $environmentalScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvssVectorImpl &&
            (identical(other.vectorString, vectorString) ||
                other.vectorString == vectorString) &&
            (identical(other.baseScore, baseScore) ||
                other.baseScore == baseScore) &&
            (identical(other.temporalScore, temporalScore) ||
                other.temporalScore == temporalScore) &&
            (identical(other.environmentalScore, environmentalScore) ||
                other.environmentalScore == environmentalScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    vectorString,
    baseScore,
    temporalScore,
    environmentalScore,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CvssVectorImplCopyWith<_$CvssVectorImpl> get copyWith =>
      __$$CvssVectorImplCopyWithImpl<_$CvssVectorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CvssVectorImplToJson(this);
  }
}

abstract class _CvssVector implements CvssVector {
  const factory _CvssVector({
    required final String vectorString,
    required final double baseScore,
    required final double temporalScore,
    required final double environmentalScore,
  }) = _$CvssVectorImpl;

  factory _CvssVector.fromJson(Map<String, dynamic> json) =
      _$CvssVectorImpl.fromJson;

  @override
  String get vectorString;
  @override
  double get baseScore;
  @override
  double get temporalScore;
  @override
  double get environmentalScore;
  @override
  @JsonKey(ignore: true)
  _$$CvssVectorImplCopyWith<_$CvssVectorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
