import 'package:flutter_learn/utils/sql.dart';

abstract class UserInfoInterface {
  int get id;
  String get userName;
  String get password;
  String get nickName;
  int get age;
  int get sex;
}

class UserInfo implements UserInfoInterface {
  int id;
  String userName;
  String password;
  String nickName;
  int age;
  int sex;

  UserInfo(
      {this.id,
      this.userName,
      this.password,
      this.nickName,
      this.age,
      this.sex});

  factory UserInfo.fromJSON(Map<String, dynamic> json) {
    return UserInfo(
        id: json['id'],
        userName: json['userName'],
        password: json['password'],
        nickName: json['nickName'],
        age: json['age'],
        sex: json['sex']);
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
      'nickName': nickName,
      'age': age,
      'sex': sex
    };
  }
}

class UserInfoModel {
  final String table = 'userInfo';
  Sql sql;

  UserInfoModel() {
    sql = Sql.setTable(table);
  }

  // 插入
  Future<Map<String, dynamic>> insert(UserInfo userInfo) {
    return sql.insert(userInfo.toJSON());
  }

  // 查询
  Future<List<UserInfo>> getAllInfo() async {
    List list = await sql.getByCondition();
    List<UserInfo> resultList = [];
    list.forEach((item) {
      print(item);
      resultList.add(UserInfo.fromJSON(item));
    });
    return resultList;
  }

  // 修改
  Future<int> update(UserInfo userInfo) {
    return sql.updateById(userInfo.toJSON(), userInfo.id);
  }

  // 删除所有
  Future<int> deleteAll() async {
    return await sql.deleteAll();
  }

  // 删除所有
  Future<int> deleteById(int id) async {
    return await sql.deleteById(id);
  }
}
