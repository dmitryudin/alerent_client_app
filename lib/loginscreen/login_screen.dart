
import 'package:client/register_screen/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
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
                    width: width,
                    height: height*0.4,
                    //fit: BoxFit.contain,
                  ),
                  Card(
                      child:  Column(
                          children:  <Widget>[
                            TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Телефон или Email",
                                )
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },)
                  ,]
            )
        )));
  }
}