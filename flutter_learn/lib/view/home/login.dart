import 'package:flutter/material.dart';
import 'package:flutter_learn/i10n/localization_intl.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/utils/http.dart';
import 'package:flutter_learn/utils/provider.dart';
import 'package:flutter_learn/utils/toast.dart';
import 'package:flutter_learn/view/home/register.dart';
import 'package:flutter_learn/view/loading_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 响应空白处的焦点的Node
  bool _isShowPassWord = false;
  FocusNode blankNode = FocusNode();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            // leading: _leading(context),
            title: Text(Languages.of(context).login),
            actions: <Widget>[
              FlatButton(
                child: Text(Languages.of(context).register),
                textColor: Colors.white,
                onPressed: () {
                  XRouter.gotoWidget(context, RegisterPage());
                },
              )
            ],
          ),
          body: GestureDetector(
            onTap: () {
              // 点击空白页面关闭键盘
              closeKeyboard(context);
            },
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: buildForm(context),
            ),
          ),
        ),
        onWillPop: () async {
          return Future.value(false);
        });
  }

  Widget _leading(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4),
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  //构建表单
  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
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
                  labelText: Languages.of(context).loginName,
                  hintText: Languages.of(context).loginNameHint,
                  hintStyle: TextStyle(fontSize: 12),
                  icon: Icon(Icons.person)),
              //校验用户名
              validator: (v) {
                return v.trim().length > 0
                    ? null
                    : Languages.of(context).loginNameError;
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: Languages.of(context).password,
                  hintText: Languages.of(context).passwordHint,
                  hintStyle: TextStyle(fontSize: 12),
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
                return v.trim().length >= 6
                    ? null
                    : Languages.of(context).passwordError;
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Builder(builder: (context) {
                  return RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text(Languages.of(context).login),
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
            showContent: false,
            backgroundColor: Colors.black38,
            loadingView: SpinKitCircle(color: Colors.white),
          );
        });

    UserProfile userProfile = Provider.of<UserProfile>(context, listen: false);

    XHttp.post("/user/login", {
      "username": _unameController.text,
      "password": _pwdController.text
    }).then((response) {
      Navigator.pop(context);
      if (response['errorCode'] == 0) {
        userProfile.nickName = response['data']['nickname'];
        XToast.toast(Languages.of(context).loginSuccess);
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        XToast.error(response['errorMsg']);
      }
    }).catchError((onError) {
      Navigator.of(context).pop();
      XToast.error(onError);
    });
  }
}
