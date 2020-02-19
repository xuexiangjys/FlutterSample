import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/permission.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionApplyPage extends StatefulWidget {
  final String title;
  PermissionApplyPage(this.title, {Key key}) : super(key: key);
  @override
  _PermissionApplyPageState createState() => _PermissionApplyPageState();
}

class _PermissionApplyPageState extends State<PermissionApplyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              PermissionUtils.openAppSettings().then((bool hasOpened) =>
                  debugPrint('App Settings opened: ' + hasOpened.toString()));
            },
          )
        ]),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    child: Text('相机权限申请'),
                    onPressed: () {
                      PermissionUtils.requestPermission(PermissionGroup.camera).then((value) => {
                        XToast.toast("申请结果:$value")
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('相机权限检查'),
                    onPressed: () {
                      PermissionUtils.checkPermissionStatus(PermissionGroup.camera).then((value)  => {
                        XToast.toast("检查结果:$value")
                      });
                    },
                  ),
                ],
              )
            ])));
  }

  void checkServiceStatus(BuildContext context, PermissionGroup permission) {
    PermissionHandler()
        .checkServiceStatus(permission)
        .then((ServiceStatus serviceStatus) {
      final SnackBar snackBar =
          SnackBar(content: Text(serviceStatus.toString()));

      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

}
