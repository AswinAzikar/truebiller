import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:truebiller/Themes/app_text_theme.dart';
import 'package:truebiller/constants/constants.dart';
import 'package:truebiller/utils/size_utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 92, 164, 223)),
            height: SizeUtils.height,
            width: SizeUtils.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(animatedTexts: [
                      TypewriterAnimatedText("Welcome !",
                          textStyle: context.openSansSemiBold24,
                          speed: Durations.medium4)
                    ])
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(paddingLarge),
            width: double.maxFinite,
            color: Colors.red,
            height: SizeUtils.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Enter Organization Name:"),
                TextFormField()
              ],
            ),
          )
        ],
      ),
    );
  }
}
