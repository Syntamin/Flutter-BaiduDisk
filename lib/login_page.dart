import 'package:baidudisk/main.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Baidu Disk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), //首页路由
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _biggerFont =
  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600);
  final _normalFont = const TextStyle(fontSize: 18.0);
  final _borderRadius = BorderRadius.circular(6);

//  bool _obsureText = false; //test

  String _accountText = '';
  String _pwdText = '';
  bool _isEnableLogin = false;
  bool _obsureText = true;

//  登录页面的widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginPage'),
        ),
        body: SingleChildScrollView(
          //包裹滚动条
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: <Widget>[
                _buildTopWidget(),
                _buildAccountEditTextField(),
                _buildPWDEditTextFiled(),
                _bulidLoginButton(),
              ],
            ),
          ),
        ));
  }

//  登录图标widget
  Widget _buildTopWidget() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/baidu_resultlogo.png'),
          Text(
            '欢迎登录百度帐户',
            style: _biggerFont,
          )
        ],
      ),
    );
  }

//  账户输入框widget
  Widget _buildAccountEditTextField() {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: TextField(
        onChanged: (text) {
          _accountText = text;
          _checkUserInput();
        },
        style: _normalFont,
        decoration: InputDecoration(
          hintText: '请输入手机号/用户名/邮箱',
          filled: true,
          fillColor: Color.fromARGB(255, 240, 240, 240),
          contentPadding: EdgeInsets.only(left: 8),
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: _borderRadius),
        ),
      ),
    );
  }

//  密码输入框widget
  Widget _buildPWDEditTextFiled() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextField(
        onChanged: (text) {
          _pwdText = text;
          _checkUserInput();
        },
        style: _normalFont,
        obscureText: _obsureText,
        decoration: InputDecoration(
          hintText: '请输入登录密码',
          filled: true,
          fillColor: Color.fromARGB(250, 240, 240, 240),
          contentPadding: EdgeInsets.only(left: 8),
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: _borderRadius),
          suffixIcon: IconButton(
            onPressed: () => setState(() => _obsureText = !_obsureText),
            icon: Image.asset(
              _obsureText ? 'assets/hide.png' : 'assets/open.png',
              width: 20,
              height: 20,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

//  登录按钮widget
  Widget _bulidLoginButton() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: RaisedButton(
        child: Text(
          "登录",
          style: _normalFont,
        ),
        color: Colors.blue,
        disabledColor: Colors.black12,
        textColor: Colors.white,
        disabledTextColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius,
        ),
        onPressed: _getLoginButtonPressed(),
      ),
    );
  }

  _getLoginButtonPressed() {
    if (!_isEnableLogin) {
      return null;
    }
    return () {
      showDialog( //点击登录显示账户名以及账户密码，点击确定登录到主页面，点击取消返回登陆界面
          context: this.context,
          builder: (context) {
            return AlertDialog(
              title: Text('登陆提醒'),
              content: Text('登陆账户:$_accountText\n''登录密码:$_pwdText'),
              actions: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  child: Text(
                    '确认',
                    style: _normalFont,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  child: Text(
                    '取消',
                    style: _normalFont,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
      );
//      Navigator.push(
//          context,
//          new MaterialPageRoute(
//              builder: (context) => personal_center())); //跳转个人中心页面
    };
  }

  void _checkUserInput() {
    if (_accountText.isNotEmpty && _pwdText.isNotEmpty) {
//      是否允许登录：账户与密码输入框不为空
      if (_isEnableLogin) return;
    } else {
      if (!_isEnableLogin) return;
    }

    setState(() {
      _isEnableLogin = !_isEnableLogin;
    });
  }
}


