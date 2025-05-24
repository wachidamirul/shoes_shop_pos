import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/text_theme.dart';

import '../../constants/colors.dart';

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
