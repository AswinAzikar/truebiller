import 'package:flutter/material.dart';
import 'package:truebiller/view/landing_page/landing_page.dart';
import 'package:truebiller/view/navigation_screen/navigation_screen.dart';
import '../view/home_screen/home_screen.dart';

class AppRoutes {
  static const String landingScreen = '/';
  static const String home = '/home';
  static const String navigation = "/navigation";
  // Add more routes as needed

  static Map<String, WidgetBuilder> get routes {
    return {
      landingScreen: (context) => const LandingPage(),
      home: (context) => const HomeScreen(),
      navigation: (context) => const NavigationScreen()
      // Add other routes here
    };
  }
}
