import 'package:flutter/foundation.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_learn/utils/device.dart';

class Bugly {
  static const String BUGLY_APP_ID_ANDROID = "ee68b0a303";
  static const String BUGLY_APP_ID_IOS = "79aa609366";

  //============================统计==================================//

  ///初始化Bugly
  static void init() {
    FlutterBugly.init(
      androidAppId: BUGLY_APP_ID_ANDROID,
      iOSAppId: BUGLY_APP_ID_IOS,
      channel: "github"
    ).then((_result) {
      print("Bugly初始化结果: " + _result.appId);
    });
    //初始化UserId
    DeviceUtils.getDeviceID().then((deviceID) {
      print("Bugly初始化UserId: $deviceID");
      FlutterBugly.setUserId(deviceID);
    });
    //同步设备信息
    DeviceUtils.getDeviceInfo().then((deviceInfo) {
      print("Bugly同步设备信息: $deviceInfo");
      FlutterBugly.putUserData(key: "deviceInfo", value: deviceInfo.toString());
    });
  }

  ///自定义渠道标识 android专用
  static Future<Null> setAppChannel(String channel) {
    return FlutterBugly.setAppChannel(channel);
  }

  ///设置用户标识
  static Future<Null> setUserId(String userId) {
    return FlutterBugly.setUserId(userId);
  }

  ///设置标签
  ///userTag 标签ID，可在网站生成
  static Future<Null> setUserTag(int userTag) {
    return FlutterBugly.setUserTag(userTag);
  }

  ///设置关键数据，随崩溃信息上报
  static Future<Null> putUserData(String key, String value) {
    return FlutterBugly.putUserData(key: key, value: value);
  }

  //============================更新==================================//

  ///检查更新
  static Future<UpgradeInfo> checkUpgrade() {
    return FlutterBugly.checkUpgrade();
  }

  //============================日志上传==================================//

  ///手动上报自定义异常信息
  static Future<Null> uploadException(
      String title, //标题
      String detail, //内容
      {Map data} //data为文本附件, Android 错误分析=>跟踪数据=>extraMessage.txt
      //iOS 错误分析=>跟踪数据=>crash_attach.log
      ) {
    return FlutterBugly.uploadException(
        message: title, detail: detail, data: data);
  }

  ///异常上报
  static void postCatchedException<T>(
    T callback(), {
    FlutterExceptionHandler handler, //异常捕捉，用于自定义打印异常
    String filterRegExp, //异常上报过滤正则，针对message
    bool debugUpload = false,
  }) {
    return FlutterBugly.postCatchedException(callback,
        handler: handler, filterRegExp: filterRegExp, debugUpload: debugUpload);
  }
}
