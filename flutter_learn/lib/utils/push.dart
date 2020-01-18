//消息推送
import 'package:flutter_learn/utils/event.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

const String EVENT_NOTIFICATION_MESSAGE = "event_notification_message";
const String EVENT_NOTIFICATION_OPEN = "event_notification_open";
const String EVENT_CUSTOM_MESSAGE = "event_custom_message";

class XPush {
  static final JPush jpush = JPush();

  //================初始化=====================//

  ///初始化
  static void init() async {
    initJPushSDK();
    registerEvent();
  }

  ///初始化JPush
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

  ///注册事件监听
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

  static List<String> string2List(String value) {
    return value.split(",");
  }

  //================别名=====================//

  ///绑定别名
  static Future<bool> setAlias(String alias) async {
    Map reslut = await jpush.setAlias(alias);
    return reslut != null && reslut.containsKey("alias");
  }

  ///解绑别名
  static Future<bool> deleteAlias() async {
    Map reslut = await jpush.deleteAlias();
    return reslut != null && reslut.containsKey("alias");
  }

  //================标签=====================//

  ///添加标签
  static Future<bool> addTags(List<String> tags) async {
    Map reslut = await jpush.addTags(tags);
    return reslut != null && reslut.containsKey("tags");
  }

  ///删除标签
  static Future<bool> deleteTags(List<String> tags) async {
    Map reslut = await jpush.deleteTags(tags);
    return reslut != null && reslut.containsKey("tags");
  }

  ///获取标签
  static Future<Map<dynamic, dynamic>> getTags() {
    return jpush.getAllTags();
  }

  ///设置标签
  static Future<bool> setTags(List<String> tags) async {
    Map reslut = await jpush.setTags(tags);
    return reslut != null && reslut.containsKey("tags");
  }

  ///清除标签
  static Future<bool> cleanTags() async {
    Map reslut = await jpush.cleanTags();
    return reslut != null && reslut.containsKey("tags");
  }
}
