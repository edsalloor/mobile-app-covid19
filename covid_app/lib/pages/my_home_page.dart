import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

import 'package:covidapp/models/image_data.dart';
import 'package:covidapp/pages/my_image_page.dart';
import 'package:covidapp/widgets/my_button.dart';
import 'package:covidapp/widgets/my_image_view.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'myHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Covid-19 Detector',
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyImageView(
              imageProvider: AssetImage('images/doctor.png'),
              boxShape: BoxShape.circle,
              width: 250.0,
              height: 250.0,
            ),
            MyButton(
              title: 'BUSCAR IMAGEN',
              function: () async {
                File image =
                await FilePicker.getFile(type: FileType.image);
                if (image != null) {
                  Provider.of<MyImageData>(context, listen: false)
                      .uploadImage(image);
                  await Navigator.pushNamed(context, MyImagePage.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController ctrl_image_path = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Padding(
//          padding: EdgeInsets.only(left: 15.0, right: 15.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              SelectorImagenGaleria(ctrl_img_path: this.ctrl_image_path,)
//            ],
//          ),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          print(this.ctrl_image_path.text);
//        },
//        tooltip: 'Analizar',
//        child: Icon(Icons.arrow_forward),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
