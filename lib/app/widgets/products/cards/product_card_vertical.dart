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
  const MyProductCardVertical({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.productTitle,
    required this.price,
  });

  final VoidCallback onTap;
  final String imageUrl;
  final String productTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
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
              height: 180,
              padding: const EdgeInsets.all(MySizes.xs),
              showBorder: true,
              borderColor: dark ? MyColors.black : MyColors.light,
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  MyRoundedImage(
                    width: double.infinity,
                    height: double.infinity,
                    isNetworkImage: true,
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                    backgroundColor:
                        dark
                            ? MyColors.dark.withValues(alpha: 0.8)
                            : MyColors.light.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwItems / 2),
            // -- Details
            Padding(
              padding: const EdgeInsets.only(left: MySizes.sm),
              child: SizedBox(
                height: 81,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyProductTitleText(title: productTitle, smallSize: true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyProductPriceText(price: "\$$price", isLarge: true),
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
                            width: MySizes.iconLg * 1.2,
                            height: MySizes.iconLg * 1.2,
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
            ),
          ],
        ),
      ),
    );
  }
}
