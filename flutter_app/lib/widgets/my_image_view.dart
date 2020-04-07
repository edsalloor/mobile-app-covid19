import 'package:flutter/material.dart';

class MyImageView extends StatelessWidget {

  MyImageView({@required this.imageProvider, this.boxShape, this.width = 250.0, this.height = 250.0});

  final double width;
  final double height;
  final BoxShape boxShape;
  final ImageProvider imageProvider;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: boxShape,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: imageProvider,
          ),
        ),
      ),
    );
  }
}