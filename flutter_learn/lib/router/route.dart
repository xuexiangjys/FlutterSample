import 'package:flutter/material.dart';
import 'package:flutter_learn/home.dart';
import 'package:flutter_learn/page/expand/date_picker.dart';
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
import 'package:flutter_learn/page/utils/battery.dart';
import 'package:flutter_learn/page/utils/bugly.dart';
import 'package:flutter_learn/page/utils/camera_simple.dart';
import 'package:flutter_learn/page/utils/device_info.dart';
import 'package:flutter_learn/page/utils/event_bus.dart';
import 'package:flutter_learn/page/utils/jpush.dart';
import 'package:flutter_learn/page/utils/json_serialize.dart';
import 'package:flutter_learn/page/utils/mmkv.dart';
import 'package:flutter_learn/page/utils/navigator.dart';
import 'package:flutter_learn/page/utils/net.dart';
import 'package:flutter_learn/page/utils/package_info.dart';
import 'package:flutter_learn/page/utils/path.dart';
import 'package:flutter_learn/page/utils/provider.dart';
import 'package:flutter_learn/page/utils/provider_next.dart';
import 'package:flutter_learn/page/utils/share.dart';
import 'package:flutter_learn/page/utils/shared_preferences.dart';
import 'package:flutter_learn/page/utils/sqlite.dart';
import 'package:flutter_learn/page/utils/toast.dart';
import 'package:flutter_learn/page/utils/url.dart';
import 'package:flutter_learn/page/utils/video.dart';
import 'package:flutter_learn/page/widget/anim/basic_animation.dart';
import 'package:flutter_learn/page/widget/anim/stagger_animation.dart';
import 'package:flutter_learn/page/widget/anim/transition_animations.dart';
import 'package:flutter_learn/page/widget/appbar.dart';
import 'package:flutter_learn/page/widget/bottom_navigation_bar.dart';
import 'package:flutter_learn/page/widget/button.dart';
import 'package:flutter_learn/page/widget/cardview.dart';
import 'package:flutter_learn/page/widget/contain/clip.dart';
import 'package:flutter_learn/page/widget/contain/constrained_box.dart';
import 'package:flutter_learn/page/widget/contain/container.dart';
import 'package:flutter_learn/page/widget/contain/decorated_box.dart';
import 'package:flutter_learn/page/widget/contain/transform.dart';
import 'package:flutter_learn/page/widget/control.dart';
import 'package:flutter_learn/page/widget/custom/combination_widget.dart';
import 'package:flutter_learn/page/widget/custom/drawing_widget.dart';
import 'package:flutter_learn/page/widget/dialog.dart';
import 'package:flutter_learn/page/widget/drag.dart';
import 'package:flutter_learn/page/widget/drawer.dart';
import 'package:flutter_learn/page/widget/empty.dart';
import 'package:flutter_learn/page/widget/form.dart';
import 'package:flutter_learn/page/widget/future_builder.dart';
import 'package:flutter_learn/page/widget/gesture.dart';
import 'package:flutter_learn/page/widget/image/cached_network_image.dart';
import 'package:flutter_learn/page/widget/image/image.dart';
import 'package:flutter_learn/page/widget/image/image_zoom.dart';
import 'package:flutter_learn/page/widget/input.dart';
import 'package:flutter_learn/page/widget/layout/layout_align.dart';
import 'package:flutter_learn/page/widget/layout/layout_flex.dart';
import 'package:flutter_learn/page/widget/layout/layout_linear.dart';
import 'package:flutter_learn/page/widget/layout/layout_stack.dart';
import 'package:flutter_learn/page/widget/layout/layout_wrap.dart';
import 'package:flutter_learn/page/widget/notification.dart';
import 'package:flutter_learn/page/widget/progress.dart';
import 'package:flutter_learn/page/widget/scrollview/custom_scrollview.dart';
import 'package:flutter_learn/page/widget/scrollview/nested_scrollview.dart';
import 'package:flutter_learn/page/widget/scrollview/scroll_controller.dart';
import 'package:flutter_learn/page/widget/tab.dart';
import 'package:flutter_learn/page/widget/text.dart';
import 'package:flutter_learn/view/listview_page.dart';
import 'package:flutter_learn/view/simple_list_page.dart';
import 'package:flutter_learn/i10n/localization_intl.dart';

