import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/appbar/app_bar_blank.dart';
import '../../../widgets/custom_shapes/containers/rounded_image.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBarBlank(lightSystemOverlayStyle: false),
      floatingActionButton: FloatingActionButton(
        heroTag: 'product_fab',
        onPressed: controller.goToAddProduct,
        backgroundColor: MyColors.primary,
        child: const Icon(Icons.add, color: MyColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Obx(() {
        if (controller.products.isEmpty) {
          return const Center(child: Text('No products found.'));
        }
        return ListView.separated(
          itemCount: controller.products.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(MySizes.md),
          itemBuilder: (_, index) {
            final product = controller.products[index];
            return Container(
              padding: const EdgeInsets.all(MySizes.sm),
              decoration: BoxDecoration(
                color: dark ? MyColors.black : MyColors.white,
                borderRadius: BorderRadius.circular(MySizes.cardRadiusMd),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.dark.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  // Action for the product item tap
                  print("Product item tapped: ${product['name']}");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRoundedImage(
                      width: 60,
                      height: 60,
                      isNetworkImage: true,
                      imageUrl: product['image_url'] ?? '',
                      applyImageRadius: true,
                      borderRadius: MySizes.cardRadiusMd,
                    ),
                    const SizedBox(width: MySizes.spaceBtwItems),
                    Expanded(
                      child: Text(
                        product['name'] ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: MySizes.spaceBtwItems),
                    IconButton(
                      onPressed: () {
                        // Action for the edit button
                      },
                      icon: const Icon(Iconsax.edit, color: MyColors.primary),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: MySizes.sm),
        );
      }),
    );
  }
}
