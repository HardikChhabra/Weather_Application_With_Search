import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleTextStyle extends StatelessWidget {
  final String text;
  final double size;
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
