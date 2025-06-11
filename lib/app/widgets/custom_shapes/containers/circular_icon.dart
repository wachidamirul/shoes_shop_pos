import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class MyCircularIcon extends StatelessWidget {
  const MyCircularIcon({
    super.key,
    this.onPressed,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.width,
    this.height,
    this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize, width, height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color:
            backgroundColor != null
                ? backgroundColor!
                : dark
                ? MyColors.black.withValues(alpha: 0.9)
                : MyColors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
