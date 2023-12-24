import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 2)).then((value) => isUserLogin());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> isUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? clientId = prefs.getInt("clientId");
    if (clientId != null) {
      Get.offAllNamed(Routes.BOTTOMBAR);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
