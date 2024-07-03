import 'package:flutter/material.dart';
import 'package:weather_application_advanced/pages/search_page.dart';
import 'package:weather_application_advanced/pages/weather_page.dart';
import 'package:weather_application_advanced/settings/preferences.dart';

/// A stateful widget that serves as the home page of the weather application.
///
/// It fetches the city name from the preferences and displays either the
/// [SearchPage] or [WeatherPage] based on the availability of the city name.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/// The state class for the [Home] widget.
class _HomeState extends State<Home> {
  /// Fetches the city name from the preferences.
  ///
  /// Returns an empty string if no city name is found.
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
            /// If an error occurs, display the [SearchPage].
            return const SearchPage();
          } else {
            String cityName = snapshot.data ?? '';
            if (cityName.isEmpty) {
              print("No city");

              /// If no city name is found, display the [SearchPage].
              return const SearchPage();
            } else {
              print("cityName: $cityName");

              /// If a city name is found, display the [WeatherPage] with the city name.
              return WeatherPage(city: cityName);
            }
          }
        },
      ),
    );
  }
}
