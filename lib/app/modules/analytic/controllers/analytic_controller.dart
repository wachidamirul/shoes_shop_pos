import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnalyticController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final SupabaseClient supabase = Supabase.instance.client;

  final timeFrameItem = ["Today", "This Week", "This Month", "This Year"];
  final RxString valTimeFrame = "Today".obs;
  final RxInt tabBarPosition = 0.obs;
  final RxDouble totalSales = 0.0.obs;
  late TabController tabController;
  final RxList<Map<String, dynamic>> productsSold =
      <Map<String, dynamic>>[].obs;

  // Fetch products sold for the selected timeframe
  Future<void> fetchProductsSold() async {
    final start = _getStartDate(valTimeFrame.value);

    // 1. Get transaction_ids in the selected timeframe
    final transactionRes = await supabase
        .from('transactions')
        .select('transaction_id')
        .gte('transaction_date', start.toIso8601String())
        .eq('is_deleted', false);

    final transactionData = transactionRes as List<dynamic>? ?? [];
    final transactionIds =
        transactionData.map((e) => e['transaction_id']).toList();

    if (transactionIds.isEmpty) {
      productsSold.value = [];
      return;
    }

    // 2. Get products sold in those transactions, including image and price
    final response = await supabase
        .from('transactions_details')
        .select(
          'quantity, total_price, variant_id, product_variants(product_id, products(name, image_url, price))',
        )
        .inFilter('transaction_id', transactionIds);

    final data = response as List<dynamic>? ?? [];

    // Aggregate quantities and total price per product
    final Map<String, Map<String, dynamic>> productMap = {};
    for (final item in data) {
      final product = item['product_variants']['products'];
      final productName = product['name'] ?? 'Unknown';
      final imageUrl = product['image_url'] ?? '';
      final price = product['price'] ?? 0.0;
      final qty = item['quantity'] ?? 0;
      final totalPrice = double.tryParse(item['total_price'].toString()) ?? 0.0;

      if (!productMap.containsKey(productName)) {
        productMap[productName] = {
          'product_name': productName,
          'image_url': imageUrl,
          'quantity': 0,
          'total_price': 0.0,
          'price': price,
        };
      }
      productMap[productName]!['quantity'] += qty;
      productMap[productName]!['total_price'] += totalPrice;
    }

    productsSold.value = productMap.values.toList();
  }

  // Set selected time frame and fetch sales
  void setTimeFrame(String? newValue) {
    if (newValue == null || !timeFrameItem.contains(newValue)) return;
    valTimeFrame.value = newValue;
    final idx = timeFrameItem.indexOf(newValue);
    tabBarPosition.value = idx;
    tabController.animateTo(idx);
    fetchTotalSales();
    fetchProductsSold();
  }

  // Calculate start date based on selected time frame
  DateTime _getStartDate(String timeFrame) {
    final now = DateTime.now();
    switch (timeFrame) {
      case "Today":
        return DateTime(now.year, now.month, now.day);
      case "This Week":
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
      case "This Month":
        return DateTime(now.year, now.month, 1);
      case "This Year":
        return DateTime(now.year, 1, 1);
      default:
        return DateTime(now.year, now.month, now.day);
    }
  }

  // Fetch total sales from Supabase
  Future<void> fetchTotalSales() async {
    final start = _getStartDate(valTimeFrame.value);
    final response = await supabase
        .from('transactions')
        .select('total_amount')
        .gte('transaction_date', start.toIso8601String())
        .eq('is_deleted', false);

    final data = response as List<dynamic>? ?? [];
    final sum = data.fold<double>(
      0.0,
      (prev, item) =>
          prev + (double.tryParse(item['total_amount'].toString()) ?? 0.0),
    );
    totalSales.value = sum;
  }

  @override
  void onInit() {
    tabController = TabController(length: timeFrameItem.length, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        setTimeFrame(timeFrameItem[tabController.index]);
      }
    });
    fetchTotalSales();
    fetchProductsSold();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
