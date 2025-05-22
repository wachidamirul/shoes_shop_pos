import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_pos/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  final _box = GetStorage();
  final _key = 'is_login';

  redirectPage() async {
    String? isLogin = _box.read(_key);

    if (isLogin == null) {
      await Future.delayed(
        Duration(seconds: 4),
      ).then((value) => Get.offAllNamed(Routes.LOGIN));
    } else {
      await Future.delayed(
        Duration(seconds: 4),
      ).then((value) => Get.offAllNamed(Routes.HOME));
    }
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
