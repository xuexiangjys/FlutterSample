import 'package:flutter/material.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/utils/random.dart';
import 'package:provider/provider.dart';

class ProviderNextPage extends StatefulWidget {
  ProviderNextPage({this.title = "下一页", Key key}) : super(key: key);

  final String title;

  @override
  _ProviderNextPageState createState() => _ProviderNextPageState();
}

class _ProviderNextPageState extends State<ProviderNextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(60),
            child: Center(
                child: Column(children: <Widget>[
              Text("counter:${Provider.of<Counter>(context).count}"),
              SizedBox(height: 20),
              RaisedButton(
                child: Text("下一页"),
                color: RandomUtils.getRandomColor(),
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
