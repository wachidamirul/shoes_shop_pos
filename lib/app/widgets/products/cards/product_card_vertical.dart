import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/shadows.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../custom_shapes/containers/rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class MyProductCardVertical extends StatelessWidget {
  const MyProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        // Handle product card tap
        print("Product card tapped");
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MyShadowStyle.productItemShadow],
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.black : MyColors.white,
        ),
        child: Column(
          children: [
            // -- Thumbnail
            MyRoundedContainer(
              height: 171,
              padding: const EdgeInsets.all(MySizes.xs),
              showBorder: true,
              borderColor: dark ? MyColors.black : MyColors.light,
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  // MyRound
                  MyRoundedImage(
                    width: double.infinity,
                    height: double.infinity,
                    isNetworkImage: true,
                    imageUrl:
                        "https://www.converse.id/media/catalog/product/0/1/01-CONVERSE-FFSSBCONA-CONA04144C-Black.jpg",
                    applyImageRadius: true,
                    backgroundColor:
                        dark
                            ? MyColors.dark.withValues(alpha: 0.8)
                            : MyColors.light.withValues(alpha: 0.8),
                  ),

                  // -- Tag
                  Positioned(
                    top: 8,
                    left: 8,
                    child: MyRoundedContainer(
                      radius: MySizes.sm,
                      backgroundColor: MyColors.secondary.withValues(
                        alpha: 0.8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: MySizes.sm,
                        vertical: MySizes.xs,
                      ),
                      child: Text(
                        "25%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: MyColors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: MySizes.spaceBtwItems / 2),

            // -- Details
            Padding(
              padding: const EdgeInsets.only(left: MySizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyProductTitleText(
                    title: "Converse Chuck Taylor All Star",
                    smallSize: true,
                  ),
                  const SizedBox(height: MySizes.spaceBtwItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyProductPriceText(
                            price: "\$47,33",
                            isLarge: false,
                            lineThrough: true,
                          ),
                          const MyProductPriceText(
                            price: "\$35.5",
                            isLarge: true,
                          ),
                        ],
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(MySizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              MySizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: MySizes.iconLg * 1.3,
                          height: MySizes.iconLg * 1.3,
                          child: Center(
                            child: Icon(Iconsax.add, color: MyColors.white),
                          ),
                        ),
                      ),
                    ],
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
