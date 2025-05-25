import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:shoes_shop_pos/app/modules/home/views/home_view.dart';
import 'package:shoes_shop_pos/app/modules/order/views/order_view.dart';
import 'package:shoes_shop_pos/app/modules/product/views/product_view.dart';
import 'package:shoes_shop_pos/app/modules/store/views/store_view.dart';
import 'package:shoes_shop_pos/app/utils/constants/colors.dart';
import 'package:shoes_shop_pos/app/utils/helpers/helper_functions.dart';

class MyNavigationMenu extends StatefulWidget {
  const MyNavigationMenu({super.key});

  @override
  State<MyNavigationMenu> createState() => _MyNavigationMenuState();
}

class _MyNavigationMenuState extends State<MyNavigationMenu> {
  final controller = MyNavigationMenuController();
  final screenList = <Widget>[
    const HomeView(),
    const OrderView(),
    const ProductView(),
    const StoreView(),
  ];
  final iconList = <IconData>[
    Iconsax.home_2,
    Iconsax.document_text,
    Iconsax.box,
    Iconsax.shop,
  ];
  final iconStrings = <String>['Home', 'Order', 'Product', 'Store'];

  @override
  Widget build(BuildContext context) {
    final darkMode = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: IndexedStack(index: controller.getIndex(), children: screenList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: MyColors.primary,
        foregroundColor: MyColors.softGrey,
        shape: const CircleBorder(),
        child: Icon(Iconsax.scan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        elevation: 0,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive
                  ? darkMode
                      ? MyColors.softGrey
                      : MyColors.primary
                  : MyColors.darkGrey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconList[index], size: 22, color: color),
              const SizedBox(height: 2),
              Text(
                iconStrings[index],
                style: TextStyle(color: color, fontSize: 10),
              ),
            ],
          );
        },
        height: 64,
        onTap: (index) => setState(() => controller.setIndex(index)),
        activeIndex: controller.getIndex(),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        backgroundColor: darkMode ? MyColors.black : MyColors.white,
      ),
    );
  }
}

class MyNavigationMenuController extends GetxController {
  var currentIndex = 0.obs;

  getIndex() => currentIndex.value;
  setIndex(int index) => currentIndex.value = index;
}
