import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database_connection.dart';

final settingsServiceProvider = Provider<SettingsService>((ref) {
  return SettingsService(ref.watch(databaseProvider));
});

final themeModeProvider = FutureProvider<ThemeMode>((ref) async {
  final value = await ref
      .watch(settingsServiceProvider)
      .getValue<bool>('darkMode');
  return value == false ? ThemeMode.light : ThemeMode.dark;
});

class SettingsService {
  SettingsService(this._database);

  final AppDatabase _database;

  Future<T?> getValue<T>(String key) async {
    final setting = await _database.appSettingsDao.getSetting(key);
    final value = setting?['value'];
    return value is T ? value : null;
  }

  Future<void> setValue(String key, Object? value) async {
    await _database.appSettingsDao.setSetting(key, {'value': value});
  }

  Future<void> clearScanHistory() => _database.clearScanHistory();

  Future<void> clearAllUserData() => _database.clearAllUserData();
}
