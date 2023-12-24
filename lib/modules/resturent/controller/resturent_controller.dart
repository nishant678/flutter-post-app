import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:test_app/modules/resturent/model/resturent_model.dart';

class ResturentController extends GetxController {
  @override
  void onInit() {
    getResturent();
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

  var isResturentLoading = false.obs;
  ResturentModel? resturentModel;

  RxList<Datum> resturentData = <Datum>[].obs;

  Future<void> getResturent() async {
    isResturentLoading.value = true;
    try {
      var myDio = dio.Dio();
      // myDio.options.headers["Content-Type"] = "application/json";
      await myDio
          .get(
        "https://user.requeue.com/user/mainpages/get-restaurants?PickupAvailable=1&AreaName=Kuwait&page=1&page limit=10",
        options: dio.Options(
          validateStatus: (status) => true,
        ),
      )
          .then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            resturentModel = ResturentModel.fromJson(value.data);
            resturentData.clear();
            resturentData.value = resturentModel!.data;
            isResturentLoading.value = false;
            // Get.back();
          } else if (value.statusCode == 400 || value.statusCode == 401) {
            isResturentLoading.value = false;
          } else {
            isResturentLoading.value = false;
            print("Something Went Wrong");
          }
        },
      );
      isResturentLoading.value = false;
    } catch (err) {
      isResturentLoading.value = false;
      print("Register Error => ${err.toString()}");
    }
  }
}
