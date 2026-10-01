import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'wifi_models.freezed.dart';
part 'wifi_models.g.dart';

@freezed
sealed class AccessPoint with _$AccessPoint {
  const factory AccessPoint({
    required String id,
    required String bssid,
    required String ssid,
    required int frequency,
    required int channel,
    required int signalLevel,
    required int noiseLevel,
    required SecurityProtocol security,
    required List<SecurityProtocol> supportedProtocols,
    required bool wpsEnabled,
    required String? wpsManufacturer,
    required String? wpsModel,
    required int beaconInterval,
    required int capabilityMask,
    required DateTime firstSeen,
    required DateTime lastSeen,
    required int packetCount,
    required Map<String, dynamic> vendorIEs,
    @Default([]) List<ClientDevice> associatedClients,
  }) = _AccessPoint;

  factory AccessPoint.fromJson(Map<String, dynamic> json) =>
      _$AccessPointFromJson(json);
}

@freezed
sealed class ClientDevice with _$ClientDevice {
  const factory ClientDevice({
    required String id,
    required String macAddress,
    required String? hostname,
    required String? vendor,
    required int signalLevel,
    required int dataFrames,
    required DateTime firstSeen,
    required DateTime lastSeen,
    required String associatedBssid,
    @Default([]) List<ProbeRequest> probeRequests,
  }) = _ClientDevice;

  factory ClientDevice.fromJson(Map<String, dynamic> json) =>
      _$ClientDeviceFromJson(json);
}

@freezed
sealed class ProbeRequest with _$ProbeRequest {
  const factory ProbeRequest({
    required String ssid,
    required int signalLevel,
    required DateTime timestamp,
  }) = _ProbeRequest;

  factory ProbeRequest.fromJson(Map<String, dynamic> json) =>
      _$ProbeRequestFromJson(json);
}

enum SecurityProtocol {
  @JsonValue('open')
  open,
  @JsonValue('wep')
  wep,
  @JsonValue('wpa')
  wpa,
  @JsonValue('wpa2')
  wpa2,
  @JsonValue('wpa3')
  wpa3,
  @JsonValue('wpa2_wpa3')
  wpa2_wpa3,
  @JsonValue('owe')
  owe,
  @JsonValue('unknown')
  unknown,
}

extension SecurityProtocolX on SecurityProtocol {
  String get displayName {
    switch (this) {
      case SecurityProtocol.open:
        return 'Open';
      case SecurityProtocol.wep:
        return 'WEP';
      case SecurityProtocol.wpa:
        return 'WPA';
      case SecurityProtocol.wpa2:
        return 'WPA2';
      case SecurityProtocol.wpa3:
        return 'WPA3';
      case SecurityProtocol.wpa2_wpa3:
        return 'WPA2/WPA3';
      case SecurityProtocol.owe:
        return 'OWE';
      case SecurityProtocol.unknown:
        return 'Unknown';
    }
  }

  int get severity {
    switch (this) {
      case SecurityProtocol.open:
        return 1;
      case SecurityProtocol.wep:
        return 5;
      case SecurityProtocol.wpa:
        return 3;
      case SecurityProtocol.wpa2:
        return 2;
      case SecurityProtocol.wpa3:
        return 1;
      case SecurityProtocol.wpa2_wpa3:
        return 2;
      case SecurityProtocol.owe:
        return 1;
      case SecurityProtocol.unknown:
        return 3;
    }
  }
}

@freezed
sealed class HandshakeCapture with _$HandshakeCapture {
  const factory HandshakeCapture({
    required String id,
    required String accessPointId,
    required String bssid,
    required String ssid,
    required HandshakeType type,
    required List<int> eapolFrames,
    required DateTime capturedAt,
    required int frameCount,
    required bool isComplete,
    required Map<String, dynamic> metadata,
  }) = _HandshakeCapture;

  factory HandshakeCapture.fromJson(Map<String, dynamic> json) =>
      _$HandshakeCaptureFromJson(json);
}

enum HandshakeType {
  @JsonValue('wpa2_4way')
  wpa2_4way,
  @JsonValue('wpa3_sae')
  wpa3_sae,
  @JsonValue('pmkid')
  pmkid,
  @JsonValue('wps')
  wps,
}

@freezed
sealed class PmkidCapture with _$PmkidCapture {
  const factory PmkidCapture({
    required String id,
    required String accessPointId,
    required String bssid,
    required String ssid,
    required List<int> pmkidData,
    required DateTime capturedAt,
    required Map<String, dynamic> metadata,
  }) = _PmkidCapture;

  factory PmkidCapture.fromJson(Map<String, dynamic> json) =>
      _$PmkidCaptureFromJson(json);
}

@freezed
sealed class WpsPin with _$WpsPin {
  const factory WpsPin({
    required String id,
    required String accessPointId,
    required String bssid,
    required String pin,
    required WpsMethod method,
    required DateTime recoveredAt,
    required Map<String, dynamic> metadata,
  }) = _WpsPin;

  factory WpsPin.fromJson(Map<String, dynamic> json) => _$WpsPinFromJson(json);
}

