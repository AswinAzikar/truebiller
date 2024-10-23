import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truebiller/Themes/app_text_theme.dart';
import 'package:truebiller/utils/size_utils.dart';
import 'package:truebiller/view/landing_page/widgets/buttons.dart';

import '../../../constants/constants.dart';
import '../../../controllers/controllers.dart';

class AdditionalDataWidget extends StatefulWidget {
  const AdditionalDataWidget({super.key});

  @override
  State<AdditionalDataWidget> createState() => _AdditionalDataWidgetState();
}

class _AdditionalDataWidgetState extends State<AdditionalDataWidget> {
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final RegExp zipRegExp = RegExp(r'^\d{6}$');
  final RegExp phoneRegExp = RegExp(r'^\+?\d{10,12}$');
  final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp gstRegExp =
      RegExp(r'^\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}$');

  String? _validatePlace(String? value) {
    if (value == null || value.isEmpty) {
      return "Place is required";
    }
    return null;
  }

  String? _validateZip(String? value) {
    if (value == null || value.isEmpty) {
      return "Zip code is required";
    } else if (!zipRegExp.hasMatch(value)) {
      return "Invalid zip code";
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    } else if (!phoneRegExp.hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!emailRegExp.hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  String? _validateGst(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (!gstRegExp.hasMatch(value)) {
      return "Invalid GST format";
    }
    return null;
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('orgName', organizationNameController.text.trim());
    prefs.setString('orgPlace', placeController.text.trim());
    prefs.setString('orgZip', zipController.text.trim());
    prefs.setString('orgPhone', phoneController.text.trim());
    prefs.setString('orgEmail', emailController.text.trim());
    prefs.setString('orgGst', gstController.text.trim());

    // Printing data
    logger.w(
        "${prefs.getString('orgName')}\n${prefs.getString('orgPlace')} \n${prefs.getString('orgZip')}\n${prefs.getString('orgPhone')}\n${prefs.getString('orgEmail')}\n${prefs.getString('orgGst')}");
  }

  void _validateAndSave() {
    if (_formKey.currentState?.validate() ?? false) {
      _saveData();
      logger.i("All data are Saved");
    }
    
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.enter) {
      _validateAndSave();
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (value) {
        _handleKeyEvent(value);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Set Up Your Organization",
            style: context.openSansBold16
                .copyWith(color: Colors.black87, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: paddingLarge),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  Place:",
                  style: context.openSansRegular8
                      .copyWith(color: Colors.grey, fontSize: 9.fSize),
                ),
                Gap(8.fSize),
                TextFormField(
                  controller: placeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Enter Organization Place, Eg: New York, USA",
                    hintStyle: const TextStyle(color: Colors.black54),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 16),
                  ),
                  validator: _validatePlace,
                ),
                gapLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100.fSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Zip:",
                            style: context.openSansRegular8.copyWith(
                                color: Colors.grey, fontSize: 9.fSize),
                          ),
                          Gap(8.fSize),
                          TextFormField(
                            controller: zipController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Eg: 6XXX22",
                              hintStyle: const TextStyle(color: Colors.black54),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 16),
                            ),
                            validator: _validateZip,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150.fSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Phone:",
                            style: context.openSansRegular8.copyWith(
                                color: Colors.grey, fontSize: 9.fSize),
                          ),
                          Gap(8.fSize),
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Eg: +919xxxxxxx4x",
                              hintStyle: const TextStyle(color: Colors.black54),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 16),
                            ),
                            validator: _validatePhone,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                gapLarge,
                Text(
                  "  Email:",
                  style: context.openSansRegular8
                      .copyWith(color: Colors.grey, fontSize: 9.fSize),
                ),
                Gap(8.fSize),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Eg: youremail@gmail.com",
                    hintStyle: const TextStyle(color: Colors.black54),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 16),
                  ),
                  validator: _validateEmail,
                ),
                gapLarge,
                Text(
                  "  GST (Optional):",
                  style: context.openSansRegular8
                      .copyWith(color: Colors.grey, fontSize: 9.fSize),
                ),
                Gap(8.fSize),
                TextFormField(
                  controller: gstController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Eg: 27ABCDE1XX4F1Z5",
                    hintStyle: const TextStyle(color: Colors.black54),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 16),
                  ),
                  validator: _validateGst,
                ),
                gapLarge
              ],
            ),
          ),
          const SizedBox(height: paddingLarge),

          LoadButton(onTap: _validateAndSave)
          // MouseRegion(
          //   cursor: SystemMouseCursors.click,
          //   child: AnimatedContainer(
          //     duration: const Duration(milliseconds: 200),
          //     curve: Curves.easeIn,
          //     width: double.infinity,
          //     height: 35.fSize,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: buttonGradient,
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //       ),
          //       borderRadius: BorderRadius.circular(10),
          //       boxShadow: shadows,
          //     ),
          //     child: ElevatedButton(
          //       onPressed: _validateAndSave,
          //       style: ElevatedButton.styleFrom(
          //         elevation: 0,
          //         backgroundColor: Colors.transparent,
          //         shadowColor: Colors.transparent,
          //       ),
          //       child: const Text(
          //         "Continue",
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
