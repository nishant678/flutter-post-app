import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/home/controllers/home_controller.dart';
import 'package:test_app/modules/post_details/controllers/post_detail_controller.dart';

class PostDetailView extends GetView<PostDetailController> {
  final String? name;
  PostDetailView({Key? key, required this.name}) : super(key: key);

  final PostDetailController postDetailController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: !postDetailController.isUserLoading.value,
        replacement: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 237, 237),
          appBar: AppBar(
            title: const Text("User Post details"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 680.h,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.w,
                        right: 15,
                        top: 8.h,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/img/profile-img.png',
                                    height: 45.h,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    name!,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                  postDetailController.userPostByIdMode?.body ??
                                      "")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
