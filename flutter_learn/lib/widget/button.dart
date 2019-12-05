import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  ButtonPage({Key key}) : super(key: key);
  final String title = "按钮";
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Scrollbar(
              child: ListView(scrollDirection: Axis.vertical, // 水平listView
                  children: <Widget>[
            ButtonBar(
              alignment:
                  MainAxisAlignment.spaceAround, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
              children: <Widget>[
                // Button集合
                RaisedButton(
                  child: Text('按钮1'),
                  color: Colors.blue,
                  onPressed: () => {},
                ),
                RaisedButton(
                  child: Text('按钮2'),
                  color: Colors.red,
                  onPressed: () => {},
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
              children: <Widget>[
                // Button集合
                RaisedButton(
                  child: Text(
                    '按钮3',
                    style: new TextStyle(
                      color: const Color(0xffffffff), //文字颜色
                    ),
                  ),
                  color: Colors.yellow,
                  onPressed: () => {},
                ),
                RaisedButton(
                  child: Text(
                    '按钮4',
                    style: new TextStyle(
                      decorationColor: const Color(0xffffffff), //线的颜色
                      decoration: TextDecoration
                          .none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                      decorationStyle: TextDecorationStyle
                          .solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                      wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                      letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
                      fontStyle: FontStyle.italic, //文字样式，斜体和正常
                      fontSize: 20.0, //字体大小
                      fontWeight: FontWeight.w900, //字体粗细  粗体和正常
                      color: const Color(0xffffffff), //文字颜色
                    ),
                  ),
                  color: Colors.pink,
                  onPressed: () => {},
                ),
              ],
            )
          ]))),
    );
  }
}
