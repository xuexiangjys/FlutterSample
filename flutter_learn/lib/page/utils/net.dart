import 'package:flutter/material.dart';

class NetRequestPage extends StatefulWidget {
  NetRequestPage({Key key}) : super(key: key);
  final String title = "网络请求";
  @override
  _NetRequestPageState createState() => _NetRequestPageState();
}



class _NetRequestPageState extends State<NetRequestPage> {
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
                  alignment: MainAxisAlignment
                      .spaceAround, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('Get请求'),
                      color: Colors.blue,
                      onPressed: () => {

                      },
                    ),
                    RaisedButton(
                      child: Text('post请求'),
                      color: Colors.blue,
                      onPressed: () => {

                      },
                    ),
                  ],
                ),
              ],
            )));
  }
}
