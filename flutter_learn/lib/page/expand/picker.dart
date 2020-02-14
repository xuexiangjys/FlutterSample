import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/i10n/localization_intl.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/utils/utils.dart';
import 'package:flutter_learn/utils/xuifont.dart';
import 'package:flutter_picker/flutter_picker.dart';

class PickerPage extends StatefulWidget {
  final String title;
  PickerPage(this.title, {Key key}) : super(key: key);
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _picker1 = "";
  String _picker2 = "";

  String _pickerSelect1 = "联动选择";
  String _pickerSelect2 = "非联动选择";
  String _pickerSelect3 = "联动选择[弹窗]";
  String _pickerSelect4 = "非联动选择[弹窗]";
  String _pickerSelect5 = "民族选择";
  String _pickerSelect6 = "性别选择";
  String _pickerSelect7 = "身高选择";
  String _pickerSelect8 = "时间段选择";

  String _start = "";
  String _end = "";

  List<int> _selected1 = [0, 0, 8];
  List<int> _selected2 = [0, 0];
  List<int> _selected3 = [0, 0, 8];
  List<int> _selected4 = [0, 0];
  List<int> _selected5 = [0];
  List<int> _selected6 = [0];
  List<int> _selected7 = [0];

  Future<void> loadJsonFromAsset() async {
    _picker1 = await rootBundle.loadString('assets/json/picker1.json');
    _picker2 = await rootBundle.loadString('assets/json/picker2.json');
  }

