import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';

class InputPage extends StatefulWidget {
  InputPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _password = "";

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
                Theme(
                    data: Theme.of(context).copyWith(
                        hintColor: Colors.grey[200], //定义下划线颜色
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.grey), //定义label字体样式
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                            )),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              labelText: "用户名",
                              hintText: "请输入用户名或邮箱",
                              prefixIcon: Icon(Icons.person)),
                        ),
                        TextField(
                          onChanged: (value) {
                            _password = value;
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: "密码",
                              hintText: "请输入您的登录密码",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 13.0)),
                          obscureText: true,
                        )
                      ],
                    )),
                SizedBox(height: 20),
                ButtonBar(
                  alignment: MainAxisAlignment
                      .spaceAround, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('登录'),
                      onPressed: () => {
                        XToast.success(
                            "用户名:" + _nameController.text + ", 密码:" + _password)
                      },
                    ),
                    RaisedButton(
                      child: Text('重置'),
                      color: Colors.grey,
                      onPressed: () => {
                        _nameController.clear(),
                        _passwordController.clear()
                      },
                    ),
                  ],
                ),
              ],
            )));
  }
}
