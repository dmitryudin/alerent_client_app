import 'dart:io';

import 'package:client/user_app/HomePageUser.dart';
import 'package:client/user_app/main_screen_user.dart';
import 'package:client/register_screen/register_screen.dart';
import 'package:client/user_app/user_object.dart';
import 'package:client/utils/LoginController.dart';
import 'package:client/utils/RestConrtoller.dart';
import 'package:client/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'loginscreen/login_screen.dart';
import 'objects/passport_object.dart';






void main() {
  RestController.init();
  LoginController().init();
  runApp(MyApp()); // Функция в качестве аргумента принимает
                    // экземпляр класса MyApp (корневой виджет)
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<User>(create: (context) => User()),
          ChangeNotifierProvider<Passport>(create: (context) => Passport()),
        ],
        child: MaterialApp(
          theme: basicTheme(),
            title: 'Flutter Demo',
            home: Choose()));

  }
}


class Choose extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return ChooseScreen();
  }
}

class ChooseScreen extends State<Choose>{

  ChooseScreen(){
    LoginController().addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (LoginController().isAuthFlag){
      return HomePageUser();
    }
    else{
      return LoginScreen();
    }
  }





}




