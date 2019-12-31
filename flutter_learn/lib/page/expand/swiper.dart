import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/view/swiper_control.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({this.title = "轮播图", Key key}) : super(key: key);

  final String title;

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(0),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                getBanner1(),
                SizedBox(height: 20),
                getBanner2(),
                SizedBox(height: 20),
                getGuidView()
              ],
            )));
  }

  final List<String> urls = [
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144160323071011277.jpg", //伪装者:胡歌演绎"痞子特工"
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144158380433341332.jpg", //无心法师:生死离别!月牙遭虐杀
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144160286644953923.jpg", //花千骨:尊上沦为花千骨
    "http://photocdn.sohu.com/tvmobilemvms/20150902/144115156939164801.jpg", //综艺饭:胖轩偷看夏天洗澡掀波澜
    "http://photocdn.sohu.com/tvmobilemvms/20150907/144159406950245847.jpg", //碟中谍4:阿汤哥高塔命悬一线,超越不可能
  ];

  Widget getBanner1() {
    return SizedBox(
      height: 200,
      child: Swiper(
        autoplay: true,
        duration: 2000,
        autoplayDelay: 5000,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(urls[index], fit: BoxFit.fill)),
          );
        },
        itemCount: urls.length,
        pagination: SwiperPagination(),
      ),
    );
  }

  Widget getBanner2() {
    return SizedBox(
      height: 180,
      child: Swiper(
          scale: 0.8,
          fade: 0.8,
          autoplay: true,
          duration: 2000,
          autoplayDelay: 5000,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(urls[index], fit: BoxFit.fill)),
            );
          },
          itemCount: urls.length,
          indicatorLayout: PageIndicatorLayout.SCALE,
          pagination: SwiperPagination(margin: const EdgeInsets.all(20)),
          onTap: (value) {
            XToast.toast("点击--->" + value.toString());
          },
          onIndexChanged: (value) {
            XToast.toast("滚动--->" + value.toString());
          }),
    );
  }

  Widget getGuidView() {
    return SizedBox(
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              urls[index],
              fit: BoxFit.fill,
            );
          },
          loop: false,
          autoplay: false,
          itemCount: urls.length,
          pagination: SwiperPagination(),
          control: FixSwiperControl(color: Colors.white),
        ));
  }
}
