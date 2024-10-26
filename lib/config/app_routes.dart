import 'package:ambulance/presentation/screens/ambunalce_request_screen.dart';
import 'package:ambulance/presentation/screens/all_orders_screen.dart';
import 'package:ambulance/presentation/screens/home_screen.dart';
import 'package:ambulance/presentation/screens/login_screen.dart';
import 'package:ambulance/presentation/screens/register_screen.dart';
import 'package:ambulance/presentation/screens/setting_screen.dart';
import 'package:ambulance/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String homeScreen = '/home';
  static const String allOrdersScreen = '/allOrdersScreen';
  static const String settingsScreen = '/settings';
  static const String ambunalceRequestScreen = '/ambunalceRequest';

  static Route<dynamic> route(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case AppRoutes.allOrdersScreen:
        return MaterialPageRoute(
          builder: (context) => const AllOrdersScreen(),
        );

      case AppRoutes.settingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingScreen());

      case AppRoutes.ambunalceRequestScreen:
        return MaterialPageRoute(
            builder: (context) => const AmbunalceRequestScreen());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
