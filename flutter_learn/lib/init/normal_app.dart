import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_learn/init/splash.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/utils/router.dart';
import 'package:flutter_learn/utils/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//普通App的启动
class NormalApp {
  //运行app
  static void run() {
    runApp(MyApp());
    initApp();
  }

  //程序初始化操作
  static void initApp() {
    XRouter.init();
    SPUtils.getInstance().init();
    Provider.init(true);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Learn',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
        onGenerateRoute: XRouter.router.generator,
        routes: RouteMap.routes,
        localizationsDelegates: [
          GlobalEasyRefreshLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale("en", ""),
          Locale("zh", "CN"),
        ]);
  }
}
