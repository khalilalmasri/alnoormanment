import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class StorageUtil {
  static SharedPreferences? _preferences;

  static void _getInstance() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get string
  static Future<String?> getString(String key, {String defValue = ''}) async {
    if (_preferences == null)
      _preferences = await SharedPreferences.getInstance();
    try {
      return _preferences!.containsKey(key) ? _preferences!.getString(key) : '';
    } catch (Exception) {}
    return '';
  }

  static Future<bool?> getBoolean(String key) async {
    if (_preferences == null)
      _preferences = await SharedPreferences.getInstance();
    try {
      return _preferences!.containsKey(key)
          ? _preferences!.getBool(key)
          : false;
    } catch (Exception) {}
    return false;
  }

  // put string
  static setString(String key, String value) async {
    if (_preferences == null)
      _preferences = await SharedPreferences.getInstance();
    _preferences!.setString(key, value);
  }

  // put string
  static setBool(String key, bool value) async {
    if (_preferences == null)
      _preferences = await SharedPreferences.getInstance();
    _preferences!.setBool(key, value);
  }

  // put list
  static setListString(String key, List<String> value) async {
    if (_preferences == null)
      _preferences = await SharedPreferences.getInstance();
    _preferences!.setStringList(key, value);
  }

  // get list
  static Future<List<String>?> getListString(String key) async {
    if (_preferences == null)
      _preferences = await SharedPreferences.getInstance();
    try {
      return _preferences!.containsKey(key)
          ? _preferences!.getStringList(key)
          : [];
    } catch (Exception) {}
    return [];
  }

  static setSerialize(String key,  value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static  readSerialize(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }
}
