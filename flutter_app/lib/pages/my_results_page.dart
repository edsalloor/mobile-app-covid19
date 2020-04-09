import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../models/image_data.dart';
import '../widgets/my_text.dart';

class MyResultsPage extends StatelessWidget {
  static String id = 'myResultsPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Resultado'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Consumer<MyImageData>(
            builder:
                (BuildContext context, MyImageData imageData, Widget widget) =>
                    Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyText(
                  text: 'EL RESULTADO DEL ANÁLISIS CORRESPONDE AL',
                  color: Colors.white,
                  size: 20.0,
                ),
                imageData.state == ViewState.Busy
                    ? SpinKitDoubleBounce(
                        color: Color(0XFF0F7986),
                        size: 250.0,
                      )
                    : Opacity(
                      opacity: 0.85,
                      child: Container(
                          width: 250.0,
                          height: 250.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFF0F7986),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.teal[500],
                                blurRadius: 12.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  3.0,
                                  5.0,
                                ),
                              )
                            ],
                          ),
                          child: Center(
                            child: MyText(
                              text: '${imageData.getProb().toString()}%',
                              color: Colors.white,
                              size: 100.0,
                              isBold: true,
                              hasShadow: true,
                              fontFamily: 'bodoni',
                            ),
                          ),
                        ),
                    ),
                MyText(
                  text: 'DE PROBABILIDAD DE QUE TENGA COVID-19',
                  color: Colors.white,
                  size: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
