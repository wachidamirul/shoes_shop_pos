import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final _box = GetStorage();
  final _key = 'is_login';

  redirectPage() async {
    // bool isLogin = _box.read(_key);
    bool isLogin = false;

    await Future.delayed(Duration(seconds: 4)).then(
      (value) => {
        // isLogin ? Get.offAllNamed(Routes.HOME) : Get.offAllNamed(Routes.LOGIN),
        Get.offAllNamed(Routes.LOGIN),
      },
    );
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
