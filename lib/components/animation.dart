import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A widget that displays a weather animation based on the main weather condition.
///
/// The animation is loaded from a JSON file in the assets directory, and the
/// file name is determined by the [mainCondition] parameter.
class WeatherAnimation extends StatelessWidget {
  /// The main weather condition, used to determine the animation to display.
  final String? mainCondition;

  /// Creates a new [WeatherAnimation] widget.
  ///
  /// [key] is the widget key, and [mainCondition] is the main weather condition.
  const WeatherAnimation({super.key, required this.mainCondition});

  /// Returns the relative path to the weather animation asset based on the
  /// [mainCondition].
  ///
  /// If [mainCondition] is null, returns 'assets/loading.json'. Otherwise,
  /// returns the path to the animation asset that matches the condition.
  ///
  /// Example:
  /// ```dart
  /// String animationPath = getWeatherAnimation('Clouds'); // returns 'assets/cloudy.json'
  /// ```
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return 'assets/loading.json';
    }
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'ist':
      case 'moke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'hower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunderstorm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(getWeatherAnimation(mainCondition));
  }
}
