import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/utils.dart';

class PackageInfoPage extends StatefulWidget {
  final String title;
  PackageInfoPage(this.title, {Key key}) : super(key: key);
  @override
  _PackageInfoPageState createState() => _PackageInfoPageState();
}

class _PackageInfoPageState extends State<PackageInfoPage> {
  Map<String, dynamic> _packageInfo = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    if (!mounted) return;

    Utils.getPackageInfoMap().then((map) {
      setState(() {
        _packageInfo = map;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: ListView(
          shrinkWrap: true,
          children: _packageInfo.keys.map((String property) {
            return buildItem(property, '${_packageInfo[property]}');
          }).toList(),
        ));
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
            overflow: TextOverflow.ellipsis,
          ),
        )),
      ],
    );
  }


}
