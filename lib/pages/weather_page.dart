import 'package:flutter/material.dart';
import 'package:weather_application_advanced/components/animation.dart';
import 'package:weather_application_advanced/components/text_style.dart';
import 'package:weather_application_advanced/entities/weather/weather.dart';
import 'package:weather_application_advanced/pages/search_page.dart';
import 'package:weather_application_advanced/services/weather.dart';

class WeatherPage extends StatefulWidget {
  //city to show weather of
  final String city;
  const WeatherPage({super.key, required this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //instance of weather service to fetch weather
  final _weatherService = WeatherService();

  //instance of weather to show weather
  Weather? _weather;

  //fetch weather
  Future<void> fetchWeather(String cityName) async {
    //get weather for city
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

    //fetching the weather
    fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color from themes
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Route to search page
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(Icons.search),
            ),

            //city name
            GoogleTextStyle(
                text: _weather?.cityName ?? "Loading city...", size: 40),

            //weather animation
            WeatherAnimation(mainCondition: _weather?.mainCondition),

            //weather information
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //weather condition
                GoogleTextStyle(
                    text: _weather?.mainCondition ?? "Loading Condition...",
                    size: 20),

                //weather temperature
                GoogleTextStyle(text: "${_weather?.temperature}°", size: 50),

                //wind speed and humidity
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
