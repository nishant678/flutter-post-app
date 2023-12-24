import 'package:get/get.dart';
import 'package:test_app/modules/bottom_bar/controller/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomBarNavigationController>(BottomBarNavigationController());
  }
}
