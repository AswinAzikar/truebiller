import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truebiller/routes/app_routes.dart';
import 'package:truebiller/utils/size_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.landingScreen,
    );
  }
}
