import 'package:client/user_app/register_as_user.dart';
import 'package:client/register_screen/register_screen.dart';
import 'package:client/utils/LoginController.dart';
import 'package:client/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  MyScreen createState() {
    return MyScreen();
  }
}

class MyScreen extends State<LoginScreen> {
  void _goHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegisterScreenAsUser()));
  }

  LoginController _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 180, 180, 180)));
    return (Scaffold(
        body: Form(
            key: _formKey,
            child: Center(
                child: ListView(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.09, horizontal: width * 0.01),
                    children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    width: width,
                    height: height * 0.4,
                    //fit: BoxFit.contain,
                  ),
                  /* add child content here */
                  Column(children: <Widget>[
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.02),
                        child: TextFormField(
                            validator: (value) =>
                                Validator.isEmptyValid(value!),
                            onChanged: (String value) {
                              _loginController.login = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              labelText: "Телефон или Email",
                            ))),
                    SizedBox(height: 10),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.02),
                        child: TextFormField(
                            validator: (value) =>
                                Validator.isEmptyValid(value!),
                            onChanged: (String value) {
                              _loginController.password = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                              labelText: "Пароль",
                            ))),
                  ]),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  TextButton(
                    child: Text("Войти",
                        style: Theme.of(context).textTheme.headline2),
                    onPressed: () async {
                      await _loginController.sendLoginData();
                      setState(() {});
                    },
                  ),
                  TextButton(
                    child: Text("Зарегестрироваться",
                        style: Theme.of(context).textTheme.headline2),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: height * 0.07)),
                  TextButton(
                    child: Text("Не могу войти",
                        style: TextStyle(fontSize: 17, color: Colors.grey)),
                    onPressed: () async {
                      await _loginController.sendLoginData();
                      setState(() {});
                    },
                  ),
                ])))));
  }
}
