// main.dart

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:therapy_app/core/routing/my_route.dart';
import 'package:therapy_app/features/auth/dashboard/view/page/dashboard_page.dart';
import 'package:therapy_app/features/auth/login/view/page/login.dart';
import 'package:therapy_app/features/auth/onboarding/view/page/onboarding.dart';
import 'package:therapy_app/features/auth/registration/view/page/registration_page.dart';
import 'package:therapy_app/features/auth/splash/view/page/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
      onGenerateRoute: MyRoute.onNavigateByName,
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
    );
  }
}
