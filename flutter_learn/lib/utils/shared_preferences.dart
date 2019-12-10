import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {

  /// 单例对象
  static SPUtils _instance;
  SharedPreferences _spf;
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory SPUtils.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = SPUtils._internal();
    }
    return _instance;
  }

  Future init() async {
    _spf = await SharedPreferences.getInstance();
  }

  bool _beforeCheck() {
    return _spf == null;
  }


  String getString(String key) {
    if (_beforeCheck()) return null;
    return _spf.getString(key);
  }

  Future < bool > putString(String key, String value) {
    if (_beforeCheck()) return null;
    return _spf.setString(key, value);
  }

  bool getBool(String key) {
    if (_beforeCheck()) return null;
    return _spf.getBool(key);
  }

  Future < bool > putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _spf.setBool(key, value);
  }

  int getInt(String key) {
    if (_beforeCheck()) return null;
    return _spf.getInt(key);
  }

  Future < bool > putInt(String key, int value) {
    if (_beforeCheck()) return null;
    return _spf.setInt(key, value);
  }

}