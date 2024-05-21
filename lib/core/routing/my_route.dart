// my_route.dart

import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/new_doctor/view/page/new_doctor.dart';
import 'package:therapy_app/features/auth/dashboard/view/page/dashboard_page.dart';
import 'package:therapy_app/features/auth/login/view/page/login.dart';
import 'package:therapy_app/features/auth/registration/view/page/registration_page.dart';
import 'package:therapy_app/features/auth/splash/view/page/splash.dart';
import 'package:therapy_app/features/auth/verification/view/page/verification_page.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const Splash()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardPage(),
        );
        case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const RegestrationPage(),
        );
        case 'login':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const loginPage(),
        );
        case 'add_doctor':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const doctorPage(),
        );
         case 'verification':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => verificationPage(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardPage(),
        );
    }
  }
}
