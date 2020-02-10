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
