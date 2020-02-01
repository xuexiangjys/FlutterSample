import 'package:flutter/material.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/view/viewpage_item.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({this.title = "布局演示", Key key}) : super(key: key);
  final String title;
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ViewPageItem(items: RouteMap.layoutItems)));
  }
}
