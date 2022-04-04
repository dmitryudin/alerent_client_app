

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/my_widgets/picture.dart';
import 'package:client/user_app/user_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditUserPage.dart';

class UserCard extends StatefulWidget{
  @override
  MyWidget createState(){
    return MyWidget();
  }
}

class MyWidget extends State<UserCard>{

  @override
  Widget build(BuildContext context) {
    var _user =Provider.of<User>(context, listen: true);
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,

        colors: [
        const Color(0xFF3366FF),
    const Color(0xFF00CCFF),
        ],
    )),
        width: width-50,

        child: CircleAvatar(
      child: ClipOval(

        child: CachedNetworkImage(imageUrl: _user.photo.entity.uri,
            width: width/3.8,
      fit: BoxFit.fill
      )),
        backgroundColor: Colors.transparent,
        radius: 55,
    ));
  }
}