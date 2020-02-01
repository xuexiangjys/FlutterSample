import 'package:flutter/material.dart';

class AlignLayoutPage extends StatefulWidget {
  AlignLayoutPage({this.title = "定位布局", Key key}) : super(key: key);
  final String title;
  @override
  _AlignLayoutPageState createState() => _AlignLayoutPageState();
}

class _AlignLayoutPageState extends State<AlignLayoutPage> {
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
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0) 。
                //x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离，因此2个水平（或垂直）单位则等于矩形的宽（或高），
                //如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0) 则正是右侧顶点，即Alignment.topRight。为了使用方便，矩形的原点、四个顶点，以及四条边的终点在Alignment类中都已经定义为了静态常量。
                Container(
                  color: Colors.blue[50],
                  child: Align(
                    //widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。如果值为null，则组件的宽高将会占用尽可能多的空间。
                    widthFactor: 2,
                    heightFactor: 2,
                    alignment: Alignment(2, 0.0),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，所以理解起来会比较容易。FractionalOffset的坐标转换公式为：
                //实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //可以看到Center继承自Align，它比Align只少了一个alignment 参数；由于Align的构造函数中alignment 值为Alignment.center，所以，我们可以认为Center组件其实是对齐方式确定（Alignment.center）了的Align。
                Container(
                    color: Colors.blue[50],
                    child: Center(
                      widthFactor: 2,
                      heightFactor: 2,
                      child: FlutterLogo(
                        size: 60,
                      ),
                    )),
              ],
            )));
  }
}
