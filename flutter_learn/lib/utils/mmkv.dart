import 'package:mmkv_flutter/mmkv_flutter.dart';

class MMKV {
  static Future<String> getString(String key) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return mmkv.getString(key);
  }

  static Future<bool> putString(String key, String value) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return mmkv.setString(key, value);
  }

  static Future<bool> getBool(String key) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return mmkv.getBool(key);
  }

  static Future<bool> putBool(String key, bool value) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return mmkv.setBool(key, value);
  }

  static Future<int> getInt(String key) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return mmkv.getInt(key);
  }

  static Future<bool> putInt(String key, int value) async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    return mmkv.setInt(key, value);
  }
}
