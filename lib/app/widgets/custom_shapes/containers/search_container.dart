import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class MySearchContainer extends StatelessWidget {
  const MySearchContainer({
    super.key,
    required this.textHint,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String textHint;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MySizes.defaultSpace),
      child: Container(
        width: MyDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(MySizes.md),
        decoration: BoxDecoration(
          color:
              showBackground
                  ? dark
                      ? MyColors.dark
                      : MyColors.light
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(MySizes.cardRadiusLg),
          border:
              showBorder
                  ? Border.all(color: dark ? MyColors.dark : MyColors.light)
                  : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: dark ? MyColors.grey : MyColors.dark),
            const SizedBox(width: MySizes.spaceBtwItems),
            Text(
              textHint,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: dark ? MyColors.grey : MyColors.dark,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
