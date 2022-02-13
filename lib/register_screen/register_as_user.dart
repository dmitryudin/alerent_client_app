import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../users/user_object.dart';

class RegisterScreenAsUser extends StatefulWidget {
  const RegisterScreenAsUser({Key? key}) : super(key: key);

  @override
  MyScreen createState() {
    return MyScreen();
  }
}

class MyScreen extends State<RegisterScreenAsUser> {
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
          title: const Text('Регистрация Нанимателя'),
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.02),
            children: <Widget>[
              Card(
                shadowColor: Colors.grey,
                  elevation: 15,
                  child: Column(children: <Widget>[
                    ListTile(
                      tileColor: Colors.teal,
                      title: Text("Заполните личные данные", style: TextStyle(color: Colors.black),),
                    ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      onChanged: (String value) => _user.first_name = value,
                      decoration: InputDecoration(
                        labelText: 'Фамилия',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      onChanged: (String value) => _user.last_name = value,
                      decoration: InputDecoration(
                        labelText: 'Имя',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      onChanged: (String value) => _user.last_name = value,
                      decoration: InputDecoration(
                        labelText: 'Отчество',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                        onTap: () async {
                          image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          _user.imageBytes =
                              File(image!.path).readAsBytesSync();
                          avatar = 'Аватар';

                          setState(() {});
                        },
                        child: Column(
                          children: <Widget>[
                            Text(avatar),
                            image == null
                                ? Image.asset('assets/images/photo.png')
                                : Image.file(File(image!.path)),
                          ],
                        ))),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      onChanged: (String value) => _user.last_name = value,
                      decoration: InputDecoration(
                        labelText: 'Дата рождения',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      onChanged: (String value) => _user.phone = value,
                      decoration: InputDecoration(
                        labelText: 'Контактный телефон',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      onChanged: (String value) => _user.email = value,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                    )),
              ])),
              Card(
                elevation: 15,
                  child: Column(children: <Widget>[
                    ListTile(
                      tileColor: Colors.teal,
                      title: Text("Заполните данные паспотра", style: TextStyle(color: Colors.black),),
                    ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      controller: TextEditingController()
                        ..text = _user.passport,
                      onChanged: (String value) => _user.passport = value,
                      decoration: InputDecoration(
                        labelText: 'Серия паспорта',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      controller: TextEditingController()
                        ..text = _user.passport,
                      onChanged: (String value) => _user.passport = value,
                      decoration: InputDecoration(
                        labelText: 'Номер паспорта',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      controller: TextEditingController()
                        ..text = _user.passport,
                      onChanged: (String value) => _user.passport = value,
                      decoration: InputDecoration(
                        labelText: 'Дата выдачи',
                      ),
                    )),

              ])),
              TextButton(
                child: const Text("Сохранить"),
                onPressed: () {
                  _user.registration();
                },
              )
            ])));
  }
}
