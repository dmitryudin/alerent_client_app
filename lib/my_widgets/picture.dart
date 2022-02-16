import 'package:client/users/user_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PictureWidget extends StatefulWidget {
  var user;

  PictureWidget(this.user, {Key? key}) : super(key: key);

  @override
  MyGallery createState() {
    return MyGallery(user);
  }
}

class MyGallery extends State<PictureWidget> {
  var user_class;
  double r = 0.5;

  MyGallery(this.user_class);

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  static String avatar = 'Загрузите аватарку';
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 2,
        width: 2,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
          border: Border.all(
            width: 20,
          ),
        ),
        child: GestureDetector(
            onTap: () async {
              image = await _picker.pickImage(source: ImageSource.gallery);

              avatar = 'Аватар';
              user_class.photo.add(File(image!.path));
              setState(() {
                // setImage();
              });
            },
            child: Column(
              children: <Widget>[
                Text(avatar),
                image == null
                    ? Image.asset('assets/images/photo.png', width: 320, height: 240)
                    : Image.file(File(image!.path)),
              ],
            )));
  }
}
