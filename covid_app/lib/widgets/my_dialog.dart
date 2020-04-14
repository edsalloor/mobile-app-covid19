import 'package:flutter/material.dart';

class Dialogs {

  static Future<void> myAlertDialog(
    {BuildContext context,
    String title,
    String content,}
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          elevation: 24.0,
          actions: <Widget>[
            FlatButton(
              child: Text('Listo'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
//
//title: Text('Sin Conexión a Internet'),
//content: Text('Por favor, conéctate a internet.'),
