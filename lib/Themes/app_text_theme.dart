import 'package:flutter/material.dart';
import 'package:truebiller/utils/size_utils.dart';

class AppTextStyles {
  static String openSansFontFamily = "OpenSans";
  static String interFontFamily = "Inter";

  static TextStyle openSansRegular8 = TextStyle(
      fontFamily: openSansFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 8.fSize);
  static TextStyle openSansRegular12 = TextStyle(
      fontFamily: openSansFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12.fSize);

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
}

extension TextStyleExtensions on BuildContext {
  TextStyle get openSansRegular8 => AppTextStyles.openSansRegular8;

  TextStyle get openSansRegular12 => AppTextStyles.openSansRegular12;
  TextStyle get openSansRegular14 => AppTextStyles.openSansRegular14;
  TextStyle get openSansBold16 => AppTextStyles.openSansBold16;
  TextStyle get openSansBoldItalic16 => AppTextStyles.openSansBoldItalic16;
  TextStyle get openSansMedium18 => AppTextStyles.openSansMedium18;
  TextStyle get openSansSemiBold24 => AppTextStyles.openSansSemiBold24;
}
