import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../storage_utility.dart';

class ThemeController extends GetxController {
  final MyLocalStorage _storage = MyLocalStorage();
  final String _key = 'theme_mode';

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final RxBool isDarkMode = false.obs;

  ThemeMode _loadThemeFromStorage() {
    final themeText = _storage.readData<String>(_key);
    switch (themeText) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> _saveThemeToStorage(String themeText) async {
    await _storage.saveData<String>(_key, themeText);
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      _setTheme(ThemeMode.dark, 'dark');
    } else {
      _setTheme(ThemeMode.light, 'light');
    }
  }

  void setThemeSystem() {
    _setTheme(ThemeMode.system, 'system');
  }

  void _setTheme(ThemeMode mode, String text) {
    themeMode.value = mode;
    isDarkMode.value = mode == ThemeMode.dark;
    Get.changeThemeMode(mode);
    _saveThemeToStorage(text);
  }

  @override
  void onInit() {
    super.onInit();
    final loadedTheme = _loadThemeFromStorage();
    themeMode.value = loadedTheme;
    isDarkMode.value = loadedTheme == ThemeMode.dark;
    Get.changeThemeMode(loadedTheme);
  }
}
