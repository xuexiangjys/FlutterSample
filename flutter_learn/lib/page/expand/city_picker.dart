import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

class CityPickerPage extends StatefulWidget {
  final String title;
  CityPickerPage(this.title, {Key key}) : super(key: key);
  @override
  _CityPickerPageState createState() => _CityPickerPageState();
}

class _CityPickerPageState extends State<CityPickerPage> {
  String _data1 = "省市区三级选择";
  String _data2 = "省市区三级选择(全屏)";
  String _data3 = "城市选择";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              ButtonBar(
                alignment:
                    MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                children: <Widget>[
                  RaisedButton(
                    child: Text(_data1),
                    color: Colors.blue,
                    onPressed: () => showPicker1(context),
                  ),
                  RaisedButton(
                    child: Text(_data2),
                    color: Colors.blue,
                    onPressed: () => showPicker2(context),
                  ),
                  RaisedButton(
                    child: Text(_data3),
                    color: Colors.blue,
                    onPressed: () => showPicker3(context),
                  ),
                ],
              ),
            ])));
  }

  void showPicker1(BuildContext context) {
    ///设置默认: 江苏-南京市-江宁区
    CityPickers.showCityPicker(
            context: context, height: 220, locationCode: '320115')
        .then((value) => setState(() {
              _data1 =
                  "${value.provinceName}-${value.cityName}-${value.areaName}";
            }));
  }

  void showPicker2(BuildContext context) {
    ///设置默认: 江苏-南京市-江宁区
    CityPickers.showFullPageCityPicker(context: context, locationCode: '320115')
        .then((value) => setState(() {
              _data2 =
                  "${value.provinceName}-${value.cityName}-${value.areaName}";
            }));
  }

  void showPicker3(BuildContext context) {
    CityPickers.showCitiesSelector(
            context: context,
            hotCities: [
              HotCity(id: 0, name: '北京'),
              HotCity(id: 1, name: '上海'),
              HotCity(id: 2, name: '广州'),
              HotCity(id: 3, name: '南京'),
              HotCity(id: 4, name: '杭州'),
            ],
            cityItemStyle: BaseStyle(fontSize: 15),
            sideBarStyle: BaseStyle(backgroundActiveColor: Colors.transparent))
        .then((value) => setState(() {
              _data3 = "${value.cityName}";
            }));
  }
}
