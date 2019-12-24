import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/router.dart';
import 'package:flutter_learn/utils/toast.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key}) : super(key: key);
  final String title = "文字";
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  LongPressGestureRecognizer _longPressRecognizer;
  TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handlePress;
    _longPressRecognizer = LongPressGestureRecognizer()
      ..onLongPress = _handleLongPress;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    _longPressRecognizer.dispose();
    super.dispose();
  }

  void _handlePress() {
    XRouter.router.navigateTo(context,
        "/web?url=${Uri.encodeComponent("https://flutterchina.club/")}&title=${Uri.encodeComponent("Flutter中文网")}",
        transition: TransitionType.fadeIn);
  }

  void _handleLongPress() {
    XToast.success("长按点击");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
              children: <Widget>[
                Text('下面是基本输入框：',
                    style: TextStyle(
                        fontSize: 14, height: 1.2, color: Colors.blue),
                    textAlign: TextAlign.left),
                TextField(),
                Container(
                    child: Text('下面是稍微输入框：',
                        style: TextStyle(
                            fontSize: 18, height: 1.5, color: Colors.pink),
                        textAlign: TextAlign.left),
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(5.0)),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      icon: Icon(Icons.text_fields),
                      labelText: '请输入你的用户名',
                      helperText: '用户名为8~16位',
                      helperStyle: TextStyle(color: Colors.red)),
                  onChanged: (str) {
                    print(str);
                  },
                  autofocus: false,
                ),
                SizedBox(height: 20),
                Divider(height: 5),
                SizedBox(height: 20),
                Text(
                  'inherit: 为 false 的时候不显示',
                  style: TextStyle(
                    inherit: true,
                  ),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: "Flutter中文网: "),
                  TextSpan(
                      text: "https://flutterchina.club",
                      style: TextStyle(color: Colors.blue),
                      recognizer: _tapGestureRecognizer),
                ])),
                Text(
                  'color/fontSize: 字体颜色，字号等',
                  style: TextStyle(
                    color: Color.fromARGB(255, 150, 150, 150),
                    fontSize: 22.0,
                  ),
                ),
                Text(
                  'fontWeight: 字重',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  'fontStyle: FontStyle.italic 斜体',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'letterSpacing: 字符间距',
                  style: TextStyle(
                    letterSpacing: 10.0,
                    // wordSpacing: 15.0
                  ),
                ),
                Text(
                  'wordSpacing: 字或单词间距',
                  style: TextStyle(
                      // letterSpacing: 10.0,
                      wordSpacing: 15.0),
                ),
                Text(
                  'textBaseline:这一行的值为TextBaseline.alphabetic',
                  style: TextStyle(textBaseline: TextBaseline.alphabetic),
                ),
                Text(
                  'textBaseline:这一行的值为TextBaseline.ideographic',
                  style: TextStyle(textBaseline: TextBaseline.ideographic),
                ),
                Text('height: 用在Text控件上的时候，会乘以fontSize做为行高,所以这个值不能设置过大',
                    style: TextStyle(
                      height: 1.0,
                    )),
                Text('decoration: TextDecoration.overline 上划线',
                    style: TextStyle(
                        decoration: TextDecoration.overline,
                        decorationStyle: TextDecorationStyle.wavy)),
                Text('decoration: TextDecoration.lineThrough 删除线',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationStyle: TextDecorationStyle.dashed)),
                Text('decoration: TextDecoration.underline 下划线',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted)),
              ],
            )));
  }
}
