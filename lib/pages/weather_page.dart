import 'package:flutter/material.dart';
import 'package:weather_application_advanced/components/animation.dart';
import 'package:weather_application_advanced/components/text_style.dart';
import 'package:weather_application_advanced/entities/weather/weather.dart';
import 'package:weather_application_advanced/pages/search_page.dart';
import 'package:weather_application_advanced/services/weather.dart';

/// A widget that displays the weather information for a given city.
///
/// Example:
/// ```dart
/// WeatherPage(city: 'New York')
/// ```
class WeatherPage extends StatefulWidget {
  /// The city to show weather of.
  final String city;

  const WeatherPage({super.key, required this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

/// The state of the [WeatherPage] widget.
class _WeatherPageState extends State<WeatherPage> {
  /// An instance of the weather service to fetch weather.
  final _weatherService = WeatherService();

  /// An instance of the weather to show weather.
  Weather? _weather;

  /// Fetches the weather for a given city.
  ///
  /// Example:
  /// ```dart
  /// fetchWeather('London');
  /// ```
  Future<void> fetchWeather(String cityName) async {
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      throw Exception('Failed to load Weather');
    }
  }

  @override
  void initState() {
    super.initState();

    // Fetching the weather
    fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color from themes
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Route to search page
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(Icons.search),
            ),

            // City name
            GoogleTextStyle(
                text: _weather?.cityName ?? "Loading city...", size: 40),

            // Weather animation
            WeatherAnimation(mainCondition: _weather?.mainCondition),

            // Weather information
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Weather condition
                GoogleTextStyle(
                    text: _weather?.mainCondition ?? "Loading Condition...",
                    size: 20),

                // Weather temperature
                GoogleTextStyle(text: "${_weather?.temperature}°", size: 50),

                // Wind speed and humidity
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GoogleTextStyle(
                        text: "${_weather?.windSpeed} km/hr", size: 20),
                    const SizedBox(
                      width: 13,
                    ),
                    GoogleTextStyle(
                        text: "${_weather?.humidityPer} %", size: 20)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
