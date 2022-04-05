import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uod/core/constants/shared_preferences_keys.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService?> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  // TOKEN
  String get token => _getFromDisk(SharedPreferencesKeys.token) ?? "";

  set token(String value) => _saveToDisk(SharedPreferencesKeys.token, value);

  // Helper Methods
  dynamic _getFromDisk(String key) {
    var value = _preferences?.get(key);
    debugPrint('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content is bool) {
      _preferences?.setBool(key, content);
    }
    if (content is int) {
      _preferences?.setInt(key, content);
    }
    if (content is double) {
      _preferences?.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences?.setStringList(key, content);
    }
  }
}
