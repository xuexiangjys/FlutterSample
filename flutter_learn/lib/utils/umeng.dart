import 'package:umeng_analytics_plugin/umeng_analytics_plugin.dart';

class UMeng {
  UMeng._internal();

  static const String UMeng_APP_KEY_ANDROID = "5e382b330cafb2eacc0000a1";
  static const String UMeng_APP_KEY_IOS = "5e3822f0570df3425700018c";

  //============================统计==================================//

  ///初始化UMengSDK
  static Future<bool> init() {
    return UmengAnalyticsPlugin.init(
        androidKey: UMeng_APP_KEY_ANDROID,
        iosKey: UMeng_APP_KEY_IOS,
        channel: "github",
        logEnabled: true);
  }

  //============================事件埋点==================================//

  ///异常上报
  static Future<Null> event(String eventId, {String label}) {
    return UmengAnalyticsPlugin.event(eventId, label: label);
  }
}
