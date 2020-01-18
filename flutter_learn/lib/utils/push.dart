//消息推送
import 'package:flutter_learn/utils/event.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class XPush {
  static final JPush jpush = JPush();

  static const String EVENT_NOTIFICATION_MESSAGE = "event_notification_message";
  static const String EVENT_NOTIFICATION_OPEN = "event_notification_open";
  static const String EVENT_CUSTOM_MESSAGE = "event_custom_message";

  //初始化
  static void init() {
    initJPushSDK();
    registerEvent();
  }

  //初始化JPush
  static void initJPushSDK() {
    jpush.setup(
      appKey: "0a6e78d9e1f9fe225cedf1e8", //你自己应用的 AppKey
      channel: "developer-default",
      production: false,
      debug: true,
    );
    //通知权限的申请
    jpush.applyPushAuthority(
        NotificationSettingsIOS(sound: true, alert: true, badge: true));
  }

  //注册事件监听
  static void registerEvent() {
    jpush.addEventHandler(
        onReceiveNotification: notificationEvent,
        onOpenNotification: notificationOpenEvent,
        onReceiveMessage: customMessageEvent);
  }

  //通知消息
  static EventHandler notificationEvent = (Map<String, dynamic> message) async {
    print("JPush onReceiveNotification: $message");
    XEvent.post(EVENT_NOTIFICATION_MESSAGE, message);
  };

  //通知被点击
  static EventHandler notificationOpenEvent =
      (Map<String, dynamic> message) async {
    print("JPush onOpenNotification: $message");
    XEvent.post(EVENT_NOTIFICATION_OPEN, message);
  };

  //自定义消息
  static EventHandler customMessageEvent =
      (Map<String, dynamic> message) async {
    print("JPush onReceiveMessage: $message");
    XEvent.post(EVENT_CUSTOM_MESSAGE, message);
  };

  static Future<String> getRegistrationID() {
    return jpush.getRegistrationID();
  }
}
