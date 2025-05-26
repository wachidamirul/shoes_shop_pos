import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_appbar.dart';
import '../widgets/primary_header_container.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  MyHomeAppBar(),

                  // Search Bar

                  // Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
