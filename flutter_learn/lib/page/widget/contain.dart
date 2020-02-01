import 'package:flutter/material.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/view/viewpage_item.dart';

class ContainPage extends StatefulWidget {
  ContainPage({this.title = "容器演示", Key key}) : super(key: key);
  final String title;
  @override
  _ContainPageState createState() => _ContainPageState();
}

class _ContainPageState extends State<ContainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ViewPageItem(items: RouteMap.containerItems)));
  }
}
