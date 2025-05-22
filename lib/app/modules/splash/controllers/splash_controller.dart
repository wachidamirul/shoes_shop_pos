import 'package:get/get.dart';
import 'package:shoes_shop_pos/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  redirectPage() async {
    await Future.delayed(
      Duration(seconds: 4),
    ).then((value) => Get.offAllNamed(Routes.HOME));
  }

  @override
  void onInit() {
    super.onInit();
    redirectPage();
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
