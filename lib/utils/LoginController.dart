import 'dart:convert';
import 'dart:io';
import 'package:client/loginscreen/login_screen.dart';
import 'package:client/main.dart';
import 'package:client/objects/base_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RestConrtoller.dart';

class LoginController with ChangeNotifier implements BasicObject {
  static final LoginController _loginController = LoginController._internal();
  factory LoginController() {
    return _loginController;
  }
  LoginController._internal();

  int id=-1;
  bool isAuthFlag = false;
  String login = '';
  String password='';
  String token = '';
  String role = '';

  final prefs = SharedPreferences.getInstance();

  void init()async{

    final k = await prefs;
    prefs.then((value) {

      id = k.getInt('id')!;
      token = k.getString('token')!;
      role = k.getString('role')!;
      //RestartWidget.restartApp(ls.context1);
      if (id!=-1) isAuthFlag = true;
      notifyListeners();


    });
  }

  setSession()async{
    final k = await prefs;
  prefs.then((value) {
    k.setString('token', token);
    k.setInt('id', id);
    k.setString('role', role);
    if (id!=-1) isAuthFlag = true;
    notifyListeners();

    });
    return k;

  }

  bool isAuth(){
    if (id==-1) return false;

    return true;
  }


  sendLoginData() {
    RestController.send_request(class_obj: this, controller:'client_login', data:jsonEncode(toJson()));
  }


  Map<String, dynamic> toJson()=>{
    "login":login, "password":password
  };

  fromJson(json)  {
    id=json['id'];
    token=json['token'];
  }

  @override
  void onDataAccepted(data, controller) {
    fromJson(json.decode(data.toString()));
    setSession();
    notifyListeners();

 }

  @override
  bool flagOfBusy=false;

  @override
  void clearData() {
    // TODO: implement clearData
  }


}