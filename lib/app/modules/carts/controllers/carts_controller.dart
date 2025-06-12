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
      if (cartItems.isEmpty) {
        MyLoaders.errorSnackBar(
          title: 'Checkout Error',
          message: 'Cart is empty.',
        );
        return;
      }

      // Calculate total amount
      num totalAmount = 0;
      for (var item in cartItems) {
        final quantity = int.tryParse(item['quantity'].toString()) ?? 1;
        final price = num.tryParse(item['price'].toString()) ?? 0;
        totalAmount += quantity * price;
      }

      // Insert into transactions table
      final transactionRes =
          await supabase
              .from('transactions')
              .insert({'total_amount': totalAmount})
              .select()
              .single();

      final transactionId = transactionRes['transaction_id'];

      // Insert each cart item into transactions_details
      for (var item in cartItems) {
        final quantity = int.tryParse(item['quantity'].toString()) ?? 1;
        final price = num.tryParse(item['price'].toString()) ?? 0;
        await supabase.from('transactions_details').insert({
          'transaction_id': transactionId,
          'variant_id': item['variant_id'],
          'quantity': quantity,
          'total_price': quantity * price,
        });
        // update stock
        await supabase.rpc(
          'decrement_stock',
          params: {'variant_id': item['variant_id'], 'qty': quantity},
        );
      }

      // Clear cart
      cartItems.clear();
      localStorage.saveData('cartItems', cartItems.toList());

      MyLoaders.successSnackBar(
        title: 'Checkout Success',
        message: 'Transaction completed!',
      );
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Checkout Error', message: e.toString());
    }
  }
}
