import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/cart_menu_icon.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Home",
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: MyColors.grey),
          ),
          Text(
            "Home",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: MyColors.white),
          ),
        ],
      ),
      actions: [
        MyCartCounterIcon(
          onPressed: () {
            // Handle cart icon press
          },
          iconColor: MyColors.white,
        ),
      ],
    );
  }
}
