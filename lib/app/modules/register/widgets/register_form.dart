import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../controllers/register_controller.dart';

class MyRegisterForm extends StatelessWidget {
  const MyRegisterForm({super.key, required this.controller});

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // Name
          Row(
            children: [
              // First Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: controller.firstNameController,
                  decoration: const InputDecoration(
                    labelText: MyTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: MySizes.spaceBtwInputFields),
              // Last Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: controller.lastNameController,
                  decoration: const InputDecoration(
                    labelText: MyTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: MySizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              labelText: MyTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email';
              } else if (!GetUtils.isEmail(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),

          const SizedBox(height: MySizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: controller.passwordController,
            obscureText: controller.isObscure,
            decoration: InputDecoration(
              labelText: MyTexts.password,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: IconButton(
                onPressed: controller.toggleObscure,
                icon: Icon(
                  controller.isObscure ? Iconsax.eye_slash : Iconsax.eye,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: MySizes.spaceBtwInputFields),

          // Confirm Password
          TextFormField(
            controller: controller.confirmPasswordController,
            obscureText: controller.isObscureConfirm,
            decoration: InputDecoration(
              labelText: MyTexts.confirmPassword,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: controller.toggleObscureConfirm,
                icon: Icon(
                  controller.isObscureConfirm ? Iconsax.eye_slash : Iconsax.eye,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm your password';
              } else if (value != controller.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),

          const SizedBox(height: MySizes.spaceBtwItems),

          // Terms and Conditions
          GestureDetector(
            onTap: () {
              controller.handleTermsAccepted(!controller.isTermsAccepted.value);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: controller.isTermsAccepted.value,
                    onChanged: (value) {
                      controller.handleTermsAccepted(value);
                    },
                  ),
                ),
                const SizedBox(width: MySizes.sm),
                Text(
                  MyTexts.termsAndConditions,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),

          const SizedBox(height: MySizes.spaceBtwSections),

          // Register Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.handleRegister,
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(MyTexts.register),
            ),
          ),
        ],
      ),
    );
  }
}
