import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class MyLoginRegisterHeader extends StatelessWidget {
  const MyLoginRegisterHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: MySizes.md),
        SvgPicture.asset(MyImages.authLine, width: 100, height: 4),
      ],
    );
  }
}
