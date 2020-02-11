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
  String get theme => Intl.message('Theme', name: 'theme');
  String get language => Intl.message('Language', name: 'language');
  String get chinese => Intl.message('Chinese', name: 'chinese');
  String get english => Intl.message('English', name: 'english');
  String get auto => Intl.message('Auto', name: 'auto');
  String get widget => Intl.message('Widget', name: 'widget');
  String get utils => Intl.message('Utils', name: 'utils');
  String get expand => Intl.message('Expand', name: 'expand');

  String get appBar => Intl.message('AppBar', name: 'appBar');
  String get bottomNavigationBar => Intl.message('BottomNavigationBar', name: 'bottomNavigationBar');
  String get button => Intl.message('Button', name: 'button');
  String get cardView => Intl.message('CardView', name: 'cardView');
  String get control => Intl.message('Control', name: 'control');
  String get dialog => Intl.message('Dialog', name: 'dialog');
  String get drag => Intl.message('Drag', name: 'drag');
  String get drawer => Intl.message('Drawer', name: 'drawer');
  String get emptyPage => Intl.message('EmptyPage', name: 'emptyPage');
  String get form => Intl.message('Form', name: 'form');
  String get futureBuilder => Intl.message('FutureBuilder', name: 'futureBuilder');
  String get gesture => Intl.message('Gesture', name: 'gesture');
  String get image => Intl.message('Image', name: 'image');
  String get input => Intl.message('Input', name: 'input');
  String get notification => Intl.message('Notification', name: 'notification');
  String get progress => Intl.message('Progress', name: 'progress');
  String get tab => Intl.message('Tab', name: 'tab');
  String get text => Intl.message('Text', name: 'text');
  String get scrollView => Intl.message('ScrollView', name: 'scrollView');
  String get customScrollView => Intl.message('CustomScrollView', name: 'customScrollView');
  String get nestedScrollView => Intl.message('NestedScrollView', name: 'nestedScrollView');
  String get scrollController => Intl.message('ScrollController', name: 'scrollController');
  String get layout => Intl.message('Layout', name: 'layout');
  String get alignLayout => Intl.message('AlignLayout', name: 'alignLayout');
  String get flexLayout => Intl.message('FlexLayout', name: 'flexLayout');
  String get linearLayout => Intl.message('LinearLayout', name: 'linearLayout');
  String get stackLayout => Intl.message('StackLayout', name: 'stackLayout');
  String get wrapLayout => Intl.message('WrapLayout', name: 'wrapLayout');
  String get containerPage => Intl.message('Container', name: 'containerPage');
  String get constrainedBox => Intl.message('ConstrainedBox', name: 'constrainedBox');
  String get container => Intl.message('Container', name: 'container');
  String get decoratedBox => Intl.message('DecoratedBox', name: 'decoratedBox');
  String get transform => Intl.message('Transform', name: 'transform');
  String get clip => Intl.message('Clip', name: 'clip');
  String get animation => Intl.message('Animation', name: 'animation');
  String get basicAnimation => Intl.message('BasicAnimation', name: 'basicAnimation');
  String get staggerAnimation => Intl.message('StaggerAnimation', name: 'staggerAnimation');
  String get transitionAnimations => Intl.message('TransitionAnimations', name: 'transitionAnimations');
  String get customWidget => Intl.message('CustomWidget', name: 'customWidget');
  String get combinationWidget => Intl.message('CombinationWidget', name: 'combinationWidget');
  String get drawingWidget => Intl.message('DrawingWidget', name: 'drawingWidget');

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
