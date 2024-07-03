import 'package:flutter/material.dart';
import 'package:weather_application_advanced/pages/search_page.dart';
import 'package:weather_application_advanced/pages/weather_page.dart';
import 'package:weather_application_advanced/settings/preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<String> fetchCityFromPreferences() async {
    return await PreferenceService().getCityName() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: fetchCityFromPreferences(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SearchPage();
          } else {
            String cityName = snapshot.data ?? '';
            if (cityName.isEmpty) {
              print("No city");
              return const SearchPage();
            } else {
              print("cityName: $cityName");
              return WeatherPage(city: cityName);
            }
          }
        },
      ),
    );
  }
}
