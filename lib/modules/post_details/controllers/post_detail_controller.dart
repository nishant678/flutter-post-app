import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:test_app/modules/home/model/user_model.dart';
import 'package:test_app/modules/post_details/model/postbyidModel.dart';
import 'package:test_app/utils/app_api.dart';

class PostDetailController extends GetxController {
  final count = 0.obs;
  UserModel? userModel;

  @override
  void onInit() async {
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

  void increment() => count.value++;
  var isUserLoading = false.obs;
  UserPostByIdMode? userPostByIdMode;
  Future<void> getPostsByid({required id}) async {
    isUserLoading.value = true;
    try {
      var myDio = dio.Dio();

      await myDio
          .get(
        "${AppApi.baseUrl}${AppApi.posts}/$id",
        options: dio.Options(
          validateStatus: (status) => true,
        ),
      )
          .then((value) async {
        if (value.statusCode == 200 || value.statusCode == 201) {
          log(value.data.toString());
          userPostByIdMode = UserPostByIdMode.fromJson(value.data);
          isUserLoading.value = false;
        } else {
          isUserLoading.value = false;
          log("Something Went Wrong!");
        }
      });
    } catch (err) {
      isUserLoading.value = false;
      print("getMockList Error => ${err.toString()}");
    }
  }
}
