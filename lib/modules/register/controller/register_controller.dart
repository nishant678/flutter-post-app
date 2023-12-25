import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:test_app/utils/app_api.dart';
import 'package:test_app/utils/color_constant.dart';

class RegisterController extends GetxController {
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

  var isRegisterLoading = false.obs;
  var isCheckedTerms = false.obs;

  RxBool isVisible = true.obs;
  RxBool isVisible2 = true.obs;

  Future<void> register(
      {required String userName,
      required String conPassword,
      required String mobile,
      required String password,
      required String email,
      required String name}) async {
    isRegisterLoading.value = true;
    try {
      var myDio = dio.Dio();
      myDio.options.headers["Content-Type"] = "application/json";
      await myDio
          .post(
        AppApi.baseUrl + AppApi.register,
        data: {
          "Name": name.toString(),
          "Email": email.toString(),
          "phone_number": int.parse(mobile).toInt(),
          "Password": password.toString(),
          "confirm_password": conPassword.toString(),
          "Country": 91,
          "UserName": userName.toString()
        },
        options: dio.Options(
          validateStatus: (status) => true,
        ),
      )
          .then(
        (value) async {
          if (value.statusCode == 200 || value.statusCode == 201) {
            isRegisterLoading.value = false;
            Get.back();
            Get.snackbar(
              "Register!",
              "User register successfully",
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: ColorConstantsLight.buttonColor,
              duration: const Duration(seconds: 2),
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
            );
          } else if (value.statusCode == 400 || value.statusCode == 401) {
            isRegisterLoading.value = false;
          } else {
            isRegisterLoading.value = false;
            print("Something Went Wrong");
          }
        },
      );
      isRegisterLoading.value = false;
    } catch (err) {
      isRegisterLoading.value = false;
      print("Register Error => ${err.toString()}");
    }
  }
}
