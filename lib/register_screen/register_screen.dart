import 'package:client/owner_app/main_screen_owner.dart';
import 'package:client/objects/passport_object.dart';
import 'package:client/realtor_app/register_as_realtor.dart';
import 'package:client/user_app/register_as_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user_app/user_object.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  MyScreen createState() {
    return MyScreen();
  }
}

class MyScreen extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }


  void new_screen(var screen){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context, listen: true);
    Passport _passport = Provider.of<Passport>(context, listen: true);
        double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return (Scaffold(
        appBar: AppBar(
          title: const Text('Зарегестрироватья как...'),
        ),
        body: ListView(
            children: <Widget>[
              SizedBox(height: height*0.1),
              Row(
        mainAxisAlignment: MainAxisAlignment.center,//Прочитал на форуме, что возможно стоит оборачивать в Row элементы чтобы управлять из размерами в ListView
                   children: [ElevatedButton(
                     child: const Text("Наниматель"),
                     onPressed: () {
                       setState(() {});
                       _user.clearData();
                       new_screen(RegisterScreenAsUser());

                     },
                   ),]),
              SizedBox(height: height*0.05),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,//Прочитал на форуме, что возможно стоит оборачивать в Row элементы чтобы управлять из размерами в ListView
                  children: [ElevatedButton(
                    child: const Text("Собственник"),
                    onPressed: () {
                      setState(() {});
                      new_screen(RegisterScreenAsUser());

                    },
                  ),]),
              SizedBox(height: height*0.05),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,//Прочитал на форуме, что возможно стоит оборачивать в Row элементы чтобы управлять из размерами в ListView
                  children: [ElevatedButton(
                    child: const Text("Риелтор"),
                    onPressed: () {
                      setState(() {});
                      new_screen(RegisterScreenAsUser());

                    },
                  ),]),

            ])));
  }
}
