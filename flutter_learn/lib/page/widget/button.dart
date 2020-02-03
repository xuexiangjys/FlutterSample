import 'dart:math';

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
          child: ListView(scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
            ButtonBar(
              alignment:
                  MainAxisAlignment.spaceAround, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
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
                IconButtonDefault(false),
                IconButtonDefault(true),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
              children: <Widget>[
                FlatButtonDefault(false),
                FlatButton(
                  child: Text("默认按钮"),
                  onPressed: () {},
                ),
                FlatButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("添加"),
                  onPressed: () {},
                )
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
              children: <Widget>[
                FlatButtonCustom('按钮', Colors.blue, drawShape('radius')),
                FlatButtonCustom('按钮', Colors.blue),
                FlatButton(
                  child: Text("默认按钮"),
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.only(
                      bottom: 5.0, top: 5.0, left: 20.0, right: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ])),
    );
  }
}

// IconButton 默认按钮的实例
// isDisabled:是否是禁用，isDisabled 默认为true
class IconButtonDefault extends StatelessWidget {
  final bool isDisabled;

  const IconButtonDefault([this.isDisabled])
      : assert(isDisabled != null),
        super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        // 文本内容
        icon: Icon(Icons.volume_up),
        tooltip: isDisabled ? 'Increase volume by 10%' : null,
        onPressed: isDisabled
            ? null
            : () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("点击了按钮"),
                ));
              });
  }
}

class FlatButtonDefault extends StatelessWidget {
  final bool isDisabled;

  const FlatButtonDefault([this.isDisabled])
      : assert(isDisabled != null),
        super();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        // 文本内容
        child: const Text('默认按钮', semanticsLabel: 'FLAT BUTTON 1'),
        onPressed: isDisabled ? null : () {});
  }
}

// FlatButton 自定义的实例

class FlatButtonCustom extends StatelessWidget {
  final String txt;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const FlatButtonCustom(
      [this.txt = '自定义按钮',
      this.color = Colors.blueAccent,
      this.shape,
      this.onPressed])
      : super();

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    return FlatButton(
        // 文本内容
        child: Text(txt, semanticsLabel: 'FLAT BUTTON 2'),
        // 按钮颜色
        color: color,
        // 按钮亮度
        colorBrightness: Brightness.dark,
        // 高亮时的背景色
        //highlightColor: Colors.yellow,
        // 失效时的背景色
        disabledColor: Colors.grey,
        // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色时才会起作用
        textColor: Colors.white,
        // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会起作用
        disabledTextColor: Colors.grey,
        // 按钮主题,主要用于与ButtonTheme和ButtonThemeData一起使用来定义按钮的基色,RaisedButton，FlatButton，OutlineButton，它们是基于环境ButtonTheme配置的
        //ButtonTextTheme.accent，使用模版颜色的;ButtonTextTheme.normal，按钮文本是黑色或白色取决于。ThemeData.brightness;ButtonTextTheme.primary，按钮文本基于。ThemeData.primaryColor.
        textTheme: ButtonTextTheme.normal,
        // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
        splashColor: Colors.deepPurple,
        // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
        clipBehavior: Clip.antiAlias,
        padding:
            EdgeInsets.only(bottom: 5.0, top: 5.0, left: 20.0, right: 20.0),
        shape: (shape is ShapeBorder)
            ? shape
            : Border.all(
                // 设置边框样式
                color: Colors.grey,
                width: 2.0,
                style: BorderStyle.solid,
              ),
        // FlatButton 的点击事件
        onPressed: () {
          // Perform some action
          if (_onPressed is VoidCallback) {
            _onPressed();
          }
        },
        // 改变高亮颜色回掉函数，一个按钮会触发两次，按下后改变时触发一次，松手后恢复原始颜色触发一次
        // 参数 bool，按下后true，恢复false
        onHighlightChanged: (isClick) {
          print(isClick);
        });
  }
}

// 绘制边框信息,比如是否有边框,是否是圆角
ShapeBorder drawShape(String type) {
  final Color _color = _randomColor();
  final borderWidth = Random.secure().nextInt(5).toDouble();
  final radiusWidth = Random.secure().nextInt(50).toDouble();

  switch (type) {
    case 'border':
      return Border.all(
        // 设置边框样式
        width: borderWidth,
        color: _color,
        style: BorderStyle.solid,
      );
      break;
    case 'radius':
      return RoundedRectangleBorder(
        side: BorderSide(
          // 保留原来的边框样式
          width: borderWidth,
          color: _color,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radiusWidth),
          topLeft: Radius.circular(radiusWidth),
          bottomLeft: Radius.circular(radiusWidth),
          bottomRight: Radius.circular(radiusWidth),
        ),
      );
      break;
    default:
      return null;
  }
}

// 取随机颜色
Color _randomColor() {
  var red = Random.secure().nextInt(255);
  var greed = Random.secure().nextInt(255);
  var blue = Random.secure().nextInt(255);
  return Color.fromARGB(255, red, greed, blue);
}
