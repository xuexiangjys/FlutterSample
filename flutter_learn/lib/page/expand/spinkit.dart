import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitPage extends StatefulWidget {
  SpinkitPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _SpinkitPageState createState() => _SpinkitPageState();
}

class _SpinkitPageState extends State<SpinkitPage> {
  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).primaryColor;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitRotatingCircle(color: _color),
                  SpinKitRotatingPlain(color: _color),
                  SpinKitChasingDots(color: _color),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitPumpingHeart(color: _color),
                  SpinKitPulse(color: _color),
                  SpinKitDoubleBounce(color: _color),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitWave(color: _color, type: SpinKitWaveType.start),
                  SpinKitWave(
                      color: _color, type: SpinKitWaveType.center),
                  SpinKitWave(color: _color, type: SpinKitWaveType.end),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitThreeBounce(color: _color),
                  SpinKitWanderingCubes(color: _color),
                  SpinKitWanderingCubes(
                      color: _color, shape: BoxShape.circle),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitCircle(color: _color),
                  SpinKitFadingFour(color: _color),
                  SpinKitFadingFour(
                      color: _color, shape: BoxShape.rectangle),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitFadingCube(color: _color),
                  SpinKitCubeGrid(size: 51.0, color: _color),
                  SpinKitFoldingCube(color: _color),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitRing(color: _color),
                  SpinKitDualRing(color: _color),
                  SpinKitRipple(color: _color),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitFadingGrid(color: _color),
                  SpinKitFadingGrid(
                      color: _color, shape: BoxShape.rectangle),
                  SpinKitSquareCircle(color: _color),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitSpinningCircle(color: _color),
                  SpinKitSpinningCircle(
                      color: _color, shape: BoxShape.rectangle),
                  SpinKitFadingCircle(color: _color),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitHourGlass(color: _color),
                  SpinKitPouringHourglass(color: _color),
                ],
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ));
  }
}
