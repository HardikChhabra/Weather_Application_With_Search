class Weather {
  final String cityName;
  final String temperature;
  final String mainCondition;
  final String windSpeed;
  final String humidityPer;

  Weather({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
    required this.windSpeed,
    required this.humidityPer,
  });

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
