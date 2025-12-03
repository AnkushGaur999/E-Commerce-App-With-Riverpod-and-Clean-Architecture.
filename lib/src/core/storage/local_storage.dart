import 'dart:convert';

import 'package:plux/src/data/models/auth/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _user = "user";

  static SharedPreferences? _preferences;

  static final LocalStorage _instance = LocalStorage._private();

  LocalStorage._private();

  factory LocalStorage() => _instance;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(LoginResponse user) async {
    await _preferences?.setString(_user, jsonEncode(user.toJson()));
  }

  LoginResponse? getUser() {
    String? user = _preferences?.getString(_user);

    if (user == null) return null;

    return LoginResponse.fromJson(jsonDecode(user));
  }

  // Theme
  static const String _isDarkMode = "is_dark_mode";

  bool isDarkTheme() {
    return _preferences?.getBool(_isDarkMode) ?? false;
  }

  Future<void> setTheme({required bool isDark}) async {
    await _preferences?.setBool(_isDarkMode, isDark);
  }

  Future<void> clear() async {
    await _preferences?.clear();
  }
}
