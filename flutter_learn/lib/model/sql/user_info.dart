import 'package:flutter_learn/utils/sql.dart';

abstract class UserInfoInterface {
  String get userName;
  String get password;
  String get nickName;
  int get age;
  int get sex;
}

class UserInfo implements UserInfoInterface {
  String userName;
  String password;
  String nickName;
  int age;
  int sex;

  UserInfo({this.userName, this.password, this.nickName, this.age, this.sex});

  factory UserInfo.fromJSON(Map json) {
    return UserInfo(
        userName: json['userName'],
        password: json['password'],
        nickName: json['nickName'],
        age: json['age'],
        sex: json['sex']);
  }

  Object toMap() {
    return {
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
  Future insert(UserInfo userInfo) {
    return sql.insert({
      'username': userInfo.userName,
      'password': userInfo.password,
      'nickName': userInfo.nickName,
      'age': userInfo.age,
      'sex': userInfo.sex
    });
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
    return sql.update({
      'username': userInfo.userName,
      'password': userInfo.password,
      'nickName': userInfo.nickName,
      'age': userInfo.age,
      'sex': userInfo.sex
    });
  }

  // 删除
  Future deleteAll() async {
    return await sql.deleteAll();
  }
}
