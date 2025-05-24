import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../widgets/login_register/login_register_header.dart';
import '../controllers/register_controller.dart';
import '../widgets/register_form.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GetBuilder<RegisterController>(
        builder:
            (c) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(MySizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    MyLoginRegisterHeader(title: MyTexts.registerTitle),
                    const SizedBox(height: MySizes.xxl),

                    // Register Form
                    MyRegisterForm(controller: c),
                    const SizedBox(height: MySizes.spaceBtwSections),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
