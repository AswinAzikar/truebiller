import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truebiller/constants/constants.dart';
import 'package:truebiller/routes/app_routes.dart';
import 'package:truebiller/utils/size_utils.dart';

import 'view/landing_page/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getString("orgName") != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return child ?? const SizedBox();
          },
        );
      },
      initialRoute: isLoggedIn ? AppRoutes.navigation : AppRoutes.landingScreen,
      onGenerateRoute: (RouteSettings settings) {
        final WidgetBuilder? builder = AppRoutes.routes[settings.name];
        if (builder != null) {
          return MaterialPageRoute(
            builder: (context) => builder(context),
            settings: settings,
          );
        }

        return MaterialPageRoute(builder: (context) => const LandingPage());
      },
    );
  }
}
