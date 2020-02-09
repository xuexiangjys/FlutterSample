import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/provider.dart';

class ThemeColorPage extends StatefulWidget {
  final String title = '主题';
  @override
  _ThemeColorPageState createState() => _ThemeColorPageState();
}

class _ThemeColorPageState extends State<ThemeColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: AppTheme.materialColors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 10.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Store.value<AppTheme>(context).changeColor(index);
            },
            child: Container(color: AppTheme.materialColors[index]),
          );
        },
      ),
    );
  }

  void showColorDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          height: 300,
          child: ListView.builder(
            itemCount: AppTheme.materialColors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Store.value<AppTheme>(context).changeColor(index);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      color: AppTheme.materialColors[index], height: 40));
            },
          ),
        ));
      },
    );
  }
}
