import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/onboarding/view/components/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      body: OnboardingBody(), // Use proper function invocation
    );
  }
}
