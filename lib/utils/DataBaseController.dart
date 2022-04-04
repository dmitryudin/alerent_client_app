import 'dart:async';
import 'dart:convert';

import 'package:client/objects/base_object.dart';
import 'package:flutter/cupertino.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';
import 'RestConrtoller.dart';
/*
class ReloadController {
  BuildContext? context;
  static final ReloadController _reloadController = ReloadController
      ._internal();

  factory ReloadController([nullWidget]) {
    return _reloadController;
  }

  ReloadController._internal();
  ReloadController.setContext(this.context);

  void restart(){
    RestartWidget.restartApp(context!);
  }

}



class DataBaseController implements BasicObject {
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


  sendLoginData(){
    RestController.send_request(class_obj: this, controller:'client_login', data:jsonEncode(toJson()));
  }


  Map<String, dynamic> toJson()=>{
    "login":login, "password":password
  };


  Future<Database> getDB() async{
    Future<Database> db = openDatabase(join(await getDatabasesPath(), 'db.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE auth(id INTEGER PRIMARY KEY, token TEXT, ids INTEGER)',
        );
      },
      version: 1,
    );
    return db;

  }

  Future<List<Map<String, dynamic>>> getSession() async {
    Database db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query('auth');
    print('db asked $maps');
    return maps;
  }

  Future<bool> isAuth () async {


    var res = await getSession();
    id=res[0]['ids'];
    token=res[0]['token'];
    if (id==-1) isAuthFlag=false;
    else isAuthFlag=true;
    return true;
  }

  void setSession() async {
    Database db = await getDB();
    await db.insert(
      'auth',
      {"ids": id, "token":token},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.delete(
      'auth',
      where: 'id > 1',
    );

  }




  @override
  void clearData() {
    // TODO: implement clearData
  }

  fromJson(json)  {
    id=json['id'];
    token=json['token']; }

  @override
  void onDataAccepted(data, controller) {

    fromJson(json.decode(data.toString()));
    setSession();
    getSession();



  }

  @override
  bool flagOfBusy=false;
}
*/
