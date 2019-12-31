import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_learn/view/list/sample_list_item.dart';

/// Material Design样式
class MaterialRefreshPage extends StatefulWidget {
  /// 标题
  final String title;
  const MaterialRefreshPage({this.title = "Material Design风格", Key key})
      : super(key: key);

  @override
  _MaterialPageState createState() {
    return _MaterialPageState();
  }
}

class _MaterialPageState extends State<MaterialRefreshPage> {
  // 总数
  int _count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {
              _count = 10;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {
              _count += 10;
            });
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SampleListItem();
              },
              childCount: _count,
            ),
          ),
        ],
      ),
    );
  }
}
