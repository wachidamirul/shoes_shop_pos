import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
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
        // isScrollable: true,
        controller: controller,
        indicatorColor: MyColors.primary,
        labelColor: dark ? MyColors.white : MyColors.primary,
        unselectedLabelColor: MyColors.darkGrey,
        tabAlignment: TabAlignment.fill,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getAppBarHeight());
}
