import 'package:flutter/material.dart';
import 'package:therapy_app/core/routing/my_route.dart';
import 'package:therapy_app/features/auth/dashboard/view/page/dashboard_page.dart';

import 'features/dashboard/view/page/dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
      onGenerateRoute: MyRoute.onNavigateByName,
    );
  }
}
