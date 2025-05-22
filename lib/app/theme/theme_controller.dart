import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'theme_mode';

  // Reactive themeMode
  late final Rx<ThemeMode> themeMode;

  @override
  void onInit() {
    super.onInit();
    themeMode = _loadThemeFromBox().obs;
    Get.changeThemeMode(themeMode.value); // Apply theme on start
  }

  ThemeMode _loadThemeFromBox() {
    String? themeText = _box.read(_key);
    switch (themeText) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void _saveThemeToBox(String themeText) {
    _box.write(_key, themeText);
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
      Get.changeThemeMode(ThemeMode.dark);
      _saveThemeToBox('dark');
    } else {
      themeMode.value = ThemeMode.light;
      Get.changeThemeMode(ThemeMode.light);
      _saveThemeToBox('light');
    }
  }
}
