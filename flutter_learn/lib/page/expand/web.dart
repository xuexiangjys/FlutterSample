import 'package:flutter/material.dart';
import 'package:flutter_learn/view/web_view_page.dart';

class WebPage extends StatefulWidget {
  WebPage({Key key}) : super(key: key);
  final String title = "网页加载";
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
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
                      child: Text('访问百度'),
                      color: Colors.blue,
                      onPressed: () => {gotoBaidu(context)},
                    ),
                  ],
                ),
              ],
            )));
  }

  void gotoBaidu(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WebViewPage("www.baidu.com", "百度");
    }));
  }
}
