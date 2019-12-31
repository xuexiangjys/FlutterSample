import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_learn/router/route.dart';
import 'package:flutter_learn/splash.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/utils/router.dart';
import 'package:flutter_learn/utils/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//程序的主入口
void main() => {
      //捕获异常的回调
      FlutterError.onError = (FlutterErrorDetails details) {
        reportErrorAndLog(details);
      },
      runZoned(
        () => run(),
        zoneSpecification: ZoneSpecification(
          print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
            collectLog(parent, zone, line); // 收集日志
          },
        ),
        //未捕获的异常的回调
        onError: (Object obj, StackTrace stack) {
          var details = makeDetails(obj, stack);
          reportErrorAndLog(details);
        },
      )
    };

void run() {
  runApp(MyApp());
  init();
}

//程序初始化操作
void init() {
  XRouter.init();
  SPUtils.getInstance().init();
  Provider.init(true);
}

//日志拦截, 收集日志
void collectLog(ZoneDelegate parent, Zone zone, String line) {
  parent.print(zone, "日志拦截: $line");
}

//上报错误和日志逻辑
void reportErrorAndLog(FlutterErrorDetails details) {
  print(details);
}

// 构建错误信息
FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {}

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
