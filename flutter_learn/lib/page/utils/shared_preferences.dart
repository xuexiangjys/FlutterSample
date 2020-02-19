import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  SharedPreferencesPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String result = "";

  int random;

  void updateResult(String value) {
    setState(() {
      result = value;
    });
  }

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
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('设置String'),
                      onPressed: () => {
                        SPUtils.putString("username", "xuexiang123").then(
                            (result) =>
                                {updateResult(result ? '设置成功' : '设置失败')})
                      },
                    ),
                    RaisedButton(
                      child: Text('获取String'),
                      onPressed: () =>
                          {updateResult(SPUtils.getString("username"))},
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
                      child: Text('设置Int随机数'),
                      onPressed: () => {
                        random = Random().nextInt(100),
                        SPUtils.putInt("int_key", random).then((result) =>
                            {updateResult('保存的数字:' + random.toString())})
                      },
                    ),
                    RaisedButton(
                      child: Text('获取Int'),
                      onPressed: () => {
                        updateResult(
                            '获得的数字:' + SPUtils.getInt("int_key").toString())
                      },
                    ),
                  ],
                ),
                Text('结果：\n$result',
                    style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
              ],
            )));
  }
}
