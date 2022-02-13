import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../users/user_object.dart';

class RegisterScreenAsOwner extends StatefulWidget{
  const RegisterScreenAsOwner({Key? key}) : super(key: key);

  @override
  MyScreen createState() {

    return MyScreen();
  }

}


class MyScreen extends State<RegisterScreenAsOwner>{
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
          title: const Text('Регистрация'),
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.07),
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    onChanged:(String value)=> _user.first_name=value,
                    decoration: InputDecoration(
                      labelText:'Введите имя',
                    ),
                  )
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    onChanged:(String value)=> _user.last_name=value,
                    decoration: InputDecoration(
                      labelText:'Введите фамилию',

                    ),
                  )
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: GestureDetector(
                      onTap: ()  async {
                        image = await _picker.pickImage(source: ImageSource.gallery);
                        _user.imageBytes = File(image!.path).readAsBytesSync();
                        avatar='Аватар';

                        setState(() {
                        });
                      },
                      child: Column(
                        children: <Widget> [
                          Text(avatar),
                          image == null
                              ? Image.asset('assets/images/photo.png')
                              : Image.file(File(image!.path)),

                        ],
                      )
                  )),


              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    onChanged:(String value)=> _user.phone=value,
                    decoration: InputDecoration(
                      labelText:'Введите телефон',
                    ),
                  )
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    onChanged:(String value)=> _user.email=value,
                    decoration: InputDecoration(
                      labelText:'Введите E-mail',
                    ),
                  )
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    onChanged:(String value)=> _user.dateOfBurn=value,
                    decoration: InputDecoration(
                      labelText:'Введите дату рождения',
                    ),
                  )
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: TextFormField(
                    controller: TextEditingController()..text = _user.passport,
                    onChanged:(String value)=> _user.passport=value,
                    decoration: InputDecoration(
                      labelText:'Введите серию паспорта',
                    ),
                  )
              ),
              TextButton(
                child:const Text("Сохранить"),
                onPressed: () {
                  _user.registration();
                },)
            ]
        )
    )



    );
  }

}