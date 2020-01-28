import 'dart:io';

import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_learn/utils/device.dart';

class Bugly {
  static const String BUGLY_APP_KEY_ANDROID = "ee68b0a303";
  static const String BUGLY_APP_KEY_IOS = "79aa609366";

  //============================统计==================================//

  ///初始化Bugly
  static void init() {
    FlutterBugly.init(
      androidAppId: BUGLY_APP_KEY_ANDROID,
      iOSAppId: BUGLY_APP_KEY_IOS,
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
}
