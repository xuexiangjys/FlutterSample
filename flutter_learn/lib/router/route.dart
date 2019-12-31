import 'package:flutter/material.dart';
import 'package:flutter_learn/home.dart';
import 'package:flutter_learn/page/expand/easy_refresh.dart';
import 'package:flutter_learn/page/expand/iconfont.dart';
import 'package:flutter_learn/page/expand/image_picker.dart';
import 'package:flutter_learn/page/expand/refresh/ballpulse_refresh.dart';
import 'package:flutter_learn/page/expand/refresh/basic_refresh.dart';
import 'package:flutter_learn/page/expand/refresh/material_refresh.dart';
import 'package:flutter_learn/page/expand/refresh/user_profile.dart';
import 'package:flutter_learn/page/expand/spinkit.dart';
import 'package:flutter_learn/page/expand/swiper.dart';
import 'package:flutter_learn/page/expand/web.dart';
import 'package:flutter_learn/page/utils/event_bus.dart';
import 'package:flutter_learn/page/utils/json_serialize.dart';
import 'package:flutter_learn/page/utils/mmkv.dart';
import 'package:flutter_learn/page/utils/navigator.dart';
import 'package:flutter_learn/page/utils/net.dart';
import 'package:flutter_learn/page/utils/shared_preferences.dart';
import 'package:flutter_learn/page/utils/sqlite.dart';
import 'package:flutter_learn/page/utils/toast.dart';
import 'package:flutter_learn/page/widget/appbar.dart';
import 'package:flutter_learn/page/widget/bottom_navigation_bar.dart';
import 'package:flutter_learn/page/widget/button.dart';
import 'package:flutter_learn/page/widget/cardview.dart';
import 'package:flutter_learn/page/widget/control.dart';
import 'package:flutter_learn/page/widget/dialog.dart';
import 'package:flutter_learn/page/widget/drawer.dart';
import 'package:flutter_learn/page/widget/empty.dart';
import 'package:flutter_learn/page/widget/form.dart';
import 'package:flutter_learn/page/widget/image.dart';
import 'package:flutter_learn/page/widget/input.dart';
import 'package:flutter_learn/page/widget/nested_scrollview.dart';
import 'package:flutter_learn/page/widget/progress.dart';
import 'package:flutter_learn/page/widget/refresh_list.dart';
import 'package:flutter_learn/page/widget/tab.dart';
import 'package:flutter_learn/page/widget/text.dart';
import 'package:flutter_learn/view/viewpage_item.dart';

class RouteMap {
  static final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => MainHomePage(),
    '/empty': (BuildContext context) => EmptyPage(),

    //============================widget=================================//

    '/widget/appbar': (BuildContext context) => AppBarPage(),
    '/widget/button': (BuildContext context) => ButtonPage(),
    '/widget/control': (BuildContext context) => ControlPage(),
    '/widget/text': (BuildContext context) => TextPage(),
    '/widget/input': (BuildContext context) => InputPage(),
    '/widget/form': (BuildContext context) => FormPage(),
    '/widget/image': (BuildContext context) => ImagePage(),
    '/widget/tab': (BuildContext context) => TabPage(),
    '/widget/navigation': (BuildContext context) => BottomNavigationBarPage(),
    '/widget/dialog': (BuildContext context) => DialogPage(),
    '/widget/drawer': (BuildContext context) => DrawerPage(),
    '/widget/nested_scrollview': (BuildContext context) => NestedScrollViewPage(),
    '/widget/progress': (BuildContext context) => ProgressPage(),
    '/widget/cardview': (BuildContext context) => CardViewPage(),
    '/widget/refresh_list': (BuildContext context) => RefreshListPage(),

    //============================utils=================================//

    '/utils/navigator': (BuildContext context) => NavigatorPage(),
    '/utils/net': (BuildContext context) => NetRequestPage(),
    '/utils/toast': (BuildContext context) => ToastPage(),
    '/utils/mmkv': (BuildContext context) => MMKVPage(),
    '/utils/shared_preferences': (BuildContext context) => SharedPreferencesPage(),
    '/utils/sqlite': (BuildContext context) => SqlitePage(),
    '/utils/event_bus': (BuildContext context) => EventBusPage(),
    '/utils/json_serialize': (BuildContext context) => JsonSerializePage(),


    //============================expand=================================//

    '/expand/web_page': (BuildContext context) => WebPage(),
    '/expand/image_picker': (BuildContext context) => ImagePickerPage(),
    '/expand/iconfont': (BuildContext context) => IconFontPage(),
    '/expand/spinkit': (BuildContext context) => SpinkitPage(),
    '/expand/swiper': (BuildContext context) => SwiperPage(),
    '/expand/easy_refresh': (BuildContext context) => EasyRefreshPage(),

