import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/styles/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/login_register/form_divider.dart';
import '../../../widgets/login_register/social_buttons.dart';
import '../controllers/login_controller.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GetBuilder<LoginController>(
        builder:
            (c) => Padding(
              padding: MySpacingStyle.paddingWithAppBarHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  MyLoginHeader(),
                  const SizedBox(height: MySizes.xxl),
                  // Login Form
                  MyLoginForm(),
                  const SizedBox(height: MySizes.spaceBtwSections),

                  // Divider
                  MyFormDivider(dividerText: MyTexts.orSignInWith),
                  const SizedBox(height: MySizes.spaceBtwSections),

                  // Social Login
                  MySocialButtons(),
                ],
              ),
            ),
      ),
    );
  }
}
