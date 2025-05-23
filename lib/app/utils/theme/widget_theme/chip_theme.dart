import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/utils/constants/colors.dart';

class MyChipTheme {
  MyChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: MyColors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: MyColors.black),
    selectedColor: MyColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: MyColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: MyColors.darkerGrey,
    labelStyle: TextStyle(color: MyColors.white),
    selectedColor: MyColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: MyColors.white,
  );
}
