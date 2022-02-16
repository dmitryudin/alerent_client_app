import 'dart:convert';
import 'dart:io' as dio;
import 'package:http/http.dart' as http;


class User {

  Future<User> registration() async {

    User _user = User();

    final response = await http.post(
      Uri.parse('http://192.168.43.246:5050/client/registration'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(toJson())
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<User> get_data(String title) async {
    final response = await http.post(
      Uri.parse('http://192.168.43.246:5050/client/get_profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  static final User _user = User._internal();
  int id=0;
  List<String> photo_str = [];
  String first_name='';
  String last_name='';
  String phone='';
  String email='';
  String dateOfBurn='';
  String passport='';
  double rating=0.0;
  List<dio.File> photo=[];
  String qr='';
  String token='';
  String date_of_registration='';
  bool is_verified=false;
  List<int>? imageBytes;

  User.fromJson(Map<String, dynamic> json)
      : first_name = json['first_name'], last_name = json['last_name'], phone=json['phone'],
        email = json['email'], dateOfBurn=json['dateOfBurn'], passport=json['passport'],
        rating=json['rating'], photo=json['photo'], qr=json['qr'], token=json['token'],
        date_of_registration=json['date_of_registration'], is_verified=json['is_verified'];

  Map<String, dynamic> toJson() {
    photo_str = [];
    for (var el in photo){
      photo_str.add(base64Encode(el.readAsBytesSync()));
    }
    return {
    'first_name': first_name, 'last_name':last_name, 'phone':phone, 'email':email,
    'dateOfBurn':dateOfBurn, 'passport':passport, 'rating':rating, 'photo':photo_str,
    'qr':qr, 'token':token, 'date_of_registration':date_of_registration, 'is_verified':is_verified
  };}

  factory User() {
    return _user;
  }
  User._internal();
}