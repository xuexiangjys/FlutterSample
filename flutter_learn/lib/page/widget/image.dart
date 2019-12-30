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
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                        'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                        width: 120,
                        height: 120)),
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
                ),
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/normal_user_icon.png", //预览图
                    fit: BoxFit.fitWidth,
                    image:
                        "http://img.wxcha.com/file/201806/06/520cba4626.jpg?down",
                    width: 80,
                    height: 80,
                  ),
                ),
              ]),
            )));
  }
}
