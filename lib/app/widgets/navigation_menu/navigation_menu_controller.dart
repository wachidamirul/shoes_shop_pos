import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNavigationMenuController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  void changePage(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animateToPage(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
