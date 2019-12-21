import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/page/widget/empty.dart';
import 'package:flutter_learn/router/switch_animation.dart';
import 'package:flutter_learn/utils/router.dart';
import 'package:flutter_learn/utils/toast.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({Key key}) : super(key: key);
  final String title = "页面路由";
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
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
                  alignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('命名路由'),
                      color: Colors.blue,
                      onPressed: () => {
                        //不可以传参数
                        Navigator.pushNamed(context, "/empty")
                      },
                    ),
                    RaisedButton(
                      child: Text('构建路由'),
                      color: Colors.blue,
                      onPressed: () => {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (BuildContext context) {
                          return new EmptyPage(title: "这是我传的参数");
                        })).then((result) => {
                              if (result != null) {XToast.toast(result)}
                            })
                      },
                    ),
                    RaisedButton(
                      child: Text('路由动画'),
                      color: Colors.blue,
                      onPressed: () =>
                          {Navigator.push(context, SlidePageRoute("/empty"))},
                    ),
                    RaisedButton(
                      child: Text('fluro跳转'),
                      color: Colors.blue,
                      onPressed: () => {
                        XRouter.router.navigateTo(context, "/web?url=${Uri.encodeComponent("https://www.baidu.com/")}&title=${Uri.encodeComponent("百度")}", transition: TransitionType.fadeIn)
                      },
                    ),
                  ],
                ),
              ],
            )));
  }
}
