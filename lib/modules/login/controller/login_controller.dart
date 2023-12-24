import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/modules/login/model/login_model.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/utils/app_api.dart';
import 'package:test_app/utils/color_constant.dart';

class LoginController extends GetxController {
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

  RxBool isVisible = true.obs;
  var isLoginLoading = false.obs;
  LoginModel? loginModel;
  Future<void> login({required String mobile, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoginLoading.value = true;
    try {
      var myDio = dio.Dio();
      myDio.options.headers["Content-Type"] = "application/json";
      await myDio
          .post(
        AppApi.baseUrl + AppApi.login,
        data: {
          "phone_number": int.parse(mobile).toInt(),
          "password": password.toString(),
        },
        options: dio.Options(
          validateStatus: (status) => true,
        ),
      )
          .then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            loginModel = LoginModel.fromJson(value.data);
            int clientId = loginModel!.user.clientId;
            prefs.setInt("clientId", clientId);
            print("client id value ${prefs.getInt("clientId")}");
            isLoginLoading.value = false;
            Get.offAllNamed(Routes.BOTTOMBAR);

            Get.snackbar(
              "Login!",
              "Login successfully.",
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: ColorConstantsLight.primaryColor,
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
            );
          } else if (value.statusCode == 400 || value.statusCode == 401) {
            isLoginLoading.value = false;
          } else {
            isLoginLoading.value = false;
            print("Something Went Wrong");
          }
        },
      );
      isLoginLoading.value = false;
    } catch (err) {
      isLoginLoading.value = false;
      print("Register Error => ${err.toString()}");
    }
  }
}
