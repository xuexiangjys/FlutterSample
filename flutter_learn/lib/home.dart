import 'package:flutter/material.dart';
import 'package:flutter_learn/viewpageitem.dart';

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

  static final List<ListItem> widgetItems = [
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
    new ListItem(Icons.text_fields, "文字", "简单的文字使用", '/widget/text'),
    new ListItem(Icons.image, "图片", "简单的图片使用", '/widget/image'),
    new ListItem(Icons.tab, "选项卡", "简单的选项卡使用", '/widget/tab'),
  ];

   static final List<ListItem> utilsItems = [
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
    new ListItem(Icons.text_fields, "文字", "简单的文字使用", '/widget/text'),
  ];

   static final List<ListItem> expandItems = [
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
  ];

  final List<Widget> mTabViews = <Widget>[
    ViewPageItem(items: widgetItems),
    ViewPageItem(items: utilsItems),
    ViewPageItem(items: expandItems),
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
