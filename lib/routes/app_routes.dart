// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/registration/registration_screen.dart'; // ✅ Vérifiez ce chemin
import '../screens/dashboard/dashboard_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String registration = '/registration';
  static const String dashboard = '/dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(), //
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}