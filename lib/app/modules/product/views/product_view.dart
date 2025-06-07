import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/appbar/app_bar_blank.dart';
import '../../../widgets/custom_shapes/containers/rounded_container.dart';
import '../../../widgets/custom_shapes/containers/rounded_image.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBarBlank(lightSystemOverlayStyle: false),
      floatingActionButton: FloatingActionButton(
        heroTag: 'product_fab',
        onPressed: () {
          // Action for the floating action button
        },
        backgroundColor: MyColors.primary,
        child: const Icon(Icons.add, color: MyColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(MySizes.md),
        itemBuilder:
            (_, index) => Container(
              decoration: BoxDecoration(
                color: dark ? MyColors.black : MyColors.white,
                borderRadius: BorderRadius.circular(MySizes.cardRadiusMd),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.dark.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListTile(
                leading: MyRoundedImage(
                  width: 64,
                  height: 64,
                  isNetworkImage: true,
                  imageUrl:
                      "https://www.converse.id/media/catalog/product/0/1/01-CONVERSE-FFSSBCONA-CONA04144C-Black.jpg",
                  applyImageRadius: true,
                  borderRadius: MySizes.cardRadiusMd,
                ),
                title: Text(
                  'Converse Chuck Taylor All Star',
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: MySizes.spaceBtwItems / 2),
                    Text(
                      'Size:',
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Wrap(
                      spacing: MySizes.xs,
                      runSpacing: MySizes.xs,
                      children: [
                        MyRoundedContainer(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MySizes.sm,
                            vertical: MySizes.xs,
                          ),
                          backgroundColor: MyColors.success,
                          child: Text(
                            '39: 10 pcs',
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        MyRoundedContainer(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MySizes.sm,
                            vertical: MySizes.xs,
                          ),
                          backgroundColor: MyColors.warning,
                          child: Text(
                            '40: 5 pcs',
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        MyRoundedContainer(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MySizes.sm,
                            vertical: MySizes.xs,
                          ),
                          backgroundColor: MyColors.error,
                          child: Text(
                            '41: 2 pcs',
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.edit, color: MyColors.primary),
                ),
              ),
            ),
        separatorBuilder: (_, __) => const SizedBox(height: MySizes.sm),
      ),
    );
  }
}
