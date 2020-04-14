import 'dart:io';

import 'package:connectivity/connectivity.dart';

class Network {

  static Future<bool> _checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile);
  }

  static Future<bool> checkConnectivity() async {
    bool isConnected = await _checkConnection();
    if (isConnected) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } catch (socketException) {
      }
    }
    return false;
  }
}
