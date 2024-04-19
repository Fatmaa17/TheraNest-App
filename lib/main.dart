// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapy_app/features/auth/onboarding/view/page/onboarding.dart';
//import 'package:therapy_app/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized

  // Initialize SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPreferences.getBool('onboarding')??false;
  runApp(const therapy_app());
}

class therapy_app extends StatelessWidget {
  const therapy_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}
