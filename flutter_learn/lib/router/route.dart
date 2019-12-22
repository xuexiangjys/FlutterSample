import 'package:flutter/material.dart';
import 'package:flutter_learn/home.dart';
import 'package:flutter_learn/page/expand/image_picker.dart';
import 'package:flutter_learn/page/expand/web.dart';
import 'package:flutter_learn/page/utils/mmkv.dart';
import 'package:flutter_learn/page/utils/navigator.dart';
import 'package:flutter_learn/page/utils/net.dart';
import 'package:flutter_learn/page/utils/shared_preferences.dart';
import 'package:flutter_learn/page/utils/sqlite.dart';
import 'package:flutter_learn/page/utils/toast.dart';
import 'package:flutter_learn/page/widget/appbar.dart';
import 'package:flutter_learn/page/widget/bottom_navigation_bar.dart';
import 'package:flutter_learn/page/widget/button.dart';
import 'package:flutter_learn/page/widget/dialog.dart';
import 'package:flutter_learn/page/widget/drawer.dart';
import 'package:flutter_learn/page/widget/empty.dart';
import 'package:flutter_learn/page/widget/image.dart';
import 'package:flutter_learn/page/widget/nested_scrollview.dart';
import 'package:flutter_learn/page/widget/tab.dart';
import 'package:flutter_learn/page/widget/text.dart';
import 'package:flutter_learn/view/viewpage_item.dart';

class RouteMap {
  static final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => new MainHomePage(),
    '/empty': (BuildContext context) => new EmptyPage(),

    //=============================================================//

    '/widget/appbar': (BuildContext context) => new AppBarPage(),
    '/widget/button': (BuildContext context) => new ButtonPage(),
    '/widget/text': (BuildContext context) => new TextPage(),
    '/widget/image': (BuildContext context) => new ImagePage(),
    '/widget/tab': (BuildContext context) => new TabPage(),
    '/widget/navigation': (BuildContext context) => new BottomNavigationBarPage(),
    '/widget/dialog': (BuildContext context) => new DialogPage(),
    '/widget/drawer': (BuildContext context) => new DrawerPage(),
    '/widget/nested_scrollview': (BuildContext context) => new NestedScrollViewPage(),

    //=============================================================//

    '/utils/navigator': (BuildContext context) => new NavigatorPage(),
    '/utils/net': (BuildContext context) => new NetRequestPage(),
    '/utils/toast': (BuildContext context) => new ToastPage(),
    '/utils/mmkv': (BuildContext context) => new MMKVPage(),
    '/utils/shared_preferences': (BuildContext context) => new SharedPreferencesPage(),
    '/utils/sqlite': (BuildContext context) => new SqlitePage(),

    //=============================================================//

    '/expand/web_page': (BuildContext context) => new WebPage(),
    '/expand/image_picker': (BuildContext context) => new ImagePickerPage(),

  };

  /*
   * 组件
   */
  static final List<ListItem> widgetItems = [
    new ListItem(Icons.title, "标题", "简单的标题使用", '/widget/appbar'),
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
    new ListItem(Icons.text_fields, "文字", "简单的文字、输入框使用", '/widget/text'),
    new ListItem(Icons.image, "图片", "简单的图片使用", '/widget/image'),
    new ListItem(Icons.tab, "选项卡", "简单的选项卡使用", '/widget/tab'),
    new ListItem(Icons.navigation, "底部导航栏", "简单的底部导航栏使用", '/widget/navigation'),
    new ListItem(Icons.notifications, "对话框", "简单的对话框使用", '/widget/dialog'),
    new ListItem(Icons.menu, "侧滑菜单", "简单侧滑菜单的使用", '/widget/drawer'),
    new ListItem(Icons.list, "NestedScrollView", "嵌套滚动联动的使用", '/widget/nested_scrollview'),
  ];

  /*
   * 工具
   */
  static final List<ListItem> utilsItems = [
    new ListItem(Icons.navigation, "页面跳转", "详解页面路由跳转", '/utils/navigator'),
    new ListItem(Icons.http, "网络请求", "详解dio的使用", '/utils/net'),
    new ListItem(Icons.info, "Toast使用", "详解Toast的使用", '/utils/toast'),
    new ListItem(Icons.data_usage, "MMKV使用", "腾讯MMKV键值对使用", '/utils/mmkv'),
    new ListItem(Icons.data_usage, "SharedPreferences使用","SharedPreferences键值对使用", '/utils/shared_preferences'),
    new ListItem(Icons.date_range, "Sqlite数据库使用","Sqlite增删改查操作", '/utils/sqlite'),

  ];

  /*
   * 拓展
   */
  static final List<ListItem> expandItems = [
    new ListItem(Icons.radio_button_checked, "网页加载", "简单的网页加载", '/expand/web_page'),
    new ListItem(Icons.image, "图片选择", "图片选择的简单使用", '/expand/image_picker'),
  ];
}
