import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../utils/popups/loaders.dart';
import '../../../utils/storage_utility.dart';

class CartsController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  final localStorage = MyLocalStorage();

  final RxList cartItems = [].obs;
  final RxString selectedVariant = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCartFromLocalStorage();
  }

  void loadCartFromLocalStorage() async {
    final savedCart = await localStorage.readData('cartItems');
    if (savedCart != null && savedCart is List) {
      cartItems.assignAll(List<Map<String, dynamic>>.from(savedCart));
    }
  }

  void addToCart(Map<String, dynamic> product) async {
    await fetchVariantName(product['variant_id'] ?? 0);
    final productWithVariant = Map<String, dynamic>.from(product)
      ..['variant_name'] = selectedVariant.value;
    cartItems.add(productWithVariant);
    MyLoaders.successSnackBar(
      title: 'Added to Cart',
      message:
          '${product['name']} (${selectedVariant.value}) has been added to your cart.',
    );
    localStorage.saveData('cartItems', cartItems.toList());
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    localStorage.saveData('cartItems', cartItems.toList());
  }

  Future<void> fetchVariantName(int variantId) async {
    final response =
        await supabase
            .from('product_variants')
            .select("size")
            .eq('variant_id', variantId)
            .single();
    selectedVariant.value = response['size'] ?? '';
  }

  Future<void> checkout() async {
    try {
      for (final item in cartItems) {
        await supabase.from('orders').insert({
          'product_id': item['id'],
          'quantity': 1,
          'price': item['price'],
        });

        final sizes = item['sizes'] as List<dynamic>? ?? [];
        if (sizes.isNotEmpty) {
          final firstSize = sizes[0];
          final sizeId = firstSize['id'];
          final currentStock = firstSize['stock'] ?? 0;
          if (currentStock > 0) {
            await supabase
                .from('product_sizes')
                .update({'stock': currentStock - 1})
                .eq('id', sizeId);
          }
        }
      }
      cartItems.clear();
      localStorage.saveData('cartItems', cartItems.toList());
      MyLoaders.successSnackBar(
        title: 'Checkout Successful',
        message: 'Your order has been placed successfully.',
      );
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Checkout Error', message: e.toString());
    }
  }
}
