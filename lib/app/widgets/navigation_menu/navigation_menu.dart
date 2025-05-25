import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../navigation_menu/navigation_menu_controller.dart';

class MyNavigationMenu extends StatelessWidget {
  MyNavigationMenu({super.key});

  final MyNavigationMenuController controller = Get.put(
    MyNavigationMenuController(),
  );

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: PageView(
        onPageChanged: controller.changePage,
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        children: const [
          Center(child: Text('Home Page')),
          Center(child: Text('Orders Page')),
          Center(child: Text('Products Page')),
          Center(child: Text('Store Page')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: MyColors.primary,
        foregroundColor: MyColors.softGrey,
        shape: const CircleBorder(),

        child: Icon(Iconsax.scan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        color: dark ? MyColors.black : MyColors.white,
        shape: const CircularNotchedRectangle(),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _bottomAppBarItem(
                context,
                icon: Iconsax.home_2,
                page: 0,
                label: 'Home',
              ),
              _bottomAppBarItem(
                context,
                icon: Iconsax.document_text,
                page: 1,
                label: 'Orders',
              ),
              const SizedBox(width: 48), // Space for the FAB
              _bottomAppBarItem(
                context,
                icon: Iconsax.box,
                page: 2,
                label: 'Products',
              ),
              _bottomAppBarItem(
                context,
                icon: Iconsax.shop,
                page: 3,
                label: 'Store',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(
    BuildContext context, {
    required icon,
    required page,
    required label,
  }) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return ZoomTapAnimation(
      onTap: () => controller.changePage(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  controller.currentPage.value == page
                      ? dark
                          ? const Color(0xFF5988FF)
                          : MyColors.primary
                      : dark
                      ? MyColors.softGrey
                      : MyColors.darkGrey,
            ),
            const SizedBox(height: MySizes.xs),
            Text(
              label,
              style: TextStyle(
                fontSize: MySizes.fontSizeSm,
                color:
                    controller.currentPage.value == page
                        ? dark
                            ? const Color(0xFF5988FF)
                            : MyColors.primary
                        : dark
                        ? MyColors.softGrey
                        : MyColors.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
