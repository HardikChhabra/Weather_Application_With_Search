import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application_advanced/components/text_style.dart';

class ErrorDialogBox extends StatelessWidget {
  final String errorMessage;
  final Function refreshPage;
  const ErrorDialogBox(
      {super.key, required this.errorMessage, required this.refreshPage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //error animation
            Lottie.asset('assets/error.json'),
            const SizedBox(
              height: 24,
            ),

            //error
            const GoogleTextStyle(text: "Error", size: 40),
            const SizedBox(
              height: 24,
            ),

            //error message
            GoogleTextStyle(text: errorMessage, size: 20),
            const SizedBox(
              height: 24,
            ),

            //refresh button
            TextButton(
                onPressed: () => refreshPage,
                child: const GoogleTextStyle(
                  text: "Refresh Page",
                  size: 20,
                )),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
