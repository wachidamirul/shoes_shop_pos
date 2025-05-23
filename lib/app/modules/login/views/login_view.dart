import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shoes_shop_pos/app/theme/color_theme.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';
import 'package:shoes_shop_pos/app/widgets/button.dart';
import 'package:shoes_shop_pos/app/widgets/iconbutton.dart';
import 'package:shoes_shop_pos/app/widgets/textform.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GetBuilder<LoginController>(
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
                        'Login to your\naccount',
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
                              labelText: 'Email',
                              hintText: 'Email',
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
                                      ? Icons.visibility_off
                                      : Icons.visibility,
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
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot Password?',
                                style: FontTheme.medium.copyWith(
                                  fontSize: 14,
                                  color: Colors.indigo.shade500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            MyButton(
                              onPressed: () {},
                              color: Colors.indigo.shade500,
                              label: "Login",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 36),
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade400)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Or continue with',
                              style: FontTheme.regular.copyWith(
                                color: ColorTheme.darkGray,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey.shade400)),
                        ],
                      ),
                      const SizedBox(height: 36),
                      Row(
                        children: [
                          MyIconButton(
                            onPressed: () {},
                            label: 'Google',
                            icon: SvgPicture.asset(
                              'assets/vectors/google.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(width: 20),
                          MyIconButton(
                            onPressed: () {},
                            label: 'Facebook',
                            icon: SvgPicture.asset(
                              'assets/vectors/facebook.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: FontTheme.medium.copyWith(
                          fontSize: 14,
                          color: ColorTheme.darkGray,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Register',
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
