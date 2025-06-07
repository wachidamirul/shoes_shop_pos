import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/storage_utility.dart';
import '../../../widgets/navigation_menu/navigation_menu.dart';

class SplashController extends GetxController {
  final localStorage = MyLocalStorage();

  void authGate() async {
    bool? isLogin = localStorage.readData('isLogin') as bool?;
    await Future.delayed(Duration(seconds: 4)).then(
      (value) async => {
        isLogin != null
            ? Get.offAll(() => MyNavigationMenu())
            : Get.offAllNamed(Routes.LOGIN),
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    authGate();
  }
}
