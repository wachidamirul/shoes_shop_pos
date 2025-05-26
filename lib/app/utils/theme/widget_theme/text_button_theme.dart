import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'text_theme.dart';

class MyTextButtonTheme {
  MyTextButtonTheme._();

  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: MyColors.primary,
      textStyle: MyTextTheme.lightTextTheme.labelLarge,
    ),
  );

  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: MyColors.primary,
      textStyle: MyTextTheme.darkTextTheme.labelLarge,
    ),
  );
}
