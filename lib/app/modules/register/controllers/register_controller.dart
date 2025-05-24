import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscure = true;
  bool isObscureConfirm = true;

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void toggleObscureConfirm() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }

  void handleRegister() {
    print('First Name: ${firstNameController.text}');
    print('Last Name: ${lastNameController.text}');
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
    print('Confirm Password: ${confirmPasswordController.text}');

    Get.offAllNamed(Routes.LOGIN);
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
