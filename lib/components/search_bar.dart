import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A custom search bar widget that allows users to input text.
///
/// This widget provides a simple and customizable search bar experience.
/// It uses a [TextField] under the hood and provides a default styling
/// that can be easily overridden using the [Theme] of the app.
class CustomSearchBar extends StatelessWidget {
  /// The hint text to be displayed in the search bar.
  final String hint;

  /// The text editing controller that manages the text input.
  final TextEditingController controller;

  /// A callback function that is called whenever the text input changes.
  final Function(String) onChanged;

  /// Creates a new instance of [CustomSearchBar].
  ///
  /// [hint] is the hint text to be displayed in the search bar.
  /// [controller] is the text editing controller that manages the text input.
  /// [onChanged] is a callback function that is called whenever the text input changes.
  const CustomSearchBar({
    super.key,
    required this.hint,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          hintText: hint,
          hintStyle: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

/// Example usage:
///
/// ```dart
/// class MyApp extends StatelessWidget {
///   final TextEditingController _controller = TextEditingController();
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(
///         title: CustomSearchBar(
///           hint: 'Search for something...',
///           controller: _controller,
///           onChanged: (text) {
///             print('Search query: $text');
///           },
///         ),
///       ),
///     );
///   }
/// }
/// ```