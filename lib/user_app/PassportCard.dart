




import 'package:client/objects/passport_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PassportCard extends StatelessWidget{
  Passport _pass = Passport();
  PassportCard(){
    _pass.getData();
  }
  @override
  Widget build(BuildContext context) {
    var _passport = Provider.of<Passport>(context, listen: true);
    double width = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return Card(
        shadowColor: Colors.grey,
        elevation: 15,
        child: Column(children: <Widget>[
          ListTile(
            leading: Icon(Icons.people, color: Colors.cyan, size: 45),
            tileColor: Colors.teal,
            title: Text(
              "Паспорт",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: width / 3,
                padding: const EdgeInsets.symmetric(
                    vertical: 1, horizontal: 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
                child: Icon(Icons.article, color: Colors.cyan, size: 45),
              ),
              Flexible
                (child:Table(
                border: TableBorder(horizontalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid),
                    verticalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid)),
                //border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Text('Серия', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_passport.series.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Номер', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_passport.number.entity, textAlign: TextAlign.start, ),
                  ]),
                  TableRow(children: [
                    Text('Дата выдачи', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_passport.dateOfIssue.entity, textAlign: TextAlign.start, ),
                  ]),


                ],
              ))
            ],
          )
        ]));
  }

}