import 'dart:io';

import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class MyImageData extends ChangeNotifier{

  ViewState _state = ViewState.Busy;

  File _image;
  File get image => _image;
  ViewState get state => _state;


  void uploadImage(File image) {
    _image = image;
    notifyListeners();
  }

  // PARA SIMULAR EL TIEMPO DE ESPERA DEL ANÁLISIS
  Future<void> analyzingImage() async {
    setState(ViewState.Busy);
    await Future.delayed(const Duration(seconds: 5));
    setState(ViewState.Idle);
  }
  
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

}