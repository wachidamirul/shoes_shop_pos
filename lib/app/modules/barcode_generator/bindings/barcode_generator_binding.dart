import 'package:get/get.dart';

import '../controllers/barcode_generator_controller.dart';

class BarcodeGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarcodeGeneratorController>(
      () => BarcodeGeneratorController(),
    );
  }
}
