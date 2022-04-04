import 'dart:convert';
import 'dart:io' as dio;
import 'package:client/objects/base_object.dart';
import 'package:client/utils/Fields.dart';
import 'package:client/utils/LoginController.dart';
import 'package:client/utils/RestConrtoller.dart';
import 'package:client/utils/photo_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Passport with ChangeNotifier implements BasicObject{

  static final Passport _passport = Passport._internal();
  factory Passport() {
    return _passport;
  }
  Passport._internal();




  int id = 0;
  Field<String> series = Field('');
  Field<String> number = Field('');
  Field<String> dateOfIssue = Field('');
  Field<MyImage> photoOfMainPage = Field(MyImage(''));
  Field<MyImage> photoOfRegisteration = Field(MyImage(''));
  Field<bool> isVerified = Field(false);
  LoginController _loginController = LoginController();



  void getData(){
    // TODO: проверим Интернет и в случае его отсутсвия попытаемся поискать данные в локальной базе данных
    id=_loginController.id;
    var token=_loginController.token;
    RestController.send_request(class_obj: this, controller:'client_get_passport', data:jsonEncode({"id":id, "token":token}));
  }

  fromJson(Map<String, dynamic> json){
       series.entity = json['series'];  number.entity = json['number'];
       dateOfIssue.entity = json['dateOfIssue']; //isVerified.entity = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    String base64_photo_of_main_page ='';
    String base64_photo_of_registeration='';
    if (photoOfMainPage.entity.uri!='') base64_photo_of_main_page = RestController.fileInBase64(uri:photoOfMainPage.entity.uri);
    if (photoOfRegisteration.entity.uri!='') base64_photo_of_registeration = RestController.fileInBase64(uri:photoOfRegisteration.entity.uri);
    return {
      'series': series.entity,
      'number': number.entity,
      'dateOfIssue': dateOfIssue.entity,
      'photoOfMainPage':  base64_photo_of_main_page,
      'photoOfRegisterationPage':base64_photo_of_registeration,
    };
  }



  @override
  void clearData() {
    id = 0;
    series = Field('');
    number = Field('');
    dateOfIssue = Field('');
    photoOfMainPage = Field(MyImage(''));
    photoOfRegisteration = Field(MyImage(''));
    isVerified = Field(false);
    // TODO: implement clearData
  }

  @override
  void onDataAccepted(data, controller) {
  fromJson(jsonDecode(data));
  notifyListeners();
    // TODO: implement onDataAccepted
  }

  @override
  bool flagOfBusy=false;
}
