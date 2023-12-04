import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:test_app/modules/home/model/user_model.dart';
import 'package:test_app/utils/app_api.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  UserModel? userModel;
  List listofUser = [].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
    await getPosts();
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

  Future<void> getUserDetails() async {
    isUserLoading.value = true;
    try {
      var myDio = dio.Dio();

      await myDio
          .get(
        AppApi.baseUrl + AppApi.user,
        options: dio.Options(
          validateStatus: (status) => true,
        ),
      )
          .then((value) async {
        if (value.statusCode == 200 || value.statusCode == 201) {
          log(value.data.toString());
          listofUser.clear();
          listofUser.assignAll(value.data);
          print("user data list ${listofUser.length}");
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

  var isPostLoading = false.obs;
  RxList listOfPost = [].obs;
  var userIdlist = [].obs;
  RxList listOfPost2 = [].obs;
  Future<void> getPosts() async {
    isPostLoading.value = true;
    try {
      var myDio = dio.Dio();

      await myDio
          .get(
        AppApi.baseUrl + AppApi.posts,
        options: dio.Options(
          validateStatus: (status) => true,
        ),
      )
          .then((value) async {
        if (value.statusCode == 200 || value.statusCode == 201) {
          listOfPost.clear();
          listOfPost.value = value.data;

          print("post data list ${listOfPost2.length}");
          isPostLoading.value = false;
        } else {
          isPostLoading.value = false;
          log("Something Went Wrong!");
        }
      });
    } catch (err) {
      isPostLoading.value = false;
      print("getMockList Error => ${err.toString()}");
    }
  }
}
