import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/theme/theme_controller.dart';

class MyThemeButton extends StatelessWidget {
  const MyThemeButton({super.key, this.isIconLight = false});

  final bool isIconLight;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final dark = MyHelperFunctions.isDarkMode(context);

    return IconButton(
      onPressed: () {
        themeController.toggleTheme();
      },
      icon: Icon(
        dark ? Iconsax.sun_1 : Iconsax.moon,
        color:
            isIconLight
                ? MyColors.light
                : dark
                ? MyColors.light
                : MyColors.dark,
      ),
    );
  }
}
