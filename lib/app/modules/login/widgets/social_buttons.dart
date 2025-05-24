import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class MySocialButtons extends StatelessWidget {
  const MySocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.borderPrimary),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(MyImages.google, width: 16, height: 16),
          ),
        ),

        const SizedBox(width: MySizes.spaceBtwItems),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.borderPrimary),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(MyImages.facebook, width: 16, height: 16),
          ),
        ),
      ],
    );
  }
}