  @override
  void initState() {
    super.initState();
    loadJsonFromAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        key: _scaffoldKey,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    child: Text(_pickerSelect1),
                    color: Colors.blue,
                    onPressed: () => showPicker1(context),
                  ),
                  RaisedButton(
                    child: Text(_pickerSelect2),
                    color: Colors.blue,
                    onPressed: () => showPicker2(context),
                  ),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    child: Text(_pickerSelect3),
                    color: Colors.blue,
                    onPressed: () => showPicker3(context),
                  ),
                  RaisedButton(
                    child: Text(_pickerSelect4),
                    color: Colors.blue,
                    onPressed: () => showPicker4(context),
                  ),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    child: Text(_pickerSelect5),
                    color: Colors.blue,
                    onPressed: () => showPicker5(context),
                  ),
                  RaisedButton(
                    child: Text(_pickerSelect6),
                    color: Colors.blue,
                    onPressed: () => showPicker6(context),
                  ),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    child: Text(_pickerSelect7),
                    color: Colors.blue,
                    onPressed: () => showPicker7(context),
                  ),
                  RaisedButton(
                    child: Text(_pickerSelect8),
                    color: Colors.blue,
                    onPressed: () => showPickerDateRange(context),
                  ),
                ],
              )
            ])));
  }

  showPicker1(BuildContext context) {
    Picker(
        title: Text(Languages.of(context).cityPicker),
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(_picker1)),
        changeToFirst: true,
        selecteds: _selected1,
        cancelTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        confirmTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          _selected1 = value;
          setState(() {
            _pickerSelect1 = picker.getSelectedValues().toString();
          });
        }).show(_scaffoldKey.currentState);
  }

  showPicker2(BuildContext context) {
    Picker(
        title: Text(Languages.of(context).classPicker),
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(_picker2), isArray: true),
        selecteds: _selected2,
        cancelTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        confirmTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          _selected2 = value;
          setState(() {
            _pickerSelect2 = picker.getSelectedValues().toString();
          });
        }).showModal(context);
  }

  showPicker3(BuildContext context) {
    Picker(
        title: Text(Languages.of(context).cityPicker),
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(_picker1)),
        changeToFirst: false,
        hideHeader: true,
        textStyle: TextStyle(color: Colors.black, fontSize: 15),
        selecteds: _selected3,
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          _selected3 = value;
          setState(() {
            _pickerSelect3 = picker.getSelectedValues().toString();
          });
        }).showDialog(context);
  }

  showPicker4(BuildContext context) {
    Picker(
        title: Text(Languages.of(context).classPicker),
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(_picker2), isArray: true),
        selecteds: _selected4,
        hideHeader: true,
        onConfirm: (Picker picker, List value) {
          _selected4 = value;
          setState(() {
            _pickerSelect4 = picker.getSelectedValues().toString();
          });
        }).showDialog(context);
  }

  ///===========================///

  static const List<String> nation = [
    "汉族",
    "壮族",
    "回族",
    "满族",
    "维吾尔族",
    "苗族",
    "彝族",
    "土家族",
    "藏族",
    "蒙古族",
    "侗族",
    "布依族",
    "瑶族",
    "白族",
    "朝鲜族",
    "哈尼族",
    "黎族",
    "哈萨克族",
    "傣族",
    "畲族",
    "傈僳族",
    "东乡族",
    "仡佬族",
    "拉祜族",
    "佤族",
    "水族",
    "纳西族",
    "羌族",
    "土族",
    "仫佬族",
    "锡伯族",
    "柯尔克孜族",
    "景颇族",
    "达斡尔族",
    "撒拉族",
    "布朗族",
    "毛南族",
    "塔吉克族",
    "普米族",
    "阿昌族",
    "怒族",
    "鄂温克族",
    "京族",
    "基诺族",
    "德昂族",
    "保安族",
    "俄罗斯族",
    "裕固族",
    "乌孜别克族",
    "门巴族",
    "鄂伦春族",
    "独�����族",
    "赫哲族",
    "高山族",
    "珞巴族",
    "塔塔尔族"
  ];

  showPicker5(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(pickerdata: nation),
        selecteds: _selected5,
        cancelTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        confirmTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        itemExtent: 40,
        onConfirm: (Picker picker, List value) {
          _selected5 = value;
          setState(() {
            _pickerSelect5 = picker.getSelectedValues().toString();
          });
        }).show(_scaffoldKey.currentState);
  }

  showPicker6(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter(data: [
          PickerItem(text: Icon(XUIIcons.boy, color: Colors.blue), value: "男"),
          PickerItem(text: Icon(XUIIcons.girl, color: Colors.blue), value: "女"),
        ]),
        selecteds: _selected6,
        itemExtent: 40,
        cancelTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        confirmTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        onConfirm: (Picker picker, List value) {
          _selected6 = value;
          setState(() {
            _pickerSelect6 = picker.getSelectedValues().toString();
          });
        }).show(_scaffoldKey.currentState);
  }

  ///===========================///

  showPicker7(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 80, end: 250, suffix: Text("cm")),
        ]),
        selecteds: _selected7,
        cancelTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        confirmTextStyle:
            TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
        onConfirm: (Picker picker, List value) {
          _selected7 = value;
          setState(() {
            _pickerSelect7 = picker.getSelectedValues().toString();
          });
        }).show(_scaffoldKey.currentState);
  }

  showPickerDateRange(BuildContext context) {
    Picker ps = Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(
            type: PickerDateTimeType.kYMD, isNumberMonth: true),
        onConfirm: (Picker picker, List value) {
          _start = Utils.formatDateTime(
              (picker.adapter as DateTimePickerAdapter).value);
        });
    Picker pe = Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(type: PickerDateTimeType.kYMD),
        onConfirm: (Picker picker, List value) {
          _end = Utils.formatDateTime(
              (picker.adapter as DateTimePickerAdapter).value);
        });

    List<Widget> actions = [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(PickerLocalizations.of(context).cancelText)),
      FlatButton(
          onPressed: () {
            DateTime start = (ps.adapter as DateTimePickerAdapter).value;
            DateTime end = (pe.adapter as DateTimePickerAdapter).value;

            if (start.millisecondsSinceEpoch - end.millisecondsSinceEpoch < 0) {
              Navigator.pop(context);
              ps.onConfirm(ps, ps.selecteds);
              pe.onConfirm(pe, pe.selecteds);
              onDateSelected();
            } else {
              XToast.error("开始时间不能晚于结束时间!");
            }
          },
          child: Text(PickerLocalizations.of(context).confirmText))
    ];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("时间段选择"),
            actions: actions,
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("开始:"),
                  ps.makePicker(),
                  Text("结束:"),
                  pe.makePicker()
                ],
              ),
            ),
          );
        });
  }

  void onDateSelected() {
    setState(() {
      _pickerSelect8 = "$_start ~ $_end";
    });
  }
}
