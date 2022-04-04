
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker{

   static selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != DateTime.now()) return picked.toString().split(' ')[0];
      }

}