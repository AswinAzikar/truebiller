import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truebiller/Themes/app_text_theme.dart';
import 'package:truebiller/constants/constants.dart';
import 'package:truebiller/main.dart';
import 'package:truebiller/utils/size_utils.dart';
import 'package:truebiller/view/landing_page/widgets/additional_data_widget.dart';
import 'package:truebiller/view/landing_page/widgets/buttons.dart';

import '../../controllers/controllers.dart';
import '../../routes/app_routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final FocusNode _focusNode = FocusNode();

  bool _orgNameEmpty = false;
  bool _isOrgNameSaved = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    organizationNameController.dispose();
    super.dispose();
  }

  void _handleKeyEvent(KeyEvent event) {
<<<<<<< HEAD
    if (event.logicalKey == LogicalKeyboardKey.enter) {
      _validateInput();
    }

            Get.toNamed(AppRoutes.home);
=======
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
      _validateInput();
    }

    // Get.toNamed(AppRoutes.home);
>>>>>>> master
  }

  void _validateInput() async {
    if (organizationNameController.text.trim().isEmpty) {
      setState(() {
        _orgNameEmpty = true;
      });
    } else {
      setState(() {
        _orgNameEmpty = false;
      });

      _isOrgNameSaved = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: KeyboardListener(
        focusNode: _focusNode,
        onKeyEvent: (value) {
          _handleKeyEvent(value);
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF5CA4DF), Color(0xFF3461C1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  _buildMovingBubble(
                      top: 100,
                      left: 40,
                      size: 120,
                      color: Colors.white.withOpacity(0.2)),
                  _buildMovingBubble(
                      bottom: 150,
                      left: 150,
                      size: 80,
                      color: Colors.white.withOpacity(0.15)),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long_rounded,
                          size: 120,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        const SizedBox(height: 20),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Welcome to TrueBiller",
                              textStyle: context.openSansSemiBold24.copyWith(
                                color: Colors.white,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(color: Colors.white),
                  _buildMovingBubble(
                      top: 200,
                      right: 50,
                      size: 100,
                      color: Colors.blue.withOpacity(0.1)),
                  _buildMovingBubble(
                      bottom: 100,
                      right: 100,
                      size: 60,
                      color: Colors.blue.withOpacity(0.15)),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      width: 300.fSize,
                      child: _isOrgNameSaved
                          ? const AdditionalDataWidget()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Set Up Your Organization",
                                  style: context.openSansBold16.copyWith(
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: paddingLarge),
                                TextFormField(
=======
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5CA4DF), Color(0xFF3461C1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                _buildMovingBubble(
                    top: 100,
                    left: 40,
                    size: 120,
                    color: Colors.white.withOpacity(0.2)),
                _buildMovingBubble(
                    bottom: 150,
                    left: 150,
                    size: 80,
                    color: Colors.white.withOpacity(0.15)),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_rounded,
                        size: 120,
                        color: Colors.white.withOpacity(0.9),
                      ),
                      const SizedBox(height: 20),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Welcome to TrueBiller",
                            textStyle: context.openSansSemiBold24.copyWith(
                              color: Colors.white,
                            ),
                            speed: const Duration(milliseconds: 200),
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(color: Colors.white),
                _buildMovingBubble(
                    top: 200,
                    right: 50,
                    size: 100,
                    color: Colors.blue.withOpacity(0.1)),
                _buildMovingBubble(
                    bottom: 100,
                    right: 100,
                    size: 60,
                    color: Colors.blue.withOpacity(0.15)),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    width: 300.fSize,
                    child: _isOrgNameSaved
                        ? const AdditionalDataWidget()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Set Up Your Organization",
                                style: context.openSansBold16.copyWith(
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: paddingLarge),
                              KeyboardListener(
                                focusNode: _focusNode,
                                onKeyEvent: (value) {
                                  _handleKeyEvent(value);
                                },
                                child: TextFormField(
>>>>>>> master
                                  onTap: () => setState(() {
                                    _orgNameEmpty = false;
                                  }),
                                  controller: organizationNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(padding),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Enter Organization Name",
                                    hintStyle:
                                        const TextStyle(color: Colors.black54),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 16),
                                  ),
                                ),
<<<<<<< HEAD
                                const SizedBox(height: paddingLarge),
                                if (_orgNameEmpty)
                                  Text(
                                    "Please enter the organization name",
                                    style: context.openSansBold16.copyWith(
                                        fontSize: 13,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  ),
                                LoadButton(onTap: _validateInput)
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
=======
                              ),
                              const SizedBox(height: paddingLarge),
                              if (_orgNameEmpty)
                                Text(
                                  "Please enter the organization name",
                                  style: context.openSansBold16.copyWith(
                                      fontSize: 13,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                              LoadButton(onTap: _validateInput)
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
>>>>>>> master
      ),
    );
  }

  Widget _buildMovingBubble({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required Color color,
  }) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: top != null ? top + _controller.value * 15 : null,
          bottom: bottom != null ? bottom + _controller.value * 15 : null,
          left: left != null ? left + _controller.value * 15 : null,
          right: right != null ? right + _controller.value * 15 : null,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
