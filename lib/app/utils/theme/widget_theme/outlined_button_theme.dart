import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class MyOutlinedButtonTheme {
  MyOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: MyColors.dark,
      side: const BorderSide(color: MyColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 14,
        color: MyColors.black,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: MySizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySizes.buttonRadius),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: MyColors.light,
      side: const BorderSide(color: MyColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 14,
        color: MyColors.textWhite,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: MySizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySizes.buttonRadius),
      ),
    ),
  );
}