class RouteMap {
  static final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => MainHomePage(),
    '/empty': (BuildContext context) => EmptyPage(title: Languages.of(context).emptyPage),


    //============================widget=================================//

    '/widget/appbar': (BuildContext context) => AppBarPage(Languages.of(context).appBar),
    '/widget/button': (BuildContext context) => ButtonPage(Languages.of(context).button),
    '/widget/bottom_navigation_bar': (BuildContext context) => BottomNavigationBarPage(Languages.of(context).bottomNavigationBar),
    '/widget/cardview': (BuildContext context) => CardViewPage(Languages.of(context).cardView),
    '/widget/control': (BuildContext context) => ControlPage(Languages.of(context).control),
    '/widget/text': (BuildContext context) => TextPage(Languages.of(context).text),
    '/widget/input': (BuildContext context) => InputPage(Languages.of(context).input),
    '/widget/form': (BuildContext context) => FormPage(Languages.of(context).form),
    '/widget/tab': (BuildContext context) => TabPage(Languages.of(context).tab),
    '/widget/dialog': (BuildContext context) => DialogPage(Languages.of(context).dialog),
    '/widget/drawer': (BuildContext context) => DrawerPage(Languages.of(context).drawer),
    '/widget/progress': (BuildContext context) => ProgressPage(Languages.of(context).progress),
    '/widget/gesture': (BuildContext context) => GesturePage(Languages.of(context).gesture),
    '/widget/drag': (BuildContext context) => DragPage(Languages.of(context).drag),
    '/widget/future_builder': (BuildContext context) => FutureBuilderPage(Languages.of(context).futureBuilder),
    '/widget/notification': (BuildContext context) => NotificationPage(Languages.of(context).notification),

    '/widget/image': (BuildContext context) => SimpleListPage(Languages.of(context).image, imageItems(context)),
    '/widget/image/image': (BuildContext context) => ImagePage(Languages.of(context).image),
    '/widget/image/cached_network_image': (BuildContext context) => CachedNetWorkImagePage(Languages.of(context).cachedNetWorkImage),
    '/widget/image/zoom': (BuildContext context) => ImageZoomPage(Languages.of(context).imageZoom),

    '/widget/scrollview': (BuildContext context) => SimpleListPage(Languages.of(context).scrollView, scrollViewItems(context)),
    '/widget/scrollview/nested_scrollview': (BuildContext context) => NestedScrollViewPage(Languages.of(context).nestedScrollView),
    '/widget/scrollview/custom_scrollview': (BuildContext context) => CustomScrollViewPage(Languages.of(context).customScrollView),
    '/widget/scrollview/scroll_controller': (BuildContext context) => ScrollControllerPage(Languages.of(context).scrollController),

    '/widget/layout': (BuildContext context) => SimpleListPage(Languages.of(context).layout, layoutItems(context)),
    '/widget/layout/linear': (BuildContext context) => LinearLayoutPage(Languages.of(context).linearLayout),
    '/widget/layout/flex': (BuildContext context) => FlexLayoutPage(Languages.of(context).flexLayout),
    '/widget/layout/wrap': (BuildContext context) => WrapLayoutPage(Languages.of(context).wrapLayout),
    '/widget/layout/stack': (BuildContext context) => StackLayoutPage(Languages.of(context).stackLayout),
    '/widget/layout/align': (BuildContext context) => AlignLayoutPage(Languages.of(context).alignLayout),
    
    '/widget/container': (BuildContext context) => SimpleListPage(Languages.of(context).containerPage, containerItems(context)),
    '/widget/container/constrained_box': (BuildContext context) => ConstrainedBoxPage(Languages.of(context).constrainedBox),
    '/widget/container/decorated_box': (BuildContext context) => DecoratedBoxPage(Languages.of(context).decoratedBox),
    '/widget/container/transform': (BuildContext context) => TransformPage(Languages.of(context).transform),
    '/widget/container/container': (BuildContext context) => ContainerPage(Languages.of(context).container),
    '/widget/container/clip': (BuildContext context) => ClipPage(Languages.of(context).clip),

