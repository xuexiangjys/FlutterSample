import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_learn/utils/utils.dart';

class DatePickerPage extends StatefulWidget {
  DatePickerPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  String _date = "选择日期";
  String _time1 = "选择时间1";
  String _time2 = "选择时间2";

  String _dateSystem = "系统的日期选择";
  String _timeSystem = "系统的时间选择";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                      child: Text(_date),
                      color: Colors.blue,
                      onPressed: onShowDatePicker,
                    ),
                    RaisedButton(
                      child: Text(_time1),
                      color: Colors.blue,
                      onPressed: showTimePicker1,
                    ),
                    RaisedButton(
                      child: Text(_time2),
                      color: Colors.blue,
                      onPressed: showTimePicker2,
                    ),
                  ],
                ),
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                        child: Text(_dateSystem),
                        color: Colors.blue,
                        onPressed: () {
                          showDatePickerSystem(context);
                        }),
                    RaisedButton(
                        child: Text(_timeSystem),
                        color: Colors.blue,
                        onPressed: () {
                          showTimePickerSystem(context);
                        }),
                  ],
                ),
              ],
            )));
  }

  void onShowDatePicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1990, 1, 1),
        maxTime: DateTime(2050, 12, 31),
        theme: DatePickerTheme(
            headerColor: Colors.white,
            backgroundColor: Colors.white,
            itemStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            doneStyle: TextStyle(fontSize: 16)), onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
      setState(() {
        _date = Utils.formatDateTime(date);
      });
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  void showTimePicker1() {
    DatePicker.showTimePicker(context, showTitleActions: true,
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
      setState(() {
        _time1 = formatDate(date, [HH, ':', nn, ':', ss]);
      });
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  void showTimePicker2() {
    DatePicker.showTimePicker(context, showSecondsColumn: false,
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
      setState(() {
        _time2 = formatDate(date, [HH, ':', nn]);
      });
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  void showDatePickerSystem(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2050))
        .then((date) {
      if (date != null) {
        setState(() {
          _dateSystem = Utils.formatDateTime(date);
        });
      }
    });
  }

  void showTimePickerSystem(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time) {
      if (time != null) {
        setState(() {
          _timeSystem = "${time.hour}:${time.minute}";
        });
      }
    });
  }
}
