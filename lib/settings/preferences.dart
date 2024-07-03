import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setCityName(String cityName) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('cityName', cityName);
    print(cityName);
  }

  Future<String?> getCityName() async {
    final SharedPreferences prefs = await _prefs;
    final String? cityName = prefs.getString('cityName');
    return cityName;
  }
}
