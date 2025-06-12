import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDetailController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;

  var product = Rxn<Map<String, dynamic>>();
  var variants = <Map<String, dynamic>>[].obs;
  final Rx<int> valueSelectedVariant = 0.obs;
  final Rx<int?> selectedVariantId = Rx<int?>(null);
  final Rx<int> cartQuantity = 1.obs;

  // Product ID passed from the previous screen
  int? productId;

  @override
  void onInit() {
    super.onInit();
    productId = Get.arguments?['productId'];
    if (productId != null) {
      fetchProductDetail(productId!);
      fetchProductVariants(productId!);
    }
  }

  Future<void> fetchProductDetail(int id) async {
    final response =
        await supabase.from('products').select().eq('product_id', id).single();

    product.value = response;
  }

  Future<void> fetchProductVariants(int id) async {
    final response = await supabase
        .from('product_variants')
        .select()
        .eq('product_id', id);
    variants.value = List<Map<String, dynamic>>.from(response);

    // Auto-select the first variant if available
    if (variants.isNotEmpty) {
      final firstVariantId = variants.first['variant_id'];
      selectedVariantId.value = firstVariantId;
      fetchVariantStock(firstVariantId);
    }
  }

  Future<void> fetchVariantStock(int variantId) async {
    final response =
        await supabase
            .from('stocks')
            .select()
            .eq('variant_id', variantId)
            .single();

    valueSelectedVariant.value = response['quantity'] ?? 0;
    selectedVariantId.value = variantId;
    cartQuantity.value = 1;
  }

  void increaseCartQuantity() {
    if (cartQuantity.value < valueSelectedVariant.value) {
      cartQuantity.value++;
    }
  }

  void decreaseCartQuantity() {
    if (cartQuantity.value > 1) {
      cartQuantity.value--;
    }
  }
}
