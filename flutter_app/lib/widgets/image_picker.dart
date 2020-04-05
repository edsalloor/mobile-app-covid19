import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectorImagenGaleria extends StatefulWidget {
  TextEditingController ctrl_img_path;

  SelectorImagenGaleria({@required this.ctrl_img_path});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelectorImagenGaleria();
  }
}

class _SelectorImagenGaleria extends State<SelectorImagenGaleria> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
    widget.ctrl_img_path != null && widget.ctrl_img_path.text != null && widget.ctrl_img_path.text != ''
    ? Container(
          height: 275.0,
          color: Colors.black12,
          child: Container(
            alignment: Alignment.center,
            child: Image.file(File(widget.ctrl_img_path.text), fit: BoxFit.contain,),
          )
      )
    : Container(),
    FlatButton.icon(
      onPressed: () => getImage(),
      icon: Icon(Icons.account_box, color: Colors.white,),
      label: Text('Seleccione una imagen de rayos x', style: TextStyle(color: Colors.white),),
      color: Colors.blue,
    )
    ],);
  }

  Future getImage() async {
    String img_path = (await ImagePicker.pickImage(source: ImageSource.gallery)).path;

    if (img_path != null) {
      setState(() {
        widget.ctrl_img_path.text = img_path;
      });
    }
  }
}