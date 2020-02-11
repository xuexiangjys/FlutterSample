import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';

class CombinationWidgetPage extends StatefulWidget {
  CombinationWidgetPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _CombinationWidgetPageState createState() => _CombinationWidgetPageState();
}

class _CombinationWidgetPageState extends State<CombinationWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                GradientButton(
                  colors: [Colors.orange, Colors.red],
                  height: 50.0,
                  child: Text("Submit"),
                  onPressed: onTap,
                ),
                SizedBox(height: 10),
                GradientButton(
                  height: 50.0,
                  width: 200,
                  colors: [Colors.lightGreen, Colors.purple],
                  child: Text("Submit"),
                  onPressed: onTap,
                ),
                SizedBox(height: 10),
                GradientButton(
                  height: 50.0,
                  colors: [Colors.lightBlue, Colors.yellow],
                  child: Text("Submit"),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onPressed: onTap,
                ),
                SizedBox(height: 10),
                GradientButton(
                  height: 50.0,
                  colors: [Colors.pink, Colors.grey],
                  child: Text("Submit"),
                  isDisabled: true,
                  onPressed: onTap,
                ),
              ],
            )));
  }

  void onTap() {
    XToast.toast("点击了按钮");
  }
}

///自定义渐变按钮, 由DecoratedBox、Padding、Center、InkWell等组件组合而成
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.isDisabled = false,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  /// 渐变色数组
  final List<Color> colors;

  /// 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  ///是否可点击
  final bool isDisabled;

  ///点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: isDisabled ? null : onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
