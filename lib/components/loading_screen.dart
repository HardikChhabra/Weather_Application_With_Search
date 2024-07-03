import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A widget that displays a loading animation from a Lottie JSON file.
///
/// This widget is useful for displaying a loading indicator while data is being
/// fetched or processed.

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/loading.json'),
    );
  }
}
