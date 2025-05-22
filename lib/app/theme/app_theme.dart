import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.indigo.shade50,
      primary: Colors.indigo.shade200,
      secondary: Colors.indigo.shade100,
    ),
  );
}

class DarkTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
    ),
  );
}

class AppTheme {
  static final light = LightTheme.theme;
  static final dark = DarkTheme.theme;
}
