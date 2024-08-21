import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_preferences_keys.dart';

class SharedPreferencesService {
  SharedPreferencesService._();
  static late final SharedPreferences _sp;
  static Future<void> init() async =>
      _sp = await SharedPreferences.getInstance();
  static Future<void> clear() async => await _sp.clear();
  static Future<void> storeLanguage(String code) async {
    await _sp.setString(AppKeys.language, code);
  }

  static String getLanguage() {
    return _sp.getString(AppKeys.language) ?? 'en';
  }

  static Future<void> storeFcmToken(String code) async {
    await _sp.setString(AppKeys.fcmToken, code);
  }

  static String? getFcmToken() {
    return _sp.getString(AppKeys.fcmToken);
  }

  static Future<void> storeToken(String token) async {
    await _sp.setString(AppKeys.token, token);
  }

  static String? getToken() {
    return _sp.getString(AppKeys.token);
  }

  static Future<void> storeIdForOTP(String token) async {
    await _sp.setString(AppKeys.idForOTP, token);
  }

  static String? getIdForOTP() {
    return _sp.getString(AppKeys.idForOTP);
  }
}
