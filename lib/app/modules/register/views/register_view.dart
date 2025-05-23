import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shoes_shop_pos/app/theme/color_theme.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';
import 'package:shoes_shop_pos/app/widgets/button.dart';
import 'package:shoes_shop_pos/app/widgets/textform.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GetBuilder<RegisterController>(
        builder:
            (c) => Padding(
              padding: EdgeInsets.fromLTRB(24, 40, 24, 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register new\naccount',
                        style: FontTheme.bold.copyWith(
                          fontSize: 24,
                          color: ColorTheme.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SvgPicture.asset(
                        'assets/vectors/line.svg',
                        width: 99,
                        height: 4,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MyTextForm(
                              labelText: 'Full Name',
                              hintText: 'John Doe',
                              prefixIcon: Icon(
                                Icons.person,
                                color: ColorTheme.darkGray,
                              ),
                              controller: c.nameController,
                            ),
                            const SizedBox(height: 24),
                            MyTextForm(
                              labelText: 'Email',
                              hintText: 'example@mail.test',
                              prefixIcon: Icon(
                                Icons.email,
                                color: ColorTheme.darkGray,
                              ),
                              controller: c.emailController,
                            ),
                            const SizedBox(height: 24),
                            MyTextForm(
                              labelText: 'Password',
                              hintText: 'Password',
                              obscureText: c.isObscure,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  c.isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorTheme.darkGray,
                                ),
                                onPressed: () {
                                  c.isObscure = !c.isObscure;
                                  c.update();
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: ColorTheme.darkGray,
                              ),
                              controller: c.passwordController,
                            ),
                            const SizedBox(height: 24),
                            MyTextForm(
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password',
                              obscureText: c.isObscureConfirm,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  c.isObscureConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorTheme.darkGray,
                                ),
                                onPressed: () {
                                  c.isObscureConfirm = !c.isObscureConfirm;
                                  c.update();
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: ColorTheme.darkGray,
                              ),
                              controller: c.confirmPasswordController,
                            ),
                            const SizedBox(height: 24),
                            MyButton(
                              onPressed: () {},
                              color: Colors.indigo.shade500,
                              label: "Register",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: FontTheme.medium.copyWith(
                          fontSize: 14,
                          color: ColorTheme.darkGray,
                        ),
                      ),
                      GestureDetector(
                        onTap: c.goToLogin,
                        child: Text(
                          'Login',
                          style: FontTheme.medium.copyWith(
                            fontSize: 14,
                            color: Colors.indigo.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
