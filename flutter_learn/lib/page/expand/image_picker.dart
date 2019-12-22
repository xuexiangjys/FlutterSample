import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({this.title = "图片选择", Key key}) : super(key: key);
  final String title;
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File _image;

  //选择照片
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  //拍照片
  Future takeImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.vertical, // 水平listView
              children: <Widget>[
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('选择图片'),
                      color: Colors.blue,
                      onPressed: getImage,
                    ),
                    RaisedButton(
                      child: Text('拍照片'),
                      color: Colors.blue,
                      onPressed: takeImage,
                    ),
                  ],
                ),
                _image == null
                    ? Text('您还未选择任何图片.')
                    : Image.file(
                        _image,
                        scale: 0.5,
                        fit: BoxFit.cover,
                      )
              ],
            )));
  }
}
