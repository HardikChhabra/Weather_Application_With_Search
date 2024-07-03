/// The main entry point of the Weather Application Advanced.
///
/// This file sets up the basic configuration for the Flutter app,
/// including the theme and home page.
import 'package:flutter/material.dart';
import 'package:weather_application_advanced/constants/themes/dark_mode.dart';
import 'package:weather_application_advanced/constants/themes/light_mode.dart';
import 'package:weather_application_advanced/pages/home.dart';

/// The main function that runs the Flutter app.
///
/// This function returns a [MaterialApp] widget, which is the root
/// of the Flutter app. It sets up the debug mode, home page, and
/// themes for the app.
///
void main() {
  return runApp(
    MaterialApp(
      ///Whether to show the debug mode banner.
      ///
      /// Set to `false` to hide the banner.

      debugShowCheckedModeBanner: false,

      ///
      /// The home page of the app.
      ///
      /// In this case, it's the [Home] page.
      ///
      home: const Home(),

      ///
      /// The light theme for the app.
      ///
      /// This theme is used when the device is not in dark mode.
      ///
      theme: lightMode,

      ///
      /// The dark theme for the app.
      ///
      /// This theme is used when the device is in dark mode.
      ///
      darkTheme: darkMode,
    ),
  );
}
