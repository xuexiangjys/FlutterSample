import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key}) : super(key: key);
  final String title = "文字";
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
              children: <Widget>[
                Text('下面是基本输入框：',
                    style: TextStyle(
                        fontSize: 14, height: 1.2, color: Colors.blue),
                    textAlign: TextAlign.left),
                TextField(),
                Container(
                    child: Text('下面是稍微输入框：',
                        style: TextStyle(
                            fontSize: 18, height: 1.5, color: Colors.pink),
                        textAlign: TextAlign.left),
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(5.0)),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      icon: Icon(Icons.text_fields),
                      labelText: '请输入你的用户名',
                      helperText: '用户名为8~16位',
                      helperStyle: TextStyle(color: Colors.red)),
                  onChanged: (str) {
                    print(str);
                  },
                  autofocus: false,
                ),
              ],
            )));
  }
}
