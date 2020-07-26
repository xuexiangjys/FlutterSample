import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadUtils {
  DownloadUtils._internal();

  static init() {
    FlutterDownloader.initialize(debug: true);
  }
}
