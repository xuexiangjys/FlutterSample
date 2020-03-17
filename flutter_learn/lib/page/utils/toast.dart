import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/oktoast.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oktoast/oktoast.dart';

class ToastPage extends StatefulWidget {
  ToastPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _ToastPageState createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                Text("使用原生的toast"),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('普通toast'),
                      onPressed: () => {XToast.toast("这是一个普通的Toast")},
                    ),
                    RaisedButton(
                      child: Text('警告toast'),
                      onPressed: () => {XToast.waring("这是一个警告Toast")},
                    ),
                  ],
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('错误toast'),
                      onPressed: () => {
                        XToast.error("这是一个错误Toast", length: Toast.LENGTH_LONG)
                      },
                    ),
                    RaisedButton(
                      child: Text('成功toast'),
                      onPressed: () => {XToast.success("这是一个成功Toast")},
                    ),
                  ],
                ),
                Text("使用非原生的toast"),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('普通toast'),
                      onPressed: () => {ToastUtils.toast("这是一个普通的Toast")},
                    ),
                    RaisedButton(
                      child: Text('警告toast'),
                      onPressed: () => {ToastUtils.waring("这是一个警告Toast")},
                    ),
                  ],
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('错误toast'),
                      onPressed: () => {
                        ToastUtils.error("这是一个错误Toast",
                            duration: Duration(seconds: 5))
                      },
                    ),
                    RaisedButton(
                      child: Text('成功toast'),
                      onPressed: () => {ToastUtils.success("这是一个成功Toast")},
                    ),
                  ],
                ),
                Text("自定义toast"),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('自定义toast'),
                      onPressed: () {
                        showCustomToast('这是自定义的toast~~');
                      }
                    ),
                  ],
                ),
              ],
            )));
  }

  showCustomToast(String msg) {
    // 3.2 use showToastWidget method
    Widget widget = Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: DEFAULT_TOAST_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              child: Icon(
                Icons.warning,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 5),
          Text(msg)
        ]));
    showToastWidget(
      widget,
      duration: Duration(seconds: 3),
    );
  }
}
