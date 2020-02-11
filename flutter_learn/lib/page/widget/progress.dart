import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  ProgressPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  double _progress = 0.20;

  void increase() {
    setState(() {
      _progress += 0.05;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                LinearProgressIndicator(),
                SizedBox(height: 20),
                SizedBox(
                    height: 30,
                    child: LinearProgressIndicator(value: _progress)),
                SizedBox(height: 20),
                CircularProgressIndicator(),
                SizedBox(height: 20),
                SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      value: _progress,
                      strokeWidth: 5,
                    )),
                SizedBox(height: 10),
                FlatButton(
                  child: Text('增加进度', style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: increase,
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  margin: EdgeInsets.all(8.0),
                  child: CustomPaint(
                      child: Center(
                          child: Text(
                        (_doubleAnimation.value / 3.6).round().toString(),
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                      painter:
                          CircleProgressBarPainter(_doubleAnimation.value)),
                )
              ],
            )));
  }

  Animation<double> _doubleAnimation;
  AnimationController _controller;
  CurvedAnimation curvedAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _doubleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller);
    _controller.addListener(() {
      if (mounted) {
        this.setState(() {});
      }
    });
    onAnimationStart();
  }

  void onAnimationStart() {
    _controller.forward(from: 0.0);
  }

  @override
  void reassemble() {
    super.reassemble();
    onAnimationStart();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CircleProgressBarPainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;
  final double pi = 3.1415926;
  var progress;

  CircleProgressBarPainter(this.progress) {
    _paintBackground = Paint()
      ..color = Colors.lightBlue[100]
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        _paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    canvas.drawArc(rect, 0.0, progress * pi / 180, false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
