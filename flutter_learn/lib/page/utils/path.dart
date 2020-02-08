import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/path.dart';

class FilePathPage extends StatefulWidget {
  final String title = '文件路径';
  @override
  _FilePathPageState createState() => _FilePathPageState();
}

class _FilePathPageState extends State<FilePathPage> {
  String cachePath = '';
  String filesPath = '';
  String documentsPath = '';

  @override
  void initState() {
    super.initState();
    PathUtils.getCacheDirPath().then((value) {
      setState(() {
        cachePath = value;
      });
    });
    PathUtils.getFilesDirPath().then((value) {
      setState(() {
        filesPath = value;
      });
    });
    PathUtils.getDocumentsDirPath().then((value) {
      setState(() {
        documentsPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              buildItem('缓存路径', cachePath),
              buildItem('文件路径', filesPath),
              buildItem('文档路径', documentsPath),
            ])));
  }

  Widget buildItem(String title, String content) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Text(
            content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        )),
      ],
    );
  }
}
