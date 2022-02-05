import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return(Scaffold( //ипользуется как activity в нативном андроиде
        appBar: AppBar( //Scaffold пригимает аргумент appBar в виде экземпляра класса AppBar
          title: Text('Авторизация'),
        ),
        body: Center(
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: height*0.09, horizontal: width*0.07),
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                  Card(
                      child:  Column(
                          children: const <Widget>[
                            TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Телефон или Email",
                                )
                            ),
                            TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "Пароль",
                                )
                            ),
                          ]
                      )),
                  TextButton(
                    child: const Text("Войти"),
                    onPressed: () {
                    },),
                  TextButton(
                    child: const Text("Зарегестрироваться"),
                    onPressed: () {
                    },)
                  ,]
            )
        )));
  }
}