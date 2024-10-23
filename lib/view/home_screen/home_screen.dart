import 'package:flutter/material.dart';
import 'package:truebiller/constants/constants.dart';
import 'package:truebiller/view/home_screen/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        backgroundColor: Colors.transparent,
        gradientColor: buttonGradient,
      ),
      appBar: AppBar(),
    );
  }
}
