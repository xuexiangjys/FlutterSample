import 'package:flutter/material.dart';
import 'package:flutter_learn/view/listview_page.dart';

class SimpleListPage extends StatefulWidget {
  SimpleListPage(this.title, this.items, {Key key}) : super(key: key);
  final String title;
  final List<ListItem> items;
  @override
  _SimpleListPageState createState() => _SimpleListPageState();
}

class _SimpleListPageState extends State<SimpleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListViewPage(items: widget.items)));
  }
}
