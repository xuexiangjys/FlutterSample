import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraUtils {
  CameraUtils._internal();

  static List<CameraDescription> cameras;

  static Future<List<CameraDescription>> init() async {
    if (cameras == null) {
      cameras = await getAvailableCameras();
    }
    return cameras;
  }

  ///获取可使用的摄像头
  static Future<List<CameraDescription>> getAvailableCameras() =>
      availableCameras();

  /// 获取不同摄像头的图标（前置、后置、其它）
  static IconData getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
    }
    throw ArgumentError('Unknown lens direction');
  }
}
