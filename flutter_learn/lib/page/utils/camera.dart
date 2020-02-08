import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/path.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/utils/utils.dart';

class CameraPage extends StatefulWidget {
  final String title = '照相机';
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _controller;

  @override
  void initState() {
    super.initState();
    Utils.getAvailableCameras().then((cameras) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      _controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
            child: _controller != null && _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller))
                : CircularProgressIndicator()),
        floatingActionButton: FloatingActionButton(
          onPressed: takePhoto,
          child: Icon(
            Icons.photo_camera,
          ),
        ));
  }

  ///拍照片
  void takePhoto() {
    PathUtils.getCacheDirPath().then((value) {
      String path = value +
          '/' +
          DateTime.now().millisecondsSinceEpoch.toString() +
          '.png';
      print('文件路径:$path');
      _controller.takePicture(path).then((value) => XToast.success('拍摄成功'));
    }).catchError((error) => {XToast.error(error)});
  }
}
