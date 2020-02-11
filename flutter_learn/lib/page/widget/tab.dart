import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  TabPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  final List<Tab> mTabs = <Tab>[
    Tab(text: '语文'),
    Tab(text: '数学'),
    Tab(text: '英语')
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
        children: mTabs.map((Tab tab) {
          return Center(child: Text(tab.text));
        }).toList(),
      ),
    );
  }
}
