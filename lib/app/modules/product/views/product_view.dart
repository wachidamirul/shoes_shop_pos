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
      body: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(MySizes.md),
        itemBuilder:
            (_, index) => Container(
              padding: const EdgeInsets.all(MySizes.sm),
              decoration: BoxDecoration(
                color: dark ? MyColors.black : MyColors.white,
                borderRadius: BorderRadius.circular(MySizes.cardRadiusMd),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.dark.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  // Action for the product item tap
                  print("Product item tapped: $index");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRoundedImage(
                      width: 60,
                      height: 60,
                      isNetworkImage: true,
                      imageUrl:
                          "https://www.converse.id/media/catalog/product/0/1/01-CONVERSE-FFSSBCONA-CONA04144C-Black.jpg",
                      applyImageRadius: true,
                      borderRadius: MySizes.cardRadiusMd,
                    ),
                    const SizedBox(width: MySizes.spaceBtwItems),
                    Expanded(
                      child: Text(
                        'Converse Chuck Taylor All Star',
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
            ),
        separatorBuilder: (_, __) => const SizedBox(height: MySizes.sm),
      ),
    );
  }
}
