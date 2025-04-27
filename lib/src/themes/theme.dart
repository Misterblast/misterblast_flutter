import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? fontFamily = GoogleFonts.poppins().fontFamily;
final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      textStyle: TextStyle(
        fontSize: AppFontSizes.md,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.primary),
      foregroundColor: Colors.blue,
      backgroundColor: Colors.white,
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      textStyle: TextStyle(
        fontSize: AppFontSizes.md,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        width: 2,
        color: AppColors.primary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontFamily: fontFamily,
      fontSize: AppFontSizes.md,
    ),
    suffixIconColor: Colors.grey.withOpacity(0.5),
  ),
  colorScheme: ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.lightBlue,
    surface: Colors.white,
    error: AppColors.danger,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: AppFontSizes.xl,
      color: Colors.black,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: AppFontSizes.md,
      color: Colors.black,
      fontFamily: fontFamily,
    ),
  ),
  dialogBackgroundColor: Colors.white,
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
