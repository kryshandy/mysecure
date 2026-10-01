import 'dart:convert';

import 'package:drift/drift.dart';
import '../models/assessment_models.dart';
import '../models/project_models.dart';
import '../models/report_models.dart';
import '../models/wifi_models.dart';

part 'app_database.g.dart';

@DataClassName('DbProject')
class Projects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get type => intEnum<ProjectType>()();
  IntColumn get status => intEnum<ProjectStatus>()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get clientJson => text().map(const ClientInfoConverter())();
  TextColumn get scopeJson => text().map(const ScopeDefinitionConverter())();
  TextColumn get authorizationJson =>
      text().map(const AuthorizationConverter())();
  TextColumn get settingsJson => text().map(const ProjectSettingsConverter())();
  TextColumn get assessmentIds => text().map(const StringListConverter())();
  TextColumn get teamMembers => text().map(const StringListConverter())();
  TextColumn get metadata => text().map(const JsonMapConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbAssessment')
class Assessments extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get name => text()();
  IntColumn get type => intEnum<AssessmentType>()();
  IntColumn get status => intEnum<AssessmentStatus>()();
  TextColumn get scopeJson => text().map(const AssessmentScopeConverter())();
  TextColumn get configJson => text().map(const AssessmentConfigConverter())();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get pausedAt => dateTime().nullable()();
  IntColumn get totalDurationMs => integer()();
  TextColumn get progressJson =>
      text().map(const AssessmentProgressConverter())();
  TextColumn get phasesJson => text().map(const AssessmentPhasesConverter())();
  TextColumn get findingIds => text().map(const StringListConverter())();
  TextColumn get evidenceIds => text().map(const StringListConverter())();
  TextColumn get metadata => text().map(const JsonMapConverter())();
  TextColumn get assignedTo => text().nullable()();
  TextColumn get parentAssessmentId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbAccessPoint')
class AccessPoints extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  TextColumn get bssid => text()();
  TextColumn get ssid => text()();
  IntColumn get frequency => integer()();
  IntColumn get channel => integer()();
  IntColumn get signalLevel => integer()();
  IntColumn get noiseLevel => integer()();
  IntColumn get security => intEnum<SecurityProtocol>()();
  TextColumn get supportedProtocols =>
      text().map(const SecurityProtocolListConverter())();
  BoolColumn get wpsEnabled => boolean()();
  TextColumn get wpsManufacturer => text().nullable()();
  TextColumn get wpsModel => text().nullable()();
  IntColumn get beaconInterval => integer()();
  IntColumn get capabilityMask => integer()();
  DateTimeColumn get firstSeen => dateTime()();
  DateTimeColumn get lastSeen => dateTime()();
  IntColumn get packetCount => integer()();
  TextColumn get vendorIEs => text().map(const JsonMapConverter())();
  TextColumn get clientIds => text().map(const StringListConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbClientDevice')
class ClientDevices extends Table {
  TextColumn get id => text()();
  TextColumn get accessPointId => text()();
  TextColumn get macAddress => text()();
  TextColumn get hostname => text().nullable()();
  TextColumn get vendor => text().nullable()();
  IntColumn get signalLevel => integer()();
  IntColumn get dataFrames => integer()();
  DateTimeColumn get firstSeen => dateTime()();
  DateTimeColumn get lastSeen => dateTime()();
  TextColumn get associatedBssid => text()();
  TextColumn get probeRequestsJson =>
      text().map(const ProbeRequestListConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbHandshakeCapture')
class HandshakeCaptures extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  TextColumn get accessPointId => text()();
  TextColumn get bssid => text()();
  TextColumn get ssid => text()();
  IntColumn get type => intEnum<HandshakeType>()();
  BlobColumn get eapolFrames => blob()();
  DateTimeColumn get capturedAt => dateTime()();
  IntColumn get frameCount => integer()();
  BoolColumn get isComplete => boolean()();
  TextColumn get metadata => text().map(const JsonMapConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbPmkidCapture')
class PmkidCaptures extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  TextColumn get accessPointId => text()();
  TextColumn get bssid => text()();
  TextColumn get ssid => text()();
  BlobColumn get pmkidData => blob()();
  DateTimeColumn get capturedAt => dateTime()();
  TextColumn get metadata => text().map(const JsonMapConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbWpsPin')
class WpsPins extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  TextColumn get accessPointId => text()();
  TextColumn get bssid => text()();
  TextColumn get pin => text()();
  IntColumn get method => intEnum<WpsMethod>()();
  DateTimeColumn get recoveredAt => dateTime()();
  TextColumn get metadata => text().map(const JsonMapConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbVulnerabilityFinding')
class VulnerabilityFindings extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  TextColumn get accessPointId => text().nullable()();
  IntColumn get type => intEnum<VulnerabilityType>()();
  IntColumn get severity => intEnum<Severity>()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get recommendation => text()();
  TextColumn get evidence => text().map(const JsonMapConverter())();
  DateTimeColumn get discoveredAt => dateTime()();
  TextColumn get cvssVectorJson =>
      text().map(const CvssVectorConverter()).nullable()();
  BoolColumn get verified => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbFinding')
class Findings extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  IntColumn get type => intEnum<FindingType>()();
  IntColumn get severity => intEnum<Severity>()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get recommendation => text()();
  TextColumn get affectedTarget => text()();
  TextColumn get evidence => text().map(const JsonMapConverter())();
  TextColumn get evidenceIds => text().map(const StringListConverter())();
  TextColumn get cvssVectorJson => text().map(const CvssVectorConverter())();
  DateTimeColumn get discoveredAt => dateTime()();
  DateTimeColumn get verifiedAt => dateTime().nullable()();
  BoolColumn get verified => boolean()();
  BoolColumn get falsePositive => boolean()();
  TextColumn get references => text()();
  TextColumn get metadata => text().map(const JsonMapConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbEvidence')
class Evidence extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  IntColumn get type => intEnum<EvidenceType>()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get filePath => text()();
  TextColumn get hashSha256 => text()();
  IntColumn get sizeBytes => integer()();
  DateTimeColumn get capturedAt => dateTime()();
  TextColumn get capturedBy => text()();
  TextColumn get metadata => text().map(const JsonMapConverter())();
  TextColumn get tags => text().map(const StringListConverter())();
  BoolColumn get isEncrypted => boolean()();
  TextColumn get encryptionKeyId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbReport')
class Reports extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get assessmentId => text()();
  TextColumn get title => text()();
  IntColumn get type => intEnum<ReportType>()();
  IntColumn get status => intEnum<ReportStatus>()();
  IntColumn get format => intEnum<ReportFormat>()();
  IntColumn get template => intEnum<ReportTemplate>()();
  TextColumn get contentJson => text().map(const ReportContentConverter())();
  TextColumn get metadataJson => text().map(const ReportMetadataConverter())();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get generatedAt => dateTime().nullable()();
  DateTimeColumn get deliveredAt => dateTime().nullable()();
  TextColumn get attachedEvidenceIds =>
      text().map(const StringListConverter())();
  TextColumn get customData => text().map(const JsonMapConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbScanSession')
class ScanSessions extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text().nullable()();
  TextColumn get name => text()();
  IntColumn get mode => intEnum<ScanMode>()();
  IntColumn get status => intEnum<ScanStatus>()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get configJson => text().map(const ScanConfigConverter())();
  TextColumn get statisticsJson =>
      text().map(const ScanStatisticsConverter())();
  TextColumn get accessPointIds => text().map(const StringListConverter())();
  TextColumn get handshakeIds => text().map(const StringListConverter())();
  TextColumn get pmkidIds => text().map(const StringListConverter())();
  TextColumn get wpsPinIds => text().map(const StringListConverter())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbAssessmentEvent')
class AssessmentEvents extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentId => text()();
  IntColumn get type => intEnum<EventType>()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get message => text()();
  TextColumn get data => text().map(const JsonMapConverter())();
  IntColumn get level => intEnum<LogLevel>()();
  TextColumn get phaseId => text().nullable()();
  TextColumn get taskId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DbPluginConfig')
class PluginConfigs extends Table {
  TextColumn get pluginId => text()();
  TextColumn get configJson => text().map(const JsonMapConverter())();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {pluginId};
}

@DataClassName('DbAppSetting')
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text().map(const JsonMapConverter())();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(
  tables: [
    Projects,
    Assessments,
    AccessPoints,
    ClientDevices,
    HandshakeCaptures,
    PmkidCaptures,
    WpsPins,
    VulnerabilityFindings,
    Findings,
    Evidence,
    Reports,
    ScanSessions,
    AssessmentEvents,
    PluginConfigs,
    AppSettings,
  ],
)
abstract class AppDatabaseSchema extends _$AppDatabaseSchema {
  AppDatabaseSchema(super.e);
}

class ClientInfoConverter extends TypeConverter<ClientInfo, String> {
  const ClientInfoConverter();
  @override
  ClientInfo fromSql(String value) => ClientInfo.fromJson(jsonDecode(value));
  @override
  String toSql(ClientInfo value) => jsonEncode(value.toJson());
}

class ScopeDefinitionConverter extends TypeConverter<ScopeDefinition, String> {
  const ScopeDefinitionConverter();
  @override
  ScopeDefinition fromSql(String value) =>
      ScopeDefinition.fromJson(jsonDecode(value));
  @override
  String toSql(ScopeDefinition value) => jsonEncode(value.toJson());
}

class AuthorizationConverter extends TypeConverter<Authorization, String> {
  const AuthorizationConverter();
  @override
  Authorization fromSql(String value) =>
      Authorization.fromJson(jsonDecode(value));
  @override
  String toSql(Authorization value) => jsonEncode(value.toJson());
}

class ProjectSettingsConverter extends TypeConverter<ProjectSettings, String> {
  const ProjectSettingsConverter();
  @override
  ProjectSettings fromSql(String value) =>
      ProjectSettings.fromJson(jsonDecode(value));
  @override
  String toSql(ProjectSettings value) => jsonEncode(value.toJson());
}

class AssessmentScopeConverter extends TypeConverter<AssessmentScope, String> {
  const AssessmentScopeConverter();
  @override
  AssessmentScope fromSql(String value) =>
      AssessmentScope.fromJson(jsonDecode(value));
  @override
  String toSql(AssessmentScope value) => jsonEncode(value.toJson());
}

class AssessmentConfigConverter
    extends TypeConverter<AssessmentConfig, String> {
  const AssessmentConfigConverter();
  @override
  AssessmentConfig fromSql(String value) =>
      AssessmentConfig.fromJson(jsonDecode(value));
  @override
  String toSql(AssessmentConfig value) => jsonEncode(value.toJson());
}

class AssessmentProgressConverter
    extends TypeConverter<AssessmentProgress, String> {
  const AssessmentProgressConverter();
  @override
  AssessmentProgress fromSql(String value) =>
      AssessmentProgress.fromJson(jsonDecode(value));
  @override
  String toSql(AssessmentProgress value) => jsonEncode(value.toJson());
}

class AssessmentPhasesConverter
    extends TypeConverter<List<AssessmentPhase>, String> {
  const AssessmentPhasesConverter();
  @override
  List<AssessmentPhase> fromSql(String value) => (jsonDecode(value) as List)
      .map((item) => AssessmentPhase.fromJson(item as Map<String, dynamic>))
      .toList();
  @override
  String toSql(List<AssessmentPhase> value) =>
      jsonEncode(value.map((item) => item.toJson()).toList());
}

class ScanConfigConverter extends TypeConverter<ScanConfig, String> {
  const ScanConfigConverter();
  @override
  ScanConfig fromSql(String value) => ScanConfig.fromJson(jsonDecode(value));
  @override
  String toSql(ScanConfig value) => jsonEncode(value.toJson());
}

class ScanStatisticsConverter extends TypeConverter<ScanStatistics, String> {
  const ScanStatisticsConverter();
  @override
  ScanStatistics fromSql(String value) =>
      ScanStatistics.fromJson(jsonDecode(value));
  @override
  String toSql(ScanStatistics value) => jsonEncode(value.toJson());
}

class SecurityProtocolListConverter
    extends TypeConverter<List<SecurityProtocol>, String> {
  const SecurityProtocolListConverter();
  @override
  List<SecurityProtocol> fromSql(String value) => (jsonDecode(value) as List)
      .map((item) => SecurityProtocol.values.byName(item as String))
      .toList();
  @override
  String toSql(List<SecurityProtocol> value) =>
      jsonEncode(value.map((item) => item.name).toList());
}

class ProbeRequestListConverter
    extends TypeConverter<List<ProbeRequest>, String> {
  const ProbeRequestListConverter();
  @override
  List<ProbeRequest> fromSql(String value) => (jsonDecode(value) as List)
      .map((item) => ProbeRequest.fromJson(item as Map<String, dynamic>))
      .toList();
  @override
  String toSql(List<ProbeRequest> value) =>
      jsonEncode(value.map((item) => item.toJson()).toList());
}

class CvssVectorConverter extends TypeConverter<CvssVector, String> {
  const CvssVectorConverter();
  @override
  CvssVector fromSql(String value) => CvssVector.fromJson(jsonDecode(value));
  @override
  String toSql(CvssVector value) => jsonEncode(value.toJson());
}

class ReportContentConverter extends TypeConverter<ReportContent, String> {
  const ReportContentConverter();
  @override
  ReportContent fromSql(String value) =>
      ReportContent.fromJson(jsonDecode(value));
  @override
  String toSql(ReportContent value) => jsonEncode(value.toJson());
}

class ReportMetadataConverter extends TypeConverter<ReportMetadata, String> {
  const ReportMetadataConverter();
  @override
  ReportMetadata fromSql(String value) =>
      ReportMetadata.fromJson(jsonDecode(value));
  @override
  String toSql(ReportMetadata value) => jsonEncode(value.toJson());
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();
  @override
  List<String> fromSql(String value) =>
      (jsonDecode(value) as List).cast<String>();
  @override
  String toSql(List<String> value) => jsonEncode(value);
}

class JsonMapConverter extends TypeConverter<Map<String, dynamic>, String> {
  const JsonMapConverter();
  @override
  Map<String, dynamic> fromSql(String value) =>
      (jsonDecode(value) as Map).cast<String, dynamic>();
  @override
  String toSql(Map<String, dynamic> value) => jsonEncode(value);
}
