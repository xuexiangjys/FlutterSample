import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learn/init/normal_app.dart';

//应用初始化
class AppInit {

  //启动运行
  static void runMyApp() {
    //捕获异常的回调
    FlutterError.onError = (FlutterErrorDetails details) {
      reportErrorAndLog(details);
    };
    runZoned(
      //启动App
      () => NormalApp.run(),

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
    );
  }

  //日志拦截, 收集日志
  static void collectLog(ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, "日志拦截: $line");
  }

  //上报错误和日志逻辑
  static void reportErrorAndLog(FlutterErrorDetails details) {
    print(details);
  }

  // 构建错误信息
  static FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
    return FlutterErrorDetails(stack: stack);
  }
}
