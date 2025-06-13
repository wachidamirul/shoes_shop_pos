import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../modules/analytic/controllers/analytic_controller.dart';
import '../../modules/analytic/views/analytic_view.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/product/controllers/product_controller.dart';
import '../../modules/product/views/product_view.dart';
import '../../modules/profile/controllers/profile_controller.dart';
import '../../modules/profile/views/profile_view.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/popups/loaders.dart';
import '../../utils/theme/theme_controller.dart';

class MyNavigationMenu extends StatefulWidget {
  const MyNavigationMenu({super.key});

  @override
  State<MyNavigationMenu> createState() => _MyNavigationMenuState();
}

class _MyNavigationMenuState extends State<MyNavigationMenu> {
  final themeController = Get.find<ThemeController>();

  var currentIndex = 0.obs;
  String? result;

  getIndex() => currentIndex.value;
  setIndex(int index) => currentIndex.value = index;

  final screenList = <Widget>[
    GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => const HomeView(),
    ),
    GetBuilder<AnalyticController>(
      init: AnalyticController(),
      builder: (_) => const AnalyticView(),
    ),
    GetBuilder<ProductController>(
      init: ProductController(),
      builder: (_) => const ProductView(),
    ),
    GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => const ProfileView(),
    ),
  ];

  final iconList = <IconData>[
    Iconsax.shop,
    Iconsax.chart,
    Iconsax.box,
    Iconsax.user,
  ];
  final iconStrings = <String>['Store', 'Analytic', 'Product', 'Profile'];

  @override
  Widget build(BuildContext context) {
    final darkMode = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: IndexedStack(index: getIndex(), children: screenList),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          result = await SimpleBarcodeScanner.scanBarcode(
            context,
            isShowFlashIcon: false,
            delayMillis: 2000,
            cameraFace: CameraFace.back,
            scanType: ScanType.qr,
          );
          setState(() {
            if (result != null) {
              Get.toNamed(
                '/product-detail',
                arguments: {'productId': int.tryParse(result!)},
              );
            }
          });
        },
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
