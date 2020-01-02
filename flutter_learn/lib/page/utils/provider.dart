import 'package:flutter/material.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/utils/random.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  ProviderPage({this.title = "数据共享", Key key}) : super(key: key);

  final String title;

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  final Color _color = RandomUtils.getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
                alignment: Alignment.center,
                height: 100,
                child: Column(children: <Widget>[
                  Text("counter:${Provider.of<Counter>(context).count}"),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text("下一页"),
                    color: _color,
                    textColor: Colors.white,
                    onPressed: () {
                      XRouter.goto(context, '/utils/provider_next');
                    },
                  ),
                ]))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<Counter>(context, listen: false).add();
          },
          tooltip: '增加',
          child: Icon(Icons.add),
        ));
  }
}
