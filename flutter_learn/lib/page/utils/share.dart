import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePage extends StatefulWidget {
  final String title;
  SharePage(this.title, {Key key}) : super(key: key);
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment
                    .start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Button集合
                  RaisedButton(
                    child: Text('文本分享1'),
                    color: Colors.blue,
                    onPressed: share1,
                  ),
                  RaisedButton(
                    child: Text('文本分享2'),
                    color: Colors.blue,
                    onPressed: share2,
                  ),
                ],
              ),
            ])));
  }

  void share1() {
    Share.share('这是我分享的内容: https://baidu.com');
  }

  void share2() {
    Share.share('这是我分享的内容: https://baidu.com', subject: "这是副标题");
  }
}
