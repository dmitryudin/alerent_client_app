import 'dart:io';
import 'package:client/mainscreen/main_screen_owner.dart';
import 'package:client/register_screen/register_as_realtor.dart';
import 'package:client/register_screen/register_as_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../users/user_object.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  MyScreen createState() {

    return MyScreen();
  }

}


class MyScreen extends State<RegisterScreen>{
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  static String avatar = 'Загрузите аватарку';
  User _user = User();

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
            padding: EdgeInsets.symmetric(vertical: height*0.1, horizontal: width*0.07),
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      color: Colors.deepOrange[200],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextButton(

                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child:const Text("Наниматель"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreenAsUser()));
                    },)
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent[100],
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextButton(

                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child:const Text("Собственник"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreenAsOwner()));
                    },)
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      color: Colors.teal[100],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextButton(

                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child:const Text("Риелтор"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreenAsRealtor()));
                    },)
              ),

            ]
        )
    )



    );
  }

}