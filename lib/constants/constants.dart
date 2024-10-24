import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

const double padding = 8;
const double paddingLarge = 16;
const double paddingXL = 32;
const double paddingXXL = 64;
const double paddingSmall = 4;
const double paddingTiny = 2;

const gap = Gap(padding);
const gapLarge = Gap(paddingLarge);
const gapXL = Gap(paddingXL);
const gapXXL = Gap(paddingXXL);
const gapSmall = Gap(paddingSmall);
const gapTiny = Gap(paddingTiny);

// const buttonGradient = LinearGradient(colors: [
//   Color(0xff4D2B1A),
//   Color(0xffA7745A),
// ]);
Color textColor = const Color(0xffB6B6B6);


List<Color> buttonGradient = [const Color(0xFF6FA8DC), const Color(0xFF3A79B7)];

List<BoxShadow> shadows = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 15,
    offset: const Offset(0, 5),
  ),
];

Logger logger = Logger();
