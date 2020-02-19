import 'package:flutter/material.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/view/home/about.dart';
import 'package:flutter_learn/view/home/language.dart';
import 'package:flutter_learn/i10n/localization_intl.dart';
import 'package:flutter_learn/view/home/sponsor.dart';
import 'package:flutter_learn/view/home/theme_color.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                      child: Image.asset(
                        "assets/images/flutter.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    Languages.of(context).title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
          MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: true,
            child: ListView(
              shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
              physics: NeverScrollableScrollPhysics(), //禁用滑动事件
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text(Languages.of(context).theme),
                  onTap: () => {XRouter.gotoWidget(context, ThemeColorPage())},
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text(Languages.of(context).language),
                  onTap: () => {XRouter.gotoWidget(context, LanguagePage())},
                ),
                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text(Languages.of(context).sponsor),
                  onTap: () => {XRouter.gotoWidget(context, SponsorPage())},
                ),
                ListTile(
                  leading: Icon(Icons.error_outline),
                  title: Text(Languages.of(context).about),
                  onTap: () => {XRouter.gotoWidget(context, AboutPage())},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
