import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/utils.dart';

class UrlPage extends StatefulWidget {
  final String title;
  UrlPage(this.title, {Key key}) : super(key: key);

  @override
  _UrlPageState createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Button集合
                  RaisedButton(
                    child: Text("网页"),
                    onPressed: web,
                  ),
                  RaisedButton(
                    child: Text('邮件'),
                    onPressed: email,
                  ),
                  RaisedButton(
                    child: Text('电话'),
                    onPressed: phone,
                  ),
                  RaisedButton(
                    child: Text('短信'),
                    onPressed: message,
                  ),
                ],
              )
            ])));
  }

  void web() {
    Utils.launchURL("https://github.com/xuexiangjys");
  }

  void email() {
    Utils.launchURL("mailto:xuexiangandroid@163.com?subject=这是邮件的标题&body=这是邮件的内容");
  }

  void phone() {
    //打电话骚扰中国移动,嘿嘿~~
    Utils.launchURL("tel:10086");
  }

  void message() {
    Utils.launchURL("sms:10086");
  }

}
