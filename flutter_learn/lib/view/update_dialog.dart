import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/view/number_progress.dart';

///版本更新加提示框
class UpdateDialog {
  bool _isShowing = false;
  BuildContext _context;
  UpdateWidget _widget;

  UpdateDialog(BuildContext context,
      {double width = 0.0,
      @required title,
      @required updateContent,
      @required onUpdate,
      double progress = -1.0,
      progressBackgroundColor = const Color(0xFFFFCDD2),
      topImage,
      double radius = 4.0,
      themeColor = Colors.red,
      enableIgnore = false,
      onIgnore,
      isForce = false,
      onClose}) {
    _context = context;
    _widget = UpdateWidget(
        width: width,
        title: title,
        updateContent: updateContent,
        onUpdate: onUpdate,
        progress: progress,
        topImage: topImage,
        radius: radius,
        themeColor: themeColor,
        progressBackgroundColor: progressBackgroundColor,
        enableIgnore: enableIgnore,
        onIgnore: onIgnore,
        isForce: isForce,
        onClose: onClose != null ? onClose : () => {dismiss()});
  }

  /// 显示弹窗
  Future<bool> show() {
    try {
      if (isShowing()) {
        return Future.value(false);
      }
      showDialog(
          context: _context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: () => Future.value(false), child: _widget);
          });
      _isShowing = true;
      return Future.value(true);
    } catch (err) {
      _isShowing = false;
      return Future.value(false);
    }
  }

  /// 隐藏弹窗
  Future<bool> dismiss() {
    try {
      if (_isShowing) {
        _isShowing = false;
        Navigator.pop(_context);
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (err) {
      return Future.value(false);
    }
  }

  /// 是否显示
  bool isShowing() {
    return _isShowing;
  }

  /// 更新进度
  void update(double progress) {
    if (isShowing()) {
      _widget.update(progress);
    }
  }

  /// 显示版本更新提示框
  static UpdateDialog showUpdate(BuildContext context,
      {double width = 0.0,
      @required title,
      @required updateContent,
      @required onUpdate,
      double progress = -1.0,
      progressBackgroundColor = const Color(0xFFFFCDD2),
      topImage,
      double radius = 4.0,
      themeColor = Colors.red,
      enableIgnore = false,
      onIgnore,
      isForce = false}) {
    UpdateDialog dialog = UpdateDialog(context,
        width: width,
        title: title,
        updateContent: updateContent,
        onUpdate: onUpdate,
        progress: progress,
        topImage: topImage,
        radius: radius,
        themeColor: themeColor,
        progressBackgroundColor: progressBackgroundColor,
        enableIgnore: enableIgnore,
        isForce: isForce,
        onIgnore: onIgnore);
    dialog.show();
    return dialog;
  }
}

// ignore: must_be_immutable
class UpdateWidget extends StatefulWidget {
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

  double progress;

  /// 进度条的背景颜色
  final Color progressBackgroundColor;

  /// 更新事件
  final VoidCallback onClose;

  /// 是否是强制更新
  final bool isForce;

  UpdateWidget(
      {Key key,
      this.width = 0.0,
      @required this.title,
      @required this.updateContent,
      @required this.onUpdate,
      this.progress = -1.0,
      this.progressBackgroundColor = const Color(0xFFFFCDD2),
      this.topImage,
      this.radius = 4.0,
      this.themeColor = Colors.red,
      this.enableIgnore = false,
      this.onIgnore,
      this.isForce = false,
      this.onClose})
      : super(key: key);

  _UpdateWidgetState _state = _UpdateWidgetState();

  update(double progress) {
    _state.update(progress);
  }

  @override
  _UpdateWidgetState createState() => _state;
}

class _UpdateWidgetState extends State<UpdateWidget> {
  update(double progress) {
    setState(() {
      widget.progress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    double dialogWidth =
        widget.width <= 0 ? getScreenWidth(context) * 0.8 : widget.width;
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
                  child: widget.topImage != null
                      ? widget.topImage
                      : Image.asset('assets/images/xupdate_bg_app_top.png'),
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
                          bottomLeft: Radius.circular(widget.radius),
                          bottomRight: Radius.circular(widget.radius)),
                    ),
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.title, style: TextStyle(fontSize: 16)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(widget.updateContent,
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF666666))),
                      ),
                      widget.progress < 0
                          ? Column(children: <Widget>[
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  elevation: 0,
                                  highlightElevation: 0,
                                  child: Text('升级'),
                                  color: widget.themeColor,
                                  textColor: Colors.white,
                                  onPressed: widget.onUpdate,
                                ),
                              ),
                              widget.enableIgnore && widget.onIgnore != null
                                  ? FractionallySizedBox(
                                      widthFactor: 1,
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text('忽略此版本'),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        textColor: Color(0xFF666666),
                                        onPressed: widget.onIgnore,
                                      ),
                                    )
                                  : SizedBox()
                            ])
                          : NumberProgress(
                              value: widget.progress,
                              backgroundColor: widget.progressBackgroundColor,
                              valueColor: widget.themeColor,
                              padding: EdgeInsets.symmetric(vertical: 10))
                    ],
                  )),
                ),
                !widget.isForce
                    ? Column(children: <Widget>[
                        SizedBox(
                            width: 1.5,
                            height: 50,
                            child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Colors.white))),
                        IconButton(
                          iconSize: 30,
                          constraints:
                              BoxConstraints(maxHeight: 30, maxWidth: 30),
                          padding: EdgeInsets.zero,
                          icon:
                              Image.asset('assets/images/xupdate_ic_close.png'),
                          onPressed: widget.onClose,
                        )
                      ])
                    : SizedBox()
              ],
            ),
          ),
        ));
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
