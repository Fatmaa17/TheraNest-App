import 'package:therapy_app/features/auth/login/view/page/login.dart';
import 'package:therapy_app/features/auth/onboarding/view/page/onboarding.dart';
import 'package:therapy_app/features/auth/registration/view/page/registration_page.dart';
import 'package:therapy_app/features/auth/splash/view/page/splash.dart';
import 'package:therapy_app/features/auth/verification/view/page/verification_page.dart';
//import 'package:therapy_app/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized
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
        builder: DevicePreview.appBuilder,
        useInheritedMediaQuery: true,
        home: Splash());
  }
}

class myRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => dashboardPage(),
    ),
  ];

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
