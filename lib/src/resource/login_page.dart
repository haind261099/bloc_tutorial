import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool password = false;
  String usernameError = 'Username không hợp lệ';
  String passwordError = 'Password không hợp lệ';
  bool usernameInvalid = false;
  bool passwordInvalid = false;

  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void showAndHidePassword() {
    setState(() {
      password = !password;
    });
  }

  void onSignInClicked() {
    setState(() {
      if (userController.text.length < 6 ||
          !userController.text.contains('@')) {
        usernameInvalid = true;
      } else {
        usernameInvalid = false;
      }

      if (passwordController.text.length < 6) {
        passwordInvalid = true;
      } else {
        passwordInvalid = false;
      }

      if (!usernameInvalid && !passwordInvalid) {
        //neu khong ton tai usernameInvalid va passwordInvalid thi chuyen trang
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/5.jpg'),
              ),
            ),
            SizedBox(height: 40.0),
            Text('Hello\nWelcome back',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                )),
            TextField(
              controller:
                  userController, //dai dien cho input user tro den cac gia tri cua input
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'USERNAME',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                errorText: usernameInvalid ? usernameError : null,
              ),
            ),
            SizedBox(height: 20.0),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget>[
                TextField(
                  controller:
                      passwordController, //dai dien cho input password tro den cac gia tri cua input
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  obscureText: !password,
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      errorText: passwordInvalid ? passwordError : null,
                      labelStyle:
                          TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
                GestureDetector(
                  //them 1 cu chi, hanh dong
                  onTap: () {
                    showAndHidePassword();
                  },
                  child: Text(
                    password ? 'HIDE' : 'SHOW',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity, //SizedBox keo dai toan bo man hinh
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  onSignInClicked();
                },
                color: Colors.blue,
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'NEW USER? SIGN UP',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text('FORGOT PASSWORD?',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
