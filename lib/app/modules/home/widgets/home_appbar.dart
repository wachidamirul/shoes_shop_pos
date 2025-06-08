import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../widgets/appbar/app_bar.dart';
import '../../../widgets/products/cart/cart_menu_icon.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      lightSystemOverlayStyle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyTexts.homeSubTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: MyColors.grey),
          ),
          Text(
            MyTexts.homeTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: MyColors.white),
          ),
        ],
      ),
      actions: [
        MyCartCounterIcon(
          onPressed: () {
            Get.toNamed(Routes.CARTS);
          },
          isIconLight: true,
        ),
      ],
    );
  }
}
