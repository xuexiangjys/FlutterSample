import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_learn/view/list/list_item.dart';
import 'package:flutter_learn/view/list/sample_list_item.dart';

/// 基本示例(经典样式)页面
class BasicRefreshPage extends StatefulWidget {
  /// 标题
  final String title;

  const BasicRefreshPage({this.title = "基本使用", Key key}) : super(key: key);

  @override
  _BasicRefreshPageState createState() => _BasicRefreshPageState();
}

class _BasicRefreshPageState extends State<BasicRefreshPage> {
  EasyRefreshController _controller;
  ScrollController _scrollController;

  // 条目总数
  int _count = 20;
  // 反向
  bool _reverse = false;
  // 方向
  Axis _direction = Axis.vertical;
  // Header浮动
  bool _headerFloat = false;
  // 无限加载
  bool _enableInfiniteLoad = true;
  // 控制结束
  bool _enableControlFinish = false;
  // 任务独立
  bool _taskIndependence = false;
  // 震动
  bool _vibration = true;
  // 是否开启刷新
  bool _enableRefresh = true;
  // 是否开启加载
  bool _enableLoad = true;
  // 顶部回弹
  bool _topBouncing = true;
  // 底部回弹
  bool _bottomBouncing = true;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return _buildModalMenu();
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          height: _direction == Axis.vertical ? double.infinity : 210.0,
          child: EasyRefresh.custom(
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true,
            taskIndependence: _taskIndependence,
            controller: _controller,
            scrollController: _scrollController,
            reverse: _reverse,
            scrollDirection: _direction,
            topBouncing: _topBouncing,
            bottomBouncing: _bottomBouncing,
            //经典样式
            header: ClassicalHeader(
              enableInfiniteRefresh: false,
              bgColor: _headerFloat ? Theme.of(context).primaryColor : null,
              infoColor: _headerFloat ? Colors.black87 : Colors.teal,
              float: _headerFloat,
              enableHapticFeedback: _vibration,
            ),
            //经典样式
            footer: ClassicalFooter(
              enableInfiniteLoad: _enableInfiniteLoad,
              enableHapticFeedback: _vibration,
            ),
            onRefresh: _enableRefresh
                ? () async {
                    await Future.delayed(Duration(seconds: 2), () {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        _count = 20;
                      });
                      if (!_enableControlFinish) {
                        _controller.resetLoadState();
                        _controller.finishRefresh();
                      }
                    });
                  }
                : null,
            onLoad: _enableLoad
                ? () async {
                    await Future.delayed(Duration(seconds: 2), () {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        _count += 20;
                      });
                      if (!_enableControlFinish) {
                        _controller.finishLoad(noMore: _count >= 80);
                      }
                    });
                  }
                : null,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return SampleListItem(
                      direction: _direction,
                      width:
                          _direction == Axis.vertical ? double.infinity : 150.0,
                    );
                  },
                  childCount: _count,
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        _enableControlFinish
            ? FlatButton(
                onPressed: () {
                  _controller.resetLoadState();
                  _controller.finishRefresh();
                },
                child: Text("刷新完成", style: TextStyle(color: Colors.black)))
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
        _enableControlFinish
            ? FlatButton(
                onPressed: () {
                  _controller.finishLoad(noMore: _count >= 80);
                },
                child: Text("加载完成", style: TextStyle(color: Colors.black)))
            : SizedBox(
                width: 0.0,
                height: 0.0,
              ),
        FlatButton(
            onPressed: () {
              _controller.callRefresh();
            },
            child: Text("刷新", style: TextStyle(color: Colors.black))),
        FlatButton(
            onPressed: () {
              _controller.callLoad();
            },
            child: Text("加载", style: TextStyle(color: Colors.black))),
      ],
    );
  }

  // 构建模态窗口菜单
  Widget _buildModalMenu() {
    return StatefulBuilder(
      builder: (context, state) {
        return EasyRefresh.custom(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                // 列表方向
                ListItem(
                  title: "方向",
                  describe: "列表方向",
                  rightWidget: Container(
                    child: Row(
                      children: <Widget>[
                        Text("垂直"),
                        Radio<Axis>(
                          groupValue: _direction,
                          value: Axis.vertical,
                          onChanged: (axis) {
                            setState(() {
                              _direction = Axis.vertical;
                            });
                            state(() {});
                          },
                        ),
                        Text("水平"),
                        Radio<Axis>(
                          groupValue: _direction,
                          value: Axis.horizontal,
                          onChanged: (axis) {
                            setState(() {
                              _direction = Axis.horizontal;
                            });
                            state(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // 反向
                ListItem(
                  title: "反向",
                  describe: "列表反向",
                  rightWidget: Center(
                    child: Switch(
                      value: _reverse,
                      onChanged: (reverse) {
                        setState(() {
                          _reverse = reverse;
                        });
                        state(() {});
                      },
                    ),
                  ),
                ),
                // 无限加载
                ListItem(
                  title: "无限加载",
                  describe: "滑动到底部自动���发加载",
                  rightWidget: Center(
                    child: Switch(
                      value: _enableInfiniteLoad,
                      onChanged: (infinite) {
                        setState(() {
                          _enableInfiniteLoad = infinite;
                        });
                        state(() {});
                        _controller.resetLoadState();
                      },
                    ),
                  ),
                ),
                // 控制结束
                ListItem(
                  title: "控制结束",
                  describe: "使用控制器结束异步任务",
                  rightWidget: Center(
                    child: Switch(
                      value: _enableControlFinish,
                      onChanged: (control) {
                        setState(() {
                          _enableControlFinish = control;
                        });
                        state(() {});
                      },
                    ),
                  ),
                ),
                // 任务独立
                ListItem(
                  title: "任务独立",
                  describe: "刷新和加载任务互不受影响(不推荐)",
                  rightWidget: Center(
                    child: Switch(
                      value: _taskIndependence,
                      onChanged: (independence) {
                        setState(() {
                          _taskIndependence = independence;
                        });
                        state(() {});
                      },
                    ),
                  ),
                ),
                // Header浮动
                ListItem(
                  title: "Header浮动",
                  describe: "Header显示在列表之上",
                  rightWidget: Center(
                    child: Switch(
                      value: _headerFloat,
                      onChanged: (float) {
                        setState(() {
                          _headerFloat = float;
                        });
                        state(() {});
                      },
                    ),
                  ),
                ),
                // 震动
                ListItem(
                  title: "震动",
                  describe: "触发震动反馈",
                  rightWidget: Center(
                    child: Switch(
                      value: _vibration,
                      onChanged: (vibration) {
                        setState(() {
                          _vibration = vibration;
                        });
                        state(() {});
                      },
                    ),
                  ),
                ),
                // 刷新开关
                ListItem(
                  title: "刷新开关",
                  describe: "是否开启刷新",
                  rightWidget: Center(
                    child: Switch(
                      value: _enableRefresh,
                      onChanged: (refresh) {
                        setState(() {
                          _enableRefresh = refresh;
                          if (!_topBouncing) {
                            _topBouncing = true;
                          }
                        });
                        state(() {});
                      },
                    ),
                  ),
                ),
                // 加载开关
                ListItem(
                  title: "加载开关",
                  describe: "是否开启加载",
                  rightWidget: Center(
                    child: Switch(
                      value: _enableLoad,
                      onChanged: (load) {
                        setState(() {
                          _enableLoad = load;
                          if (!_bottomBouncing) {
                            _bottomBouncing = true;
                          }
                        });
                        state(() {});
                      },
                    ),
                  ),
                ),
                // 顶部回弹
                ListItem(
                  title: "顶部回弹",
                  describe: "顶部可越界",
                  rightWidget: Center(
                    child: Switch(
                      value: _topBouncing,
                      onChanged: _enableRefresh
                          ? null
                          : (bouncing) {
                              setState(() {
                                _topBouncing = bouncing;
                              });
                              state(() {});
                            },
                    ),
                  ),
                ),
                // 底部回弹
                ListItem(
                  title: "底部回弹",
                  describe: "底部可越界",
                  rightWidget: Center(
                    child: Switch(
                      value: _bottomBouncing,
                      onChanged: _enableLoad
                          ? null
                          : (bouncing) {
                              setState(() {
                                _bottomBouncing = bouncing;
                              });
                              state(() {});
                            },
                    ),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }
}
