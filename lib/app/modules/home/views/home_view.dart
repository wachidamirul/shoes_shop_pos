import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../widgets/custom_shapes/containers/search_container.dart';
import '../../../widgets/texts/section_heading.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_categories.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            MyPrimaryHeaderContainer(
              height: 400,
              child: Column(
                children: [
                  // -- AppBar
                  MyHomeAppBar(),
                  const SizedBox(height: MySizes.spaceBtwSections / 2),

                  // -- Search Bar
                  MySearchContainer(
                    onTap: () {
                      print("Search tapped");
                    },
                    textHint: 'Search for products',
                    icon: Iconsax.search_normal,
                    showBackground: true,
                    showBorder: true,
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections),

                  // -- Categories
                  Padding(
                    padding: const EdgeInsets.only(left: MySizes.defaultSpace),
                    child: Column(
                      children: [
                        // -- Section Heading
                        MySectionHeading(
                          title: "Categories",
                          textColor: MyColors.white,
                          showActionButton: false,
                        ),
                        const SizedBox(height: MySizes.spaceBtwItems),

                        // -- Categories List
                        MyHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
