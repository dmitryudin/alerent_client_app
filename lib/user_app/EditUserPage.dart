import 'package:client/my_widgets/picture.dart';
import 'package:client/user_app/user_object.dart';
import 'package:client/utils/DatePicker.dart';
import 'package:client/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUserPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<User>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return ((Scaffold(
        appBar: AppBar(
          title: const Text('Редактирование профиля'),
        ),
        body: ListView(
            scrollDirection: Axis.vertical, //Направление прокрутки
            shrinkWrap:
                true, //Чтобы масштабировался скролл при изменении элементов
            padding: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.02),
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Card(
                        shadowColor: Colors.grey,
                        elevation: 15,
                        child: Column(children: <Widget>[
                          ListTile(
                            tileColor: Colors.teal,
                            title: Text(
                              "Заполните личные данные",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()..text = _user.firstName.entity,
                                validator: (value) =>
                                    Validator.isEmptyValid(value!),
                                onChanged: (String value) {
                                  _user.firstName.entity = value;
                                  _user.firstName.isModified = true;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Фамилия',
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()..text = _user.lastName.entity,
                                validator: (value) =>
                                    Validator.isEmptyValid(value!),
                                onChanged: (String value) {
                                  _user.lastName.entity = value;
                                  _user.lastName.isModified = true;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Имя',
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()..text = _user.dadsName.entity,
                                validator: (value) =>
                                    Validator.isEmptyValid(value!),
                                onChanged: (String value) {

                                  _user.dadsName.entity = value;
                                  _user.dadsName.isModified = true;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Отчество',
                                ),
                              )),
                        Container(

                          child: PictureWidget(fieldPhoto: _user.photo, title: 'загрузить аватарку', isActive: true,),
                        ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()
                                  ..text = _user.dateOfBurn.entity,
                                onChanged: (String value) async {
                                  _user.dateOfBurn.entity =
                                      await DatePicker.selectDate(context);
                                  _user.dateOfBurn.isModified = true;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Дата рождения',
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()..text = _user.phone.entity,
                                onChanged: (String value) {
                                  _user.phone.entity = value;
                                  _user.phone.isModified = true;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Контактный телефон',
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()..text = _user.email.entity,
                                onChanged: (String value) {
                                  _user.email.entity = value;
                                  _user.email.isModified = true;
                                },
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                ),
                              )),
                        ])),
                    TextButton(
                        child: const Text("Сохранить"),
                        onPressed: () {
                          //_formKey.currentState!.validate();
                          _user.updateProfile();

                        })

                  ]))
            ]))));
  }
}
