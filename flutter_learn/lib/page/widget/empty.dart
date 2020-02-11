import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  EmptyPage({this.title, Key key}) : super(key: key);

  final String title;

  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
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
                      child: Text('参数回传'),
                      color: Colors.blue,
                      onPressed: () => {Navigator.of(context).pop("回传的参数")},
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
