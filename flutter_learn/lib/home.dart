import 'package:flutter/material.dart';
import 'package:flutter_learn/i10n/localization_intl.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/utils/click.dart';
import 'package:flutter_learn/utils/xupdate.dart';
import 'package:flutter_learn/view/gridview_page.dart';
import 'package:flutter_learn/view/home/home_drawer.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with SingleTickerProviderStateMixin {
  List<Tab> getTabs(BuildContext context) => [
        Tab(text: Languages.of(context).widget),
        Tab(text: Languages.of(context).utils),
        Tab(text: Languages.of(context).expand)
      ];

  List<Widget> getTabViews(BuildContext context) => <Widget>[
        GridViewPage(items: RouteMap.getWidgetItems(context)),
        GridViewPage(items: RouteMap.utilsItems),
        GridViewPage(items: RouteMap.expandItems),
      ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);

    XUpdate.initAndCheck();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(Languages.of(context).title),
            bottom: TabBar(
              controller: _tabController,
              tabs: getTabs(context),
            ),
          ),
          drawer: HomeDrawer(),
          body: TabBarView(
            controller: _tabController,
            children: getTabViews(context).map((Widget widget) {
              return widget;
            }).toList(),
          ),
        ),
        //监听导航栏返回,类似onKeyEvent
        onWillPop: () =>
            ClickUtils.exitBy2Click(status: _scaffoldKey.currentState));
  }
}
