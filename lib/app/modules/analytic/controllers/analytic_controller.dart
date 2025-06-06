import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var timeFrameItem = ["Today", "This Week", "This Month", "This Year"];
  RxString valTimeFrame = "Today".obs;
  RxInt tabBarPosition = 0.obs;
  late TabController tabController;

  void setTimeFrame(newValue) {
    if (newValue != null && timeFrameItem.contains(newValue)) {
      valTimeFrame.value = newValue;
      int idx = timeFrameItem.indexOf(newValue);
      tabBarPosition.value = idx;
      tabController.animateTo(idx);
    } else {
      print("Invalid time frame selected.");
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: timeFrameItem.length, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) return;
      valTimeFrame.value = timeFrameItem[tabController.index];
      tabBarPosition.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
