import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/modules/profile/controller/profile_controller.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/utils/color_constant.dart';
import 'package:test_app/utils/smallheading.dart';
import 'package:test_app/utils/textheading.dart';
import 'package:test_app/widgets/inputfield.dart';

class Profile extends GetView<ProfileController> {
  Profile({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            () => profileController.isProfileLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.r))),
                                    child: Image.asset(
                                      "assets/img/photo.png",
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextHeading(
                                text: profileController
                                    .profileData.first.clientName,
                              ),
                              Text(
                                  profileController.profileData.first.username),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Obsessed with Fahim MD's, love to go shopping on weekends and loveee food #foodielife",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Followers"),
                                      Text(
                                          "${profileController.profileData.first.followlist.follower} k"),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Column(
                                    children: [
                                      Text("Following"),
                                      Text(
                                          "${profileController.profileData.first.followlist.following} k"),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                        color: ColorConstantsLight.buttonColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r))),
                                    child: Center(
                                        child: Text(
                                      "Follow",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: ColorConstantsLight.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r))),
                                    child: Center(
                                        child: Text(
                                      "Message",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rates 135k",
                                    style: TextStyle(
                                        color: ColorConstantsLight.textColor,
                                        fontSize: 15.sp),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                    height: 38.h,
                                    decoration: BoxDecoration(
                                        color:
                                            ColorConstantsLight.secondryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r))),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Text(
                                          "Visited  358",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    "Favorite",
                                    style: TextStyle(
                                        color: ColorConstantsLight.textColor,
                                        fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  Image.asset("assets/img/Group 3172.png"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
