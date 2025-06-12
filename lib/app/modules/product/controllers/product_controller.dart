import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';

class ProductController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  final RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;

  Future<void> fetchProducts() async {
    try {
      final response = await supabase.from('products').select();
      products.value = List<Map<String, dynamic>>.from(response);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    }
  }

  void goToAddProduct() async {
    final result = await Get.toNamed(Routes.PRODUCT_ADD);
    if (result == true) {
      fetchProducts();
    }
  }

  void goToEditProduct(int productId) async {
    final result = await Get.toNamed(Routes.PRODUCT_EDIT, arguments: productId);
    if (result == true) {
      fetchProducts();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
