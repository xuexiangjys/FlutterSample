import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/model/sql/user_info.dart';
import 'package:flutter_learn/utils/random.dart';

class SqlitePage extends StatefulWidget {
  SqlitePage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _SqlitePageState createState() => _SqlitePageState();
}

class _SqlitePageState extends State<SqlitePage> {
  final model = new UserInfoModel();
  List<UserInfo> users = [];


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    doQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: ListView(
          scrollDirection: Axis.vertical, // 水平listView
          reverse: false, // 是否反向
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
              mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
              children: <Widget>[
                // Button集合
                RaisedButton(
                  child: Text('增加'),
                  color: Colors.blue,
                  onPressed: () => {doInsert()},
                ),
                RaisedButton(
                  child: Text('查询'),
                  color: Colors.blue,
                  onPressed: () => {doQuery()},
                ),
                RaisedButton(
                  child: Text('删除所有'),
                  color: Colors.blue,
                  onPressed: () => {doDeleteAll()},
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
              physics: NeverScrollableScrollPhysics(), //禁用滑动事件
              scrollDirection: Axis.vertical,
              itemCount: users.length, // item 的个数
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 1.0, color: Colors.grey), // 添加分割线
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Wrap(direction: Axis.vertical, children: <Widget>[
                    Text("用户名:" +
                        users[index].userName +
                        ", 密码:" +
                        users[index].password +
                        ", 年龄:" +
                        users[index].age.toString()),
                    ButtonBar(
                      alignment: MainAxisAlignment
                          .start, //布局方向，默认MainAxisAlignment.end
                      mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                      children: <Widget>[
                        // Button集合
                        RaisedButton(
                          child: Text('修改'),
                          color: Colors.blue,
                          onPressed: () => {doUpdate(index, users[index])},
                        ),
                        RaisedButton(
                          child: Text('删除'),
                          color: Colors.blue,
                          onPressed: () => {doDelete(users[index].id)},
                        ),
                      ],
                    )
                  ]),
                );
              },
            ),
          ],
        )));
  }

  //增加
  void doInsert() {
    model
        .insert(new UserInfo(
            userName: RandomUtils.getRandomLetters(8),
            password: RandomUtils.getRandomNumbers(16),
            nickName: RandomUtils.getRandomLetters(8),
            age: Random().nextInt(50),
            sex: Random().nextInt(2)))
        .then((result) => {
              if (result != null) {doQuery()}
            });
  }

  //查询
  void doQuery() {
    model.getAllInfo().then((list) => {
          setState(() {
            this.users = list;
          })
        });
  }

  //修改
  void doUpdate(int index, UserInfo userInfo) {
    userInfo.password = "被修改了";
    userInfo.age = Random().nextInt(50);
    model.update(userInfo).then((result) => {
          if (result > 0) {doQuery()}
        });
  }

  //删除
  void doDeleteAll() {
    model.deleteAll().then((result) => {
          if (result > 0) {doQuery()}
        });
  }

  //删除
  void doDelete(int id) {
    model.deleteById(id).then((result) => {
          if (result > 0) {doQuery()}
        });
  }
}
