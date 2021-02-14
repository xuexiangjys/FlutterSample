import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/router/switch_animation.dart';
import 'package:flutter_learn/view/web_view_page.dart';
import 'package:umeng_analytics_plugin/umeng_analytics_plugin.dart';

class XRouter {
  static FluroRouter router;

  static void init() {
    router = FluroRouter();
    configureRoutes(router);
  }

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
      return null;
    });

    router.define('/web', handler: webViewPageHand);
  }

  static void goto(BuildContext context, String pageName) {
    Navigator.push(context, SlidePageRoute(routeName: pageName));
  }

  static void gotoWidget(BuildContext context, Widget widget) {
    Navigator.push(context, SlidePageRoute(widget: widget));
  }
}

Handler webViewPageHand = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return WebViewPage(url, title);
});


class AppAnalysis extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (previousRoute.settings.name != null) {
      UmengAnalyticsPlugin.pageEnd(previousRoute.settings.name);
    }

    if (route.settings.name != null) {
      UmengAnalyticsPlugin.pageStart(route.settings.name);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route.settings.name != null) {
      UmengAnalyticsPlugin.pageEnd(route.settings.name);
    }

    if (previousRoute.settings.name != null) {
      UmengAnalyticsPlugin.pageStart(previousRoute.settings.name);
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    if (oldRoute.settings.name != null) {
      UmengAnalyticsPlugin.pageEnd(oldRoute.settings.name);
    }

    if (newRoute.settings.name != null) {
      UmengAnalyticsPlugin.pageStart(newRoute.settings.name);
    }
  }
}
