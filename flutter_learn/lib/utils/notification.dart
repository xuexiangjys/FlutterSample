import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'oktoast.dart';

const CHANNEL_ID = 'channel_id_flutter';
const CHANNEL_NAME = 'channel_name_flutter';
const CHANNEL_DESCRIPTION = 'channel_description_flutter';

///通知栏消息工具
class NotificationUtils {
  NotificationUtils._internal();

  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static bool hasInit = false;

  static void init() {
    if (!hasInit) {
      ///Android初始化项
      var initializationSettingsAndroid =
          AndroidInitializationSettings('ic_splash_app_logo');

      ///IOS初始化项
      var initializationSettingsIOS = IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);
      var initializationSettings = InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOS);
      plugin.initialize(initializationSettings,
          onSelectNotification: onSelectNotification);
      hasInit = true;
    }
  }

  ///IOS申请通知权限
  static void requestIOSPermissions() {
    if (Platform.isIOS) {
      plugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }

  ///IOS
  static Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    print('onDidReceiveLocalNotification:$payload');
    ToastUtils.toast('点击通知:$payload');
  }

  ///点击事件
  static Future<void> onSelectNotification(String payload) async {
    print('onSelectNotification:$payload');
    ToastUtils.toast('点击通知:$payload');
  }

  ///发送普通消息
  static Future<void> showNotification(int id, String title, String body,
      {String ticker, String payload}) {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        CHANNEL_ID, CHANNEL_NAME, CHANNEL_DESCRIPTION,
        importance: Importance.Max, priority: Priority.High, ticker: ticker);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    return NotificationUtils.plugin
        .show(id, title, body, platformChannelSpecifics, payload: payload);
  }

  ///取消所有通知
  static Future<void> cancelAll() {
    return NotificationUtils.plugin.cancelAll();
  }
}
