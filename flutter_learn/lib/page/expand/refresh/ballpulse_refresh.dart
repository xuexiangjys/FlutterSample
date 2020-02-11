import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_learn/view/list/sample_list_item.dart';

/// 球脉冲样式
class BallPulseRefreshPage extends StatefulWidget {
  /// 标题
  final String title;
  const BallPulseRefreshPage(this.title, {Key key}) : super(key: key);

  @override
  _BallPulseRefreshPageState createState() {
    return _BallPulseRefreshPageState();
  }
}

class _BallPulseRefreshPageState extends State<BallPulseRefreshPage> {
  // 总数
  int _count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: EasyRefresh.custom(
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
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
