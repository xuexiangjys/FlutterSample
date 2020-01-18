import 'package:flutter/material.dart';

class JPushPage extends StatefulWidget {
  
  JPushPage({this.title = "极光推送", Key key}) : super(key: key);

  final String title;

  @override
  _JPushPageState createState() => _JPushPageState();
}

class _JPushPageState extends State<JPushPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('参数回传'),
                      color: Colors.blue,
                      onPressed: () => {},
                    ),
                    RaisedButton(
                      child: Text('按钮二'),
                      color: Colors.blue,
                      onPressed: () => {},
                    ),
                  ],
                ),
              ],
            )));
  }
}
