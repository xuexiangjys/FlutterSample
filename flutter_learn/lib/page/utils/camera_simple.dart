import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/i10n/localization_intl.dart';
import 'package:flutter_learn/page/utils/camera_complex.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/utils/camera.dart';
import 'package:flutter_learn/utils/path.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/utils/utils.dart';

class CameraPage extends StatefulWidget {
  final String title;
  CameraPage(this.title, {Key key}) : super(key: key);
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _controller;
  String _imageFilePath = '';

  @override
  void initState() {
    super.initState();
    CameraUtils.init().then((cameras) {
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
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.view_compact),
                onPressed: () {
                  XRouter.gotoWidget(context,
                      ComplexCameraPage(Languages.of(context).complexCamera));
                }),
          ],
        ),
        body: Center(child: buildWidget()),
        floatingActionButton: FloatingActionButton(
          onPressed: takePhoto,
          child: Icon(
            _imageFilePath.isEmpty ? Icons.photo_camera : Icons.switch_camera,
          ),
        ));
  }

  Widget buildWidget() {
    if (_controller != null && _controller.value.isInitialized) {
      if (_imageFilePath.isEmpty) {
        return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CameraPreview(_controller));
      } else {
        return Image.file(File(_imageFilePath));
      }
    } else {
      return CircularProgressIndicator();
    }
  }

  ///拍照片
  void takePhoto() {
    if (_imageFilePath.isNotEmpty) {
      setState(() {
        _imageFilePath = '';
      });
      return;
    }

    PathUtils.getCacheDirPath().then((value) {
      String path = '$value/${Utils.timestamp()}.jpg';
      print('文件路径:$path');
      _controller.takePicture(path).then((value) {
        XToast.success('拍摄成功');
        setState(() {
          _imageFilePath = path;
        });
      });
    }).catchError((error) => {XToast.error(error)});
  }
}
