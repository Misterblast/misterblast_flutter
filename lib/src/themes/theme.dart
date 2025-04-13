import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? fontFamily = GoogleFonts.poppins().fontFamily;

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF006FFD),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme(
    primary: const Color(0xFF006FFD),
    secondary: const Color(0xFF5DA4FF),
    surface: const Color(0xFFFFFFFF),
    error: const Color(0xFFE74C3C),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: AppFontSizes.xs,
      color: Colors.black,
      fontFamily: fontFamily,
    ),
  ),
);

class AppColors {
  static const Color primary = Color(0xFF006FFD);
  static const Color lightBlue = Color(0xFF5DA4FF);
  static const Color softYellow = Color(0xFFFCE96A);
  static const Color warmOrange = Color(0xFFFFA34D);
  static const Color coolTeal = Color(0xFF4BC1A6);
  static const Color darkerGreen = Color(0xFF4D9988);
  static const Color neutralGray = Color(0xFFF4F4F4);
  static const Color danger = Color(0xFFE74C3C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFD2D2D2);
}

class AppFontSizes {
  //i use +4 multiplier
  static const double xs = 4.0;
  static const double sm = xs * 2;
  static const double md = xs * 3;
  static const double lg = xs * 4;
  static const double xl = xs * 5;
}
