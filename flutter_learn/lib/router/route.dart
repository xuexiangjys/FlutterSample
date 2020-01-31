import 'package:flutter/material.dart';
import 'package:flutter_learn/home.dart';
import 'package:flutter_learn/page/expand/date_picker.dart';
import 'package:flutter_learn/page/expand/easy_refresh.dart';
import 'package:flutter_learn/page/expand/iconfont.dart';
import 'package:flutter_learn/page/expand/image_picker.dart';
import 'package:flutter_learn/page/expand/multi_image_picker.dart';
import 'package:flutter_learn/page/expand/refresh/ballpulse_refresh.dart';
import 'package:flutter_learn/page/expand/refresh/basic_refresh.dart';
import 'package:flutter_learn/page/expand/refresh/material_refresh.dart';
import 'package:flutter_learn/page/expand/refresh/user_profile.dart';
import 'package:flutter_learn/page/expand/spinkit.dart';
import 'package:flutter_learn/page/expand/swiper.dart';
import 'package:flutter_learn/page/expand/web.dart';
import 'package:flutter_learn/page/utils/bugly.dart';
import 'package:flutter_learn/page/utils/device_info.dart';
import 'package:flutter_learn/page/utils/event_bus.dart';
import 'package:flutter_learn/page/utils/jpush.dart';
import 'package:flutter_learn/page/utils/json_serialize.dart';
import 'package:flutter_learn/page/utils/mmkv.dart';
import 'package:flutter_learn/page/utils/navigator.dart';
import 'package:flutter_learn/page/utils/net.dart';
import 'package:flutter_learn/page/utils/provider.dart';
import 'package:flutter_learn/page/utils/provider_next.dart';
import 'package:flutter_learn/page/utils/shared_preferences.dart';
import 'package:flutter_learn/page/utils/sqlite.dart';
import 'package:flutter_learn/page/utils/toast.dart';
import 'package:flutter_learn/page/widget/appbar.dart';
import 'package:flutter_learn/page/widget/bottom_navigation_bar.dart';
import 'package:flutter_learn/page/widget/button.dart';
import 'package:flutter_learn/page/widget/cardview.dart';
import 'package:flutter_learn/page/widget/clip.dart';
import 'package:flutter_learn/page/widget/constrained_box.dart';
import 'package:flutter_learn/page/widget/container.dart';
import 'package:flutter_learn/page/widget/control.dart';
import 'package:flutter_learn/page/widget/custom_scrollview.dart';
import 'package:flutter_learn/page/widget/decorated_box.dart';
import 'package:flutter_learn/page/widget/dialog.dart';
import 'package:flutter_learn/page/widget/drag.dart';
import 'package:flutter_learn/page/widget/drawer.dart';
import 'package:flutter_learn/page/widget/empty.dart';
import 'package:flutter_learn/page/widget/form.dart';
import 'package:flutter_learn/page/widget/gesture.dart';
import 'package:flutter_learn/page/widget/image.dart';
import 'package:flutter_learn/page/widget/input.dart';
import 'package:flutter_learn/page/widget/layout_align.dart';
import 'package:flutter_learn/page/widget/layout_flex.dart';
import 'package:flutter_learn/page/widget/layout_linear.dart';
import 'package:flutter_learn/page/widget/layout_stack.dart';
import 'package:flutter_learn/page/widget/layout_wrap.dart';
import 'package:flutter_learn/page/widget/nested_scrollview.dart';
import 'package:flutter_learn/page/widget/progress.dart';
import 'package:flutter_learn/page/widget/tab.dart';
import 'package:flutter_learn/page/widget/text.dart';
import 'package:flutter_learn/page/widget/transform.dart';
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
    '/widget/custom_scrollview': (BuildContext context) => CustomScrollViewPage(),
    '/widget/progress': (BuildContext context) => ProgressPage(),
    '/widget/cardview': (BuildContext context) => CardViewPage(),
    '/widget/gesture': (BuildContext context) => GesturePage(),
    '/widget/drag': (BuildContext context) => DragPage(),
    '/widget/layout_linear': (BuildContext context) => LinearLayoutPage(),
    '/widget/layout_flex': (BuildContext context) => FlexLayoutPage(),
    '/widget/layout_wrap': (BuildContext context) => WrapLayoutPage(),
    '/widget/layout_stack': (BuildContext context) => StackLayoutPage(),
    '/widget/layout_align': (BuildContext context) => AlignLayoutPage(),
    '/widget/constrained_box': (BuildContext context) => ConstrainedBoxPage(),
    '/widget/decorated_box': (BuildContext context) => DecoratedBoxPage(),
    '/widget/transform': (BuildContext context) => TransformPage(),
    '/widget/containter': (BuildContext context) => ContainerPage(),
    '/widget/clip': (BuildContext context) => ClipPage(),

    //============================utils=================================//

    '/utils/navigator': (BuildContext context) => NavigatorPage(),
    '/utils/net': (BuildContext context) => NetRequestPage(),
    '/utils/toast': (BuildContext context) => ToastPage(),
    '/utils/mmkv': (BuildContext context) => MMKVPage(),
    '/utils/shared_preferences': (BuildContext context) => SharedPreferencesPage(),
    '/utils/sqlite': (BuildContext context) => SqlitePage(),
    '/utils/event_bus': (BuildContext context) => EventBusPage(),
    '/utils/jpush': (BuildContext context) => JPushPage(),
    '/utils/json_serialize': (BuildContext context) => JsonSerializePage(),
    '/utils/provider': (BuildContext context) => ProviderPage(),
    '/utils/provider_next': (BuildContext context) => ProviderNextPage(),
    '/utils/device_info': (BuildContext context) => DeviceInfoPage(),
    '/utils/bugly': (BuildContext context) => BuglyPage(),


    //============================expand=================================//

    '/expand/web_page': (BuildContext context) => WebPage(),
    '/expand/image_picker': (BuildContext context) => ImagePickerPage(),
    '/expand/multi_image_picker': (BuildContext context) => MultiImagePickerPage(),
    '/expand/date_picker': (BuildContext context) => DatePickerPage(),
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
    ListItem(Icons.list, "CustomScrollView", "自定义滚动模型", '/widget/custom_scrollview'),
    ListItem(Icons.refresh, "进度条显示", "简单的进度条使用", '/widget/progress'),
    ListItem(Icons.credit_card, "卡片", "简单的卡片使用", '/widget/cardview'),
    ListItem(Icons.gesture, "手势动作", "单击、双击、长按、缩放等手势动作", '/widget/gesture'),
    ListItem(Icons.gesture, "拖拽动作", "简单的拖拽动作", '/widget/drag'),
    ListItem(Icons.layers, "线性布局", "Flutter中通过Row和Column来实现线性布局，类似于Android中的LinearLayout控件", '/widget/layout_linear'),
    ListItem(Icons.layers, "弹性(权重)布局", "Flutter中的弹性布局主要通过Flex和Expanded来配合实现", '/widget/layout_flex'),
    ListItem(Icons.layers, "流式布局", "Flutter中通过Wrap和Flow来支持流式布局", '/widget/layout_wrap'),
    ListItem(Icons.layers, "层叠(框架)布局", "类似于Android中的FrameLayout布局，子组件可以根据距父容器四个角的位置来确定自身的位置。", '/widget/layout_stack'),
    ListItem(Icons.layers, "定位布局", "Flutter中只想简单的调整一个子元素在父元素中的位置,只需使用Align即可.", '/widget/layout_align'),
    ListItem(Icons.check_box_outline_blank, "尺寸限制类容器", "尺寸限制类容器用于限制容器大小，Flutter中提供了多种这样的容器，如ConstrainedBox、SizedBox、UnconstrainedBox、AspectRatio等", '/widget/constrained_box'),
    ListItem(Icons.check_box_outline_blank, "装饰容器", "可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等", '/widget/decorated_box'),
    ListItem(Icons.transform, "控件变换", "Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效.", '/widget/transform'),
    ListItem(Icons.check_box_outline_blank, "万能的Container容器", "Container是一个组合类容器，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器.", '/widget/containter'),
    ListItem(Icons.content_cut, "控件裁剪", "Flutter中提供了ClipOval(圆形)、ClipRRect(圆角矩形)和ClipRect(矩形).", '/widget/clip'),
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
    ListItem(Icons.notifications, "极光推送", "极光推送详细使用", '/utils/jpush'),
    ListItem(Icons.date_range, "Json序列化", "Json序列化和反序列化", '/utils/json_serialize'),
    ListItem(Icons.date_range, "状态同步", "使用provider进行简单的状态同步", '/utils/provider'),
    ListItem(Icons.devices, "设备信息", "获取设备的详尽信息", '/utils/device_info'),
    ListItem(Icons.report, "应用数据统计", "Bugly的应用", '/utils/bugly'),
  ];

  /*
   * 拓展
   */
  static final List<ListItem> expandItems = [
    ListItem(Icons.radio_button_checked, "网页加载", "简单的网页加载", '/expand/web_page'),
    ListItem(Icons.image, "单图片选择", "单图片选择的简单使用", '/expand/image_picker'),
    ListItem(Icons.image, "多图片选择", "多图片选择的简单使用", '/expand/multi_image_picker'),
    ListItem(Icons.date_range, "日期选择器", "日期选择器的简单使用", '/expand/date_picker'),
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
