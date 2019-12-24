import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_learn/model/sql/app_info.dart';

/*
* 1.可使用Dart Data Class Generator插件 根据json创建dart类,类似Android的GsonFormat
*   使用命令: Generate from JSON
* 2.使用在线生成工具: https://javiercbk.github.io/json_to_dart/
*/
class JsonSerializePage extends StatefulWidget {
  JsonSerializePage({this.title = "Json序列化", Key key}) : super(key: key);
  final String title;
  @override
  _JsonSerializePageState createState() => _JsonSerializePageState();
}

class _JsonSerializePageState extends State<JsonSerializePage> {
  String jsonString = "";
  String message = "";

  Future<void> loadJsonFromAsset() async {
    jsonString = await rootBundle.loadString('assets/json/app_version.json');
    updateResult("从assets加载的json:\n" + jsonString);
  }

  @override
  void initState() {
    super.initState();
    loadJsonFromAsset();
  }

  void updateResult(String result) {
    setState(() {
      message = result;
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
                  alignment:
                      MainAxisAlignment.start, //布局方向，默认MainAxisAlignment.end
                  mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                  children: <Widget>[
                    RaisedButton(
                      child: Text('反序列化'),
                      color: Colors.blue,
                      onPressed: deSerialize,
                    ),
                    RaisedButton(
                      child: Text('序列化'),
                      color: Colors.blue,
                      onPressed: serialize,
                    ),
                  ],
                ),
                Text("结果:"),
                SizedBox(height: 10),
                Text(message)
              ],
            )));
  }

  //反序列化
  void deSerialize() {
    AppInfo appInfo = AppInfo.fromJson(jsonString);
    updateResult("反序列化获取更新的内容:" + appInfo.modifyContent);
  }

  //序列化
  void serialize() {
    AppInfo appInfo = AppInfo.fromJson(jsonString);
    updateResult("序列化结果:" + appInfo.toJson());
  }
}
