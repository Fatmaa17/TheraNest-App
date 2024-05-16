// main.dart

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:therapy_app/core/routing/my_route.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqflite.dart';


void main() async { 
  //   sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder:  (context) => MyApp(),
     )
   );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
      onGenerateRoute: MyRoute.onNavigateByName,
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
    );
  }
}
