import 'package:flutter/material.dart';
import 'package:truebiller/constants/constants.dart';
import 'package:truebiller/view/home_screen/widgets/custom_drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        backgroundColor: Colors.transparent,
        gradientColor: buttonGradient,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
