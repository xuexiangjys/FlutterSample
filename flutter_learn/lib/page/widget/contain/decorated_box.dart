import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatefulWidget {
  DecoratedBoxPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _DecoratedBoxPageState createState() => _DecoratedBoxPageState();
}

class _DecoratedBoxPageState extends State<DecoratedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                DecoratedBox(
                    decoration: BoxDecoration(
                        //线性渐变
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange[700]]), //背景渐变
                        //圆角
                        borderRadius: BorderRadius.circular(3.0), //3像素圆角
                        //阴影
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 18.0),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),

                SizedBox(height: 20),

                DecoratedBox(
                    decoration: BoxDecoration(
                        //放射渐变
                        gradient: RadialGradient(
                            colors: [Colors.red, Colors.orange, Colors.blue, Colors.pink]), //背景渐变
                        //圆角
                        borderRadius: BorderRadius.circular(10), //10像素圆角
                        //阴影
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 4.0)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 60.0),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            )));
  }
}
