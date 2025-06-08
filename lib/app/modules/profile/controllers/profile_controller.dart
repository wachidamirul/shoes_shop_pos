import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';
import '../../../utils/theme/theme_controller.dart';

class ProfileController extends GetxController {
  final authService = AuthService();

  final themeController = Get.find<ThemeController>();

  // Reactive variables for UI updates
  final RxnString firstName = RxnString();
  final RxnString lastName = RxnString();
  final RxnString fullName = RxnString();
  final RxnString email = RxnString();
  final RxnString avatar = RxnString();

  void logout() async {
    Get.offAllNamed(Routes.LOGIN);
    await authService.signOut();
  }

  void toggleTheme() {
    themeController.toggleTheme();
  }

  @override
  void onInit() {
    super.onInit();

    final currentUser = authService.currentUser;
    firstName.value = currentUser?.userMetadata?['first_name'];
    lastName.value = currentUser?.userMetadata?['last_name'];

    if (firstName.value == null || lastName.value == null) {
      fullName.value = currentUser?.userMetadata?['full_name'] ?? '';
    } else {
      fullName.value = '${firstName.value} ${lastName.value}';
    }

    email.value = currentUser?.email;
  }
}
