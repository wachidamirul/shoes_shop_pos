import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../modules/carts/controllers/carts_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class MyCartCounterIcon extends StatelessWidget {
  const MyCartCounterIcon({
    super.key,
    required this.onPressed,
    this.isIconLight = false,
  });

  final bool isIconLight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final CartsController cartsController = Get.put(CartsController());

    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color:
                isIconLight
                    ? MyColors.white
                    : dark
                    ? MyColors.white
                    : MyColors.black,
          ),
        ),
        Positioned(
          right: 0.0,
          child: Container(
            width: 18.0,
            height: 18.0,
            decoration: BoxDecoration(
              color:
                  isIconLight
                      ? MyColors.black
                      : dark
                      ? MyColors.white
                      : MyColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  cartsController.cartItems.length.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                    color:
                        isIconLight
                            ? MyColors.white
                            : dark
                            ? MyColors.black
                            : MyColors.white,
                    fontSizeFactor: 0.8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
