import 'package:client/loginscreen/login_screen.dart';
import 'package:client/user_app/user_object.dart';
import 'package:client/user_app/HomePageUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HistoryPage.dart';

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({Key? key}) : super(key: key);
  @override
  MyScreen createState() {
    // TODO: implement createState
    return MyScreen();
  }
}

class MyScreen extends State<MainUserScreen> {
  User _user = User();
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[HomePageUser(), HistoryPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        //appBar: AppBar(title: Text('Наниматель')),
        body: Center(child: _widgetOptions[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Дом'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarms), label: 'История')
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
