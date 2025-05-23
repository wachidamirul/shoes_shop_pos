import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    colorScheme: ColorScheme.light(
      surface: Colors.indigo.shade50,
      primary: Colors.indigo.shade200,
      secondary: Colors.indigo.shade100,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.grey.shade800),
      labelMedium: TextStyle(color: Colors.grey.shade700),
      labelSmall: TextStyle(color: Colors.grey.shade500),
      bodyMedium: TextStyle(color: Colors.grey.shade600),
      headlineMedium: TextStyle(color: Colors.indigo.shade500),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Colors.grey.shade700),
      hintStyle: TextStyle(color: Colors.grey.shade500),
      suffixIconColor: Colors.grey.shade700,
      prefixIconColor: Colors.grey.shade700,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.shade100),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.shade200),
      ),
    ),
    dividerColor: Colors.grey.shade400,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.grey.shade300),
      labelMedium: TextStyle(color: Colors.grey.shade500),
      labelSmall: TextStyle(color: Colors.grey.shade600),
      bodyMedium: TextStyle(color: Colors.grey.shade400),
      headlineMedium: TextStyle(color: Colors.indigo.shade400),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.shade800,
      labelStyle: TextStyle(color: Colors.grey.shade500),
      hintStyle: TextStyle(color: Colors.grey.shade600),
      suffixIconColor: Colors.grey.shade500,
      prefixIconColor: Colors.grey.shade500,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade500),
      ),
    ),
    dividerColor: Colors.grey.shade700,
  );
}
