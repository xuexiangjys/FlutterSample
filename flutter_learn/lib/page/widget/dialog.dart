import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/oktoast.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/view/loading_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DialogPage extends StatefulWidget {
  DialogPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void showAboutDialog() {
    showDialog(
        context: context,
        builder: (_) => AboutDialog(
            applicationName: '应用名称',
            applicationIcon: Icon(Icons.ac_unit),
            applicationVersion: 'V1.0',
            children: <Widget>[Text('我是一个关于的dialog')]));
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('标题'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
                Text('too long~~~'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop();
                XToast.success("确认");
              },
            ),
          ],
        );
      },
    );
  }

  void showSimpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('选择'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('选项 1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: Text('选项 2'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('我是一个自定义的dialog'),
              RaisedButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
      },
    );
  }

  void showLoadingDialog1(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            content: "加载中…",
            loadingView: SpinKitCircle(color: Colors.lightBlue),
          );
        });
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  void showLoadingDialog2(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            showContent: false,
            backgroundColor: Colors.black38,
            loadingView: SpinKitCircle(color: Colors.white),
          );
        });
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  double percentage = 0.0;

  void showProgressDialog(BuildContext context) {
    ProgressDialog pr = ProgressDialog(
      context,
      type: ProgressDialogType.Download,
      // textDirection: TextDirection.ltr,
      isDismissible: false,
    );
    pr.show();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      percentage = percentage + 2.0;
      if (percentage >= 100) {
        timer.cancel();
        pr.hide().whenComplete(() {
          percentage = 0.0;
          ToastUtils.success("下载成功!");
        });
      } else {
        pr.update(
          progress: percentage,
          message: "正在下载中...",
          progressWidget:
              Container(child: SpinKitCircle(color: Colors.lightBlue)),
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('AlertDialog'),
                      onPressed: showAlertDialog,
                    ),
                    RaisedButton(
                      child: Text('SimpleDialog'),
                      onPressed: showSimpleDialog,
                    ),
                  ],
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('CustomDialog'),
                      onPressed: showCustomDialog,
                    ),
                    RaisedButton(
                      child: Text('AboutDialog'),
                      onPressed: showAboutDialog,
                    ),
                  ],
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默��MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('LoadingDialog1'),
                      onPressed: () => {showLoadingDialog1(context)},
                    ),
                    RaisedButton(
                      child: Text('LoadingDialog2'),
                      onPressed: () => {showLoadingDialog2(context)},
                    ),
                  ],
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('ProgressDialog'),
                      onPressed: () => {showProgressDialog(context)},
                    ),
                  ],
                ),
              ],
            )));
  }
}
