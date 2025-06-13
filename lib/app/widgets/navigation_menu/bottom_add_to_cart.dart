import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_icon.dart';

class MyBottomAddToCart extends StatelessWidget {
  const MyBottomAddToCart({
    super.key,
    this.itemCount = '0',
    required this.addToCart,
    required this.increaseItemCount,
    required this.descreaseItemCount,
  });

  final String itemCount;
  final VoidCallback addToCart, increaseItemCount, descreaseItemCount;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MySizes.defaultSpace,
        vertical: MySizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MySizes.cardRadiusLg),
          topRight: Radius.circular(MySizes.cardRadiusLg),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: MySizes.xl),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: descreaseItemCount,
                  child: MyCircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: MyColors.darkGrey,
                    width: 40,
                    height: 40,
                    iconColor: MyColors.white,
                  ),
                ),
                const SizedBox(width: MySizes.spaceBtwItems),
                Text(itemCount, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: MySizes.spaceBtwItems),
                GestureDetector(
                  onTap: increaseItemCount,
                  child: MyCircularIcon(
                    icon: Iconsax.add,
                    backgroundColor: MyColors.black,
                    width: 40,
                    height: 40,
                    iconColor: MyColors.white,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: addToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: MySizes.defaultSpace * 2,
                  vertical: MySizes.defaultSpace / 2,
                ),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
