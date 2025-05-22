import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_pos/app/theme/app_theme.dart';
import 'package:shoes_shop_pos/app/theme/theme_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Inisialisasi storage
  Get.put(ThemeController()); // Daftarkan controller

  final themeController = Get.find<ThemeController>();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeController.themeMode.value,
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
    ),
  );
}
