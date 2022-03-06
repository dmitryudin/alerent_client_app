import 'dart:convert';
import 'dart:io' as dio;
import 'package:client/utils/photo_class.dart';
import 'package:http/http.dart' as http;

class Passport {


  Future<Passport> registration() async {
    final response = await http.post(
        Uri.parse('http://192.168.43.246:5050/client/registration'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(toJson()));

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Passport.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<Passport> get_data(String title) async {
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
      return Passport.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  static final Passport _passport = Passport._internal();
  int id = 0;
  String series = '';
  String number = '';
  String dateOfIssue = '';
  Photo photo_of_main_page = Photo(dio.File(''));
  Photo photo_of_registeration = Photo(dio.File(''));
  String base64_photo_of_main_page ='';
  String base64_photo_of_registeration='';
  bool is_verified = false;


  Passport.fromJson(Map<String, dynamic> json)
      : series = json['series'],
        number = json['number'],
        dateOfIssue = json['date_of_issue'],
        photo_of_main_page=json['photo_of_main_page'],
        photo_of_registeration = json['photo_of_registeration'],
        is_verified = json['is_verified'];

  Map<String, dynamic> toJson() {
    try {
      base64_photo_of_main_page = base64Encode(photo_of_main_page.photo.readAsBytesSync());
      base64_photo_of_registeration = base64Encode(photo_of_registeration.photo.readAsBytesSync());
    }
    catch(e){
      base64_photo_of_main_page ='';
      base64_photo_of_registeration='';
    }
    return {
      'series': series,
      'number': number,
      'date_of_issue': dateOfIssue,
      'photo_of_main_page':  base64_photo_of_main_page,
      'photo_of_registeration':base64_photo_of_registeration,
      'is_verified': is_verified
    };
  }

  factory Passport() {
    return _passport;
  }
  Passport._internal();
}
