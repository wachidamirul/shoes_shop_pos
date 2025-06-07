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
  final RxnString fullName = RxnString();
  final RxnString email = RxnString();
  final RxnString avatar = RxnString();

  void logout() async {
    Get.offAllNamed(Routes.LOGIN);
    await authService.signOut();
  }

  @override
  void onInit() {
    super.onInit();
    final currentUser = authService.currentUser;
    user.value = currentUser;
    firstName.value = currentUser?.userMetadata?['first_name'];
    lastName.value = currentUser?.userMetadata?['last_name'];

    if (firstName.value == null || lastName.value == null) {
      // If first or last name is not set, use email as full name
      fullName.value = currentUser?.userMetadata?['full_name'] ?? '';
    } else {
      // Combine first and last name for full name
      fullName.value = '${firstName.value} ${lastName.value}';
    }

    email.value = currentUser?.email;
    print(currentUser?.userMetadata);
  }
}
