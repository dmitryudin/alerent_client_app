import 'package:client/my_widgets/gallery.dart';
import 'package:client/my_widgets/picture.dart';
import 'package:client/objects/passport_object.dart';
import 'package:client/utils/DatePicker.dart';
import 'package:client/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../objects/user_object.dart';

class RegisterScreenAsUser extends StatefulWidget {
  const RegisterScreenAsUser({Key? key}) : super(key: key);

  @override
  MyScreen createState() {
    return MyScreen();
  }
}

class MyScreen extends State<RegisterScreenAsUser> {
  final _formKey = GlobalKey<FormState>();
  User _user = User();
  Passport _passport = Passport();


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
                          PictureWidget(_user.photo, 'загрузить аватарку'),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()..text = _user.dateOfBurn.entity,
                                onChanged: (String value) async {
                                  _user.dateOfBurn.entity = await DatePicker.selectDate(context);
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
                                onChanged: (String value){
                                  _user.email.entity = value;
                                  _user.email.isModified = true;
                                },
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
                            title: Text(
                              "Заполните данные паспотра",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                  onChanged: (String value) {
                                    _passport.series.entity = value;
                                    _passport.series.isModified = true;
                                  },
                                decoration: InputDecoration(
                                  labelText: 'Серия паспорта',
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                   onChanged: (String value)  {
                                   _passport.number.entity = value;
                                   _passport.number.isModified = true;
                              },
                                decoration: InputDecoration(
                                  labelText: 'Номер паспорта',
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                controller: TextEditingController()..text = _user.passport.entity.dateOfIssue.entity,
                                onChanged: (String value) async{
                                  _user.passport.entity.dateOfIssue.entity = await DatePicker.selectDate(context);
                                  _user.passport.entity.dateOfIssue.isModified =true;

                                },
                                decoration: InputDecoration(
                                  labelText: 'Дата выдачи',
                                ),
                              )),
                          PictureWidget(_user.passport.entity.photo_of_main_page,'загрузить основную страницу паспорта'),
                          SizedBox(height: height * 0.01),
                          PictureWidget(_user.passport.entity.photo_of_registeration, 'загрузить страницу паспорта с пропиской'),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                //   controller: TextEditingController(text: _passport.dateOfIssue),
                                onChanged: (String value) {

                                  setState(()=> _user.password.entity = value);

                                },
                                decoration: InputDecoration(
                                  labelText: 'Пароль',
                                ),
                              )),
                        ])),
                    TextButton(
                        child: const Text("Сохранить"),
                        onPressed: () {
                          //_formKey.currentState!.validate();
                          _user.registration();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        })
                  ]))
            ])));
  }
}
