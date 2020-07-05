import 'package:flutter/material.dart';
import 'package:flutter_learn/i10n/messages_all.dart';
import 'package:intl/intl.dart';

////国际化
class Languages {
  static Future<Languages> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new Languages();
    });
  }

  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get title => Intl.message('Flutter Learn', name: 'title');
  String get login => Intl.message('Login', name: 'login');
  String get logout => Intl.message('Logout', name: 'logout');
  String get loginName => Intl.message('LoginName', name: 'loginName');
  String get loginNameHint =>
      Intl.message('Please enter your login name or email',
          name: 'loginNameHint');
  String get loginNameError =>
      Intl.message('LoginName cannot be empty!', name: 'loginNameError');
  String get password => Intl.message('Password', name: 'password');
  String get passwordHint =>
      Intl.message('Please enter your password', name: 'passwordHint');
  String get passwordError =>
      Intl.message('Password cannot be less than 6 digits!',
          name: 'passwordError');
  String get repeatPassword =>
      Intl.message('Repeat Password', name: 'repeatPassword');
  String get passwordsInconsistent =>
      Intl.message('Passwords are inconsistent!',
          name: 'passwordsInconsistent');
  String get register => Intl.message('Register', name: 'register');
  String get loginSuccess =>
      Intl.message('Login Success', name: 'loginSuccess');
  String get registerSuccess =>
      Intl.message('Register Success', name: 'registerSuccess');
  String get theme => Intl.message('Theme', name: 'theme');
  String get language => Intl.message('Language', name: 'language');
  String get chinese => Intl.message('Chinese', name: 'chinese');
  String get english => Intl.message('English', name: 'english');
  String get auto => Intl.message('Auto', name: 'auto');
  String get widget => Intl.message('Widget', name: 'widget');
  String get utils => Intl.message('Utils', name: 'utils');
  String get expand => Intl.message('Expand', name: 'expand');
  String get about => Intl.message('About', name: 'about');
  String get versionName => Intl.message('Version', name: 'versionName');
  String get author => Intl.message('Author', name: 'author');
  String get qqgroup => Intl.message('QQ Group', name: 'qqgroup');
  String get appupdate => Intl.message('AppUpdate', name: 'appupdate');
  String get sponsor => Intl.message('Sponsor', name: 'sponsor');
  String get sponsorDescription => Intl.message(
      'Your reward is the motivation for me to maintain. I will make a list of all reward staff on GitHub as a voucher.',
      name: 'sponsorDescription');

  String get appBar => Intl.message('AppBar', name: 'appBar');
  String get bottomNavigationBar =>
      Intl.message('BottomNavigationBar', name: 'bottomNavigationBar');
  String get button => Intl.message('Button', name: 'button');
  String get cardView => Intl.message('CardView', name: 'cardView');
  String get control => Intl.message('Control', name: 'control');
  String get dialog => Intl.message('Dialog', name: 'dialog');
  String get drag => Intl.message('Drag', name: 'drag');
  String get drawer => Intl.message('Drawer', name: 'drawer');
  String get emptyPage => Intl.message('EmptyPage', name: 'emptyPage');
  String get form => Intl.message('Form', name: 'form');
  String get futureBuilder =>
      Intl.message('FutureBuilder', name: 'futureBuilder');
  String get gesture => Intl.message('Gesture', name: 'gesture');
  String get image => Intl.message('Image', name: 'image');
  String get cachedNetWorkImage =>
      Intl.message('CachedNetWorkImage', name: 'cachedNetWorkImage');
  String get imageZoom => Intl.message('ImageZoom', name: 'imageZoom');
  String get input => Intl.message('Input', name: 'input');
  String get notification => Intl.message('Notification', name: 'notification');
  String get progress => Intl.message('Progress', name: 'progress');
  String get tab => Intl.message('Tab', name: 'tab');
  String get text => Intl.message('Text', name: 'text');
  String get scrollView => Intl.message('ScrollView', name: 'scrollView');
  String get customScrollView =>
      Intl.message('CustomScrollView', name: 'customScrollView');
  String get nestedScrollView =>
      Intl.message('NestedScrollView', name: 'nestedScrollView');
  String get scrollController =>
      Intl.message('ScrollController', name: 'scrollController');
  String get layout => Intl.message('Layout', name: 'layout');
  String get alignLayout => Intl.message('AlignLayout', name: 'alignLayout');
  String get flexLayout => Intl.message('FlexLayout', name: 'flexLayout');
  String get linearLayout => Intl.message('LinearLayout', name: 'linearLayout');
  String get stackLayout => Intl.message('StackLayout', name: 'stackLayout');
  String get wrapLayout => Intl.message('WrapLayout', name: 'wrapLayout');
  String get containerPage => Intl.message('Container', name: 'containerPage');
  String get constrainedBox =>
      Intl.message('ConstrainedBox', name: 'constrainedBox');
  String get container => Intl.message('Container', name: 'container');
  String get decoratedBox => Intl.message('DecoratedBox', name: 'decoratedBox');
  String get transform => Intl.message('Transform', name: 'transform');
  String get clip => Intl.message('Clip', name: 'clip');
  String get animation => Intl.message('Animation', name: 'animation');
  String get basicAnimation =>
      Intl.message('BasicAnimation', name: 'basicAnimation');
  String get staggerAnimation =>
      Intl.message('StaggerAnimation', name: 'staggerAnimation');
  String get transitionAnimations =>
      Intl.message('TransitionAnimations', name: 'transitionAnimations');
  String get customWidget => Intl.message('CustomWidget', name: 'customWidget');
  String get combinationWidget =>
      Intl.message('CombinationWidget', name: 'combinationWidget');
  String get drawingWidget =>
      Intl.message('DrawingWidget', name: 'drawingWidget');

  String get battery => Intl.message('Battery', name: 'battery');
  String get bugly => Intl.message('Bugly', name: 'bugly');
  String get complexCamera =>
      Intl.message('ComplexCamera', name: 'complexCamera');
  String get camera => Intl.message('Camera', name: 'camera');
  String get deviceInfo => Intl.message('DeviceInfo', name: 'deviceInfo');
  String get eventBus => Intl.message('EventBus', name: 'eventBus');
  String get jpush => Intl.message('JPush', name: 'jpush');
  String get jsonSerialize =>
      Intl.message('JsonSerialize', name: 'jsonSerialize');
  String get mmkv => Intl.message('MMKV', name: 'mmkv');
  String get navigator => Intl.message('Navigator', name: 'navigator');
  String get netRequest => Intl.message('NetRequest', name: 'netRequest');
  String get packageInfo => Intl.message('PackageInfo', name: 'packageInfo');
  String get filePath => Intl.message('FilePath', name: 'filePath');
  String get providerNext => Intl.message('ProviderNext', name: 'providerNext');
  String get provider => Intl.message('Provider', name: 'provider');
  String get share => Intl.message('Share', name: 'share');
  String get sharedPreferences =>
      Intl.message('SharedPreferences', name: 'sharedPreferences');
  String get sqlite => Intl.message('Sqlite', name: 'sqlite');
  String get toast => Intl.message('Toast', name: 'toast');
  String get url => Intl.message('Url', name: 'url');
  String get videoPlayer => Intl.message('VideoPlayer', name: 'videoPlayer');
  String get permissionApply =>
      Intl.message('PermissionApply', name: 'permissionApply');
  String get appBadge => Intl.message('AppBadge', name: 'appBadge');
  String get localNotification =>
      Intl.message('Notification', name: 'localNotification');

  String get badge => Intl.message('Badge', name: 'badge');
  String get picker => Intl.message('Picker', name: 'picker');
  String get cityPicker => Intl.message('CityPicker', name: 'cityPicker');
  String get datePicker => Intl.message('DatePicker', name: 'datePicker');
  String get classPicker => Intl.message('ClassPicker', name: 'classPicker');
  String get iconFont => Intl.message('IconFont', name: 'iconFont');
  String get imagePicker => Intl.message('ImagePicker', name: 'imagePicker');
  String get multiImagePicker =>
      Intl.message('MultiImagePicker', name: 'multiImagePicker');
  String get spinkit => Intl.message('Spinkit', name: 'spinkit');
  String get swiper => Intl.message('Swiper', name: 'swiper');
  String get web => Intl.message('Web', name: 'web');
  String get easyRefresh => Intl.message('EasyRefresh', name: 'easyRefresh');
  String get ballPulseRefresh =>
      Intl.message('BallPulseRefresh', name: 'ballPulseRefresh');
  String get basicRefresh => Intl.message('BasicRefresh', name: 'basicRefresh');
  String get materialRefresh =>
      Intl.message('MaterialRefresh', name: 'materialRefresh');
  String get userProfile => Intl.message('UserProfile', name: 'userProfile');
  String get qrcode => Intl.message('QRCode', name: 'qrcode');
}

//Locale代理类
class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<Languages> load(Locale locale) {
    return Languages.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
