import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../widgets/layouts/grid_layout.dart';
import '../../../widgets/products/cards/product_card_vertical.dart';
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
            // -- Header
            MyPrimaryHeaderContainer(
              key: const Key("home_header"),
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
                    textHint: MyTexts.searchProducts,
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
                          title: MyTexts.categories,
                          textColor: MyColors.white,
                          showActionButton: false,
                        ),
                        const SizedBox(height: MySizes.spaceBtwItems),

                        // -- Categories List
                        MyHomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections),
                ],
              ),
            ),

            // -- Body
            Padding(
              padding: EdgeInsets.all(MySizes.defaultSpace),
              child: Column(
                children: [
                  // -- Banner Section

                  // -- Products Section
                  MyGridLayout(
                    itemCount: 4,
                    mainAxisExtent: 271,
                    itemBuilder: (_, index) {
                      return const MyProductCardVertical();
                    },
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
