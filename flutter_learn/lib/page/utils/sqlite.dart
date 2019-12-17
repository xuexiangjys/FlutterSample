import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/model/sql/user_info.dart';
import 'package:flutter_learn/utils/random.dart';

class SqlitePage extends StatefulWidget {
  SqlitePage({Key key}) : super(key: key);
  final String title = "Sqlite数据库";
  @override
  _SqlitePageState createState() => _SqlitePageState();
}

class _SqlitePageState extends State<SqlitePage> {
  final model = new UserInfoModel();
  List<UserInfo> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                ButtonBar(
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
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
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Button集合
                    RaisedButton(
                      child: Text('修改'),
                      color: Colors.blue,
                      onPressed: () => {doUpdate()},
                    ),
                    RaisedButton(
                      child: Text('删除'),
                      color: Colors.blue,
                      onPressed: () => {doDelete()},
                    ),
                  ],
                ),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: users.length, // item 的个数
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1.0, color: Colors.grey), // 添加分割线
                  itemBuilder: (BuildContext context, int index) {
                    return Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: <Widget>[
                        Text("userName" + users[index].userName + ", password:"),
                      ],
                    );
                  },
                )
              ],
            )));
  }

  //增加
  void doInsert() {
    model.insert(new UserInfo(
        userName: RandomUtils.getRandomLetters(8),
        password: RandomUtils.getRandomNumbers(16),
        nickName: RandomUtils.getRandomLetters(8),
        age: Random().nextInt(50),
        sex: Random().nextInt(2)));
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
  void doUpdate() {}

  //删除
  void doDelete() {
    model.deleteAll();
  }
}
