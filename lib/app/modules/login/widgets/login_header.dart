import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class MyLoginHeader extends StatelessWidget {
  const MyLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MyTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: MySizes.md),
        SvgPicture.asset(MyImages.authLine, width: 100, height: 4),
      ],
    );
  }
}
