import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../modules/carts/controllers/carts_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/shadows.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/popups/loaders.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../custom_shapes/containers/rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class MyProductCardVertical extends StatelessWidget {
  const MyProductCardVertical({
    super.key,
    required this.imageUrl,
    required this.productTitle,
    required this.price,
  });

  final String imageUrl;
  final String productTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final CartsController cartsController = Get.put(CartsController());

    return GestureDetector(
      onTap: () {
        cartsController.addToCart({
          'image_url': imageUrl,
          'name': productTitle,
          'price': price,
        });
        MyLoaders.successSnackBar(
          title: "Added to Cart",
          message: "$productTitle has been added to your cart.",
        );
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
              height: 180,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyProductTitleText(title: productTitle, smallSize: true),
                  const SizedBox(height: MySizes.spaceBtwItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,

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
          ],
        ),
      ),
    );
  }
}
