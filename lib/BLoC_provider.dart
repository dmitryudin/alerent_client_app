
/*
import 'package:client/BLoC.dart';
import 'package:flutter/material.dart';

class BlocProviderState<T> extends State<BlocProvider<Bloc>>{

 @override
 void dispose(){
   widget.bloc.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
   return widget.child;
  }

}


class BlocProvider<T extends Bloc> extends StatefulWidget{

  Widget child;
  T bloc;
  BlocProvider(key, @required this.child, @required this.bloc):super(key: key);
  BlocProviderState<T> createState()=>BlocProviderState();


  }


}

 */