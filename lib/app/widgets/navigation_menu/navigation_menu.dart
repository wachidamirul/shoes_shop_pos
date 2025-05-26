import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../modules/home/controllers/home_controller.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/order/controllers/order_controller.dart';
import '../../modules/order/views/order_view.dart';
import '../../modules/product/controllers/product_controller.dart';
import '../../modules/product/views/product_view.dart';
import '../../modules/store/controllers/store_controller.dart';
import '../../modules/store/views/store_view.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class MyNavigationMenu extends StatefulWidget {
  const MyNavigationMenu({super.key});

  @override
  State<MyNavigationMenu> createState() => _MyNavigationMenuState();
}

class _MyNavigationMenuState extends State<MyNavigationMenu> {
  var currentIndex = 0.obs;

  getIndex() => currentIndex.value;
  setIndex(int index) => currentIndex.value = index;

  final screenList = <Widget>[
    GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => const HomeView(),
    ),
    GetBuilder<OrderController>(
      init: OrderController(),
      builder: (_) => const OrderView(),
    ),
    GetBuilder<ProductController>(
      init: ProductController(),
      builder: (_) => const ProductView(),
    ),
    GetBuilder<StoreController>(
      init: StoreController(),
      builder: (_) => const StoreView(),
    ),
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
      body: IndexedStack(index: getIndex(), children: screenList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [MyColors.primary, Colors.blue.shade300],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Icon(Iconsax.scan, size: 28, color: MyColors.softGrey),
        ),
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
        onTap: (index) => setState(() => setIndex(index)),
        activeIndex: getIndex(),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        backgroundColor: darkMode ? MyColors.black : MyColors.white,
      ),
    );
  }
}
