import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/http.dart';

class NetRequestPage extends StatefulWidget {
  NetRequestPage({
    Key key
  }): super(key: key);
  final String title = "网络请求";
  @override
  _NetRequestPageState createState() => _NetRequestPageState();
}

class _NetRequestPageState extends State < NetRequestPage > {
  String json = "";

  void doGet() {
    XHttp.get("/weather/current/南京市").then((response) => {
      setState(() {
        json = response.toString();
      })
    });
  }

  void doParam() {
    XHttp.get("/music/singer/search/", {
      "keyWord": "周杰伦"
    }).then((response) => {
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
            children: < Widget > [
              ButtonBar(
                alignment: MainAxisAlignment
                .spaceAround, //布局方向，默认MainAxisAlignment.end
                mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                children: < Widget > [
                  // Button集合
                  RaisedButton(
                    child: Text('Get请求'),
                    color: Colors.blue,
                    onPressed: () => {
                      doGet()
                    },
                  ),
                  RaisedButton(
                    child: Text('参数请求'),
                    color: Colors.blue,
                    onPressed: () => {
                      doParam()
                    },
                  ),
                ],
              ),
              Text('网络请求结果：\n$json',
                style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
            ],
          )));
  }
}