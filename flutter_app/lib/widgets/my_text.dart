import 'package:flutter/material.dart';

class MyText extends StatelessWidget {

  MyText({@required this.text, this.color, this.size});

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'RobotoMono',
      ),
    );
  }
}