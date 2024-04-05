import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor:const Color.fromRGBO(253, 235, 189, 255),
      // Adjusted duration to a more typical range
      splash: Image.asset('assets/logo.png'),
      splashIconSize: 200,

      nextScreen:
           HomePage(), // Make HomePage a const widget for performance
    );
  }
}
