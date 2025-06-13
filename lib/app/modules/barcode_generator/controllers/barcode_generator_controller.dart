import 'package:get/get.dart';

class BarcodeGeneratorController extends GetxController {
  final String barcodeData =
      Get.arguments?['product_id']?.toString() ?? 'No Data';

  @override
  void onInit() {
    super.onInit();
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
