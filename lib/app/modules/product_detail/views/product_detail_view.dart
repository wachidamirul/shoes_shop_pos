import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/popups/loaders.dart';
import '../../../widgets/appbar/app_bar.dart';
import '../../../widgets/custom_shapes/containers/rounded_container.dart';
import '../../../widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../widgets/navigation_menu/bottom_add_to_cart.dart';
import '../../../widgets/texts/product_price_text.dart';
import '../../../widgets/texts/section_heading.dart';
import '../../carts/controllers/carts_controller.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final CartsController cartsController = Get.put(CartsController());

    return Scaffold(
      appBar: MyAppBar(showbackArrow: true, leadingIcon: Iconsax.arrow_left),
      extendBodyBehindAppBar: true,
      backgroundColor: dark ? MyColors.black : MyColors.white,
      bottomNavigationBar: Obx(() {
        final product = controller.product.value;
        final productId = product?['product_id'];
        final name = product?['name'] ?? 'Product';
        final price = product?['price']?.toString() ?? '0.00';
        final imageUrl = product?['image_url'] ?? '';

        return MyBottomAddToCart(
          itemCount: controller.cartQuantity.value.toString(),
          addToCart: () {
            cartsController.addToCart({
              'product_id': productId,
              'image_url': imageUrl,
              'name': name,
              'price': price,
              'variant_id': controller.selectedVariantId.value,
              'quantity': controller.cartQuantity.value,
            });
          },
          increaseItemCount: controller.increaseCartQuantity,
          descreaseItemCount: controller.decreaseCartQuantity,
        );
      }),
      body: Obx(() {
        final product = controller.product.value;
        if (product == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              MyCurvedEdgeWidget(
                child: Container(
                  color: dark ? MyColors.darkerGrey : MyColors.light,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(
                            MySizes.productImageRadius * 2,
                          ),
                          child: Center(
                            child: Image.network(
                              product['image_url'] ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Product Details
              Padding(
                padding: EdgeInsets.only(
                  right: MySizes.defaultSpace,
                  left: MySizes.defaultSpace,
                  bottom: MySizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Title
                        Text(
                          product['name'] ?? 'Product Title',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: MySizes.spaceBtwItems / 2),

                        // Price
                        MyProductPriceText(
                          price: "\$${product['price']?.toString() ?? '0.00'}",
                          isLarge: true,
                        ),
                        const SizedBox(height: MySizes.spaceBtwItems),

                        // Stock Information
                        MyRoundedContainer(
                          padding: EdgeInsets.symmetric(
                            horizontal: MySizes.md,
                            vertical: MySizes.sm,
                          ),
                          backgroundColor:
                              dark ? MyColors.darkerGrey : MyColors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'In Stock',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  borderRadius: BorderRadius.circular(
                                    MySizes.cardRadiusMd,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(MySizes.sm),
                                  child: Text(
                                    '${controller.valueSelectedVariant.value} pcs',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(color: MyColors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: MySizes.spaceBtwItems),

                        // Variants Section
                        if (controller.variants.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Size',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: MySizes.spaceBtwItems / 2),
                              Wrap(
                                spacing: MySizes.sm,
                                runSpacing: MySizes.sm,
                                children:
                                    controller.variants.map((variant) {
                                      return Obx(() {
                                        final isSelected =
                                            controller
                                                .selectedVariantId
                                                .value ==
                                            variant['variant_id'];
                                        return GestureDetector(
                                          onTap: () {
                                            controller.fetchVariantStock(
                                              variant['variant_id'],
                                            );
                                          },
                                          child: MyRoundedContainer(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: MySizes.md,
                                              vertical: MySizes.sm,
                                            ),
                                            showBorder: true,
                                            borderColor:
                                                isSelected
                                                    ? MyColors.primary
                                                    : MyColors.darkGrey,
                                            backgroundColor:
                                                isSelected
                                                    ? MyColors.primary
                                                        .withValues(alpha: 0.2)
                                                    : (dark
                                                        ? MyColors.black
                                                        : MyColors.light),
                                            child: Text(
                                              variant['size'] ?? '0',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                color:
                                                    isSelected
                                                        ? MyColors.primary
                                                        : null,
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                    }).toList(),
                              ),
                            ],
                          ),
                        const SizedBox(height: MySizes.spaceBtwSections),

                        // Description
                        MySectionHeading(title: 'Description'),
                        const SizedBox(height: MySizes.spaceBtwItems / 2),
                        Text(
                          product['description'] ?? 'No description available.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: MySizes.spaceBtwSections),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
