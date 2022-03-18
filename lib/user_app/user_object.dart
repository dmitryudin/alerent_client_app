import 'dart:convert';
import 'dart:io' as dio;
//import 'package:client/users/passport_object.dart';
import 'package:client/objects/base_object.dart';
import 'package:client/objects/passport_object.dart';
import 'package:client/utils/Fields.dart';
import 'package:client/utils/LoginController.dart';
import 'package:client/utils/RestConrtoller.dart';
import 'package:client/utils/photo_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class User implements BasicObject{
  static final User _user = User._internal();
  factory User() {
    return _user;
  }
  User._internal();

  void registration(){
    RestController.send_request(class_obj: this, controller:'client_registration', data:jsonEncode(toJson()));
  }  

  void getProfile(){
    id=_loginController.id;
    token.entity=_loginController.token;
    RestController.send_request(class_obj: this, controller:'client_get_profile', data:jsonEncode({"id":id, "token":token.entity}));
  }
  LoginController _loginController = LoginController();
  int id=0;
  Field<Passport> passport = Field(Passport());
  Field<String> lastName=Field('');
  Field<String> dadsName=Field('');
  Field<String> firstName= Field('');
  Field<String> phone=Field('');
  Field<String> email=Field('');
  Field<String> password=Field('');
  Field<String> dateOfBurn=Field('');
  Field<double> rating=Field(0.0);
  Field<MyImage> photo = Field(MyImage(''));
  Field<MyImage> qr = Field(MyImage(''));
  Field<String> token=Field('');
  Field<String> dateOfRegistration=Field('');
  Field<bool> isVerified=Field(false);


  fromJson(Map<String, dynamic> json)
  { firstName.entity = json['firstName'];  print('DEBUG'+firstName.entity); lastName.entity = json['lastName'];  dadsName.entity=json['dadsName'];
    phone.entity=json['phone']; email.entity = json['email'];  dateOfBurn.entity=json['dateOfBurn']; // _passport=json['passport'];

  photo.entity.uri=json['photo']; qr.entity.uri=json['qr'];//rating=json['rating'];
        dateOfRegistration.entity=json['dateOfRegistration'];
          //isVerified.entity=json['isVerified'];

   }

  Map<String, dynamic> toJson() {
    String base_64_photo='';
    if (photo.entity.uri!='') base_64_photo = RestController.fileInBase64(uri:photo.entity.uri);

    Map<String, dynamic> data = {
     'firstName': firstName.entity, 'lastName':lastName.entity, 'dadsName':dadsName.entity, 'phone':phone.entity, 'email':email.entity,
    'dateOfBurn':dateOfBurn.entity,  'photo':base_64_photo,'token':token.entity,
        'password':password.entity, '_passport': passport.entity
  };

  return data;
  }




  @override
  void clearData(){
    id=0;
     lastName=Field('');
     dadsName=Field('');
     firstName= Field('');
     phone=Field('');
     email=Field('');
     dateOfBurn=Field('');
     rating=Field(0.0);
     photo = Field(MyImage(''));
     qr= Field(MyImage(''));
     token=Field('');
     dateOfRegistration=Field('');
     isVerified=Field(false);
}
  @override
  void onDataAccepted(data, controller) {
    print('data accepted');
    fromJson(jsonDecode(data));
    // TODO: implement onDataAccepted
  }

  @override
  bool flagOfBusy=false;
}