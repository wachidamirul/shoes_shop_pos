import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_pos/app/widgets/navigation_menu.dart';

import '../../../../app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  final _box = GetStorage();
  final _key = 'is_login';

  redirectPage() async {
    // bool isLogin = _box.read(_key);
    bool isLogin = false;

    await Future.delayed(Duration(seconds: 4)).then(
      (value) => {
        // isLogin ? Get.offAllNamed(Routes.HOME) : Get.offAllNamed(Routes.LOGIN),
        Get.to(() => MyNavigationMenu()),
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
