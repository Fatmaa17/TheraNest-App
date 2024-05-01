// my_route.dart

import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/view/page/dashboard_page.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const DashboardPage()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardPage(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardPage(),
        );
    }
  }
}