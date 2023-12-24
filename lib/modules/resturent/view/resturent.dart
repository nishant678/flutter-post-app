import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/modules/resturent/controller/resturent_controller.dart';
import 'package:test_app/routes/app_pages.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 122, 100, 242),
        title: const Text(
          "Resturent",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onTap: () {
                logout();
              },
              child: SizedBox(
                height: 25.h,
                width: 25.w,
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => resturentController.isResturentLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 600.h,
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
                              border: Border.all(
                                color: const Color.fromARGB(255, 168, 209, 242),
                              ),
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
                                      Smallheading(
                                          headingText: resturentController
                                              .resturentData[index].nameEn),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      RatingBar.builder(
                                        initialRating: resturentController
                                            .resturentData[index].rating,
                                        minRating: resturentController
                                            .resturentData[index].rating,
                                        direction: Axis.horizontal,
                                        itemSize: 20,
                                        allowHalfRating: true,
                                        itemCount: resturentController
                                            .resturentData[index].rating
                                            .toInt(),
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        itemBuilder: (context, _) => const Icon(
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
    );
  }
}
