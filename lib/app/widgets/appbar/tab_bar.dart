import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device_utility.dart';
import '../../utils/helpers/helper_functions.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabBar({super.key, required this.tabs, this.controller});

  final TabController? controller;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? MyColors.dark : MyColors.light,
      child: TabBar(
        controller: controller,
        // isScrollable: true,
        indicatorColor: MyColors.primary,
        labelColor: dark ? MyColors.white : MyColors.primary,
        unselectedLabelColor: MyColors.darkGrey,
        tabAlignment: TabAlignment.fill,
        tabs: tabs,
        labelPadding: const EdgeInsets.symmetric(horizontal: MySizes.sm),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getAppBarHeight());
}
