import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderInit {
  static var providers = [
    ChangeNotifierProvider(create: (_) => Counter(10))
  ];
}

//计数演示
class Counter with ChangeNotifier {
  int _count;
  Counter(this._count);

  void add() {
    _count++;
    notifyListeners();
  }

  get count => _count;
}


//计数演示
class AppTheme with ChangeNotifier {
  Color _primaryColor;

  AppTheme(this._primaryColor);

  void change(Color color) {
    _primaryColor  = color;
    notifyListeners();
  }

  get primaryColor => _primaryColor;
}
