import 'package:flutter/material.dart';
import 'package:flutter_learn/router/route.dart';

import 'view/viewpageitem.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);
  final String title = "Flutter学习";
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> mTabs = <Tab>[
    Tab(text: '组件'),
    Tab(text: '工具'),
    Tab(text: '拓展')
  ];

  final List<Widget> mTabViews = <Widget>[
    ViewPageItem(items: RouteMap.widgetItems),
    ViewPageItem(items: RouteMap.utilsItems),
    ViewPageItem(items: RouteMap.expandItems),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: mTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: mTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: mTabViews.map((Widget widget) {
          return widget;
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '新建',
        child: Icon(Icons.add),
      ),
    );
  }
}
