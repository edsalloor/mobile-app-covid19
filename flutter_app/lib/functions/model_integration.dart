import 'dart:io';
import 'package:image/image.dart';

Future<List<double>> image_preprocessing(String imagePath) async {
  var imagenCovid = File(imagePath);
  var imgData = await imagenCovid.readAsBytes();
  Image img = decodeImage(imgData);
  var resized = copyResize(img, width: 150, height: 150, interpolation: Interpolation.average);
  var onechannel = grayscale(resized);
  var decoded = onechannel.getBytes(format: Format.rgba);
  var transformed = decoded.map((byte) => byte * 1/255).toList();
  return transformed;
}

void covid19_probability() {
}