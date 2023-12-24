import 'package:get/get.dart';
import 'package:test_app/modules/resturent/controller/resturent_controller.dart';

class ResturentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ResturentController>(ResturentController());
  }
}
