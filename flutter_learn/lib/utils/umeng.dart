import 'package:lcfarm_flutter_umeng/lcfarm_flutter_umeng.dart';

class UMeng {
  UMeng._internal();
  
  static const String UMeng_APP_KEY_ANDROID = "5e382b330cafb2eacc0000a1";
  static const String UMeng_APP_KEY_IOS = "5e3822f0570df3425700018c";

  //============================统计==================================//

  ///初始化UMengSDK
  static void init() {
    LcfarmFlutterUmeng.init(
            androidAppKey: UMeng_APP_KEY_ANDROID,
            iOSAppKey: UMeng_APP_KEY_IOS,
            channel: "github",
            logEnable: true)
        .then((result) {
      print("UMeng初始化结果:$result");
    });
  }

  //============================事件埋点==================================//

  ///异常上报
  static Future<Null> event(String eventId, {String label}) {
    return LcfarmFlutterUmeng.event(eventId, label: label);
  }
}
