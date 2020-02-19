import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/event.dart';
import 'package:flutter_learn/utils/random.dart';

class EventBusPage extends StatefulWidget {
  EventBusPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _EventBusPageState createState() => _EventBusPageState();
}

const String EVENT_CHANGE_COLOR = "event_change_color";

class _EventBusPageState extends State<EventBusPage> {
  Color _primaryColor = Colors.blue;
  bool _isSubscription = false;

  @override
  void initState() {
    super.initState();
    initEvent();
  }

  void initEvent() {
    if (!_isSubscription) {
      XEvent.on<Color>(EVENT_CHANGE_COLOR, (color) {
        setState(() {
          _primaryColor = color;
        });
      });
      setState(() {
        _isSubscription = true;
      });
    }
  }

  void switchEvent() {
    if (_isSubscription) {
      XEvent.cancelAll(EVENT_CHANGE_COLOR);
      setState(() {
        _isSubscription = false;
      });
    } else {
      initEvent();
    }
  }

  @override
  void dispose() {
    super.dispose();
    //取消订阅
    XEvent.cancelAll(EVENT_CHANGE_COLOR);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: _primaryColor,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('改变标题栏的背景颜色'),
                      onPressed: () => {
                        XEvent.post(
                            EVENT_CHANGE_COLOR, RandomUtils.getRandomColor())
                      },
                    ),
                    RaisedButton(
                      child: Text(_isSubscription ? '取消订阅' : "订阅"),
                      onPressed: switchEvent,
                    ),
                  ],
                ),
              ],
            )));
  }
}
