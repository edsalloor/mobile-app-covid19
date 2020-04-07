import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/pages/my_home_page.dart';
import 'package:flutter_app/models/image_data.dart';

import 'pages/my_home_page.dart';
import 'pages/my_image_page.dart';
import 'pages/my_results_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyImageData>(
      create: (context) => MyImageData(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: MyHomePage(),
        initialRoute: MyHomePage.id,
        routes: {
          MyImagePage.id: (context) => MyImagePage(),
          MyResultsPage.id: (context) => MyResultsPage(),
        },
      ),
    );
  }
}
