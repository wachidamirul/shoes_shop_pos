import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/device_utility.dart';
import '../../utils/helpers/helper_functions.dart';

class MyAppBarBlank extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarBlank({super.key, this.lightSystemOverlayStyle = false});

  final bool lightSystemOverlayStyle;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: MyDeviceUtils.getStatusBarHeight() - 12,
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
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            dark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getStatusBarHeight());
}
