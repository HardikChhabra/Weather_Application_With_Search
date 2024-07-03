import 'dart:convert';
import 'package:weather_application_advanced/constants/env_constants/constant.dart';
import 'package:weather_application_advanced/entities/weather/weather.dart';
import 'package:http/http.dart' as http;

/// A service class that provides weather data for a given city.
class WeatherService {
  /// Retrieves the weather data for a given city.
  ///
  /// Throws an [Exception] if the request fails.
  ///
  /// Example:
  /// ```dart
  /// final weatherService = WeatherService();
  /// final weather = await weatherService.getWeather('London');
  /// print(weather.temperature); // prints the temperature in London
  /// ```
  ///
  /// return A [Weather] object containing the weather data for the given city.
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
