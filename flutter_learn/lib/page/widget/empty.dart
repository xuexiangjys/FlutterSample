import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  EmptyPage({Key key}) : super(key: key);
  final String title = "空页面";
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
            padding: const EdgeInsets.all(20),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[],
            )));
  }
}
