import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  final RxList products = [].obs;

  Future<void> fetchProducts() async {
    final response = await supabase.from('products').select();
    products.assignAll(response);
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
