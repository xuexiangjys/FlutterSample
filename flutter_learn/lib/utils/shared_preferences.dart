import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static SharedPreferences _spf;

  static Future<SharedPreferences> init() async {
    if (_spf == null) {
      _spf = await SharedPreferences.getInstance();
    }
    return _spf;
  }

  static String getString(String key) {
    return _spf.getString(key);
  }

  static Future<bool> putString(String key, String value) {
    return _spf.setString(key, value);
  }

  static bool getBool(String key) {
    return _spf.getBool(key);
  }

  static Future<bool> putBool(String key, bool value) {
    return _spf.setBool(key, value);
  }

  static int getInt(String key) {
    return _spf.getInt(key);
  }

  static Future<bool> putInt(String key, int value) {
    return _spf.setInt(key, value);
  }

  static Future<bool> saveThemeColorIndex(int value) {
    return _spf.setInt('key_theme_color', value);
  }

  static int getThemeColorIndex() {
    if (_spf.containsKey('key_theme_color')) {
      return _spf.getInt('key_theme_color');
    }
    return 0;
  }

  static Future<bool> saveLocale(String locale) {
    return _spf.setString('key_locale', locale);
  }

  static String getLocale() {
    return _spf.getString('key_locale');
  }

  static Future<bool> saveNickName(String nickName) {
    return _spf.setString('key_nickname', nickName);
  }

  static String getNickName() {
    return _spf.getString('key_nickname');
  }

  static Future<bool> saveAppBadgeNumber(int number) {
    return _spf.setInt('key_App_Badge_number', number);
  }

  static int getAppBadgeNumber() {
    int result = _spf.getInt('key_App_Badge_number');
    return result == null ? 0 : result;
  }
}
