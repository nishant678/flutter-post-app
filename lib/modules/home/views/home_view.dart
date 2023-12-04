import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/home/controllers/home_controller.dart';
import 'package:test_app/modules/post_details/controllers/post_detail_controller.dart';
import 'package:test_app/modules/post_details/views/post_detail_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();
  final PostDetailController postDetailController =
      Get.put(PostDetailController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: !homeController.isUserLoading.value &&
            !homeController.isPostLoading.value,
        replacement: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 237, 237),
          appBar: AppBar(
            title: const Text("User Post"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                homeController.listofUser.isEmpty
                    ? const Center(child: Text("Empty Data"))
                    : SizedBox(
                        height: 680.h,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: ListView.builder(
                            itemCount: homeController.listofUser.length,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  postDetailController.getPostsByid(
                                      id: homeController.listOfPost[index]
                                          ["id"]);
                                  Get.to(
                                    PostDetailView(
                                        name: homeController.listofUser[index]
                                            ["name"]),
                                  );
                                },
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    'assets/img/profile-img.png',
                                                    height: 45.h,
                                                  ),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Text(
                                                    homeController
                                                            .listofUser[index]
                                                        ["name"],
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                              const Icon(Icons.more_horiz)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(homeController.listOfPost[index]
                                              ["body"]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
