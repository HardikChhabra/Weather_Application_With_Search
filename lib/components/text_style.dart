import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A custom text widget that uses the Teko font from Google Fonts.
///
/// This widget allows you to easily display text with a consistent style
/// throughout your app. You can customize the text and font size to fit
/// your needs.
class GoogleTextStyle extends StatelessWidget {
  /// The text to be displayed.
  final String text;

  /// The font size of the text.
  final double size;

  /// Creates a new instance of [GoogleTextStyle].
  const GoogleTextStyle({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.teko(
          textStyle: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.tertiary),
        ));
  }
}

/// Example usage:
///
/// ```dart
/// GoogleTextStyle(
///   text: 'Hello, World!',
///   size: 24,
/// )
/// ```