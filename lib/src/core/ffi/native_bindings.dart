import 'dart:ffi' as ffi;
import 'package:logger/logger.dart';

final _logger = Logger();

/// Loads optional native acceleration. The Flutter implementation remains the
/// supported fallback when the platform library is unavailable.
class NativeLibraryLoader {
  static bool _initialized = false;
  static Future<void> initialize() async {
    _initialized = false;
    _logger.i('Native WiFi acceleration unavailable; using platform fallback');
  }

  static ffi.DynamicLibrary? get wifiLib => null;
  static ffi.DynamicLibrary? get cryptoLib => null;
  static bool get isInitialized => _initialized;
}

class NativeWifiBindings {
  NativeWifiBindings() {
    if (!NativeLibraryLoader.isInitialized) {
      throw StateError('Native library not initialized');
    }
  }

  int stopScan() => 0;

  int sendDeauth(String bssid, int count, int intervalMs) {
    if (!_validBssid(bssid) || count <= 0 || intervalMs < 0) return -1;
    return -1;
  }

  bool _validBssid(String value) =>
      RegExp(r'^[0-9A-Fa-f]{2}([:-][0-9A-Fa-f]{2}){5}$').hasMatch(value);
}

class NativeCryptoBindings {
  NativeCryptoBindings() {
    if (!NativeLibraryLoader.isInitialized) {
      throw StateError('Native library not initialized');
    }
  }
}
