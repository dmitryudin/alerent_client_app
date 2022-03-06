import 'dart:convert';
import 'dart:io' as dio;
import 'package:client/users/passport_object.dart';
import 'package:client/utils/Fields.dart';
import 'package:client/utils/photo_class.dart';
import 'package:http/http.dart' as http;


class User {
  Passport _passport = Passport();
  Future<User> registration() async {



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

  Field<String> last_name=Field('');
  Field<String> dads_name=Field('');
  Field<String> first_name= Field('');
  Field<String> phone=Field('');
  Field<String> email=Field('');
  Field<String> dateOfBurn=Field('');
  Field<double> rating=Field(0.0);
  Field<MyImage> photo = Field(MyImage(''));
  Field<String> qr=Field('');
  Field<String> token=Field('');
  Field<String> date_of_registration=Field('');
  Field<bool> is_verified=Field(false);


  User.fromJson(Map<String, dynamic> json)
  { first_name.value = json['first_name']; last_name.value = json['last_name']; dads_name.value=json['dads_name']; phone.value=json['phone'];
        email.value = json['email']; dateOfBurn.value=json['dateOfBurn']; _passport=json['passport'];
        rating=json['rating']; photo.value=json['photo']; qr.value=json['qr']; token.value=json['token'];
        date_of_registration.value=json['date_of_registration']; is_verified.value=json['is_verified'];}

  Map<String, dynamic> toJson() {
    String base_64_photo = '';
    try {
      base_64_photo = base64Encode(photo.photo.readAsBytesSync());
    }
    catch(e){
      base_64_photo ='';
    }

     return {
    'first_name': first_name.value, 'last_name':last_name.value, 'dads_name':dads_name.value, 'phone':phone.value, 'email':email.value,
    'dateOfBurn':dateOfBurn.value, 'rating':rating, 'photo':base_64_photo,
    'qr':qr.value, 'token':token.value, 'date_of_registration':date_of_registration.value, 'is_verified':is_verified, 'passport':_passport
  };}

  factory User() {
    return _user;
  }
  User._internal();
}