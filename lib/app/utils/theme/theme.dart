import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/utils/constants/colors.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/appbar_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/bottom_sheet_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/checkbox_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/chip_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/text_button_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/text_field_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/text_selection_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/widget_theme/text_theme.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: MyTextTheme.lightTextTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    scaffoldBackgroundColor: MyColors.light,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme,
    textSelectionTheme: MyTextSelectionTheme.lightSelectionTheme,
    textButtonTheme: MyTextButtonTheme.lightTextButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: MyTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    scaffoldBackgroundColor: MyColors.dark,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.darkInputDecorationTheme,
    textSelectionTheme: MyTextSelectionTheme.darkSelectionTheme,
    textButtonTheme: MyTextButtonTheme.darkTextButtonTheme,
  );
}
