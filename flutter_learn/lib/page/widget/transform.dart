import 'package:flutter/material.dart';
import 'dart:math' as math;

///Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
class TransformPage extends StatefulWidget {
  TransformPage({this.title = "控件变换", Key key}) : super(key: key);
  final String title;
  @override
  _TransformPageState createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
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
                SizedBox(height: 40),
                Container(
                  color: Colors.black38,
                  child: Transform(
                    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                    transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text('Apartment for rent!'),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                //平移: Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离。
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //默认原点为左上角，左移20像素，向上平移5像素
                  child: Transform.translate(
                    offset: Offset(-20.0, -5.0),
                    child: Text("Hello world"),
                  ),
                ),

                SizedBox(height: 40),

                //旋转: Transform.rotate可以对子组件进行旋转变换
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    //旋转90度
                    angle: math.pi / 2,
                    child: Text("Hello world"),
                  ),
                ),

                SizedBox(height: 40),

                //缩放: Transform.scale可以对子组件进行缩小或放大
                DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.scale(
                        scale: 1.5, //放大到1.5倍
                        child: Text("Hello world"))),

                SizedBox(height: 40),

                //RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //将Transform.rotate换成RotatedBox
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    child: Text("Hello world"),
                  ),
                ),

              ],
            )));
  }
}
