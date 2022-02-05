
/*
import 'dart:async';
import 'package:client/BLoC.dart';
import 'package:image_picker/image_picker.dart';

enum Events {
  new_image,
}

class BlocRegister extends BLoC{
  XFile? _image;
  final StreamController<Events> _streamController = StreamController<Events>();
  Sink<Events> get inEvent => _streamController.sink;
  Stream<Events> get _outEvent => _streamController.stream;

  BlocRegister(){
    _outEvent.listen(_handleEvent);
  }

  void _handleEvent(Events event){
    switch (event){
      case Events.new_image:
        break;

    }
  }

  @override
  void dispose(){
    _streamController.close();

  }

}

*/