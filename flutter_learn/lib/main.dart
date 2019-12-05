import 'package:flutter/material.dart';
import 'package:flutter_learn/home.dart';
import 'package:flutter_learn/widget/button.dart';
import 'package:flutter_learn/widget/image.dart';
import 'package:flutter_learn/widget/tab.dart';
import 'package:flutter_learn/widget/text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainHomePage(),
      routes: <String, WidgetBuilder>{
        '/widget/button': (BuildContext context) => new ButtonPage(),
        '/widget/text': (BuildContext context) => new TextPage(),
        '/widget/image': (BuildContext context) => new ImagePage(),
        '/widget/tab': (BuildContext context) => new TabPage(),
      },
    );
  }
}
