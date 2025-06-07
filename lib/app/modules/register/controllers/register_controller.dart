import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';
import '../../../services/auth_service.dart';
import '../../../utils/validation.dart';
import '../../../widgets/navigation_menu/navigation_menu.dart';

class RegisterController extends GetxController {
  final authService = AuthService();

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
    final emailValidation = MyValidator.validateEmail(email);
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    final passwordValidation = MyValidator.validatePassword(password);
    final passwordMatchValidation = MyValidator.passwordMatch(
      password,
      confirmPassword,
    );

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MyLoaders.errorSnackBar(
        title: 'Error',
        message: "All fields are required",
      );
      return;
    }

    if (passwordMatchValidation != null) {
      MyLoaders.errorSnackBar(title: 'Error', message: passwordMatchValidation);
      return;
    }

    if (emailValidation != null) {
      MyLoaders.errorSnackBar(title: 'Error', message: emailValidation);
      return;
    }

    if (passwordValidation != null) {
      MyLoaders.errorSnackBar(title: 'Error', message: passwordValidation);
      return;
    }

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
      Get.snackbar(
        'Error',
        "Error: $error",
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
      );
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
