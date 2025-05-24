import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/utils/constants/colors.dart';
import 'package:shoes_shop_pos/app/utils/constants/sizes.dart';

class MyAppBarTheme {
  MyAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyColors.dark, size: MySizes.iconMd),
    actionsIconTheme: IconThemeData(color: MyColors.dark, size: MySizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: MyColors.dark,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyColors.light, size: MySizes.iconMd),
    actionsIconTheme: IconThemeData(
      color: MyColors.light,
      size: MySizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: MyColors.light,
    ),
  );
}
