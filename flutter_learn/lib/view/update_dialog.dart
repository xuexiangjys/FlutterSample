import 'package:flutter/material.dart';

///版本更新加提示框
class UpdateDialog extends Dialog {
  /// 对话框的宽度
  final double width;

  /// 升级标题
  final String title;

  final String updateContent;

  /// 顶部图片
  final Widget topImage;

  /// 边框圆角大小
  final double radius;

  /// 主题颜色
  final Color themeColor;

  /// 更新事件
  final VoidCallback onUpdate;

  /// 可忽略更新
  final bool enableIgnore;

  /// 更新事件
  final VoidCallback onIgnore;

  UpdateDialog(
      {Key key,
      this.width = 0,
      @required this.title,
      @required this.updateContent,
      this.topImage,
      this.radius = 4,
      this.themeColor = Colors.red,
      @required this.onUpdate,
      this.enableIgnore = false,
      this.onIgnore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dialogWidth = width <= 0 ? getScreenWidth(context) * 0.8 : width;
    return Material(
      type: MaterialType.transparency,
      child: Container(
        child: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: dialogWidth,
                child: topImage != null
                    ? topImage
                    : Image(
                        image:
                            AssetImage('assets/images/xupdate_bg_app_top.png'),
                      ),
              ),
              Container(
                width: dialogWidth,
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius)),
                  ),
                ),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: TextStyle(fontSize: 16)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(updateContent,
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF666666))),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        elevation: 0,
                        highlightElevation: 0,
                        child: Text('升级'),
                        color: themeColor,
                        textColor: Colors.white,
                        onPressed: onUpdate,
                      ),
                    ),
                    enableIgnore && onIgnore != null
                        ? FractionallySizedBox(
                            widthFactor: 1,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text('忽略此版本'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              textColor: Color(0xFF666666),
                              onPressed: onIgnore,
                            ),
                          )
                        : SizedBox(),
                  ],
                )),
              ),
              SizedBox(
                  width: 1.5,
                  height: 50,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white))),
              IconButton(
                iconSize: 30,
                constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
                padding: EdgeInsets.zero,
                icon: Image(
                  image: AssetImage('assets/images/xupdate_ic_close.png'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<UpdateDialog> show(BuildContext context,
      {double width,
      @required title,
      @required updateContent,
      topImage,
      double radius,
      themeColor,
      @required onUpdate,
      enableIgnore,
      onIgnore}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () => Future.value(false),
              child: UpdateDialog(
                  title: title,
                  updateContent: updateContent,
                  topImage: topImage,
                  radius: radius,
                  themeColor: themeColor,
                  enableIgnore: enableIgnore,
                  onIgnore: onIgnore,
                  onUpdate: onUpdate));
        });
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
