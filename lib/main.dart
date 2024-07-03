import 'package:flutter/material.dart';
import 'package:weather_application_advanced/constants/themes/dark_mode.dart';
import 'package:weather_application_advanced/constants/themes/light_mode.dart';
import 'package:weather_application_advanced/pages/home.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Home(),
    theme: lightMode,
    darkTheme: darkMode,
  ));
}
