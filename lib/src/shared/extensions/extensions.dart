import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension StringExtensions on String {
  String capitalize() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String truncate(int length, {String suffix = '...'}) {
    if (length <= 0) return '';
    if (this.length <= length) return this;
    return '${substring(0, length - suffix.length)}$suffix';
  }

  bool isValidMacAddress() {
    final regex = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');
    return regex.hasMatch(this);
  }

  bool isValidIpAddress() {
    final regex = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
    if (!regex.hasMatch(this)) return false;
    return split('.').every((octet) => int.parse(octet) <= 255);
  }

  String maskMac({int visible = 3}) {
    final parts = split(':');
    if (parts.length != 6) return this;
    return parts
        .asMap()
        .entries
        .map((e) => e.key < visible ? e.value : '**')
        .join(':');
  }
}

extension DateTimeExtensions on DateTime {
  String toRelativeString() {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w ago';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()}mo ago';
    return '${(diff.inDays / 365).floor()}y ago';
  }

  String toShortString() {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year} ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String toIsoStringShort() => toIso8601String().split('.')[0];
}

extension DurationExtensions on Duration {
  String toShortString() {
    if (inDays > 0) return '${inDays}d ${inHours.remainder(24)}h';
    if (inHours > 0) return '${inHours}h ${inMinutes.remainder(60)}m';
    if (inMinutes > 0) return '${inMinutes}m ${inSeconds.remainder(60)}s';
    return '${inSeconds}s';
  }

  String toLongString() {
    final parts = <String>[];
    if (inDays > 0) parts.add('${inDays} day${inDays == 1 ? '' : 's'}');
    if (inHours.remainder(24) > 0)
      parts.add(
        '${inHours.remainder(24)} hour${inHours.remainder(24) == 1 ? '' : 's'}',
      );
    if (inMinutes.remainder(60) > 0)
      parts.add(
        '${inMinutes.remainder(60)} minute${inMinutes.remainder(60) == 1 ? '' : 's'}',
      );
    if (inSeconds.remainder(60) > 0)
      parts.add(
        '${inSeconds.remainder(60)} second${inSeconds.remainder(60) == 1 ? '' : 's'}',
      );
    return parts.join(' ');
  }
}

extension ListExtensions<T> on List<T> {
  List<T> distinctBy<K>(K Function(T) key) {
    final seen = <K>{};
    return where((item) => seen.add(key(item))).toList();
  }

  Map<K, List<T>> groupBy<K>(K Function(T) key) {
    final map = <K, List<T>>{};
    for (final item in this) {
      map.putIfAbsent(key(item), () => []).add(item);
    }
    return map;
  }
}

extension MapExtensions<K, V> on Map<K, V> {
  V? getOrNull(K key) => this[key];

  V getOrDefault(K key, V defaultValue) => this[key] ?? defaultValue;
}

extension AsyncValueExtensions<T> on AsyncValue<T> {
  Widget whenDataWidget(Widget Function(T) builder) {
    return when(
      data: builder,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => null, // Would need ref to refresh
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
