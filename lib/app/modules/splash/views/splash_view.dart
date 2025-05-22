import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder:
          (controller) => Scaffold(
            body: Container(
              width: 1.sw,
              decoration: BoxDecoration(color: Colors.indigo.shade50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', height: 150.w),
                ],
              ),
            ),
          ),
    );
  }
}
