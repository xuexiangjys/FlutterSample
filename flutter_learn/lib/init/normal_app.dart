import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_learn/init/splash.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/utils/push.dart';
import 'package:flutter_learn/utils/shared_preferences.dart';
import 'package:flutter_learn/utils/sql_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

//普通App的启动
class NormalApp {
  //运行app
  static void run() {
    runApp(Store.init(MyApp()));
    initApp();
  }

  //程序初始化操作
  static void initApp() {
    XRouter.init();
    SPUtils.getInstance().init();
    SQLHelper.init();
    XPush.init();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, value, _) {
      return MaterialApp(
          title: 'Flutter Learn',
          theme: ThemeData(
            primarySwatch: value.themeColor,
          ),
          home: SplashPage(),
          onGenerateRoute: XRouter.router.generator,
          routes: RouteMap.routes,
          localizationsDelegates: [
            GlobalEasyRefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: <Locale>[
            Locale("en", ""),
            Locale("zh", "CN"),
          ]);
    });
  }
}
