import 'package:flutter/material.dart';
import 'package:flutter_learn/widget/button.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);
  final String title = "Flutter学习";
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final List<ListItem> items = [
    new ListItem(Icons.radio_button_checked, "按钮", "简单的按钮使用", (context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ButtonPage()));
    }),
    new ListItem(Icons.text_fields, "文字", "简单的文字使用", (context) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('点击title2'),
      ));
    }),
    new ListItem(Icons.image, "图片", "简单的图片使用", (context) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('点击title3'),
      ));
    }),
    new ListItem(Icons.tab, "选项卡", "简单的选项卡使用", (context) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('点击title3'),
      ));
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: items.length, // item 的个数
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1.0, color: Colors.grey), // 添加分割线
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(items[index].title), // item 标题
                leading: Icon(items[index].icon), // item 前置图标
                subtitle: Text(items[index].subTitle), // item 副标题
                trailing: Icon(Icons.keyboard_arrow_right), // item 后置图标
                isThreeLine: false, // item 是否三行显示
                dense: true, // item 直观感受是整体大小
                contentPadding: EdgeInsets.only(
                    left: 20, right: 10, top: 5, bottom: 5), // item 内容内边距
                enabled: true,
                onTap: () {
                  items[index].onPressed(context); // item onTap 点击事件
                },
                onLongPress: () {
                  print('长按:$index');
                }, // item onLongPress 长按事件
                selected: false, // item 是否选中状态
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '新建',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListItem {
  final IconData icon;
  final String title;
  final String subTitle;
  final ContextCallback onPressed;
  const ListItem(
      this.icon, this.title, this.subTitle, this.onPressed); // 常量构造函数
}

typedef ContextCallback = void Function(BuildContext context);
