import 'package:app_logo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_logo/screens/home_screen.dart';
import 'package:app_logo/screens/splash_screen.dart';
import 'package:app_logo/core/string.dart';
import 'package:app_logo/core/routes.dart';

void main() {
  runApp(const MainApp());
}

// Esta es la entrada visual de la aplicacion
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.nameApp,
      initialRoute: Routes.splash,
      routes: {
        // Aca se definen las rutas de la aplicacion
        Routes.splash: (context) => const SplashScreen(),
        Routes.home: (context) => HomeScreen(),
        Routes.login: (context) => const LoginScreen(),
      },
    );
  }
}
