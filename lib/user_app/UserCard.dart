

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/my_widgets/picture.dart';
import 'package:client/user_app/user_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditUserPage.dart';

class UserCard extends StatefulWidget{
  @override
  MyWidget createState(){
    return MyWidget();
  }
}

class MyWidget extends State<UserCard>{

  @override
  Widget build(BuildContext context) {
    var _user =Provider.of<User>(context, listen: true);
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Card(
        shadowColor: Colors.grey,
        elevation: 15,
        child: Column(children: <Widget>[
          ListTile(
            leading: Icon(Icons.people, color: Colors.cyan, size: 45),
            tileColor: Colors.teal,
            title: Text(
              "Личные данные",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: width / 3,

                padding: const EdgeInsets.symmetric(
                    vertical: 1, horizontal: 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
                child:
                 PictureWidget(fieldPhoto: _user.photo, title: 'загрузить аватарку', isActive: false,)),
              Flexible
                (child:Table(
                border: TableBorder(///horizontalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid),
                    verticalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid)),
                children: [
                  TableRow(children: [
                    Text('Фамилия', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_user.firstName.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Имя', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_user.lastName.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Отчество', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_user.dadsName.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Дата рождения', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_user.dateOfBurn.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Телефон', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_user.phone.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Email', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_user.email.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Семейное положение', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('в браке', textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Дети', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('1', textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Верификация профиля', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('В процессе', textAlign: TextAlign.start, ),
                  ]),
                ],
              ))
            ],
          ),
          TextButton(
              child: const Text("Изменить"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUserPage()));
                //_formKey.currentState!.validate();

              })
        ]));
  }
}