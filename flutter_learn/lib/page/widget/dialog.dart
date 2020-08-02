import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/dialog.dart';
import 'package:flutter_learn/utils/oktoast.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/view/loading_dialog.dart';
import 'package:flutter_learn/view/update_dialog.dart';
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
    DialogUtils.show(
        context,
        AboutDialog(
            applicationName: '应用名称',
            applicationIcon: Icon(Icons.ac_unit),
            applicationVersion: 'V1.0',
            children: <Widget>[Text('我是一个关于的dialog')]));
  }

  void showAlertDialog() {
    DialogUtils.show(
        context,
        AlertDialog(
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
        ));
  }

  void showSimpleDialog() {
    DialogUtils.show(
        context,
        SimpleDialog(
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
        ),
        dismissible: true);
  }

  void showCustomDialog() {
    DialogUtils.show(
        context,
        Dialog(
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
        )));
  }

  void showLoadingDialog1(BuildContext context) {
    DialogUtils.show(
        context,
        LoadingDialog(
          content: "加载中…",
          loadingView: SpinKitCircle(color: Colors.lightBlue),
        ));
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  void showLoadingDialog2(BuildContext context) {
    DialogUtils.show(
        context,
        LoadingDialog(
          showContent: false,
          backgroundColor: Colors.black38,
          loadingView: SpinKitCircle(color: Colors.white),
        ));
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
          // progressWidget:
          //     Container(child: SpinKitCircle(color: Colors.lightBlue)),
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500),
        );
      }
    });
  }

  UpdateDialog dialog;

  double progress = 0.0;

  void showUpdateDialog(BuildContext context) {
    if (dialog != null && dialog.isShowing()) {
      return;
    }
    dialog = UpdateDialog.showUpdate(context,
        title: "是否升级到4.1.4版本？",
        updateContent: "新版本大小:2.0M\n1.xxxxxxx\n2.xxxxxxx\n3.xxxxxxx",
        topImage: Image.asset('assets/images/bg_update_top.png'),
        radius: 8,
        themeColor: Color(0xFFFFAC5D),
        progressBackgroundColor: Color(0x5AFFAC5D),
        isForce: true,
        enableIgnore: true, onIgnore: () {
      XToast.success("忽略");
      dialog.dismiss();
    }, onUpdate: () {
      XToast.success("升级");
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        progress = progress + 0.02;
        if (progress >= 1) {
          timer.cancel();
          dialog.dismiss();
          progress = 0;
        } else {
          dialog.update(progress);
        }
      });
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
                    RaisedButton(
                      child: Text('UpdateDialog'),
                      onPressed: () => {showUpdateDialog(context)},
                    ),
                  ],
                ),
              ],
            )));
  }
}
