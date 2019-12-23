import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';

class CardViewPage extends StatefulWidget {
  CardViewPage({this.title = "卡片", Key key}) : super(key: key);

  final String title;

  @override
  _CardViewPageState createState() => _CardViewPageState();
}

class _CardViewPageState extends State<CardViewPage> {
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
              children: <Widget>[getCardView1(), getCardView2()],
            )));
  }

  Widget getCardView1() {
    return Card(
      clipBehavior: Clip.antiAlias, // 根据设置裁剪内容
      color: Colors.lightBlue, //  卡片背景颜色
      elevation: 20.0, // 卡片的z坐标,控制卡片下面的阴影大小
      margin: EdgeInsets.all(20.0),
      //  margin: EdgeInsetsDirectional.only(bottom: 30.0, top: 30.0, start: 30.0),// 边距
      semanticContainer:
          true, // 表示单个语义容器，还是false表示单个语义节点的集合，接受单个child，但该child可以是Row，Column或其他包含子级列表的widget
//      shape: Border.all(
//          color: Colors.indigo, width: 1.0, style: BorderStyle.solid), // 卡片材质的形状，以及边框
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), // 圆角
      //borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Column(
        //card里面的子控件
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.access_time, color: Colors.white),
            title: Text('主题',
                style: TextStyle(color: Colors.white, fontSize: 40.0)),
            subtitle: Text('这里是副标题的内容,这里是副标题的内容,这里是副标题的内容',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            contentPadding: EdgeInsets.only(
                left: 20, top: 10, bottom: 10, right: 20), // item 内容内边距
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('按钮1',
                    style: TextStyle(color: Colors.white, fontSize: 14.0)),
                onPressed: () {
                  XToast.toast('按钮1');
                },
              ),
              FlatButton(
                child: const Text('按钮2',
                    style: TextStyle(color: Colors.white, fontSize: 14.0)),
                onPressed: () {
                  XToast.toast('按钮2');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getCardView2() {
    return Card(
      clipBehavior: Clip.antiAlias, // 根据设置裁剪内容
      color: Colors.white, //  卡片背景颜色
      elevation: 20.0, // 卡片的z坐标,控制卡片下面的阴影大小
      margin: EdgeInsets.all(20.0),
      semanticContainer: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), // 圆角
      //borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 10, right: 20),
        child: Column(
          //card里面的子控件
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/normal_user_icon.png", //预览图
                    fit: BoxFit.fitWidth,
                    image:
                        "http://img.wxcha.com/file/201806/06/520cba4626.jpg?down",
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("xuexiangjys",
                        style: TextStyle(color: Colors.black, fontSize: 16.0)),
                    Text("Android架构师 @南京某智能科技有限公司",
                        style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("XUI 一个简洁而优雅的Android原生UI框架，解放你的双手",
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 16.0)),
                    SizedBox(height: 10),
                    Text(
                        "涵盖绝大部分的UI组件：TextView、Button、EditText、ImageView、Spinner、Picker、Dialog、PopupWindow、ProgressBar、LoadingView、StateLayout、FlowLayout、Switch、Actionbar、TabBar、Banner、GuideView、BadgeView、MarqueeView、WebView、SearchView等一系列的组件和丰富多彩的样式主题。",
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 12.0))
                  ],
                )),
                SizedBox(width: 10),
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/normal_user_icon.png", //预览图
                    fit: BoxFit.fitWidth,
                    image:
                        "https://img-blog.csdnimg.cn/2019011614245559.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3h1ZXhpYW5nanlz,size_16,color_FFFFFF,t_70",
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 3),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton.icon(
                      icon: Icon(Icons.thumb_up, size: 20, color: Colors.grey),
                      label: const Text('99',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      onPressed: () {XToast.toast("点赞");}),
                ),
                Expanded(
                  child: FlatButton.icon(
                      icon: Icon(Icons.comment, size: 20, color: Colors.grey),
                      label: const Text('25',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      onPressed: () {XToast.toast("评论");}),
                ),
                Expanded(
                  child: FlatButton.icon(
                      icon: Icon(Icons.share, size: 20, color: Colors.grey),
                      label: const Text('分享',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      onPressed: () {XToast.toast("分享");}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