    '/widget/animation': (BuildContext context) => SimpleListPage(Languages.of(context).animation, animItems(context)),
    '/widget/animation/basic_animation': (BuildContext context) => BasicAnimationPage(Languages.of(context).basicAnimation),
    '/widget/animation/stagger_animation': (BuildContext context) => StaggerAnimationPage(Languages.of(context).staggerAnimation),
    '/widget/animation/transition_animations': (BuildContext context) => TransitionAnimationsPage(Languages.of(context).transitionAnimations),

    '/widget/custom_widget': (BuildContext context) => SimpleListPage(Languages.of(context).customWidget, customWidgetItems(context)),
    '/widget/custom_widget/combination_widget': (BuildContext context) => CombinationWidgetPage(Languages.of(context).combinationWidget),
    '/widget/custom_widget/drawing_widget': (BuildContext context) => DrawingWidgetPage(Languages.of(context).drawingWidget),


    //============================utils=================================//

    '/utils/navigator': (BuildContext context) => NavigatorPage(Languages.of(context).navigator),
    '/utils/net': (BuildContext context) => NetRequestPage(Languages.of(context).netRequest),
    '/utils/toast': (BuildContext context) => ToastPage(Languages.of(context).toast),
    '/utils/mmkv': (BuildContext context) => MMKVPage(Languages.of(context).mmkv),
    '/utils/shared_preferences': (BuildContext context) => SharedPreferencesPage(Languages.of(context).sharedPreferences),
    '/utils/sqlite': (BuildContext context) => SqlitePage(Languages.of(context).sqlite),
    '/utils/event_bus': (BuildContext context) => EventBusPage(Languages.of(context).eventBus),
    '/utils/jpush': (BuildContext context) => JPushPage(Languages.of(context).jpush),
    '/utils/json_serialize': (BuildContext context) => JsonSerializePage(Languages.of(context).jsonSerialize),
    '/utils/provider': (BuildContext context) => ProviderPage(Languages.of(context).provider),
    '/utils/provider_next': (BuildContext context) => ProviderNextPage(Languages.of(context).providerNext),
    '/utils/device_info': (BuildContext context) => DeviceInfoPage(Languages.of(context).deviceInfo),
    '/utils/bugly': (BuildContext context) => BuglyPage(Languages.of(context).bugly),
    '/utils/share': (BuildContext context) => SharePage(Languages.of(context).share),
    '/utils/url': (BuildContext context) => UrlPage(Languages.of(context).url),
    '/utils/battery': (BuildContext context) => BatteryPage(Languages.of(context).battery),
    '/utils/package_info': (BuildContext context) => PackageInfoPage(Languages.of(context).packageInfo),
    '/utils/file_path': (BuildContext context) => FilePathPage(Languages.of(context).filePath),
    '/utils/video_player': (BuildContext context) => VideoPlayerPage(Languages.of(context).videoPlayer),
    '/utils/camera': (BuildContext context) => CameraPage(Languages.of(context).camera),

    //============================expand=================================//

    '/expand/web_page': (BuildContext context) => WebPage(Languages.of(context).web),
    '/expand/image_picker': (BuildContext context) => ImagePickerPage(Languages.of(context).imagePicker),
    '/expand/multi_image_picker': (BuildContext context) => MultiImagePickerPage(Languages.of(context).multiImagePicker),
    '/expand/date_picker': (BuildContext context) => DatePickerPage(Languages.of(context).datePicker),
    '/expand/iconfont': (BuildContext context) => IconFontPage(Languages.of(context).iconFont),
    '/expand/spinkit': (BuildContext context) => SpinkitPage(Languages.of(context).spinkit),
    '/expand/swiper': (BuildContext context) => SwiperPage(Languages.of(context).swiper),

