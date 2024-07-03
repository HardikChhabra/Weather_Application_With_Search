import 'dart:convert';
import 'package:weather_application_advanced/constants/env_constants/constant.dart';
import 'package:weather_application_advanced/entities/weather/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Weather> getWeather(String city) async {
    final response = await http.get(
        Uri.parse('$BASE_URL/weather?q=$city&appid=$API_KEY&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load Weather, status code:${response.statusCode}');
    }
  }
}
