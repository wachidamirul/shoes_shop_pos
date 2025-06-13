import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/appbar/app_bar.dart';
import '../controllers/product_edit_controller.dart';

class ProductEditView extends GetView<ProductEditController> {
  const ProductEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Edit Product'),
        implyLeading: true,
        showbackArrow: true,
        leadingIcon: Iconsax.arrow_left,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.barcode),
            onPressed: () {
              Get.toNamed(
                Routes.BARCODE_GENERATOR,
                arguments: {'product_id': controller.productId.value},
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    prefixIcon: Icon(Iconsax.box),
                  ),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Enter product name'
                              : null,
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    prefixIcon: Icon(Iconsax.dollar_square),
                  ),
                  keyboardType: TextInputType.number,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Enter price'
                              : value.isCurrency
                              ? null
                              : 'Enter a valid price',
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value:
                        controller.selectedCategory.value.isEmpty
                            ? null
                            : controller.selectedCategory.value,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      prefixIcon: Icon(Iconsax.category),
                    ),
                    items:
                        controller.categories
                            .map(
                              (cat) => DropdownMenuItem<String>(
                                value: cat,
                                child: Text(cat),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      controller.selectedCategory.value = value!;
                    },
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Select category'
                                : null,
                  ),
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(Iconsax.note),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields),
                Text('Sizes', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: MySizes.spaceBtwInputFields / 2),
                Obx(
                  () => Column(
                    children: List.generate(
                      controller.sizeFields.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: MySizes.spaceBtwInputFields / 2,
                        ),
                        child: Row(
                          children: [
                            // Size input
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.sizeFields[index].sizeController,
                                decoration: const InputDecoration(
                                  labelText: 'Size',
                                  prefixIcon: Icon(Iconsax.size),
                                ),
                                keyboardType: TextInputType.number,
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? 'Enter size'
                                            : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Quantity input
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.sizeFields[index].qtyController,
                                decoration: const InputDecoration(
                                  labelText: 'Qty',
                                  prefixIcon: Icon(Iconsax.box),
                                ),
                                keyboardType: TextInputType.number,
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? 'Enter qty'
                                            : null,
                              ),
                            ),
                            // Only show remove button if not the first field
                            if (index != 0)
                              IconButton(
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                                onPressed:
                                    () => controller.removeSizeField(index),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Size'),
                    onPressed: controller.addSizeField,
                  ),
                ),

                const SizedBox(height: MySizes.spaceBtwInputFields),

                TextFormField(
                  controller: controller.imageUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    prefixIcon: Icon(Iconsax.image),
                  ),
                  keyboardType: TextInputType.url,
                  onChanged: (value) => controller.imageUrl.value = value,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Enter image URL'
                              : null,
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields / 2),
                Obx(() {
                  final url = controller.imageUrl.value;
                  if (url.isEmpty) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: MySizes.spaceBtwInputFields,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        url,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                              height: 150,
                              child: const Center(
                                child: Text('Invalid image URL'),
                              ),
                            ),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: MySizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.updateProduct,
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text('Update Product'),
                  ),
                ),
                const SizedBox(height: MySizes.xxl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
