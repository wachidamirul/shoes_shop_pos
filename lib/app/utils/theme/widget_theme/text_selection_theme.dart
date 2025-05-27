import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MyTextSelectionTheme {
  MyTextSelectionTheme._();

  static TextSelectionThemeData lightSelectionTheme = TextSelectionThemeData(
    cursorColor: MyColors.dark,
    selectionColor: MyColors.primary,
  );

  static TextSelectionThemeData darkSelectionTheme = TextSelectionThemeData(
    cursorColor: MyColors.light,
    selectionColor: MyColors.primary,
  );
}
