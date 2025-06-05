import 'package:get/get.dart';

class AnalyticController extends GetxController {
  var timeFrameItem = ["Daily", "Weekly", "Monthly", "Yearly"];
  RxString valTimeFrame = "Daily".obs;

  void setTimeFrame(newValue) {
    if (newValue != null && timeFrameItem.contains(newValue)) {
      valTimeFrame.value = newValue;
    } else {
      print("Invalid time frame selected.");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
