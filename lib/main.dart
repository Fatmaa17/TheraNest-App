import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_app/core/consts/theme_data.dart';
import 'package:therapy_app/core/routing/my_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';
import 'firebase_options.dart';
import 'core/providers/theme_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize FirebaseRepo and set up the auth state listener
  FirebaseRepo firebaseRepo = FirebaseRepo();
  firebaseRepo.initializeAuthStateListener();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeprovider, child) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
       theme: Styles.themeData(
            isDarkTheme: themeprovider.getIsDarkTheme,
            context: context,
          ),
      onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
      onGenerateRoute: MyRoute.onNavigateByName,
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
    );
     }),
   );
  }
}