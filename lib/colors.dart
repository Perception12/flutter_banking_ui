import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static Color mainBackground = const Color(0xFFfbfcff);
  static Color primaryColor = const Color(0xFF5560B4);
  static Color chartColor1 = const Color(0xFF959cd0);
  static Color chartColor2 = const Color(0xFFb8bde0);
  static Color chartColor3 = const Color(0xFFcacde8);
  static Color chartColor4 = const Color(0xFFdcdeef);
  static Color disabledColor = const Color(0xFFE5E5E5);
  static Color greyColor = const Color(0xFFD4D8E2);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
