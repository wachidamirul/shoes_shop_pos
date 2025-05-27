import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class MyVerticalImageText extends StatelessWidget {
  const MyVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.imageColorBW = false,
    this.textColor = MyColors.white,
    this.backgroundColor,
  });

  final String title, image;
  final bool imageColorBW;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MySizes.spaceBtwItems),
        child: Column(
          // -- Category Item
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(MySizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? MyColors.dark : MyColors.light),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color:
                      imageColorBW
                          ? (dark ? MyColors.light : MyColors.dark)
                          : null,
                ),
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwItems / 2),
            SizedBox(
              width: 56,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
