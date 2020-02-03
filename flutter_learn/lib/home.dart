import 'package:flutter/material.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/utils/click.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/view/gridview_page.dart';

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
    GridViewPage(items: RouteMap.widgetItems),
    GridViewPage(items: RouteMap.utilsItems),
    GridViewPage(items: RouteMap.expandItems),
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

  void showColorDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          height: 300,
          child: ListView.builder(
            itemCount: AppTheme.materialColors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Store.value<AppTheme>(context).changeColor(index);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      color: AppTheme.materialColors[index], height: 40));
            },
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              onPressed: showColorDialog,
              tooltip: '换肤',
              child: Icon(Icons.color_lens),
            );
          }),
        ),
        //监听导航栏返回,类似onKeyEvent
        onWillPop: ClickUtils.exitBy2Click);
  }
}
