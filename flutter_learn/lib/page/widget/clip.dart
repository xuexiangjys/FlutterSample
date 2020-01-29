import 'package:flutter/material.dart';

class ClipPage extends StatefulWidget {
  ClipPage({this.title = "控件裁剪", Key key}) : super(key: key);
  final String title;
  @override
  _ClipPageState createState() => _ClipPageState();
}

class _ClipPageState extends State<ClipPage> {
  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset('assets/images/food01.jpeg', width: 80.0);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                image, //不剪裁

                //子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
                ClipOval(child: image),

                //将子组件剪裁为圆角矩形
                ClipRRect(
                  //剪裁为圆角矩形
                  borderRadius: BorderRadius.circular(5.0),
                  child: image,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                      child: image,
                    ),
                    Text(
                      "你好世界",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRect(
                      //将溢出部分剪裁
                      child: Align(
                        alignment: Alignment.topLeft,
                        widthFactor: .5, //宽度设为原来宽度一半
                        child: image,
                      ),
                    ),
                    Text("你好世界", style: TextStyle(color: Colors.green))
                  ],
                ),

                SizedBox(height: 20),

                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: ClipRect(
                      clipper: MyClipper(), //使用自定义的clipper
                      child: image),
                )

              ],
            )));
  }
}

//自定义裁剪
class MyClipper extends CustomClipper<Rect> {
  ///用于获取剪裁区域的接口
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 10.0, 40.0, 30.0); //以(10, 10)为左顶角起,宽为40, 高为30的矩形区域.

  /// 接口决定是否重新剪裁。如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁。
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
