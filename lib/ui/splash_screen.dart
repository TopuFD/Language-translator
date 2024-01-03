import 'dart:async';

import 'package:flutter/material.dart';
import 'package:language_translator/ui/pages/bottom_navigation.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(246, 245, 254, 245),
        body: Center(child: LottieBuilder.asset("images/splashTranslator.json")),
      ),
    );
  }
}
