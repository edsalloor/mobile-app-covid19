import 'package:flutter/material.dart';
import 'package:flutter_app/functions/network.dart';
import 'package:provider/provider.dart';

import '../models/image_data.dart';
import '../widgets/my_image_view.dart';
import '../widgets/my_button.dart';

import 'my_results_page.dart';

class MyImagePage extends StatelessWidget {
  static String id = 'myImagePage';

  @override
  Widget build(BuildContext context) {

    Future<void> _showDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sin Conexión a Internet'),
            content: Text('Por favor, conéctate a internet.'),
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
                  _showDialog();
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
