import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastPage extends StatefulWidget {
  ToastPage({
    Key key
  }): super(key: key);
  final String title = "Toast使用";
  @override
  _ToastPageState createState() => _ToastPageState();
}

class _ToastPageState extends State < ToastPage > {
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
            children: < Widget > [
              ButtonBar(
                alignment: MainAxisAlignment
                .spaceAround, //布局方向，默认MainAxisAlignment.end
                mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                children: < Widget > [
                  // Button集合
                  RaisedButton(
                    child: Text('普通toast'),
                    color: Colors.blue,
                    onPressed: () => {
                      XToast.toast(msg: "这是一个普通的Toast")
                    },
                  ),
                  RaisedButton(
                    child: Text('警告toast'),
                    color: Colors.blue,
                    onPressed: () => {
                      XToast.waring(msg: "这是一个警告Toast")
                    },
                  ),
                  RaisedButton(
                    child: Text('错误toast'),
                    color: Colors.blue,
                    onPressed: () => {
                      XToast.error(msg: "这是一个错误Toast", length: Toast.LENGTH_LONG)
                    },
                  ),
                  RaisedButton(
                    child: Text('成功toast'),
                    color: Colors.blue,
                    onPressed: () => {
                      XToast.success(msg: "这是一个成功Toast")
                    },
                  ),
                ],
              ),
            ],
          )));
  }
}