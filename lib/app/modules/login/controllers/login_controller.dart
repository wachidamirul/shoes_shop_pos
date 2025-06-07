import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../app/routes/app_pages.dart';
import '../../../utils/popups/loaders.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/navigation_menu/navigation_menu.dart';

class LoginController extends GetxController {
  final authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void goToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void handleLogin() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      MyLoaders.errorSnackBar(title: 'Error', message: "Input is required");
      return;
    }

    try {
      final response = await authService.signInWithPassword(email, password);
      if (response.user != null) {
        Get.offAll(() => MyNavigationMenu());
      }
    } on AuthException catch (e) {
      MyLoaders.errorSnackBar(title: 'Error', message: e.message);
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Error', message: e);
    }
  }

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
