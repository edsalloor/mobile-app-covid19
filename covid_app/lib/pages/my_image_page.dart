import 'package:covidapp/widgets/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:covidapp/functions/network.dart';
import 'package:covidapp/models/image_data.dart';
import 'package:covidapp/pages/my_results_page.dart';
import 'package:covidapp/widgets/my_button.dart';
import 'package:covidapp/widgets/my_image_view.dart';


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
              function: () async {
                bool connectivity = await Network.checkConnectivity();
                if (!connectivity) {
                  Dialogs.myAlertDialog(context: context,
                      title: 'Sin Conexión a Internet',
                      content: 'Por favor, conéctate a internet');
                  return;
                }
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