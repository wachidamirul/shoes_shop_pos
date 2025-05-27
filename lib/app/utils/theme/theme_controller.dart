import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../storage_utility.dart';

class ThemeController extends GetxController {
  final _storage = MyLocalStorage();
  final _key = 'theme_mode';

  // Reactive themeMode
  late final Rx<ThemeMode> themeMode;

  ThemeMode _loadThemeFromBox() {
    String? themeText = _storage.readData<String>(_key);
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
    _storage.saveData<String>(_key, themeText);
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

  void setThemeSystem() {
    themeMode.value = ThemeMode.system;
    Get.changeThemeMode(ThemeMode.system);
    _saveThemeToBox('system');
  }

  @override
  void onInit() {
    super.onInit();
    themeMode = _loadThemeFromBox().obs;
    Get.changeThemeMode(themeMode.value);
  }

  @override
  void onReady() {
    super.onReady();
  }
}
