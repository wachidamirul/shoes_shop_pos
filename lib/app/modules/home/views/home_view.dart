import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/primary_header_container.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder:
            (c) => SingleChildScrollView(
              child: Column(
                children: [MyPrimaryHeaderContainer(child: Container())],
              ),
            ),
      ),
    );
  }
}
