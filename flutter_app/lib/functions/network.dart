import 'package:dio/dio.dart';

class Api {
  factory Api() => _instance;
  Api.internal();
  static final Api _instance = Api.internal();

  final String _url = 'http://18.217.53.124:5000/imageclassifier/predict/';

  Future<Map<String, dynamic>> post (Map<String, dynamic> data) async {
    return await Dio().post(_url, data: data)
        .then((Response response){
      int status = response.statusCode;
      if (status < 200 || status > 400) {
        throw Exception('Post Error with server');
      }
      return response.data;
    });
  }

}
