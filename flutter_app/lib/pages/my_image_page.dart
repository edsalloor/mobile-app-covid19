import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/image_data.dart';
import '../widgets/my_image_view.dart';
import '../widgets/my_button.dart';

import 'my_results_page.dart';

class MyImagePage extends StatelessWidget {
  static String id = 'myImagePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Covid-19 Detector',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyImageView(
              imageProvider: FileImage(Provider.of<MyImageData>(context).image),
              boxShape: BoxShape.rectangle,
              width: 350.0,
              height: 350.0,
            ),
            MyButton(
              title: 'ANALIZAR',
              function: () {
                Provider.of<MyImageData>(context, listen: false)
                    .analyzingImage();
                Navigator.pushNamed(context, MyResultsPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
