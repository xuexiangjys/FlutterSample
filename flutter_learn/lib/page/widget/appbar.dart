import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/view/titlebar.dart';

class AppBarPage extends StatefulWidget {
  final String title;
  AppBarPage(this.title, {key}) : super(key: key);
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_a_photo),
              tooltip: '拍照',
              onPressed: () {
                // do nothing
              }),
          PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(value: "about", child: Text('关于')),
                    PopupMenuItem<String>(value: "setting", child: Text('设置')),
                  ],
              onSelected: (String action) {
                switch (action) {
                  case "about":
                    XToast.toast("点击了关于");
                    break;
                  case "setting":
                    XToast.toast("点击了设置");
                    break;
                }
              })
        ],
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            scrollDirection: Axis.vertical, // 水平listView
            children: <Widget>[TitleBar.backAppbar(context, '个人资料')],
          )),
    );
  }
}
