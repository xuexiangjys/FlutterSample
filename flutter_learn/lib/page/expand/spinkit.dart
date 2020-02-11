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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitRotatingCircle(color: Colors.white),
                  SpinKitRotatingPlain(color: Colors.white),
                  SpinKitChasingDots(color: Colors.white),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitPumpingHeart(color: Colors.white),
                  SpinKitPulse(color: Colors.white),
                  SpinKitDoubleBounce(color: Colors.white),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
                  SpinKitWave(
                      color: Colors.white, type: SpinKitWaveType.center),
                  SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitThreeBounce(color: Colors.white),
                  SpinKitWanderingCubes(color: Colors.white),
                  SpinKitWanderingCubes(
                      color: Colors.white, shape: BoxShape.circle),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitCircle(color: Colors.white),
                  SpinKitFadingFour(color: Colors.white),
                  SpinKitFadingFour(
                      color: Colors.white, shape: BoxShape.rectangle),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitFadingCube(color: Colors.white),
                  SpinKitCubeGrid(size: 51.0, color: Colors.white),
                  SpinKitFoldingCube(color: Colors.white),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitRing(color: Colors.white),
                  SpinKitDualRing(color: Colors.white),
                  SpinKitRipple(color: Colors.white),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitFadingGrid(color: Colors.white),
                  SpinKitFadingGrid(
                      color: Colors.white, shape: BoxShape.rectangle),
                  SpinKitSquareCircle(color: Colors.white),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitSpinningCircle(color: Colors.white),
                  SpinKitSpinningCircle(
                      color: Colors.white, shape: BoxShape.rectangle),
                  SpinKitFadingCircle(color: Colors.white),
                ],
              ),
              SizedBox(height: 48.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitHourGlass(color: Colors.white),
                  SpinKitPouringHourglass(color: Colors.white),
                ],
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ));
  }
}
