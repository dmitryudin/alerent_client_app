import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/my_widgets/QrCodeScanner.dart';
import 'package:client/objects/passport_object.dart';
import 'package:client/user_app/PassportCard.dart';
import 'package:client/user_app/user_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'UserCard.dart';

class HomePageUser extends StatefulWidget {
  @override
  State createState() {
    return MyScreen();
  }
}

class MyScreen extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 0, 40, 160)));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return (Scaffold(
        /* appBar: AppBar(
          title: const Text('Домашняя страница'),
            actions: <Widget>[
        IconButton(
        icon: const Icon(Icons.add_alert),
      tooltip: 'Show Snackbar',
      onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => QRViewExample()));


      },
    ),
        IconButton(
        icon: const Icon(Icons.update),
    tooltip: 'Show Snackbar',
    onPressed: () {
          Provider.of<User>(context, listen: false).getProfile();
    }),
            ]
        ),*/
        body: ListView(children: <Widget>[
      UserCard(),
      //PassportCard()
    ])));
  }
}
