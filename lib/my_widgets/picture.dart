import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/user_app/user_object.dart';
import 'package:client/utils/Fields.dart';
import 'package:client/utils/photo_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PictureWidget extends StatefulWidget {
  Field<MyImage> fieldPhoto;
  String title=''; bool isActive = true;

  PictureWidget({required this.fieldPhoto, this.title='', this.isActive=true, Key? key}) : super(key: key);
  @override
  MyGallery createState() {
    return MyGallery(fieldPhoto, title, isActive);
  }
}

class MyGallery extends State<PictureWidget> {
  Field<MyImage> fieldPhoto;
  String title;

  bool isActive = true;
  MyGallery(this.fieldPhoto, this.title, this.isActive);

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  var myImg;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (fieldPhoto.entity.uri.contains('http') || !isActive) myImg = CachedNetworkImage(
      placeholder: (context, url) => const CircularProgressIndicator(),
      imageUrl: fieldPhoto.entity.uri,

    );
    else if (image==null) myImg = Column(children: [
        Text('Нажмите'),
    Icon(Icons.add_a_photo, color: Colors.orange, size: screenSize.width/3),
    Text('чтобы '+title, textAlign: TextAlign.center),
    ],
    );
    else myImg=Image.file(File(image!.path));
    return GestureDetector(
            onTap: () async {
              image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50,);

              setState(() {
                fieldPhoto.entity.uri = image!.path;
                fieldPhoto.isModified = true;
                // setImage();
              });
            },
            child: Column(
              children: <Widget>[
               myImg
              ],
            ));
  }
}
