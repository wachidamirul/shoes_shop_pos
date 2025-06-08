import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/size_quantity_field.dart';
import '../../../utils/constants/list_data.dart';
import '../../../utils/popups/loaders.dart';

class ProductAddController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final imageUrlController = TextEditingController();

  RxList<String> categories = <String>[].obs;
  RxString selectedCategory = ''.obs;
  RxList<SizeQuantityField> sizeFields = <SizeQuantityField>[].obs;
  RxString imageUrl = ''.obs;

  void addSizeField() {
    sizeFields.add(SizeQuantityField());
  }

  void removeSizeField(int index) {
    if (sizeFields.length > 1) {
      sizeFields[index].dispose();
      sizeFields.removeAt(index);
    }
  }

  Future<void> submitProduct() async {
    if (formKey.currentState!.validate()) {
      try {
        // 1. Get category_id
        final categoryRes =
            await supabase
                .from('categories')
                .select('category_id')
                .ilike('name', selectedCategory.value.trim())
                .maybeSingle();

        if (categoryRes == null) {
          MyLoaders.errorSnackBar(
            title: "Error",
            message: "Category not found",
          );
          return;
        }
        final categoryId = categoryRes['category_id'];

        // 2. Insert product
        final productRes =
            await supabase
                .from('products')
                .insert({
                  'category_id': categoryId,
                  'name': nameController.text,
                  'description': descController.text,
                  'image_url': imageUrlController.text,
                  'price': double.tryParse(priceController.text) ?? 0.0,
                })
                .select('product_id')
                .single();

        final productId = productRes['product_id'];

        // 3. Insert variants and stocks
        for (final field in sizeFields) {
          // Insert variant
          final variantRes =
              await supabase
                  .from('product_variants')
                  .insert({
                    'product_id': productId,
                    'size': field.sizeController.text,
                  })
                  .select('variant_id')
                  .single();

          final variantId = variantRes['variant_id'];

          // Insert stock
          await supabase.from('stocks').insert({
            'variant_id': variantId,
            'quantity': int.tryParse(field.qtyController.text) ?? 0,
          });
        }

        Get.snackbar('Success', 'Product added successfully');
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    categories.value = MyListData.categories;
    if (categories.isNotEmpty) {
      selectedCategory.value = categories.first;
    }
    sizeFields.add(SizeQuantityField());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    imageUrlController.dispose();
    for (var field in sizeFields) {
      field.dispose();
    }
    super.onClose();
  }
}
