import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/navigation_menu/navigation_menu.dart';

class RegisterController extends GetxController {
  final authService = AuthService();

  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RxBool isTermsAccepted = false.obs;

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

  void handleTermsAccepted(bool? value) {
    if (value != null) {
      isTermsAccepted.value = value;
    }
    update();
  }

  void handleRegister() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final confirmPassword = confirmPasswordController.text;

    if (formKey.currentState!.validate()) {
      if (!isTermsAccepted.value) {
        MyLoaders.errorSnackBar(
          title: 'Error',
          message: "You must accept the terms and conditions",
        );
        return;
      }

      try {
        await authService.signUpWithPassword(email, confirmPassword, {
          'first_name': firstName,
          'last_name': lastName,
        });

        Get.offAll(() => MyNavigationMenu());
      } catch (error) {
        MyLoaders.errorSnackBar(
          title: 'Registration Failed',
          message: error.toString(),
        );
      }
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
