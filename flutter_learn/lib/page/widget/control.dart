import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/random.dart';

class ControlPage extends StatefulWidget {
  ControlPage(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  bool _check = false;
  int selectValue = -1;

  double sliderValue = 0.0;

  bool isCheck = false;
  List<bool> isChecks = [false, false];

  void _valueChanged(bool value) {
    for (var i = 0; i < isChecks.length; i++) {
      isChecks[i] = value;
    }
    setState(() => isCheck = value);
  }

  //RadioGroup
  int groupValue = 1;
  onChange(val) {
    setState(() => groupValue = val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // 水平listView
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text('切换'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => {
                      setState(() {
                        _check = !_check;
                      })
                    },
                  ),
                  Row(children: <Widget>[
                    Text("MD风格:"),
                    Switch(
                      value: _check,
                      onChanged: (bool val) {
                        setState(() {
                          _check = val;
                        });
                        print("onChanged:" + val.toString());
                      },
                    ),
                    SizedBox(width: 10),
                    Text("适配风格:"),
                    Switch.adaptive(
                        value: _check,
                        activeColor: Colors.blue, // 激活时原点颜色
                        onChanged: (bool val) {
                          setState(() {
                            _check = val;
                          });
                          print("onChanged:" + val.toString());
                        }),
                  ]),
                  SwitchListTile(
                    title: const Text('灯光'),
                    value: _check,
                    onChanged: (bool val) {
                      setState(() {
                        _check = val;
                      });
                      print("onChanged:" + val.toString());
                    },
                    secondary: const Icon(Icons.lightbulb_outline),
                  ),
                  Divider(height: 3),

                  //===============Radio==================//

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Radio(
                            value: 1,
                            groupValue: groupValue, //当value和groupValue一致的时候则选中
                            onChanged: (T) {
                              onChange(T);
                            }),
                        Radio(
                            value: 2,
                            groupValue: groupValue,
                            onChanged: (T) {
                              onChange(T);
                            }),
                        Radio(
                            value: 3,
                            groupValue: groupValue,
                            onChanged: (T) {
                              onChange(T);
                            })
                      ]),

                  Divider(height: 3),

                  //===============Slider==================//

                  Slider(
                    value: sliderValue,
                    //实际进度的位置
                    inactiveColor: Colors.black12,
                    //进度中不活动部分的颜色
                    label: 'value: $sliderValue',
                    min: 0.0,
                    max: 100.0,
                    divisions: 1000,
                    activeColor: Colors.blue,
                    //进度中活动部分的颜色
                    onChanged: (double) {
                      setState(() {
                        sliderValue = double.roundToDouble();
                      });
                    },
                  ),

                  Divider(height: 3),

                  //===============checkbox==================//

                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("多选checkbox")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CheckboxDefault(),
                      CheckboxDefault(),
                      CheckboxDefault(),
                      CheckboxDefault(),
                      CheckboxDefault(),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("单选checkbox")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CheckboxSelect(this, 0),
                      CheckboxSelect(this, 1),
                      CheckboxSelect(this, 2),
                      CheckboxSelect(this, 3),
                      CheckboxSelect(this, 4),
                    ],
                  ),
                  CheckboxListTile(
                    value: isCheck,
                    selected: true, // 默认文字是否高亮
                    onChanged: _valueChanged,
                    dense: false, // 文字是否对齐 图标高度
                    isThreeLine: false, // 文字是否三行显示
                    title: Text('全部'), // 主标题
                    controlAffinity: ListTileControlAffinity
                        .trailing, // 将控件放在何处相对于文本,leading 按钮显示在文字后面,platform,trailing 按钮显示在文字前面
                    subtitle: Text('勾选下面全部内容'), // 标题下方显示的副标题
                    secondary: Icon(Icons.archive), // 从复选框显示在磁贴另一侧的小组件
                    activeColor: Colors.red, // 选中此复选框时要使用的颜色
                  ),
                  CheckboxListTile(
                      value: isChecks[0],
                      title: Text('选项1'),
                      activeColor: isCheck ? Colors.red : Colors.green,
                      controlAffinity: ListTileControlAffinity.platform,
                      onChanged: (bool) {
                        if (mounted) {
                          setState(() {
                            isChecks[0] = bool;
                          });
                        }
                      }),
                  CheckboxListTile(
                      value: isChecks[1],
                      title: Text('选项2'),
                      activeColor: isCheck ? Colors.red : Colors.green,
                      controlAffinity: ListTileControlAffinity.platform,
                      onChanged: (bool) {
                        if (mounted) {
                          setState(() {
                            isChecks[1] = bool;
                          });
                        }
                      }),
                ],
              ),
            )));
  }
}

class CheckboxDefault extends StatefulWidget {
  const CheckboxDefault() : super();
  @override
  State<StatefulWidget> createState() => _CheckboxDefault();
}

class _CheckboxDefault extends State {
  bool isChecked = false;
  Color color = RandomUtils.getRandomColor();
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: color,
        value: isChecked,
        onChanged: (bool bol) {
          setState(() {
            isChecked = bol;
          });
        });
  }
}

class CheckboxSelect extends StatelessWidget {
  final int index;
  final parent;

  const CheckboxSelect([this.parent, this.index = -1]) : super();

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: RandomUtils.getRandomColor(),
        value: parent.selectValue == this.index,
        onChanged: (bool bol) {
          parent.setState(() {
            parent.selectValue = bol ? this.index : -1;
          });
        });
  }
}
