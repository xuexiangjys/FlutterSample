import 'package:flutter/material.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/view/viewpage_item.dart';

class EasyRefreshPage extends StatefulWidget {
  EasyRefreshPage({this.title = "EasyRefresh", Key key}) : super(key: key);

  final String title;

  @override
  _EasyRefreshPageState createState() => _EasyRefreshPageState();
}

class _EasyRefreshPageState extends State<EasyRefreshPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ViewPageItem(items: RouteMap.refreshItems)));
  }
}
