// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapy_app/features/auth/login/view/page/login.dart';
import 'package:therapy_app/features/auth/onboarding/view/page/onboarding.dart';
import 'package:therapy_app/features/auth/registration/view/page/registration_page.dart';
import 'package:therapy_app/features/auth/splash/view/page/splash.dart';

//import 'package:therapy_app/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized

  // Initialize SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;
  runApp( 
     DevicePreview(
      enabled: true,
      builder: (context) => therapy_app(),
    ),
  );
}

class therapy_app extends StatelessWidget {
  const therapy_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      home: Splash());
  }
}

class myRoutes {
  static List<Route> initRoutes(RouteSettings initialRoute) {
    return [
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const OnboardingScreen(),
      ),
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const RegestrationPage(),
      ),
    ];
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const loginPage());
      case 'registration':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const RegestrationPage());

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnboardingScreen(),
        );
    }
  }
}
