import 'package:flutter/material.dart';

class ConstrainedBoxPage extends StatefulWidget {
  ConstrainedBoxPage({this.title = "尺寸限制类容器", Key key}) : super(key: key);
  final String title;
  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //ConstrainedBox用于对子组件添加额外的约束
            //BoxConstraints还定义了一些便捷的构造函数，用于快速生成特定限制规则的BoxConstraints，如BoxConstraints.tight(Size size)，它可以生成给定大小的限制；const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints。
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50, //最小高度为50像素
                  maxHeight: 100 //最大高度为100像素
                  ),
              child: Container(
                height: 5,
                child: redBox,
              ),
            ),

            //SizedBox用于给子元素指定固定的宽高
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(width: 80.0, height: 80.0, child: redBox)),

            //如果某一个组件有多个父级ConstrainedBox限制时, 就拿minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                      child: redBox,
                    ))),

            //UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。一般情况下，我们会很少直接使用此组件，但在"去除"多重限制的时候也许会有帮助.

            //这里需要注意的是，UnconstrainedBox对父组件限制的“去除”并非是真正的去除：上面例子中虽然红色区域大小是90×20，但上方仍然有80的空白空间。也就是说父限制的minHeight(100.0)仍然是生效的，只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，而redBox只受子ConstrainedBox限制，这一点请读者务必注意。
            //那么有什么方法可以彻底去除父ConstrainedBox的限制吗？答案是否定的！所以在此提示读者，在定义一个通用的组件时，如果要对子组件指定限制，那么一定要注意，因为一旦指定限制条件，子组件如果要进行相关自定义大小时将可能非常困难，因为子组件在不更改父组件的代码的情况下无法彻底去除其限制条件。
            //在实际开发中，当我们发现已经使用SizedBox或ConstrainedBox给子元素指定了宽高，但是仍然没有效果时，几乎可以断定：已经有父元素已经设置了限制！
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
                    child: UnconstrainedBox(
                      //“去除”父级限制
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                        child: redBox,
                      ),
                    ))),

            SizedBox(height: 10),

            //AspectRatio限制比例约束, aspectRatio= width/height
            SizedBox(
                height: 40,
                child: AspectRatio(aspectRatio: 4.0 / 2.0, child: redBox)),

            SizedBox(height: 10),

            //LimitedBox 用于指定最大宽高,注意这里只有高度的限制生效了
            LimitedBox(
                maxHeight: 10,
                maxWidth: 10,
                child: Container(
                  height: 200,
                  width: 200,
                  child: redBox,
                )),

            SizedBox(height: 10),

            //FractionallySizedBox可以根据父容器宽高的百分比来设置子组件宽高.  注意这个和Align的widthFactor和heightFactor的作用是相反的.
            Container(
              height: 200,
              width: 200,
              child: FractionallySizedBox(
                  widthFactor: 0.4, heightFactor: 0.6, child: redBox),
            )
          ],
        )));
  }
}
