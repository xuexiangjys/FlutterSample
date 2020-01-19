# FlutterSample

Flutter使用指南,包含众多组件和插件的使用


## 包含内容

### 组件

* [AppBar(标题)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/appbar.dart)
* [BottomNavigationBar(底部导航栏)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/bottom_navigation_bar.dart)
* [Button(按钮)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/button.dart)
* [CardView(卡片)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/cardview.dart)
* [Control(控制开关)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/control.dart)
* [Dialog(对话框)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/dialog.dart)
* [Drag(拖拽)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/drag.dart)
* [Drawer(侧滑菜单)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/drawer.dart)
* [Form(表单)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/form.dart)
* [Gesture(手势)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/gesture.dart)
* [Image(图片)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/image.dart)
* [Input(输入框)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/input.dart)
* [NestedScrollView(滚动页)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/nested_scrollview.dart)
* [Progress(进度条)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/progress.dart)
* [Tab(选项卡)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/tab.dart)
* [Text(文字)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/widget/text.dart)

### 工具

* [DeviceInfo(设备信息)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/device_info.dart)
* [EventBus(事件总线)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/event_bus.dart)
* [JPush(极光推送)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/jpush.dart)
* [JsonSerialize(序列化)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/json_serialize.dart)
* [MMKV(键值对保存)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/mmkv.dart)
* [Navigator(导航路由)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/navigator.dart)
* [Net(网络请求)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/net.dart)
* [Provider(数据共享)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/provider.dart)
* [SharedPreferences(持久化)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/shared_preferences.dart)
* [Sqlite(数据库)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/sqlite.dart)
* [Toast(吐司提示)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/utils/toast.dart)

### 第三方插件

* [DatePicker(时间选择)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/date_picker.dart)
* [EasyRefresh(下拉加载上拉刷新)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/easy_refresh.dart)
* [IconFont(字体图标)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/iconfont.dart)
* [ImagePicker(单图片选择)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/image_picker.dart)
* [MultiImagePicker(多图片选择)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/multi_image_picker.dart)
* [Spinkit(loading动画)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/spinkit.dart)
* [Swiper(轮播图)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/swiper.dart)
* [Web(网页加载)](https://github.com/xuexiangjys/FlutterSample/blob/master/flutter_learn/lib/page/expand/web.dart)


## 插件查询

[flutter插件平台](https://pub.dev/flutter/packages)

## 常用命令

1.编译：
* `flutter packages get`: 获取flutter packages包

2.运行：
* `flutter run` （默认为debug环境）
* `flutter run --release` (以release模式运行)

3.安装
* 帮助：`flutter -h` 或 `flutter --help`
* 诊断flutter：`flutter doctor`
* 查看flutter版本号：`flutter --version`
* flutter升级：`flutter upgrade`

4.打包apk包：
* 直接打包：
`flutter build apk`
* 64位-release：
`flutter build apk --release --target-platform android-arm64`
* 32位-release：
`flutter build apk --release --target-platform android-arm`
