import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../controllers/login_controller.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: MyTexts.email,
            ),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Enter your email'
                        : !GetUtils.isEmail(value)
                        ? 'Enter a valid email'
                        : null,
          ),

          const SizedBox(height: MySizes.spaceBtwInputFields),

          // Password
          TextFormField(
            obscureText: controller.isObscure,
            controller: controller.passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: MyTexts.password,
              suffixIcon: IconButton(
                onPressed: controller.toggleObscure,
                icon: Icon(
                  controller.isObscure ? Iconsax.eye_slash : Iconsax.eye,
                ),
              ),
            ),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Enter your password'
                        : value.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
          ),

          const SizedBox(height: MySizes.spaceBtwInputFields / 2),

          // Forgot Password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                style: Theme.of(context).textButtonTheme.style,
                child: Text(
                  MyTexts.forgetPassword,
                  style: TextStyle(
                    color: dark ? MyColors.accent : MyColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: MySizes.spaceBtwSections),

          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.handleLogin,
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(MyTexts.login),
            ),
          ),

          const SizedBox(height: MySizes.spaceBtwItems),

          // Create Account
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: controller.goToRegister,
              style: Theme.of(context).outlinedButtonTheme.style,
              child: Text(MyTexts.register),
            ),
          ),
        ],
      ),
    );
  }
}
