import 'package:flutter/material.dart';

class BasicAnimationPage extends StatefulWidget {
  BasicAnimationPage({this.title = "动画", Key key}) : super(key: key);
  final String title;
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<BasicAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(_controller);
    animation.addStatusListener((status) {
      ///dismissed	动画在起始点停止
      ///forward	动画正在正向执行
      ///reverse	动画正在反向执行
      ///completed	动画在终点停止
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        _controller.forward();
      }
    });

    //启动动画（正向）
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GrowTransition(
          child: Image.asset("assets/images/food01.jpeg"),
          animation: animation,
        ));
  }
}

///自动变大的动画
///Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、SizeTransition等，很多时候都可以复用这些预置的过渡类。
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}
