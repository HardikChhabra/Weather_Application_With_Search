/// Represents a weather object with various properties.
class Weather {
  /// The name of the city.
  final String cityName;

  /// The current temperature in Celsius.
  final String temperature;

  /// The main weather condition (e.g. Sunny, Cloudy, Rainy, etc.).
  final String mainCondition;

  /// The wind speed in kilometers per hour.
  final String windSpeed;

  /// The humidity percentage.
  final String humidityPer;

  /// Creates a new [Weather] object with the given properties.
  Weather({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
    required this.windSpeed,
    required this.humidityPer,
  });

  /// Creates a new [Weather] object from a JSON map (provided by openweatherapi).

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      mainCondition: json['weather'][0]['main'],
      temperature: json['main']['temp'].round().toString(),
      windSpeed: (json['wind']['speed'] * 3.6).round().toString(),
      humidityPer: (json['main']['humidity']).round().toString(),
    );
  }
}
