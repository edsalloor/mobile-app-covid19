import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText(
      {@required this.text,
      this.color,
      this.size,
      this.isBold = false,
      this.hasShadow = false,
      this.fontFamily = 'RobotoMono'});

  final String text;
  final Color color;
  final double size;
  final bool isBold;
  final bool hasShadow;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: fontFamily,
        fontWeight: isBold ? FontWeight.bold : null,
        shadows: hasShadow
            ? <Shadow>[
                Shadow(
                  offset: Offset(0.0, 8.0),
                  blurRadius: 15.0,
                  color: Color(0XFF000000),
                ),
              ]
            : null,
      ),
    );
  }
}
