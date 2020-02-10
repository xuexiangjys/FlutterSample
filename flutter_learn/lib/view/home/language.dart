import 'package:flutter/material.dart';
import 'package:flutter_learn/i10n/localization_intl.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    LocaleModel localeModel = Provider.of<LocaleModel>(context);
    Languages S = Languages.of(context);

    Widget _buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
            localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 此行代码会通知MaterialApp重新build
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text(S.language)),
        body: ListView(
          children: <Widget>[
            _buildLanguageItem(S.chinese, "zh_CN"),
            _buildLanguageItem(S.english, "en_US"),
            _buildLanguageItem(S.auto, null),
          ],
        ));
  }
}
