import 'dart:io';
import 'package:client/user_app/user_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryWidget extends StatefulWidget {
  var user;
  GalleryWidget(this.user, {Key? key}) :super (key: key);
  @override
  MyGallery createState() {
    return MyGallery(user);
  }
}

class MyGallery extends State<GalleryWidget> {
  static String avatar = 'Загрузите аватарку';
  var user_class;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? images;
  MyGallery(this.user_class);
  List<Image> my_photos = [];
  List<Container> wrapper_widget = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                user_class.photo.clear();
                my_photos.clear();
                wrapper_widget.clear();
                avatar = 'Аватар';
                for (var el in images!) {
                  user_class.photo.add(File(el.path));

                }
                setState(() {
                  for (var el in images!) {
                    my_photos.add(Image.file(File(el.path),
                    height: height/5,
                    width: width/2.5));

                  }
                  my_photos.add(Image.asset('assets/images/photo.png',
                      height: height/5,
                      width: width/2.5));
                  for (var el in my_photos) { //TODO оптимизируй уже этот участок, дубина
                    wrapper_widget.add(Container(
                        height: height/5,
                      width: width/2.5,
                        decoration: BoxDecoration(

                          border: Border.all(
                            width: 1,
                          ),
                        ),
                        child:el));
                  }
                  // setImage();
                });
              },
              child: Column(
                children: <Widget>[
                  Text(avatar),
                  images == null
                      ? Image.asset('assets/images/photo.png')
                      : Wrap(children: wrapper_widget)
])));
  }
}