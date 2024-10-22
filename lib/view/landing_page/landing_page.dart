import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
                const BoxDecoration(color: Color.fromARGB(255, 255, 246, 215)),
            height: SizeUtils.height,
            width: SizeUtils.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                        animatedTexts: [TypewriterAnimatedText("Welcome !")])
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
