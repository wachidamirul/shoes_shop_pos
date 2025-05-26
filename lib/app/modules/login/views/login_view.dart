import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/styles/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../widgets/login_register/login_register_header.dart';
import '../widgets/form_divider.dart';
import '../widgets/social_buttons.dart';
import '../controllers/login_controller.dart';
import '../widgets/login_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder:
            (c) => SingleChildScrollView(
              child: Padding(
                padding: MySpacingStyle.paddingWithAppBarHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    MyLoginRegisterHeader(title: MyTexts.loginTitle),
                    const SizedBox(height: MySizes.xxl),

                    // Login Form
                    MyLoginForm(controller: c),
                    const SizedBox(height: MySizes.spaceBtwSections),

                    // Divider
                    MyFormDivider(dividerText: MyTexts.orLoginWith),
                    const SizedBox(height: MySizes.spaceBtwSections),

                    // Social Login
                    MySocialButtons(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
