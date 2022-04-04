import 'dart:convert';
import 'dart:io' as dio;
//import 'package:client/users/passport_object.dart';
import 'package:client/objects/base_object.dart';
import 'package:client/objects/passport_object.dart';
import 'package:client/user_app/HomePageUser.dart';
import 'package:client/utils/Fields.dart';
import 'package:client/utils/LoginController.dart';
import 'package:client/utils/RestConrtoller.dart';
import 'package:client/utils/photo_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class User with ChangeNotifier implements BasicObject{
  User(){
    getProfile();
  }
  void registration(){
    RestController.send_request(class_obj: this, controller:'client_registration', data:jsonEncode(toJson()));
  }  

  void getProfile(){
    // TODO: проверим Интернет и в случае его отсутсвия попытаемся поискать данные в локальной базе данных
    id=_loginController.id;
    token.entity=_loginController.token;
    RestController.send_request(class_obj: this, controller:'client_get_profile', data:jsonEncode({"id":id, "token":token.entity}));
  }

  LoginController _loginController = LoginController();
  Passport passportObject = Passport();
  int id=0;
  Field<String> firstName= Field('');
  Field<String> lastName=Field('');
  Field<String> dadsName=Field('');
  Field<String> phone=Field('');
  Field<String> email=Field('');
  Field<String> dateOfBurn=Field('');
  Field<bool> sitizenshipOfRussia=Field(true);
  Field<int> animals = Field(-1);
  Field<MyImage> photo = Field(MyImage(''));
  Field<MyImage> qr = Field(MyImage(''));
  Field<String> dateOfRegistration=Field('');
  Field<String> token=Field('');
  Field<String> checkCode = Field('');
  Field<bool> isVerified=Field(false);
  Field<double> rating=Field(0.0);
  Field<String> password=Field('');
  Field<int> passportId = Field(-1);



  fromJson(Map<String, dynamic> json)
  { firstName.entity = json['firstName'];  lastName.entity = json['lastName'];  dadsName.entity=json['dadsName'];
    phone.entity=json['phone']; email.entity = json['email'];  dateOfBurn.entity=json['dateOfBurn']; // _passport=json['passport'];
  passportId.entity = json['passportId'];
  photo.entity.uri=json['photo']; qr.entity.uri=json['qr'];//rating=json['rating'];
        dateOfRegistration.entity=json['dateOfRegistration'];
          //isVerified.entity=json['isVerified'];
   }

  Map<String, dynamic> toJson() {
    String base_64_photo='';
    if (photo.entity.uri!=''&&photo.isModified) base_64_photo = RestController.fileInBase64(uri:photo.entity.uri);

    Map<String, dynamic> data = {};
    if (firstName.isModified) data['firstName']=firstName.entity;
    if (lastName.isModified) data['lastName']=lastName.entity;
    if (dadsName.isModified) data['dadsName']=dadsName.entity;
    if (phone.isModified) data['phone']=phone.entity;
    if (email.isModified) data['email']=email.entity;
    if (dateOfBurn.isModified) data['dateOfBurn'] = dateOfBurn.entity;
    if (photo.isModified) data['photo'] = base_64_photo;
    data['token']=token.entity;
    data['_passport'] = passportObject;
    if (password.isModified) data['password'] = password.entity;
  return data;
  }

  void updateProfile(){
    RestController.send_request(class_obj: this, controller:'client_update_profile', data:jsonEncode(toJson()));
  }


  @override
  void clearData(){

}
  @override
  void onDataAccepted(data, controller) {
    print('data accepted');
    fromJson(jsonDecode(data));
    notifyListeners();
  }

  @override
  bool flagOfBusy=false;
}