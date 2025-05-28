import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/list_data.dart';
import '../../../widgets/texts/image_text.dart';

class MyHomeCategories extends StatelessWidget {
  const MyHomeCategories({super.key});

  final List<String> categories = MyListData.categories;
  final List<String> images = MyListData.imageCategories;

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
