import 'dart:io';
import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:covidapp/functions/api.dart';

enum ViewState { Idle, Busy }

class MyImageData extends ChangeNotifier{

  ViewState _state = ViewState.Busy;

  Api _api = Api();
  File _image;
  String _result = '';

  File get image => _image;
  String get result => _result;
  ViewState get state => _state;


  void uploadImage(File image) {
    _image = image;
    notifyListeners();
  }

  int getProb(){
    return Random().nextInt(100 - 0);
  }


  Future<void> analyzingImage() async {
    setState(ViewState.Busy);
    //await Future.delayed(const Duration(seconds: 5));
    Map<String, String> data = await convertToBase64();

    Map<String, dynamic> result = await _api.post(data);
    print('\nThis is the server response');
    print(result);

    double value = result['predictions'][0][0];
    print('\nThis is the server response value');
    print(value);

    print('\nThis is the prob value 1 - server response x 100');
    double probValue = (1 - value) * 100;
    print(probValue);

    print('\nThis is the server response value fixed');
    String fixedValue = probValue.toString().substring(0, 5);
    print(fixedValue);

    print('\nThis is what we show to users');
    _result = fixedValue;
    print(_result);

    setState(ViewState.Idle);
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<Map<String, String>> convertToBase64() async {
    final bytes = await File(image.path).readAsBytes();
    final String img64 = base64Encode(bytes);
    return <String, String>{
      'b64': img64
    };
  }


}