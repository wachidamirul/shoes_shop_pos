import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
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

  void handleLogin() {
    Get.offAllNamed(Routes.HOME);
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
