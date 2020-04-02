import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

///本地通知
class LocalNotificationPage extends StatefulWidget {
  final String title;
  LocalNotificationPage(this.title, {Key key}) : super(key: key);
  @override
  _LocalNotificationPageState createState() => _LocalNotificationPageState();
}

class _LocalNotificationPageState extends State<LocalNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Button集合
                  RaisedButton(
                    child: Text('发送一条普通通知'),
                    onPressed: _showNotification,
                  ),
                  RaisedButton(
                    child: Text('取消所有通知'),
                    onPressed: _cancelNotification,
                  ),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Button集合
                  RaisedButton(
                    child: Text('发送周期重复的通知'),
                    onPressed: _repeatNotification,
                  ),
                  RaisedButton(
                    child: Text('发送点击不会消失的通知(Android)'),
                    onPressed: _showOngoingNotification,
                  ),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Button集合
                  RaisedButton(
                    child: Text('模糊进度条通知'),
                    onPressed: _showIndeterminateProgressNotification,
                  ),
                  RaisedButton(
                    child: Text('进度条通知'),
                    onPressed: _showProgressNotification,
                  ),
                ],
              )
            ])));
  }

  @override
  initState() {
    super.initState();
    NotificationUtils.init();
    NotificationUtils.requestIOSPermissions();
  }

  ///普通消息
  void _showNotification() {
    NotificationUtils.showNotification(1000, '消息的主题', '这是消息的内容', ticker: 'flutter_learn', payload: '这是通知承载的消息');
  }

  ///取消所有通知
  void _cancelNotification() {
    NotificationUtils.cancelAll();
  }

  ///重复消息
  Future<void> _repeatNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id_repeating',
        'channel_name_repeating',
        'channel_description_repeating');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await NotificationUtils.plugin.periodicallyShow(1001, '重复消息的标题',
        '这是重复消息的内容', RepeatInterval.EveryMinute, platformChannelSpecifics);
  }

  ///点击不会消失
  Future<void> _showOngoingNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id_flutter',
        'channel_name_flutter',
        'channel_description_flutter',
        importance: Importance.Max,
        priority: Priority.High,
        ongoing: true,
        autoCancel: false);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await NotificationUtils.plugin.show(
        1002, '点击不会消失的通知', '点击不会消失的通知(内容)', platformChannelSpecifics,
        payload: "点击不会消失");
  }

  ///显示模糊进度条加载通知
  Future<void> _showIndeterminateProgressNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id_progress',
        'channel_name_progress',
        'channel_description_progress',
        channelShowBadge: false,
        importance: Importance.Max,
        priority: Priority.High,
        onlyAlertOnce: true,
        showProgress: true,
        indeterminate: true);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await NotificationUtils.plugin.show(
        1003, '正在加载中...', '即将加载完毕,请稍等...', platformChannelSpecifics,
        payload: '模糊进度条');
  }

  ///精准进度条通知
  Future<void> _showProgressNotification() async {
    var maxProgress = 100;
    for (var i = 0; i <= maxProgress; i++) {
      await Future.delayed(Duration(milliseconds: 100), () async {
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'channel_id_progress',
            'channel_name_progress',
            'channel_description_progress',
            channelShowBadge: false,
            importance: Importance.Max,
            priority: Priority.High,
            onlyAlertOnce: true,
            showProgress: true,
            maxProgress: maxProgress,
            progress: i);
        var iOSPlatformChannelSpecifics = IOSNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(
            androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
        await NotificationUtils.plugin.show(
            1004, '正在加载中...', '正在加载$i/$maxProgress', platformChannelSpecifics,
            payload: '精准进度条');
      });
    }
  }
}
