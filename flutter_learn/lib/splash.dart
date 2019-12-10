import 'package:flutter/material.dart';

//类似广告启动页
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
            child: Image(
          image: AssetImage('assets/images/flutter.png'),
          height: 100,
          width: 100,
        )));
  }

  //倒计时
  void countDown() {
    var _duration = Duration(seconds: 2);
    new Future.delayed(_duration, goHomePage);
  }

  //页面跳转
  void goHomePage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
