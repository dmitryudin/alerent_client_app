import 'package:client/mainscreen/main_screen_owner.dart';
import 'package:client/register_screen/register_as_realtor.dart';
import 'package:client/register_screen/register_as_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../users/user_object.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  MyScreen createState() {
    return MyScreen();
  }
}

class MyScreen extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return (Scaffold(
        appBar: AppBar(
          title: const Text('Зарегестрироватья как...'),
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.1, horizontal: width * 0.07),
            children: <Widget>[
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(height * 0.5, height * 0.1)),
                        elevation: MaterialStateProperty.all(15),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        )),
                    child: const Text("Наниматель",
                        style: TextStyle(
                          color: Colors.black, // зеленый цвет текста
                          fontSize: 26, // высота шрифта 26
                          // черный цвет фона текста
                        )),
                    onPressed: () {
                      setState(() {});

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreenAsUser()));
                    },
                  )),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                  decoration: BoxDecoration(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(height * 0.5, height * 0.1)),
                        elevation: MaterialStateProperty.all(15),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        )),
                    child: const Text("Собственник",
                        style: TextStyle(
                          color: Colors.black, // зеленый цвет текста
                          fontSize: 26, // высота шрифта 26
                          // черный цвет фона текста
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreenAsOwner()));
                    },
                  )),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(height * 0.5, height * 0.1)),
                        elevation: MaterialStateProperty.all(15),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        )),
                    child: const Text("Риелтор",
                        style: TextStyle(
                          color: Colors.black, // зеленый цвет текста
                          fontSize: 26, // высота шрифта 26
                          // черный цвет фона текста
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreenAsRealtor()));
                    },
                  )),
            ])));
  }
}
