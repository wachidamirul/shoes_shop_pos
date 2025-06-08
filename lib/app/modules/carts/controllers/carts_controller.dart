import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../utils/popups/loaders.dart';

class CartsController extends GetxController {
  final RxList cartItems = [].obs;
  final SupabaseClient supabase = Supabase.instance.client;

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
  }

  Future<void> checkout() async {
    try {
      for (final item in cartItems) {
        // 1. Insert order/transaction (optional, adjust table name/fields)
        await supabase.from('orders').insert({
          'product_id': item['id'],
          'quantity': 1,
          'price': item['price'],
          // Add more fields as needed
        });

        // 2. Decrease stock in first size
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
      MyLoaders.successSnackBar(
        title: 'Checkout Successful',
        message: 'Your order has been placed successfully.',
      );
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Checkout Error', message: e.toString());
    }
  }
}
