import 'package:client/users/user_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GalleryWidget extends StatefulWidget {
  var user;


  GalleryWidget(this.user, {Key? key}) :super (key: key);


  @override
  MyGallery createState() {
    return MyGallery(user);
  }
}

class MyGallery extends State<GalleryWidget> {
  var user_class;
  double r = 0.5;

  MyGallery(this.user_class);


  final ImagePicker _picker = ImagePicker();
  List<XFile>? images;
  static String avatar = 'Загрузите аватарку';

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.symmetric(
        vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
    border: Border.all(
    width: 1,
    ),
    ),
    child: GestureDetector(
    onTap: () async {
    images = await _picker.pickMultiImage();

    avatar = 'Аватар';
    for (var el in images!) {
    user_class.photo.add(File(el.path));
    }
    setState(() {

    // setImage();
    });
    },
    child: Column(
    children: <Widget>[
    Text(avatar),


    images == null
    ? Image.asset('assets/images/photo.png')
        : ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
    itemCount: images!.length,
    itemBuilder: (BuildContext context, int index) {
    return    Image.file(File(images![index].path));
    })

    ],
    )));

    }

  }