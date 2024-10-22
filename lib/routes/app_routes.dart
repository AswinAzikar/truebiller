import 'package:flutter/material.dart';
import 'package:truebiller/utils/size_utils.dart';
import 'package:truebiller/view/landing_page/landing_page.dart';

class AppRoutes {
  static const String landingScreen = '/';
  //static const String signUp = '/';
  static const String navigation = 'Navigator';
  static const String home = '/home';
  static const String detailScreen = '/detailScreen';

  static Map<String, WidgetBuilder> get routes {
    return {
      landingScreen: (context) => const LandingPage(),
      // detailScreen: (context) => const DetailScreen(),
      // signUp: (context) => const SignUpScreen(),
      // navigation: (context) => const NavigationScreen(),
      //     home: (context) => const HomeScreen(),
    };
  }

  static Widget getResponsiveSignUp(
      BuildContext context, Orientation orientation) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const SizedBox();
        //  return const SignUpScreen();
      },
    );
  }
}
