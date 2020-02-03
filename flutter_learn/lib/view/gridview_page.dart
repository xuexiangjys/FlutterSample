import 'package:flutter/material.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/view/listview_page.dart';

class GridViewPage extends StatefulWidget {
  GridViewPage({Key key, this.items}) : super(key: key);
  final List<ListItem> items;
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          itemCount: widget.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 10.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) {
            return getItemContainer(widget.items[index]);
          }),
    );
  }

  Widget getItemContainer(ListItem item) {
    return InkWell(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Expanded(
                flex: 3,
                child: Icon(
                  item.icon,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(item.title),
              ),
              SizedBox(height: 30)
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
        ),
        onTap: () {
          XRouter.goto(context, item.pageName);
        });
  }
}
