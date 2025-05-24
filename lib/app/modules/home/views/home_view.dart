import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoes_shop_pos/app/utils/theme/theme_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        actions: [
          IconButton(
            onPressed: themeController.toggleTheme,
            icon: const Icon(Icons.lightbulb),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Text(
          'HomeView is working',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
