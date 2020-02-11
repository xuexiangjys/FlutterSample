import 'package:flutter/material.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/utils/random.dart';
import 'package:provider/provider.dart';

class ProviderNextPage extends StatefulWidget {
  ProviderNextPage(this.title, {Key key}) : super(key: key);
  final String title;

  @override
  _ProviderNextPageState createState() => _ProviderNextPageState();
}

class _ProviderNextPageState extends State<ProviderNextPage> {
  final Color _color = RandomUtils.getRandomColor();

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
              //可以使用Consumer
              Consumer<Counter>(builder: (cotext, value, child) {
                return Text("counter:${value.count}");
              }),
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
            Store.value<Counter>(context).add();
          },
          tooltip: '增加',
          child: Icon(Icons.add),
        ));
  }
}
