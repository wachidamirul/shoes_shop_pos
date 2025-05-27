import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../widgets/texts/image_text.dart';

class MyHomeCategories extends StatelessWidget {
  const MyHomeCategories({super.key});

  final List<String> categories = const [
    'Men',
    'Women',
    'Casual',
    'Sport',
    'Boots',
  ];

  // List of images corresponding to the categories
  final List<String> images = const [
    MyImages.men,
    MyImages.women,
    MyImages.casual,
    MyImages.sport,
    MyImages.boots,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return MyVerticalImageText(
            onTap: () {
              // Handle category tap
              print('Category $index tapped');
            },
            title: categories[index],
            textColor: MyColors.white,
            image: images[index],
            imageColorBW: true,
          );
        },
      ),
    );
  }
}
