import 'package:flutter/material.dart';

class WrapLayoutPage extends StatefulWidget {
  WrapLayoutPage(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  _WrapLayoutPageState createState() => _WrapLayoutPageState();
}

class _WrapLayoutPageState extends State<WrapLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //右边溢出部分报错, 因为Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为流式布局。
                Row(
                  children: <Widget>[Text("xxx" * 100)],
                ),
                SizedBox(height: 20),
                Row(
                  ///在Column+Row的嵌套中, 因为Row默认只有一行, Text的maxLines属性会失效,需要在外面套一个Expanded
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Expanded(child: Text("xxx" * 100))],
                ),
                SizedBox(height: 20),
                //使用流布局不会溢出
                Wrap(
                  children: <Widget>[Text("xxx" * 100)],
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 8, // 主轴(水平)方向间距
                  runSpacing: 2, // 纵轴（垂直）方向间距
                  alignment: WrapAlignment.center, //沿主轴方向居中
                  children: <Widget>[
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('M')),
                      label: Text('Mother'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('F')),
                      label: Text('Father'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('S')),
                      label: Text('Sister'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('B')),
                      label: Text('Brother'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('G')),
                      label: Text('GranMother'),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Flow(
                  delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.green,
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.brown,
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.purple,
                    ),
                  ],
                )
              ],
            )));
  }
}

//可以看到我们主要的任务就是实现paintChildren，它的主要任务是确定每个子widget位置。由于Flow不能自适应子widget的大小，我们通过在getSize返回一个固定大小来指定Flow的大小。
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
