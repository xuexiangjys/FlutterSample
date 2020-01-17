import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/http.dart';

class NetRequestPage extends StatefulWidget {
  NetRequestPage({Key key}) : super(key: key);
  final String title = "网络请求";
  @override
  _NetRequestPageState createState() => _NetRequestPageState();
}

class _NetRequestPageState extends State<NetRequestPage> {
  String json = "";

  void doGet() {
    XHttp.get("/banner/json").then((response) => {
          setState(() {
            json = response.toString();
          })
        });
  }

  void doParam() {
    XHttp.get("/article/list/0/json", {"author": "xuexiangjys"})
        .then((response) => {
              setState(() {
                json = response.toString();
              })
            });
  }

  void doPost() {
    XHttp.post("/user/login", {"username": "xuexiang", "password" : "123456"})
        .then((response) => {
              setState(() {
                json = response.toString();
              })
            });
  }

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
              children: <Widget>[
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('Get请求'),
                      color: Colors.blue,
                      onPressed: doGet,
                    ),
                    RaisedButton(
                      child: Text('参数请求'),
                      color: Colors.blue,
                      onPressed: doParam,
                    ),
                    RaisedButton(
                      child: Text('post请求'),
                      color: Colors.blue,
                      onPressed: doPost,
                    ),
                  ],
                ),
                Text('网络请求结果：\n$json',
                    style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
              ],
            )));
  }
}
