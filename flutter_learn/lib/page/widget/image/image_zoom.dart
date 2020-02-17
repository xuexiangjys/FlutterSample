import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/permission.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageZoomPage extends StatefulWidget {
  final String title;
  ImageZoomPage(this.title, {Key key}) : super(key: key);
  @override
  _ImageZoomPageState createState() => _ImageZoomPageState();
}

class _ImageZoomPageState extends State<ImageZoomPage> {
  static const IMAGE_URL =
      "https://pic4.zhimg.com/v2-1236d741cbb3aabf5a9910a5e4b73e4c_1200x500.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save), onPressed: showSaveImageConfirmDialog),
        ]),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
                child: ExtendedImage.network(
              IMAGE_URL,
              fit: BoxFit.contain,
              //enableLoadState: false,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) {
                return GestureConfig(
                  minScale: 0.9,
                  animationMinScale: 0.7,
                  maxScale: 3.0,
                  animationMaxScale: 3.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false,
                  initialAlignment: InitialAlignment.center,
                );
              },
            ))));
  }

  void showSaveImageConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("是否保存当前图片?"),
          actions: <Widget>[
            FlatButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ///保存网络图片
  void saveImage() {
    PermissionUtils.requestPermission(PermissionGroup.storage).then((value) {
      if (PermissionStatus.granted == value) {
        saveNetworkImageToPhoto(IMAGE_URL).then((value) {
          if (value != null && value.isNotEmpty) {
            XToast.success("图片保存成功: $value");
          } else {
            XToast.error("图片保存失败!");
          }
        }).catchError((onError) => {XToast.error("图片保存失败:$onError")});
      } else {
        XToast.error("权限申请失败!");
      }
    });
  }

  Future<String> saveNetworkImageToPhoto(String url,
      {bool useCache: true}) async {
    var data = await getNetworkImageData(url, useCache: useCache);
    return await ImagePickerSaver.saveFile(fileData: data);
  }
}
