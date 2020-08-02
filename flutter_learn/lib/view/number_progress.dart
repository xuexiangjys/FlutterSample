import 'package:flutter/material.dart';

/// 带进度文字的圆角进度条
class NumberProgress extends StatelessWidget {
  /// 进度条的高度
  final double height;

  /// 进度
  final double value;

  /// 进度条的背景颜色
  final Color backgroundColor;

  /// 进度条的色值
  final Color valueColor;

  /// 文字的颜色
  final Color textColor;

  /// 文字的大小
  final double textSize;

  /// 文字的对齐方式
  final AlignmentGeometry textAlignment;

  /// 边距
  final EdgeInsetsGeometry padding;

  NumberProgress(
      {Key key,
      this.height = 10.0,
      this.value = 0.0,
      this.backgroundColor,
      this.valueColor,
      this.textColor = Colors.white,
      this.textSize = 8.0,
      this.padding = EdgeInsets.zero,
      this.textAlignment = Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(height)),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(valueColor),
                ),
              ),
            ),
            Container(
              height: height,
              alignment: textAlignment,
              child: Text(
                value >= 1 ? '100%' : '${(value * 100).toInt()}%',
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                ),
              ),
            ),
          ],
        ));
  }
}
