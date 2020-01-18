import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MultiImagePickerPage extends StatefulWidget {
  MultiImagePickerPage({this.title = "多图片选择器", Key key}) : super(key: key);

  final String title;

  @override
  _MultiImagePickerPageState createState() => _MultiImagePickerPageState();
}

class _MultiImagePickerPageState extends State<MultiImagePickerPage> {
  List<Asset> images = List<Asset>();
  String _error = '';

  Future<void> loadAssets(BuildContext context) async {
    List<Asset> resultList = List<Asset>();
    String error = '';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#2196F3",
          statusBarColor: "#2196F3",
          actionBarTitle: "图片选择",
          allViewTitle: "所有图片",
          useDetailsView: false,
          autoCloseOnSelectionLimit: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                RaisedButton(
                    child: Text("选择图片"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      loadAssets(context);
                    }),
                Center(child: Text('错误: $_error')),
                Expanded(
                  child: buildGridView(),
                )
              ],
            )));
  }
}
