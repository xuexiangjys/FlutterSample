import 'package:flutter/material.dart';

class DialogUtils {
  DialogUtils._internal();

  static Future<T> show<T>(BuildContext context, Widget dialog,
      {bool dismissible = false}) {
    return showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () => Future.value(dismissible), child: dialog);
        });
  }
}
