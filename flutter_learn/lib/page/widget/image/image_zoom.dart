import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageZoomPage extends StatefulWidget {
  final String title;
  ImageZoomPage(this.title, {Key key}) : super(key: key);
  @override
  _ImageZoomPageState createState() => _ImageZoomPageState();
}

class _ImageZoomPageState extends State<ImageZoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
                child: ExtendedImage.network(
              "https://pic4.zhimg.com/v2-1236d741cbb3aabf5a9910a5e4b73e4c_1200x500.jpg",
              fit: BoxFit.contain,
              //enableLoadState: false,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) {
                return GestureConfig(
                  minScale: 0.9,
                  animationMinScale: 0.7,
                  maxScale: 3.0,
                  animationMaxScale: 3.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false,
                  initialAlignment: InitialAlignment.center,
                );
              },
            ))));
  }
}
