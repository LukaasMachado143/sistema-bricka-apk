import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static final _prefs = Hive.box('prefs');

  static Future<void> saveLoginData({
    required bool rememberMe,
    required String username,
    required String password,
  }) async {
    if (rememberMe) {
      await _prefs.put('rememberMe', true);
      await _prefs.put('username', username);
      await _prefs.put('password', password);
    } else {
      await clearLoginData();
    }
  }

  static Map<String, dynamic> getLoginData() {
    return {
      'rememberMe': _prefs.get('rememberMe', defaultValue: false),
      'username': _prefs.get('username'),
      'password': _prefs.get('password'),
    };
  }

  static Future<void> clearLoginData() async {
    await _prefs.delete('rememberMe');
    await _prefs.delete('username');
    await _prefs.delete('password');
  }
}
