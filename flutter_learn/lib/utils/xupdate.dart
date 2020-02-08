import 'package:flutter_learn/utils/device.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';

class XUpdate {
  XUpdate._internal();

  static const String UPDATE_URL =
      "https://gitee.com/xuexiangjys/FlutterSample/raw/master/flutter_learn/jsonapi/update_api.json";

  static void initAndCheck() {
    if (DeviceUtils.isAndroid()) {
      init(url: UPDATE_URL);
    }
  }

  ///初始化XUpdate
  static void init({String url = ""}) {
    FlutterXUpdate.init(
            debug: true,
            enableRetry: true,
            retryContent: "Github下载速度太慢了，是否考虑切换蒲公英下载？",
            retryUrl: "https://www.pgyer.com/flutter_learn")
        .then((_result) {
      print("XUpdate初始化结果: $_result");
      if (url.isNotEmpty) {
        checkUpdate(url);
      }
    });
    FlutterXUpdate.setErrorHandler(
        onUpdateError: (Map<String, dynamic> message) async {
      ///2004是无最新版本
      if (message['code'] != 2004) {
        ///4000是下载失败
        if (message['code'] == 4000) {
          FlutterXUpdate.showRetryUpdateTipDialog(
              retryContent: "Github被墙无法继续下载，是否考虑切换蒲公英下载？",
              retryUrl: "https://www.pgyer.com/flutter_learn");
        } else {
          XToast.error(message['detailMsg']);
        }
      }
    });
  }

  ///初始化XUpdate
  static void checkUpdate(String url) {
    FlutterXUpdate.checkUpdate(url: url, widthRatio: 0.7);
  }
}
