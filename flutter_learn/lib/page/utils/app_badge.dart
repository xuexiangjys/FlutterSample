import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_learn/utils/shared_preferences.dart';

class AppBadgePage extends StatefulWidget {
  final String title;
  AppBadgePage(this.title, {Key key}) : super(key: key);
  @override
  _AppBadgePageState createState() => _AppBadgePageState();
}

class _AppBadgePageState extends State<AppBadgePage> {
  int _count = 0;
  bool _isSupport = false;

  @override
  void initState() {
    super.initState();
    _count = SPUtils.getAppBadgeNumber();
    FlutterAppBadger.isAppBadgeSupported().then((value) => {
          setState(() {
            _isSupport = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Text('当前应用消息徽章数量: $_count, 是否支持: $_isSupport'),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: <Widget>[
                      FlatButton.icon(
                        icon: Icon(Icons.add),
                        label: Text('增加'),
                        onPressed: _isSupport
                            ? () {
                                setState(() {
                                  _count += 1;
                                });
                                FlutterAppBadger.updateBadgeCount(_count);
                                SPUtils.saveAppBadgeNumber(_count);
                              }
                            : null,
                      ),
                      FlatButton.icon(
                        icon: Icon(Icons.remove),
                        label: Text('减少'),
                        onPressed: _isSupport
                            ? () {
                                if (_count > 0) {
                                  setState(() {
                                    _count -= 1;
                                  });
                                  FlutterAppBadger.updateBadgeCount(_count);
                                  SPUtils.saveAppBadgeNumber(_count);
                                }
                              }
                            : null,
                      ),
                      FlatButton.icon(
                        icon: Icon(Icons.clear),
                        label: Text('清除'),
                        onPressed: _isSupport
                            ? () {
                                setState(() {
                                  _count = 0;
                                });
                                FlutterAppBadger.removeBadge();
                                SPUtils.saveAppBadgeNumber(0);
                              }
                            : null,
                      )
                    ],
                  ))
            ])));
  }
}
