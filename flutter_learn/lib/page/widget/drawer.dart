import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({Key key}) : super(key: key);
  final String title = "侧滑菜单";
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int count = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('点我试试呼出SnackBar&Drawer'),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                  _scaffoldKey.currentState.showSnackBar(const SnackBar(
                      content: Text("我是通过ScaffoldState的方式呼出的SnackBar.")));
                },
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text('xuexiang'),
                accountEmail: Text('xuexiangjys@163.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/flutter.png',
                  ),
                ),
                margin: EdgeInsets.zero,
              ),
              MediaQuery.removePadding(
                context: context,
                // DrawerHeader consumes top MediaQuery padding.
                removeTop: true,
                child: ListView(
                  shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                  physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                  scrollDirection: Axis.vertical, // 水平listView
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('菜单1'),
                      onTap: () => {XToast.toast("菜单1")},
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('菜单2'),
                      onTap: () => {XToast.toast("菜单2")},
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text('菜单3'),
                      onTap: () => {XToast.toast("菜单3")},
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
