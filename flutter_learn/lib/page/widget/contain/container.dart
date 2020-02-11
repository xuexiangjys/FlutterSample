import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
          //1.尺寸约束,相当于ConstrainedBox
          constraints:
              BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
          //2.装饰,相当于DecoratedBox
          decoration: BoxDecoration(
              //背景装饰
              gradient: RadialGradient(
                  //背景径向渐变
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: .98),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ]),
          //3.变换, 相当于Transform
          transform: Matrix4.rotationZ(.2), //卡片倾斜变换
          //4.对齐, 相当于Align
          alignment: Alignment.center, //卡片内文字居中
          child: Text(
            //卡片文字
            "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ));
  }
}
