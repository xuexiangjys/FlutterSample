import 'package:flutter/material.dart';
import 'package:flutter_learn/router/route.dart';

//右进右出动画
class SlidePageRoute extends PageRouteBuilder {
  final String routeName;

  SlidePageRoute(this.routeName)
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return RouteMap.routes[routeName](context);
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                        //1.0为右进右出，-1.0为左进左出
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
