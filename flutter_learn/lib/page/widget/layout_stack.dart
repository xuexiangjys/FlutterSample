import 'package:flutter/material.dart';

class StackLayoutPage extends StatefulWidget {
  StackLayoutPage({this.title = "层叠布局", Key key}) : super(key: key);
  final String title;
  @override
  _StackLayoutPageState createState() => _StackLayoutPageState();
}

class _StackLayoutPageState extends State<StackLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            fit: StackFit.expand, //未定位widget占满Stack整个空间
            children: <Widget>[
              //未定位,撑满
              Container(
                //这里设置容器的对齐方式
                alignment: Alignment.center,
                child: Text("未进行定位", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              //未设置方向的默认是Stack中设置的居中对齐
              Positioned(
                left: 18.0,
                child: Text("左侧18dp处"),
              ),
              Positioned(
                top: 18.0,
                child: Text("顶部18dp处"),
              ),
              Positioned(
                bottom: 100,
                right: 50,
                child: Text("底部100dp,右侧50dp处"),
              ),
            ],
          ),
        ));
  }
}
