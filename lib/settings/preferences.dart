import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

/// A service to store and retrieve user preferences using shared_prefernces module.
class PreferenceService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Sets the city name in the shared preferences.
  ///
  /// Example:
  /// ```dart
  /// final preferenceService = PreferenceService();
  /// await preferenceService.setCityName('New York');
  /// ```
  Future<void> setCityName(String cityName) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('cityName', cityName);
  }

  /// Retrieves the city name from the shared preferences.
  ///
  /// Returns `null` if the city name is not set.
  ///
  /// Example:
  /// ```dart
  /// final preferenceService = PreferenceService();
  /// final cityName = await preferenceService.getCityName();
  /// print(cityName); // prints 'New York' if set, or null if not set
  /// ```
  Future<String?> getCityName() async {
    final SharedPreferences prefs = await _prefs;
    final String? cityName = prefs.getString('cityName');
    return cityName;
  }
}
