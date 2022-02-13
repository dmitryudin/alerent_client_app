import 'package:client/mainscreen/main_screen_user.dart';
import 'package:client/register_screen/register_screen.dart';
import 'package:client/users/user_object.dart';
import 'package:flutter/material.dart';

import 'loginscreen/login_screen.dart';

void main() {
  runApp(MyApp()); // Функция в качестве аргумента принимает
                    // экземпляр класса MyApp (корневой виджет)
}

class MyApp extends StatelessWidget { //наследование от StatelessWidget

  @override // переопределение
  Widget build(BuildContext context) {
    User _user = User();
    _user.get_data('');
    return MaterialApp( // MaterialApp - корневой виджет
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

