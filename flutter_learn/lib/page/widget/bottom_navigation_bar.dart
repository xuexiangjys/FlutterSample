import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatefulWidget {
  BottomNavigationBarPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  List<BottomNavigationBarItem> _myTabs = [
    BottomNavigationBarItem(label: "主页", icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "列表", icon: Icon(Icons.list)),
    BottomNavigationBarItem(label: "新建", icon: Icon(Icons.add)),
    BottomNavigationBarItem(label: "消息", icon: Icon(Icons.message)),
    BottomNavigationBarItem(label: "菜单", icon: Icon(Icons.menu)),
    BottomNavigationBarItem(label: "其他", icon: Icon(Icons.devices_other)),
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
          return Center(child: Text(tab.label));
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
