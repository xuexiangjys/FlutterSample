import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_learn/view/list/list_item.dart';
import 'package:url_launcher/url_launcher.dart';

/// 个人中心页面
class UserProfilePage extends StatefulWidget {
  /// 标题
  final String title;
  const UserProfilePage(this.title, {Key key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            EasyRefresh.custom(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    // 顶部栏
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 220.0,
                          color: Colors.white,
                        ),
                        ClipPath(
                          clipper: TopBarClipper(
                              MediaQuery.of(context).size.width, 200.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 200.0,
                            child: Container(
                              width: double.infinity,
                              height: 240.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        // 名字
                        Container(
                          margin: EdgeInsets.only(top: 40.0),
                          child: Center(
                            child: Text(
                              'xuexiangjys',
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                          ),
                        ),
                        // 图标
                        Container(
                          margin: EdgeInsets.only(top: 100.0),
                          child: Center(
                              child: Container(
                            width: 100.0,
                            height: 100.0,
                            child: PreferredSize(
                              child: Container(
                                child: ClipOval(
                                  child: ExtendedImage.network(
                                    "https://gitee.com/xuexiangjys/Resource/raw/master/img/avatar/avatar_github.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              preferredSize: Size(80.0, 80.0),
                            ),
                          )),
                        ),
                      ],
                    ),
                    // 内容
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                          color: Colors.blue,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                ListItem(
                                  icon: Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.white,
                                  ),
                                  title: "QQ群",
                                  titleColor: Colors.white,
                                  describe: '602082750',
                                  describeColor: Colors.white,
                                  onPressed: () {
                                    launch(
                                        'http://qm.qq.com/cgi-bin/qm/qr?k=tiP-E6rDf0y77PRNfp2lNVcc9RsglPCM');
                                  },
                                ),
                                ListItem(
                                  icon: Icon(
                                    Icons.http,
                                    color: Colors.white,
                                  ),
                                  title: "Github",
                                  titleColor: Colors.white,
                                  describe: 'https://github.com/xuexiangjys',
                                  describeColor: Colors.white,
                                  onPressed: () {
                                    launch('https://github.com/xuexiangjys');
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                          color: Colors.green,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                ListItem(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  title: "性名",
                                  titleColor: Colors.white,
                                  describe: 'xuexiangjys',
                                  describeColor: Colors.white,
                                ),
                                ListItem(
                                  icon: Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                  ),
                                  title: "生日",
                                  titleColor: Colors.white,
                                  describe: "1994-08-06",
                                  describeColor: Colors.white,
                                ),
                                ListItem(
                                  icon: Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                  ),
                                  title: "城市",
                                  titleColor: Colors.white,
                                  describe: "南京",
                                  describeColor: Colors.white,
                                )
                              ],
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                          color: Colors.pink,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                ListItem(
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  title: "手机号",
                                  titleColor: Colors.white,
                                  describe: '139******32',
                                  describeColor: Colors.white,
                                ),
                                ListItem(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  title: "邮箱",
                                  titleColor: Colors.white,
                                  describe: 'xuexiangjys@163.com',
                                  describeColor: Colors.white,
                                  onPressed: () {
                                    launch(
                                        'mailto:xuexiangjys@163.com?subject=XUI&body=XUI is so beatiful');
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ));
  }
}

// 顶部栏裁剪
class TopBarClipper extends CustomClipper<Path> {
  // 宽高
  double width;
  double height;

  TopBarClipper(this.width, this.height);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width, height / 2);
    path.lineTo(0.0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
