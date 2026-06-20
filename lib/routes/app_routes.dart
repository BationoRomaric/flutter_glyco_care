import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/registration/registration_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/analytics/analytics_screen.dart';
import '../screens/history/history_screen.dart';
import '../screens/alerts/alerts_screen.dart';
import '../screens/sync/sync_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppRoutes {
  // Constantes de routes
  static const String login = '/';
  static const String registration = '/registration';
  static const String dashboard = '/dashboard';
  static const String analytics = '/analytics';
  static const String history = '/history';
  static const String alerts = '/alerts';
  static const String sync = '/sync';
  static const String appSettings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Utiliser une variable locale pour éviter le conflit
    final routeName = settings.name;

    switch (routeName) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registration:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case analytics:
        return MaterialPageRoute(builder: (_) => const AnalyticsScreen());
      case history:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case alerts:
        return MaterialPageRoute(builder: (_) => const AlertsScreen());
      case sync:
        return MaterialPageRoute(builder: (_) => const SyncScreen());
      case appSettings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for $routeName'),
            ),
          ),
        );
    }
  }
}