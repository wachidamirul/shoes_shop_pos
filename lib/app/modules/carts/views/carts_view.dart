import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';
import '../controllers/carts_controller.dart';

class CartsView extends GetView<CartsController> {
  const CartsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return ListTile(
                    leading: Image.network(
                      item['image_url'] ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item['name'] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Size: '),
                            Text(item['variant_name'] ?? ''),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('x'),
                            Text('${item['quantity'] ?? 1}'),
                          ],
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "\$${((int.tryParse(item['quantity'].toString()) ?? 1) * (num.tryParse(item['price'].toString()) ?? 0))}",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => controller.removeFromCart(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MySizes.defaultSpace,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.checkout,
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text('Checkout'),
                ),
              ),
            ),
            const SizedBox(height: MySizes.xxl),
          ],
        );
      }),
    );
  }
}
