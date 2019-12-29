import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';

class FormPage extends StatefulWidget {
  FormPage({this.title = "表单", Key key}) : super(key: key);
  final String title;
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // 响应空白处的焦点的Node
  FocusNode blankNode = FocusNode();
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: buildForm(context),
        ),
      ),
    );
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidate: true, //开启自动校验
      child: Column(
        children: <Widget>[
          Center(
              heightFactor: 1.5,
              child: Image(
                image: AssetImage('assets/images/flutter.png'),
                height: 64,
                width: 64,
              )),
          TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: "密码", hintText: "您的登录密码", icon: Icon(Icons.lock)),
              obscureText: true,
              //校验密码
              validator: (v) {
                return v.trim().length >= 8 ? null : "密码不能少于8位";
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text("登录"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if (Form.of(context).validate()) {
                        //验证通过提交数据
                        XToast.success("用户名:" +
                            _unameController.text +
                            ",密码:" +
                            _pwdController.text);
                      }
                    },
                  );
                })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
