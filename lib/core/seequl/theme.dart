import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static Color s50 = const Color(0xFFF9F9F9);
  static Color s100 = const Color(0xFFF5F5F5);
  static Color s200 = const Color(0xFFE0E0E0);
  static Color s300 = const Color(0xFFCBCBCB);
  static Color s400 = const Color(0xFFB6B6B6);
  static Color s500 = const Color(0xFF002E66);
  static Color s600 = const Color(0xFF676767);
  static Color s700 = const Color(0xFF494949);
  static Color s800 = const Color(0xFF2B2B2B);
  static Color s900 = const Color(0xFF1f1f1f);

  static Color background = const Color(0xFF060E16);
  static Color overlay = const Color(0xFF0D2430);
  static Color blueHue = const Color(0xFF0083B9);
  static Color iconColor = const Color(0xFFCCC5A9);
  static Color highlightColor = const Color(0xFFF4A261);
  static Color cardColor = const Color(0x44555552);
  static Color textColor = Colors.grey.shade300;
  static Color white = Colors.white;
  static Color buttonColor = const Color.fromARGB(84, 73, 75, 76);
}

MaterialColor primarySwatch = MaterialColor(
  Palette.s500.value,
  {
    50: Palette.s50,
    100: Palette.s100,
    200: Palette.s200,
    300: Palette.s300,
    400: Palette.s400,
    500: Palette.s500,
    600: Palette.s600,
    700: Palette.s700,
    800: Palette.s800,
    900: Palette.s900,
  },
);

final themeData = ThemeData(
  scaffoldBackgroundColor: Palette.background,
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Palette.blueHue,
      onPrimary: Palette.iconColor,
      secondary: Palette.buttonColor,
      onSecondary: Colors.white,
      error: Palette.buttonColor,
      onError: Colors.white,
      background: Colors.transparent,
      onBackground: Colors.white,
      surface: Palette.cardColor,
      onSurface: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 20.0,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Palette.iconColor),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(60.0),
      borderSide: const BorderSide(color: Color(0xFFCBD2D9)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(60.0),
      borderSide: BorderSide(color: Palette.blueHue, width: 1.6),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(60.0),
      borderSide: BorderSide(color: Colors.red.shade300),
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: Palette.background,
  ),
  colorScheme: ColorScheme.dark(
    background: Palette.background,
    primary: Palette.blueHue,
    tertiary: Palette.cardColor,
  ),
);