    '/expand/easy_refresh': (BuildContext context) => SimpleListPage(Languages.of(context).easyRefresh, refreshItems(context)),
    '/expand/easy_refresh/basic': (BuildContext context) => BasicRefreshPage(Languages.of(context).basicRefresh),
    '/expand/easy_refresh/material': (BuildContext context) => MaterialRefreshPage(Languages.of(context).materialRefresh),
    '/expand/easy_refresh/ball_pulse': (BuildContext context) => BallPulseRefreshPage(Languages.of(context).ballPulseRefresh),
    '/expand/easy_refresh/user_profile': (BuildContext context) => UserProfilePage(Languages.of(context).userProfile),

  };

  ///组件
  static List<ListItem> getWidgetItems(BuildContext context) => [
    ListItem(Icons.title, Languages.of(context).appBar, "简单的标题使用", '/widget/appbar'),
    ListItem(Icons.radio_button_checked, Languages.of(context).button, "简单的按钮使用", '/widget/button'),
    ListItem(Icons.navigation, Languages.of(context).bottomNavigationBar, "简单的底部导航栏使用", '/widget/bottom_navigation_bar'),
    ListItem(Icons.check_box, Languages.of(context).control, "简单的控制组件使用", '/widget/control'),
    ListItem(Icons.text_fields, Languages.of(context).text, "简单的文字使用", '/widget/text'),
    ListItem(Icons.input, Languages.of(context).input, "简单的输入框使用", '/widget/input'),
    ListItem(Icons.input, Languages.of(context).form, "简单的表单使用", '/widget/form'),
    ListItem(Icons.image, Languages.of(context).image, "图片使用", '/widget/image'),
    ListItem(Icons.tab, Languages.of(context).tab, "简单的选项卡使用", '/widget/tab'),
    ListItem(Icons.notifications, Languages.of(context).dialog, "简单的对话框使用", '/widget/dialog'),
    ListItem(Icons.menu, Languages.of(context).drawer, "简单侧滑菜单的使用", '/widget/drawer'),
    ListItem(Icons.refresh, Languages.of(context).progress, "简单的进度条使用", '/widget/progress'),
    ListItem(Icons.credit_card, Languages.of(context).cardView, "简单的卡片使用", '/widget/cardview'),
    ListItem(Icons.gesture, Languages.of(context).gesture, "单击、双击、长按、缩放等手势动作", '/widget/gesture'),
    ListItem(Icons.gesture, Languages.of(context).drag, "简单的拖拽动作", '/widget/drag'),
    ListItem(Icons.sync, Languages.of(context).futureBuilder, "对于一些耗时数据的加载展示可以使用FutureBuilder构建", '/widget/future_builder'),
    ListItem(Icons.notifications, Languages.of(context).notification, "通知（Notification）是Flutter中一个重要的机制，在widget树中，每一个节点都可以分发通知，通知会沿着当前节点向上传递，所有父节点都可以通过NotificationListener来监听通知。", '/widget/notification'),
    ListItem(Icons.list, Languages.of(context).scrollView, "嵌套滚动、自定义滚动、滚动控制和滚动监听", '/widget/scrollview'),
    ListItem(Icons.layers, Languages.of(context).layout, "线性布局、弹性布局、流式布局、框架布局和定位布局", '/widget/layout'),
    ListItem(Icons.check_box_outline_blank, Languages.of(context).containerPage, "尺寸限制容器、装饰容器、控件变换、万能容器和控件裁剪", '/widget/container'),
    ListItem(Icons.brightness_auto, Languages.of(context).animation, "基础动画、交织(复杂)动画和动画过渡组件等", '/widget/animation'),
    ListItem(Icons.widgets, Languages.of(context).customWidget, "自定义组件的三个方法: 通过组合其它组件、自绘和实现RenderObject", '/widget/custom_widget'),
  ];

  ///工具
  static List<ListItem> getUtilsItems(BuildContext context) => [
    ListItem(Icons.navigation, Languages.of(context).navigator, "详解页面路由跳转", '/utils/navigator'),
    ListItem(Icons.http, Languages.of(context).netRequest, "详解dio的使用", '/utils/net'),
    ListItem(Icons.info, Languages.of(context).toast, "详解Toast的使用", '/utils/toast'),
    ListItem(Icons.data_usage, Languages.of(context).mmkv, "腾讯MMKV键值对使用", '/utils/mmkv'),
    ListItem(Icons.data_usage, Languages.of(context).sharedPreferences, "SharedPreferences键值对使用", '/utils/shared_preferences'),
    ListItem(Icons.date_range, Languages.of(context).sqlite, "Sqlite增删改查操作", '/utils/sqlite'),
    ListItem(Icons.event, Languages.of(context).eventBus, "EventBus事件使用", '/utils/event_bus'),
    ListItem(Icons.notifications, Languages.of(context).jpush, "极光推送详细使用", '/utils/jpush'),
    ListItem(Icons.date_range, Languages.of(context).jsonSerialize, "Json序列化和反序列化", '/utils/json_serialize'),
    ListItem(Icons.date_range, Languages.of(context).provider, "使用provider进行简单的状态同步", '/utils/provider'),
    ListItem(Icons.devices, Languages.of(context).deviceInfo, "获取设备的详尽信息", '/utils/device_info'),
    ListItem(Icons.report, Languages.of(context).bugly, "Bugly的应用", '/utils/bugly'),
    ListItem(Icons.share, Languages.of(context).share, "文本分享", '/utils/share'),
    ListItem(Icons.format_underlined, Languages.of(context).url, "网页、邮件、电话、短信等链接", '/utils/url'),
    ListItem(Icons.battery_std, Languages.of(context).battery, "电量、状态显示", '/utils/battery'),
    ListItem(Icons.apps, Languages.of(context).packageInfo, "应用名、包名、版本", '/utils/package_info'),
    ListItem(Icons.attach_file, Languages.of(context).filePath, "文件路径", '/utils/file_path'),
    ListItem(Icons.video_library, Languages.of(context).videoPlayer, "flutter官方视频播放插件", '/utils/video_player'),
    ListItem(Icons.camera, Languages.of(context).camera, "拍摄照片", '/utils/camera'),
  ];

  ///拓展
  static List<ListItem> getExpandItems(BuildContext context) => [
    ListItem(Icons.radio_button_checked, Languages.of(context).web, "简单的网页加载", '/expand/web_page'),
    ListItem(Icons.image, Languages.of(context).imagePicker, "单图片选择的简单使用", '/expand/image_picker'),
    ListItem(Icons.image, Languages.of(context).multiImagePicker, "多图片选择的简单使用", '/expand/multi_image_picker'),
    ListItem(Icons.date_range, Languages.of(context).datePicker, "日期选择器的简单使用", '/expand/date_picker'),
    ListItem(Icons.font_download, Languages.of(context).iconFont, "使用自定义的字体图标", '/expand/iconfont'),
    ListItem(Icons.refresh, Languages.of(context).spinkit, "使用更多有趣的loading动画", '/expand/spinkit'),
    ListItem(Icons.pages, Languages.of(context).swiper, "使用Swiper构建丰富多彩的轮播图", '/expand/swiper'),
    ListItem(Icons.system_update, Languages.of(context).easyRefresh, "使用EasyRefresh构建丰富的下拉刷新样式", '/expand/easy_refresh'),
  ];

  ///图片演示
  static List<ListItem> imageItems (BuildContext context) =>  [
    ListItem(Icons.image, Languages.of(context).image, "简单的图片使用", '/widget/image/image'),
    ListItem(Icons.image, Languages.of(context).cachedNetWorkImage, "网络图片加载, 可设置placeholder和errorWidget", '/widget/image/cached_network_image'),
    ListItem(Icons.image, Languages.of(context).imageZoom, "可根据手势放大和缩小图片", '/widget/image/zoom'),
  ];

  ///列表滚动演示
  static List<ListItem> scrollViewItems (BuildContext context) =>  [
    ListItem(Icons.list, Languages.of(context).nestedScrollView, "嵌套滚动联动的使用", '/widget/scrollview/nested_scrollview'),
    ListItem(Icons.list, Languages.of(context).customScrollView, "自定义滚动模型", '/widget/scrollview/custom_scrollview'),
    ListItem(Icons.list, Languages.of(context).scrollController, "滚动控制、滚动监听", '/widget/scrollview/scroll_controller'),
  ];

  ///布局演示
  static List<ListItem> layoutItems (BuildContext context) => [
    ListItem(Icons.layers, Languages.of(context).linearLayout, "Flutter中通过Row和Column来实现线性布局，类似于Android中的LinearLayout控件", '/widget/layout/linear'),
    ListItem(Icons.layers, Languages.of(context).flexLayout, "Flutter中的弹性布局主要通过Flex和Expanded来配合实现", '/widget/layout/flex'),
    ListItem(Icons.layers, Languages.of(context).wrapLayout, "Flutter中通过Wrap和Flow来支持流式布局", '/widget/layout/wrap'),
    ListItem(Icons.layers, Languages.of(context).stackLayout, "类似于Android中的FrameLayout布局，子组件可以根据距父容器四个角的位置来确定自身的位置。", '/widget/layout/stack'),
    ListItem(Icons.layers, Languages.of(context).alignLayout, "Flutter中只想简单的调整一个子元素在父元素中的位置,只需使用Align即可.", '/widget/layout/align'),
  ];

  ///容器演示
  static List<ListItem> containerItems (BuildContext context) =>  [
    ListItem(Icons.check_box_outline_blank, Languages.of(context).constrainedBox, "尺寸限制类容器用于限制容器大小，Flutter中提供了多种这样的容器，如ConstrainedBox、SizedBox、UnconstrainedBox、AspectRatio等", '/widget/container/constrained_box'),
    ListItem(Icons.check_box_outline_blank, Languages.of(context).decoratedBox, "可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等", '/widget/container/decorated_box'),
    ListItem(Icons.transform, Languages.of(context).transform, "Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效.", '/widget/container/transform'),
    ListItem(Icons.check_box_outline_blank, Languages.of(context).container, "Container是一个组合类容器，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器.", '/widget/container/container'),
    ListItem(Icons.content_cut, Languages.of(context).clip, "Flutter中提供了ClipOval(圆形)、ClipRRect(圆角矩形)和ClipRect(矩形).", '/widget/container/clip'),
  ];

  ///动画演示
  static List<ListItem> animItems (BuildContext context) => [
    ListItem(Icons.brightness_auto, Languages.of(context).basicAnimation, "使用AnimatedBuilder构建动画。", '/widget/animation/basic_animation'),
    ListItem(Icons.brightness_auto, Languages.of(context).staggerAnimation, "由一个动画序列或重叠的动画组成的复杂动画", '/widget/animation/stagger_animation'),
    ListItem(Icons.brightness_auto, Languages.of(context).transitionAnimations, "动画过渡组件在Widget属性发生变化时会执行过渡动画", '/widget/animation/transition_animations'),
  ];

  ///自定义组件演示
  static List<ListItem> customWidgetItems (BuildContext context) => [
    ListItem(Icons.widgets, Languages.of(context).combinationWidget, "通过组合其它组件完成封装", '/widget/custom_widget/combination_widget'),
    ListItem(Icons.widgets, Languages.of(context).drawingWidget, "在Flutter中，提供了一个CustomPaint 组件，它可以结合画笔CustomPainter来实现自定义图形绘制。", '/widget/custom_widget/drawing_widget'),
  ];


  ///下拉刷新组件
  static List<ListItem> refreshItems (BuildContext context) => [
    ListItem(Icons.list, Languages.of(context).basicRefresh, "EasyRefresh的基本使用", '/expand/easy_refresh/basic'),
    ListItem(Icons.list, Languages.of(context).materialRefresh, "Material Design风格样式", '/expand/easy_refresh/material'),
    ListItem(Icons.list, Languages.of(context).ballPulseRefresh, "球脉冲样式", '/expand/easy_refresh/ball_pulse'),
    ListItem(Icons.person, Languages.of(context).userProfile, "带回弹效果的个人中心", '/expand/easy_refresh/user_profile'),
  ];


}
