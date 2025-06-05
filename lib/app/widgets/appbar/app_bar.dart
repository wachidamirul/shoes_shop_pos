import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/device_utility.dart';
import '../../utils/helpers/helper_functions.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showbackArrow = false,
    this.lightSystemOverlayStyle = false,
  });

  final Widget? title;
  final bool showbackArrow, lightSystemOverlayStyle;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MySizes.md,
        vertical: MySizes.sm,
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading:
            showbackArrow
                ? IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Iconsax.arrow_left),
                )
                : leadingIcon != null
                ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon),
                )
                : null,
        title: title,
        actions: actions,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness:
              lightSystemOverlayStyle
                  ? Brightness.dark
                  : dark
                  ? Brightness.light
                  : Brightness.dark,
          statusBarIconBrightness:
              lightSystemOverlayStyle
                  ? Brightness.light
                  : dark
                  ? Brightness.light
                  : Brightness.dark,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getAppBarHeight());
}
