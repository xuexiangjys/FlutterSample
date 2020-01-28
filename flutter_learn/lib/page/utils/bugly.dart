import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/bugly.dart';
import 'package:flutter_learn/utils/toast.dart';

class BuglyPage extends StatefulWidget {
  BuglyPage({this.title = "Bugly功能展示", Key key}) : super(key: key);

  final String title;

  @override
  _BuglyPageState createState() => _BuglyPageState();
}

class _BuglyPageState extends State<BuglyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('版本更新检查'),
                      color: Colors.blue,
                      onPressed: _checkUpdate,
                    ),
                    RaisedButton(
                      child: Text('自定义异常信息上传'),
                      color: Colors.blue,
                      onPressed: _uploadException,
                    ),
                  ],
                ),
              ],
            )));
  }

  void _checkUpdate() {
    print("版本更新检查...");
    Bugly.checkUpgrade().then((upgradeInfo) {
      print("版本更新检查结果: $upgradeInfo");
    });
  }

  void _uploadException() {
    //这里的异常可能是业务逻辑上的异常,不一定是程序的异常
    Bugly.uploadException("这是异常的标题", "这是异常的详细内容",
        data: {"key1": "value1", "key2": "value2"}).then((value) {
      XToast.success("上传成功");
    }).catchError((error) {
      XToast.error("上传失败$error");
    });
  }
}
