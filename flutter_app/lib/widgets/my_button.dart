import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  MyButton({this.title, this.function});

  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: RaisedButton(
        child: Text(title,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'RobotoMono',
            letterSpacing: 4.0,
          ),
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0XFF0F7986),
        onPressed: function,
      ),
    );
  }
}