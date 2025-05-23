import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';
import 'package:shoes_shop_pos/app/utils/theme/theme_controller.dart';
import 'package:shoes_shop_pos/app/widgets/box.dart';
import 'package:shoes_shop_pos/app/widgets/button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView', style: FontTheme.regular),
        actions: [
          IconButton(
            onPressed: themeController.toggleTheme,
            icon: const Icon(Icons.lightbulb),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.primary,
          child: MyButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: themeController.setThemeSystem,
            label: 'System Theme',
          ),
        ),
      ),
    );
  }
}
