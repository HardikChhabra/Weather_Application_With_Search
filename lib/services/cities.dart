import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_application_advanced/constants/env_constants/constant.dart';

/// A service class that provides functionality to fetch cities resembling a given query.
class CitiesService {
  /// Fetches a list of cities that match the given query.
  ///
  /// This function makes an HTTP GET request to the OpenWeatherAPI to fetch a list of cities
  /// that resemble the given query. The response is then parsed and a list of city names is returned.
  ///
  /// Example:
  /// ```dart
  /// final citiesService = CitiesService();
  /// final cities = await citiesService.fetchCities('New York');
  /// print(cities); // Output: ['New York', 'New York City', ...]
  /// ```
  ///
  /// @param query The search query to fetch cities for.
  /// @return A list of city names that match the query.
  Future<List<String>> fetchCities(String query) async {
    if (query.isEmpty) {
      return [];
    }
    //url to fetch cities from openweatherapi
    final String url =
        '$BASE_URL/find?q=$query&type=like&sort=population&cnt=30&appid=$API_KEY';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> cityList = jsonDecode(response.body)['list'];
      return cityList.map((city) => city['name'] as String).toList();
    } else {
      // Handle the error
      throw Exception('Failed to load cities');
    }
  }
}
