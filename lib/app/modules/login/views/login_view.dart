import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_shop_pos/app/theme/app_theme.dart';
import 'package:shoes_shop_pos/app/theme/color_theme.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';
import 'package:shoes_shop_pos/app/widgets/button.dart';
import 'package:shoes_shop_pos/app/widgets/textfield.dart';
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
              padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: 16),
                      SvgPicture.asset(
                        'assets/vectors/line.svg',
                        width: 99,
                        height: 4,
                      ),
                    ],
                  ),
                  SizedBox(height: 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MyTextfield(
                        labelText: 'Email',
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: ColorTheme.darkGray,
                        ),
                        controller: c.emailController,
                      ),
                      SizedBox(height: 24),
                      MyTextfield(
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
                      SizedBox(height: 16),
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
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade500,
                      padding: EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: FontTheme.medium.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.indigo.shade200)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Or continue with',
                          style: FontTheme.regular.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.indigo.shade200)),
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/vectors/google.svg',
                            width: 22,
                          ),
                          label: Text(
                            "Google",
                            style: FontTheme.semibold.copyWith(
                              color: ColorTheme.darkGray,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.indigo.shade200,
                              width: 2,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/vectors/facebook.svg',
                            width: 22,
                          ),
                          label: Text(
                            "Facebook",
                            style: FontTheme.semibold.copyWith(
                              color: ColorTheme.darkGray,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.indigo.shade200,
                              width: 2,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
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
