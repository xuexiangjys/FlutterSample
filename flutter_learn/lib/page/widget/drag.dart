import 'package:flutter/material.dart';

class DragPage extends StatefulWidget {
  DragPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _DragPageState createState() => _DragPageState();
}

class _DragPageState extends State<DragPage> {
  double _top = 100.0; //距顶部的偏移
  double _left = 100.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: Container(
                    height: 70,
                    width: 70,
                    child: CircleAvatar(child: Text("按住\n拖动"))),
                //手指按下时会触发此回调
                onPanDown: (DragDownDetails e) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${e.globalPosition}");
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails e) {
                  //用户手指滑动时，更新偏移，重新构建
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
                onPanEnd: (DragEndDetails e) {
                  //打印滑动结束时在x、y轴上的速度
                  print(e.velocity);
                },
              ),
            )
          ],
        ));
  }
}
