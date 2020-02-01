import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({this.title = "冒泡通知", Key key}) : super(key: key);
  final String title;
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: NotificationListener<TestNotification>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg + "  ";
            });
            return true;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //  RaisedButton(
                //   onPressed: () => TestNotification("这是通知内容~~").dispatch(context),
                //   child: Text("发出通知"),
                //  ),
                //这个context是根Context，而NotificationListener是监听的子树，所以我们通过Builder来构建RaisedButton，来获得按钮位置的context。
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      //按钮点击时分发通知
                      onPressed: () =>
                          TestNotification("这是通知内容~~").dispatch(context),
                      child: Text("发出通知"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ));
  }
}

///自定义冒泡通知
class TestNotification extends Notification {
  TestNotification(this.msg);
  final String msg;
}
