import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/utils.dart';

class BatteryPage extends StatefulWidget {
  final String title = '电量';
  @override
  _BatteryPageState createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  int _battery = 0;
  String _batteryStatus;

  @override
  void initState() {
    super.initState();
    Utils.getBattery().then((value) {
      setState(() {
        _battery = value;
      });
    });
    Utils.registerBatteryChanged((status) {
      switch (status) {
        case BatteryState.full:
          _batteryStatus = "充满";
          break;
        case BatteryState.charging:
          _batteryStatus = "充电中...";
          break;
        case BatteryState.discharging:
          _batteryStatus = "充电断开";
          break;
        default:
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    Utils.unregisterBatteryChanged();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('电量: $_battery%'),
                  SizedBox(height: 10),
                  Text('电池状态: $_batteryStatus')
                ])));
  }
}
