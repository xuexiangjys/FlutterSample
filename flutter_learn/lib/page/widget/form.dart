import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/view/loading_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FormPage extends StatefulWidget {
  FormPage(this.title, {Key key}) : super(key: key);
  final String title;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // 响应空白处的焦点的Node
  bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          closeKeyboard(context);
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
      //开启自动校验
      autovalidateMode: AutovalidateMode.always,
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
              autofocus: false,
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
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isShowPassWord
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: showPassWord)),
              obscureText: !_isShowPassWord,
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
                        onSubmit(context);
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

  ///点击控制密码是否显示
  void showPassWord() {
    setState(() {
      _isShowPassWord = !_isShowPassWord;
    });
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(blankNode);
  }

  //验证通过提交数据
  void onSubmit(BuildContext context) {
    closeKeyboard(context);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            content: "登录中…",
            loadingView: SpinKitCircle(color: Colors.lightBlue),
          );
        });
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      XToast.success(
          "用户名:" + _unameController.text + ",密码:" + _pwdController.text);
    });
  }
}
