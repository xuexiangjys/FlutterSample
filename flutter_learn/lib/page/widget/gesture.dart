import 'package:flutter/material.dart';

//手势动作
class GesturePage extends StatefulWidget {
  GesturePage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String _operation = "没有手势!"; //保存事件名

  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  double _height = 100.0; //通过修改图片高度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: _width,
              height: _height,
              child: Text(
                _operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => updateText("点击"), //点击
            onDoubleTap: () => updateText("双击"), //双击
            onLongPress: () => updateText("长按"), //长按
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                //缩放倍数在0.8到10倍之间
                _operation = "缩放";
                _width = 200 * details.scale.clamp(0.8, 2.0);
                _height = 100 * details.scale.clamp(0.8, 2.0);
              });
            },
          ),
        ));
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
