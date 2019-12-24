import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key key}) : super(key: key);
  final String title = "图片";
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/food01.jpeg'),
                ),
                Container(
                  child: Image(
                    image: AssetImage('assets/images/food02.jpeg'),
                    height: 200,
                    width: 200,
                  ),
                ),
                Image.network(
                    'https://gw.alicdn.com/tfs/TB1XD.ZuYwrBKNjSZPcXXXpapXa-255-251.png'),
                Container(
                  child: Text('NetworkImage的使用,带有0.5倍缩放'),
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                ),
                Image(
                  image: NetworkImage(
                      'https://gw.alicdn.com/tfs/TB1XD.ZuYwrBKNjSZPcXXXpapXa-255-251.png',
                      scale: 0.5),
                )
              ]),
            )));
  }
}
