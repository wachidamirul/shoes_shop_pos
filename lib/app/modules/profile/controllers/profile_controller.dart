import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class ProfileController extends GetxController {
  final authService = AuthService();

  // Reactive variables for UI updates
  final Rxn<User> user = Rxn<User>();
  final RxnString firstName = RxnString();
  final RxnString lastName = RxnString();
  final RxnString email = RxnString();

  void logout() async {
    await authService.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
    final currentUser = authService.currentUser;
    user.value = currentUser;
    firstName.value = currentUser?.userMetadata?['first_name'];
    lastName.value = currentUser?.userMetadata?['last_name'];
    email.value = currentUser?.email;
  }
}
