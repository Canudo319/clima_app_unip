import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  static const _key = "79c0278b0f117e166b0c99a9e3e16a00";

  static Future<Map> getClimaByLocation(double lat, double lon) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&lang=pt_br&appid=$_key';
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  static Future<Map> getClimaByName(String city) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&lang=pt_br&appid=$_key';
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
