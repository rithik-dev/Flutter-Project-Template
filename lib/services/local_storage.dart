import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static late final SharedPreferences _prefs;

  static Future<void> initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static void write(String key, dynamic value) {
    if (value == null) {
      remove(key);
    } else {
      final v = value!;
      if (v is String) _prefs.setString(key, value);
      if (v is bool) _prefs.setBool(key, value);
      if (v is double) _prefs.setDouble(key, value);
      if (v is int) _prefs.setInt(key, value);
      if (v is List) {
        _prefs.setStringList(
          key,
          (value as List).map((e) => e.toString()).cast<String>().toList(),
        );
      }
    }
  }

  static Map<String, dynamic> readAll() {
    final all = <String, dynamic>{};
    _prefs.getKeys().forEach((key) => all[key] = LocalStorage.read(key));
    return all;
  }

  static T? read<T>(String key) {
    final value = _prefs.get(key);
    if (value != null && value is List) return value.cast<String>() as T;
    return value as T?;
  }

  static bool containsKey(String key) => _prefs.containsKey(key);

  static void remove(String key) => _prefs.remove(key);

  static void clear() => _prefs.clear();
}
