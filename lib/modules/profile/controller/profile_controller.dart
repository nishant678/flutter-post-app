import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/modules/profile/model/profile_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:test_app/utils/app_api.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    getProfile();
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

  ProfileModel? profileModel;
  var isProfileLoading = false.obs;
  RxList<ProfileData> profileData = <ProfileData>[].obs;

  Future<void> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isProfileLoading.value = true;
    try {
      var clientId = prefs.getInt("clientId");
      var myDio = dio.Dio();
      await myDio
          .get(
        AppApi.baseUrl +
            AppApi.profile +
            "?ClientID=$clientId&userid=$clientId",
        options: dio.Options(
          validateStatus: (status) => true,
        ),
      )
          .then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            profileModel = ProfileModel.fromJson(value.data);
            profileData.clear();
            profileData.value = profileModel!.data;
            isProfileLoading.value = false;
            // Get.back();
          } else if (value.statusCode == 400 || value.statusCode == 401) {
            isProfileLoading.value = false;
          } else {
            isProfileLoading.value = false;
            print("Something Went Wrong");
          }
        },
      );
      isProfileLoading.value = false;
    } catch (err) {
      isProfileLoading.value = false;
      print("Register Error => ${err.toString()}");
    }
  }
}
