import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);
  final String title = "对话框";
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void showAboutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AboutDialog(
            applicationName: '应用名称',
            applicationIcon: Icon(Icons.ac_unit),
            applicationVersion: 'V1.0',
            children: <Widget>[Text('我是一个关于的dialog')]));
  }

  void showAlertDialog(BuildContext context) {
    showDialog<void>(
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

  void showSimpleDialog(BuildContext context) {
    showDialog<Null>(
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

  void showCustomDialog(BuildContext context) {
    showDialog<void>(
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
                      color: Colors.blue,
                      onPressed: () => {showAlertDialog(context)},
                    ),
                    RaisedButton(
                      child: Text('SimpleDialog'),
                      color: Colors.blue,
                      onPressed: () => {showSimpleDialog(context)},
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
                      color: Colors.blue,
                      onPressed: () => {showCustomDialog(context)},
                    ),
                    RaisedButton(
                      child: Text('AboutDialog'),
                      color: Colors.blue,
                      onPressed: () => {showAboutDialog(context)},
                    ),
                  ],
                ),
              ],
            )));
  }
}
