import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatefulWidget {
  BottomNavigationBarPage({Key key}) : super(key: key);
  final String title = "底部导航栏";
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  List<BottomNavigationBarItem> _myTabs = [
    BottomNavigationBarItem(title: Text("主页"), icon: Icon(Icons.home)),
    BottomNavigationBarItem(title: Text("列表"), icon: Icon(Icons.list)),
    BottomNavigationBarItem(title: Text("新建"), icon: Icon(Icons.add)),
    BottomNavigationBarItem(title: Text("消息"), icon: Icon(Icons.message)),
    BottomNavigationBarItem(title: Text("菜单"), icon: Icon(Icons.menu)),
    BottomNavigationBarItem(title: Text("其他"), icon: Icon(Icons.devices_other)),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _myTabs.map((BottomNavigationBarItem tab) {
          return Center(child: tab.title);
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _onItemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