enum WpsMethod {
  @JsonValue('pixie_dust')
  pixieDust,
  @JsonValue('brute_force')
  bruteForce,
  @JsonValue('null_pin')
  nullPin,
}

@freezed
sealed class ScanSession with _$ScanSession {
  const factory ScanSession({
    required String id,
    required String name,
    required ScanMode mode,
    required ScanStatus status,
    required DateTime startedAt,
    required DateTime? completedAt,
    required ScanConfig config,
    required ScanStatistics statistics,
    String? assessmentId,
    @Default([]) List<String> accessPointIds,
    @Default([]) List<String> handshakeIds,
    @Default([]) List<String> pmkidIds,
    @Default([]) List<String> wpsPinIds,
  }) = _ScanSession;

  factory ScanSession.fromJson(Map<String, dynamic> json) =>
      _$ScanSessionFromJson(json);
}

enum ScanMode {
  @JsonValue('passive')
  passive,
  @JsonValue('active')
  active,
  @JsonValue('targeted')
  targeted,
}

enum ScanStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('running')
  running,
  @JsonValue('paused')
  paused,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

@freezed
sealed class ScanConfig with _$ScanConfig {
  const factory ScanConfig({
    @Default(true) bool enablePassiveScan,
    @Default(false) bool enableActiveScan,
    @Default(false) bool enableDeauth,
    @Default(false) bool enablePmkid,
    @Default(false) bool enableWps,
    @Default([]) List<String> targetBssids,
    @Default([]) List<int> targetChannels,
    @Default(30) int dwellTimeMs,
    @Default(5) int scanCycles,
    @Default(true) bool hopChannels,
    @Default('') String interface,
  }) = _ScanConfig;

  factory ScanConfig.fromJson(Map<String, dynamic> json) =>
      _$ScanConfigFromJson(json);
}

@freezed
sealed class ScanStatistics with _$ScanStatistics {
  const factory ScanStatistics({
    @Default(0) int totalPackets,
    @Default(0) int beaconFrames,
    @Default(0) int probeRequests,
    @Default(0) int probeResponses,
    @Default(0) int authFrames,
    @Default(0) int assocFrames,
    @Default(0) int deauthFrames,
    @Default(0) int eapolFrames,
    @Default(0) int uniqueAps,
    @Default(0) int uniqueClients,
    @Default(0) int handshakesCaptured,
    @Default(0) int pmkidsCaptured,
    @Default(0) int wpsPinsRecovered,
  }) = _ScanStatistics;

  factory ScanStatistics.fromJson(Map<String, dynamic> json) =>
      _$ScanStatisticsFromJson(json);
}

@freezed
sealed class VulnerabilityFinding with _$VulnerabilityFinding {
  const factory VulnerabilityFinding({
    required String id,
    required String accessPointId,
    required VulnerabilityType type,
    required Severity severity,
    required String title,
    required String description,
    required String recommendation,
    required Map<String, dynamic> evidence,
    required DateTime discoveredAt,
    required CvssVector? cvssVector,
    @Default(false) bool verified,
  }) = _VulnerabilityFinding;

  factory VulnerabilityFinding.fromJson(Map<String, dynamic> json) =>
      _$VulnerabilityFindingFromJson(json);
}

enum VulnerabilityType {
  @JsonValue('weak_encryption')
  weakEncryption,
  @JsonValue('wps_enabled')
  wpsEnabled,
  @JsonValue('pmkid_vulnerable')
  pmkidVulnerable,
  @JsonValue('default_credentials')
  defaultCredentials,
  @JsonValue('rogue_ap')
  rogueAp,
  @JsonValue('evil_twin_potential')
  evilTwinPotential,
  @JsonValue('weak_wps_pin')
  weakWpsPin,
  @JsonValue('outdated_firmware')
  outdatedFirmware,
  @JsonValue('insecure_configuration')
  insecureConfiguration,
}

enum Severity {
  @JsonValue('critical')
  critical,
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low,
  @JsonValue('info')
  info,
}

extension SeverityX on Severity {
  int get weight {
    switch (this) {
      case Severity.critical:
        return 5;
      case Severity.high:
        return 4;
      case Severity.medium:
        return 3;
      case Severity.low:
        return 2;
      case Severity.info:
        return 1;
    }
  }

  Color get color {
    switch (this) {
      case Severity.critical:
        return const Color(0xFFB71C1C);
      case Severity.high:
        return const Color(0xFFD32F2F);
      case Severity.medium:
        return const Color(0xFFF57C00);
      case Severity.low:
        return const Color(0xFF388E3C);
      case Severity.info:
        return const Color(0xFF1976D2);
    }
  }
}

@freezed
sealed class CvssVector with _$CvssVector {
  const factory CvssVector({
    required String vectorString,
    required double baseScore,
    required double temporalScore,
    required double environmentalScore,
  }) = _CvssVector;

  factory CvssVector.fromJson(Map<String, dynamic> json) =>
      _$CvssVectorFromJson(json);
}
