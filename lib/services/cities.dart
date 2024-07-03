import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_application_advanced/constants/env_constants/constant.dart';

class CitiesService {
  //function to fetch cities resembling query
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
