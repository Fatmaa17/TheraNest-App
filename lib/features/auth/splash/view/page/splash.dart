// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/onboarding/view/page/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome(context); // Pass the context
  }

  _navigateToHome(BuildContext context) async {
    // Receive the context
    // Delay for 5 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to the home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/SplashScreen.jpg',
          width: screenSize.width,
          height: screenSize.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
