import 'package:flutter/material.dart';
import 'package:truebiller/utils/size_utils.dart';

class AppTextStyles {
  static String openSansFontFamily = "OpenSans";

  static TextStyle openSansRegular14 = TextStyle(
      fontFamily: openSansFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14.fSize);
  static TextStyle openSansBold16 = TextStyle(
      fontFamily: openSansFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 16.fSize);
  static TextStyle openSansBoldItalic16 = TextStyle(
      fontFamily: openSansFontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
      fontSize: 16.fSize);
  static TextStyle openSansMedium18 = TextStyle(
      fontFamily: openSansFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 18.fSize);
  static TextStyle openSansSemiBold24 = TextStyle(
      fontFamily: openSansFontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 24.fSize);

  // Add more styles as needed
}

extension TextStyleExtensions on BuildContext {
  TextStyle get openSansRegular14 => AppTextStyles.openSansRegular14;
  TextStyle get openSansBold16 => AppTextStyles.openSansBold16;
  TextStyle get openSansBoldItalic16 => AppTextStyles.openSansBoldItalic16;
  TextStyle get openSansMedium18 => AppTextStyles.openSansMedium18;
  TextStyle get openSansSemiBold24 => AppTextStyles.openSansSemiBold24;

  // Add more extensions as needed
}
