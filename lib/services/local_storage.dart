import 'dart:async';
import 'dart:convert';

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
      if (value is String) _prefs.setString(key, value);
      if (value is bool) _prefs.setBool(key, value);
      if (value is double) _prefs.setDouble(key, value);
      if (value is int) _prefs.setInt(key, value);
      if (value is List) {
        _prefs.setStringList(
          key,
          value
              .map((e) => e is String ? e : jsonEncode(e))
              .cast<String>()
              .toList(),
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
    if (value != null && value is List) {
      return value.map((e) {
        try {
          return jsonDecode(e);
        } catch (_) {
          return e;
        }
      }).toList() as T;
    }
    return value as T?;
  }

  static bool containsKey(String key) => _prefs.containsKey(key);

  static void remove(String key) => _prefs.remove(key);

  static void clear() => _prefs.clear();
}
