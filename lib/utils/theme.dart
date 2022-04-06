import 'package:flutter/material.dart';

ThemeData basicTheme() => ThemeData(
      colorScheme: ColorScheme(
          primary: Colors.blue,
          secondary: Colors.blue,
          surface: Color.fromARGB(255, 235, 77, 77),
          background: Colors.teal,
          error: Colors.white,
          onPrimary: Color.fromARGB(255, 196, 66, 66),
          onSecondary: Colors.blue,
          onSurface: Colors.blue,
          onBackground: Colors.teal,
          onError: Colors.blue,
          brightness: Brightness.light),
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        shadowColor: Colors.red,
      ),
      // Это глобальный параметр для Activity

      buttonTheme: ButtonThemeData(
        // 4
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.lightGreenAccent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(20, 60)),
            elevation: MaterialStateProperty.all(15),
            backgroundColor: MaterialStateProperty.all(Colors.orange[800]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.lightBlueAccent),
              ),
            )),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(

              //elevation: MaterialStateProperty.all(15),
              // backgroundColor: MaterialStateProperty.all(Colors.pink),
              )),
      textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //subtitle(1-2), caption, overline

          bodyText2: TextStyle(fontSize: 16, fontFamily: 'Hind'),
          button: TextStyle(fontSize: 20, color: Colors.cyan)),
    );
