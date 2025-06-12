import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/size_quantity_field.dart';
import '../../../utils/popups/loaders.dart';

class ProductEditController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final imageUrlController = TextEditingController();

  final categories = <String>[].obs;
  final selectedCategoryId = ''.obs;
  final selectedCategory = ''.obs;
  final sizeFields = <SizeQuantityField>[].obs;
  final imageUrl = ''.obs;
  final productId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initCategories();
    _initSizeFields();
    _listenImageUrl();
    _loadProductIfNeeded();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    descController.dispose();
    imageUrlController.dispose();
    for (var field in sizeFields) {
      field.dispose();
    }
    super.onClose();
  }

  // --- Initialization Helpers ---

  void _initCategories() => fetchCategories();

  void _initSizeFields() {
    if (sizeFields.isEmpty) addSizeField();
  }

  void _listenImageUrl() {
    imageUrlController.addListener(() {
      imageUrl.value = imageUrlController.text;
    });
  }

  void _loadProductIfNeeded() {
    final id = Get.arguments;
    if (id != null) loadProductById(id.toString());
  }

  // --- Category ---

  Future<void> fetchCategories() async {
    try {
      final response = await supabase.from('categories').select();
      categories.value = List<String>.from(response.map((c) => c['name']));
    } catch (e) {
      MyLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to load categories: ${e.toString()}",
      );
    }
  }

  Future<void> _setSelectedCategory(dynamic categoryId) async {
    if (categoryId == null) return;
    final category =
        await supabase
            .from('categories')
            .select('name')
            .eq('category_id', categoryId)
            .single();

    selectedCategoryId.value = categoryId.toString();
    selectedCategory.value = category['name'] ?? '';
  }

  // --- Product ---

  Future<void> loadProductById(String id) async {
    try {
      final product = await _fetchProduct(id);
      _populateProductFields(product);
      await _setSelectedCategory(product['category_id']);
      final variants = await _fetchProductVariants(id);
      _populateSizeFields(variants);
    } catch (e) {
      MyLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to load product: ${e.toString()}",
      );
    }
  }

  Future<Map<String, dynamic>> _fetchProduct(String id) async {
    return await supabase
        .from('products')
        .select()
        .eq('product_id', id)
        .single();
  }

  void _populateProductFields(Map<String, dynamic> product) {
    nameController.text = product['name'] ?? '';
    priceController.text = product['price']?.toString() ?? '';
    descController.text = product['description'] ?? '';
    imageUrlController.text = product['image_url'] ?? '';
    imageUrl.value = product['image_url'] ?? '';
    productId.value = product['product_id']?.toString() ?? '';
  }

  // --- Size Fields ---

  void addSizeField() => sizeFields.add(SizeQuantityField());

  void removeSizeField(int index) {
    if (sizeFields.length > 1) {
      sizeFields[index].dispose();
      sizeFields.removeAt(index);
    }
  }

  Future<List<dynamic>> _fetchProductVariants(String id) async {
    return await supabase
        .from('product_variants')
        .select('variant_id, size, stocks(quantity)')
        .eq('product_id', id)
        .eq('is_deleted', false);
  }

  void _populateSizeFields(List<dynamic> variants) {
    sizeFields.clear();
    if (variants.isEmpty) {
      addSizeField();
      return;
    }
    for (var variant in variants) {
      final field = SizeQuantityField();
      field.sizeController.text = variant['size']?.toString() ?? '';
      final stocks = variant['stocks'] as List<dynamic>? ?? [];
      field.qtyController.text =
          stocks.isNotEmpty
              ? (stocks.first['quantity']?.toString() ?? '0')
              : '0';
      sizeFields.add(field);
    }
  }

  // --- Update ---

  Future<void> updateProduct() async {
    if (!formKey.currentState!.validate()) return;
    await supabase
        .from('products')
        .update({
          'category_id': selectedCategoryId.value,
          'name': nameController.text,
          'price': double.tryParse(priceController.text) ?? 0,
          'description': descController.text,
          'image_url': imageUrlController.text,
        })
        .eq('product_id', productId.value);

    // Update variants and stocks
    for (var field in sizeFields) {
      final size = field.sizeController.text.trim();
      final qty = int.tryParse(field.qtyController.text) ?? 0;

      // Find existing variant
      try {
        final variant =
            await supabase
                .from('product_variants')
                .select('variant_id')
                .eq('product_id', productId.value)
                .eq('size', size)
                .single();

        // Update existing variant
        await supabase
            .from('product_variants')
            .update({'size': size})
            .eq('variant_id', variant['variant_id']);

        // Update stock
        await supabase
            .from('stocks')
            .update({'quantity': qty})
            .eq('variant_id', variant['variant_id']);
      } catch (e) {
        // Insert new variant
        final newVariant =
            await supabase
                .from('product_variants')
                .insert({'product_id': productId.value, 'size': size})
                .select()
                .single();

        // Insert stock for new variant
        await supabase.from('stocks').insert({
          'variant_id': newVariant['variant_id'],
          'quantity': qty,
        });
      }
    }

    // back to previous screen and refresh product list
    Get.back(result: true);
  }
}
