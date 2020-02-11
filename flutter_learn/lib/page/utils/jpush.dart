import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/event.dart';
import 'package:flutter_learn/utils/push.dart';
import 'package:flutter_learn/utils/toast.dart';

class JPushPage extends StatefulWidget {
  JPushPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _JPushPageState createState() => _JPushPageState();
}

class _JPushPageState extends State<JPushPage> {
  String _message = "";

  @override
  void initState() {
    super.initState();
    registerPushEvent();
    XPush.getRegistrationID().then((vaule) {
      updateMessage("RegistrationID: $vaule");
    });
  }

  void updateMessage(String value) {
    setState(() {
      _message = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    unregisterPushEvent();
  }

  StreamSubscription<Map> _notification;
  StreamSubscription<Map> _notificationOpen;
  StreamSubscription<Map> _customMessage;

  void registerPushEvent() {
    _notification = XEvent.on<Map>(EVENT_NOTIFICATION_MESSAGE, (notification) {
      XToast.success("收到通知");
      updateMessage("收到通知, notification: $notification");
    });
    _notificationOpen = XEvent.on<Map>(EVENT_NOTIFICATION_OPEN, (notification) {
      XToast.success("通知被点击");
      updateMessage("通知被点击, notification: $notification");
    });
    _customMessage = XEvent.on<Map>(EVENT_CUSTOM_MESSAGE, (notification) {
      XToast.success("收到自定义消息");
      updateMessage("收到自定义消息, notification: $notification");
    });
  }

  void unregisterPushEvent() {
    XEvent.cancel(EVENT_NOTIFICATION_MESSAGE, _notification);
    XEvent.cancel(EVENT_NOTIFICATION_OPEN, _notificationOpen);
    XEvent.cancel(EVENT_NOTIFICATION_OPEN, _customMessage);
  }

  TextEditingController _aliasController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  height: 150,
                  color: Colors.grey,
                  padding: EdgeInsets.all(10),
                  child: Text(_message,
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('恢复推送'),
                      color: Colors.blue,
                      onPressed: resumePush,
                    ),
                    RaisedButton(
                      child: Text('停止推送'),
                      color: Colors.blue,
                      onPressed: stopPush,
                    ),
                  ],
                ),
                TextField(
                  controller: _aliasController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 12),
                      labelText: "别名(alias)",
                      hintText: "请输入需要绑定的别名",
                      hintStyle: TextStyle(fontSize: 12)),
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('绑定'),
                      color: Colors.blue,
                      onPressed: setAlias,
                    ),
                    RaisedButton(
                      child: Text('解绑'),
                      color: Colors.blue,
                      onPressed: deleteAlias,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _tagsController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 12),
                      labelText: "标签(tags)",
                      hintText: "请输入标签, 以英文的\',\'隔开",
                      hintStyle: TextStyle(fontSize: 12)),
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('添加(增量)'),
                      color: Colors.blue,
                      onPressed: addTags,
                    ),
                    RaisedButton(
                      child: Text('删除'),
                      color: Colors.blue,
                      onPressed: deleteTags,
                    ),
                    RaisedButton(
                      child: Text('获取'),
                      color: Colors.blue,
                      onPressed: getTags,
                    ),
                  ],
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('设置(全量)'),
                      color: Colors.blue,
                      onPressed: setTags,
                    ),
                    RaisedButton(
                      child: Text('清除'),
                      color: Colors.blue,
                      onPressed: cleanTags,
                    ),
                  ],
                ),
              ],
            )));
  }

   void resumePush() {
     XPush.jpush.resumePush();

  }

  void stopPush() {
     XPush.jpush.stopPush();
  }

  void setAlias() {
    if (_aliasController.text.isEmpty) {
      XToast.error("别名不能为空");
      return;
    }

    XPush.setAlias(_aliasController.text).then((value) {
      updateMessage("别名绑定结果: $value");
    }).catchError((error) {
      updateMessage("别名绑定出错: $error");
    });
  }

  void deleteAlias() {
    XPush.deleteAlias().then((value) {
      updateMessage("别名解绑结果: $value");
    }).catchError((error) {
      updateMessage("别名解绑出错: $error");
    });
  }

  void addTags() {
    if (_tagsController.text.isEmpty) {
      XToast.error("标签不能为空");
      return;
    }

    XPush.addTags(_tagsController.text.split(",")).then((value) {
      updateMessage("标签添加结果: $value");
    }).catchError((error) {
      updateMessage("标签添加出错: $error");
    });
  }

  void deleteTags() {
    if (_tagsController.text.isEmpty) {
      XToast.error("标签不能为空");
      return;
    }

    XPush.deleteTags(_tagsController.text.split(",")).then((value) {
      updateMessage("标签删除结果: $value");
    }).catchError((error) {
      updateMessage("标签删除出错: $error");
    });
  }

  void getTags() {
    XPush.jpush.getAllTags().then((value) {
      updateMessage("标签获取结果: $value");
    }).catchError((error) {
      updateMessage("标签获取出错: $error");
    });
  }

  void setTags() {
    if (_tagsController.text.isEmpty) {
      XToast.error("标签不能为空");
      return;
    }

    XPush.setTags(_tagsController.text.split(",")).then((value) {
      updateMessage("标签设置结果: $value");
    }).catchError((error) {
      updateMessage("标签设置出错: $error");
    });
  }

  void cleanTags() {
    XPush.cleanTags().then((value) {
      updateMessage("标签清除结果: $value");
    }).catchError((error) {
      updateMessage("标签清除出错: $error");
    });
  }

 
}
