// main.dart

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:therapy_app/core/routing/my_route.dart';

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
