import 'dart:convert';

//使用Dart Data Class Generator插件进行创建
//使用命令: Generate from JSON
class AppInfo {
  final int code;
  final String msg;
  final int updateStatus;
  final int versionCode;
  final String versionName;
  final String uploadTime;
  final String modifyContent;
  final String downloadUrl;
  final int apkSize;
  final String apkMd5;
  AppInfo({
    this.code,
    this.msg,
    this.updateStatus,
    this.versionCode,
    this.versionName,
    this.uploadTime,
    this.modifyContent,
    this.downloadUrl,
    this.apkSize,
    this.apkMd5,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'msg': msg,
      'updateStatus': updateStatus,
      'versionCode': versionCode,
      'versionName': versionName,
      'uploadTime': uploadTime,
      'modifyContent': modifyContent,
      'downloadUrl': downloadUrl,
      'apkSize': apkSize,
      'apkMd5': apkMd5,
    };
  }

  static AppInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return AppInfo(
      code: map['code']?.toInt(),
      msg: map['msg'],
      updateStatus: map['updateStatus']?.toInt(),
      versionCode: map['versionCode']?.toInt(),
      versionName: map['versionName'],
      uploadTime: map['uploadTime'],
      modifyContent: map['modifyContent'],
      downloadUrl: map['downloadUrl'],
      apkSize: map['apkSize']?.toInt(),
      apkMd5: map['apkMd5'],
    );
  }

  String toJson() => json.encode(toMap());

  static AppInfo fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppInfo code: $code, msg: $msg, updateStatus: $updateStatus, versionCode: $versionCode, versionName: $versionName, uploadTime: $uploadTime, modifyContent: $modifyContent, downloadUrl: $downloadUrl, apkSize: $apkSize, apkMd5: $apkMd5';
  }
}