    //============================easy_refresh=================================//
    '/expand/easy_refresh/basic': (BuildContext context) => BasicRefreshPage(),
    '/expand/easy_refresh/material': (BuildContext context) => MaterialRefreshPage(),
    '/expand/easy_refresh/ball_pulse': (BuildContext context) => BallPulseRefreshPage(),
    '/expand/easy_refresh/user_profile': (BuildContext context) => UserProfilePage(),

  };

  /*
   * 组件
   */
  static final List<ListItem> widgetItems = [
    ListItem(Icons.title, "标题", "简单的标题使用", '/widget/appbar'),
    ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", '/widget/button'),
    ListItem(Icons.check_box, "控制开关", "简单的控制组件使用", '/widget/control'),
    ListItem(Icons.text_fields, "文字", "简单的文字使用", '/widget/text'),
    ListItem(Icons.input, "输入框", "简单的输入框使用", '/widget/input'),
    ListItem(Icons.input, "表单输入", "简单的表单使用", '/widget/form'),
    ListItem(Icons.image, "图片", "简单的图片使用", '/widget/image'),
    ListItem(Icons.tab, "选项卡", "简单的选项卡使用", '/widget/tab'),
    ListItem(Icons.navigation, "底部导航栏", "简单的底部导航栏使用", '/widget/navigation'),
    ListItem(Icons.notifications, "对话框", "简单的对话框使用", '/widget/dialog'),
    ListItem(Icons.menu, "侧滑菜单", "简单侧滑菜单的使用", '/widget/drawer'),
    ListItem(Icons.list, "NestedScrollView", "嵌套滚动联动的使用", '/widget/nested_scrollview'),
    ListItem(Icons.refresh, "进度条显示", "简单的进度条使用", '/widget/progress'),
    ListItem(Icons.credit_card, "卡片", "简单的卡片使用", '/widget/cardview'),
    ListItem(Icons.credit_card, "下拉刷新", "下拉刷新、上拉加载", '/widget/refresh_list'),
  ];

  /*
   * 工具
   */
  static final List<ListItem> utilsItems = [
    ListItem(Icons.navigation, "页面跳转", "详解页面路由跳转", '/utils/navigator'),
    ListItem(Icons.http, "网络请求", "详解dio的使用", '/utils/net'),
    ListItem(Icons.info, "Toast使用", "详解Toast的使用", '/utils/toast'),
    ListItem(Icons.data_usage, "MMKV使用", "腾讯MMKV键值对使用", '/utils/mmkv'),
    ListItem(Icons.data_usage, "SharedPreferences", "SharedPreferences键值对使用", '/utils/shared_preferences'),
    ListItem(Icons.date_range, "Sqlite数据库", "Sqlite增删改查操作", '/utils/sqlite'),
    ListItem(Icons.event, "EventBus", "EventBus事件使用", '/utils/event_bus'),
    ListItem(Icons.date_range, "Json序列化", "Json序列化和反序列化", '/utils/json_serialize'),
  ];

  /*
   * 拓展
   */
  static final List<ListItem> expandItems = [
    ListItem(Icons.radio_button_checked, "网页加载", "简单的网页加载", '/expand/web_page'),
    ListItem(Icons.image, "图片选择", "图片选择的简单使用", '/expand/image_picker'),
    ListItem(Icons.font_download, "字体图标", "使用自定义的字体图标", '/expand/iconfont'),
    ListItem(Icons.refresh, "Spinkit", "使用更多有趣的loading动画", '/expand/spinkit'),
    ListItem(Icons.pages, "轮播图", "使用Swiper构建丰富多彩的轮播图", '/expand/swiper'),
    ListItem(Icons.system_update, "下拉刷新", "使用EasyRefresh构建丰富的下拉刷新样式", '/expand/easy_refresh'),
  ];


  /*
   * 下拉刷新组件
   */
  static final List<ListItem> refreshItems = [
    ListItem(Icons.list, "基本使用", "EasyRefresh的基本使用", '/expand/easy_refresh/basic'),
    ListItem(Icons.list, "Material", "Material Design风格样式", '/expand/easy_refresh/material'),
    ListItem(Icons.list, "Ball Pulse", "球脉冲样式", '/expand/easy_refresh/ball_pulse'),
    ListItem(Icons.person, "个人中心", "带回弹效果的个人中心", '/expand/easy_refresh/user_profile'),
  ];
}
