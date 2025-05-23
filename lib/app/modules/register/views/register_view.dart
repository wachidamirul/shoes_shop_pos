import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
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
                          color: Theme.of(context).textTheme.titleLarge?.color,
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
                              controller: c.nameController,
                              labelText: 'Full Name',
                              hintText: 'John Doe',
                              prefixIcon: Icons.person,
                            ),
                            const SizedBox(height: 24),
                            MyTextForm(
                              controller: c.emailController,
                              labelText: 'Email',
                              hintText: 'example@mail.test',
                              prefixIcon: Icons.email,
                            ),
                            const SizedBox(height: 24),
                            MyTextForm(
                              controller: c.passwordController,
                              labelText: 'Password',
                              hintText: 'Password',
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              obscureText: c.isObscure,
                              suffixIcon:
                                  c.isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                              onChanged: () {
                                c.isObscure = !c.isObscure;
                                c.update();
                              },
                            ),
                            const SizedBox(height: 24),
                            MyTextForm(
                              controller: c.confirmPasswordController,
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password',
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              obscureText: c.isObscureConfirm,
                              suffixIcon:
                                  c.isObscureConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                              onChanged: () {
                                c.isObscureConfirm = !c.isObscureConfirm;
                                c.update();
                              },
                            ),
                            const SizedBox(height: 40),
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
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                      GestureDetector(
                        onTap: c.goToLogin,
                        child: Text(
                          'Login',
                          style: FontTheme.medium.copyWith(
                            fontSize: 14,
                            color:
                                Theme.of(
                                  context,
                                ).textTheme.headlineMedium?.color,
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
