import 'package:flutter/material.dart';
import 'package:truebiller/view/landing_page/landing_page.dart';
import '../view/home_screen/home_screen.dart';

class AppRoutes {
  static const String landingScreen = '/';
  static const String home = '/home';
  // Add more routes as needed

  static Map<String, WidgetBuilder> get routes {
    return {
      landingScreen: (context) => const LandingPage(),
      home: (context) => const HomeScreen(),
      // Add other routes here
    };
  }
}
