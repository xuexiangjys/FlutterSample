import 'package:flutter/material.dart';
import 'package:flutter_learn/widget/button.dart';
import 'package:flutter_learn/widget/image.dart';
import 'package:flutter_learn/widget/tab.dart';
import 'package:flutter_learn/widget/text.dart';

import '../viewpageitem.dart';

class RouteMap {
  static final routes = <String, WidgetBuilder>{
    '/widget/button': (BuildContext context) => new ButtonPage(),
    '/widget/text': (BuildContext context) => new TextPage(),
    '/widget/image': (BuildContext context) => new ImagePage(),
    '/widget/tab': (BuildContext context) => new TabPage(),
  };

  /*
   * 组件
   */
  static final List<ListItem> widgetItems = [
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
    new ListItem(Icons.text_fields, "文字", "简单的文字使用", '/widget/text'),
    new ListItem(Icons.image, "图片", "简单的图片使用", '/widget/image'),
    new ListItem(Icons.tab, "选项卡", "简单的选项卡使用", '/widget/tab'),
  ];

  /*
   * 工具
   */
  static final List<ListItem> utilsItems = [
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
    new ListItem(Icons.text_fields, "文字", "简单的文字使用", '/widget/text'),
    new ListItem(Icons.text_fields, "文字", "简单的文字使用", '/widget/text'),
    new ListItem(Icons.text_fields, "文字", "简单的文字使用", '/widget/text'),
  ];

  /*
   * 拓展
   */
  static final List<ListItem> expandItems = [
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
  ];
}
