import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/xuifont.dart';

class IconFontPage extends StatefulWidget {
  IconFontPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _IconFontPageState createState() => _IconFontPageState();
}

class _IconFontPageState extends State<IconFontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1),
              itemCount: XUIIcons.icons.length,
              itemBuilder: (BuildContext context, int index) {
                return Icon(XUIIcons.icons[index], color: Theme.of(context).primaryColor);
              },
            )));
  }
}
