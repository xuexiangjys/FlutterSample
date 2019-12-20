import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/view/web_view_page.dart';

class XRouter {
  static Router router;

  static void init() {
    router = new Router();
    configureRoutes(router);
  }

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
    });

    router.define('/web', handler: webViewPageHand);
  }

}


Handler webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});
