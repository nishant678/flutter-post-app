import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/modules/resturent/controller/resturent_controller.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/utils/color_constant.dart';
import 'package:test_app/utils/smallheading.dart';

class Resturent extends GetView<ResturentController> {
  Resturent({Key? key}) : super(key: key);
  final ResturentController resturentController =
      Get.put(ResturentController());

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    var clientId = prefs.getInt("clientId");
    if (clientId == null) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorConstantsLight.bacgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorConstantsLight.secondryColor,
                    ColorConstantsLight.primaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            elevation: 0,
          ),
          body: Obx(
            () => resturentController.isResturentLoading.value
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SizedBox(
                        height: 35.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: ColorConstantsLight.buttonColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                  child: Text(
                                "Dine in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              )),
                            ),
                            Container(
                              height: 50.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: ColorConstantsLight.bacgroundColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                  child: Text(
                                "Pickup",
                                style: TextStyle(
                                    color: ColorConstantsLight.textColor,
                                    fontSize: 15.sp),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 500.h,
                        child: ListView.separated(
                          itemCount: resturentController.resturentData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Container(
                                // height: 80.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                  // border: Border.all(
                                  //   color: const Color.fromARGB(
                                  //       255, 168, 209, 242),
                                  // ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 70.h,
                                        width: 90.w,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r)),
                                          child: Image.network(
                                            "https://cdn.requeue.net/media/logos/${resturentController.resturentData[index].logo}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            resturentController
                                                .resturentData[index].nameEn,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          // Smallheading(
                                          //     headingText: resturentController
                                          //         .resturentData[index].nameEn),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            children: [
                                              RatingBar.builder(
                                                initialRating: 1,
                                                minRating: resturentController
                                                    .resturentData[index]
                                                    .rating,
                                                direction: Axis.horizontal,
                                                itemSize: 20,
                                                allowHalfRating: true,
                                                itemCount: 1,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 5,
                                                  // Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  // setState(() {
                                                  //   myOrderController.rating.value =
                                                  //       rating;
                                                  // });
                                                  // print(
                                                  //     'check review text ${myOrderController.rating.value}');
                                                },
                                              ),
                                              Text(
                                                "${resturentController.resturentData[index].rating}"
                                                    .substring(0, 3),
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        Positioned(
          top: 30.h,
          left: 18.w,
          right: 18.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            height: 70.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/img/Group 2775.png"),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    "Resturent",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
