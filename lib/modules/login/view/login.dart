import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/login/controller/login_controller.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/utils/color_constant.dart';
import 'package:test_app/utils/smallheading.dart';
import 'package:test_app/widgets/inputfield.dart';

class Login extends GetView<LoginController> {
  Login({Key? key}) : super(key: key);

  final LoginController loginController = Get.find();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstantsLight.primaryColor,
                ColorConstantsLight.secondryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img/rq-logo-OMAR-WHITE.png"),
                      SizedBox(
                        width: 60.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 35.h),
                        child: Row(
                          children: [
                            const Text(
                              "Skip",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset("assets/img/Group 568.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.08),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 18.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: const Smallheading(
                                headingText: "Login your account"),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          InputField(
                            prefix: Image.asset('assets/img/icon-user.png'),
                            hintText: 'Enter your mobile no.',
                            textInputType: TextInputType.number,
                            maxLength: 10,
                            data: "mobile no.",
                            controller: phoneController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Obx(
                            () => InputField(
                              prefix: Image.asset('assets/img/icon-lock.png'),
                              suffix: InkWell(
                                onTap: () {
                                  loginController.isVisible.value =
                                      !loginController.isVisible.value;
                                },
                                child: loginController.isVisible.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              obscureText: loginController.isVisible.value,
                              hintText: 'Enter your password',
                              data: "password",
                              controller: passwordController,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              "Forget your password?",
                              style: TextStyle(
                                fontFamily: 'Inter V',

                                color: ColorConstantsLight.whiteColor,
                                // color: const Color(0xff127781),
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorConstantsLight.whiteColor,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!loginController.isLoginLoading.value) {
                                if (_formKey.currentState!.validate()) {
                                  loginController.login(
                                    mobile: phoneController.text,
                                    password: passwordController.text,
                                  );
                                }
                              }
                            },
                            child: Container(
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                gradient: LinearGradient(
                                  colors: [
                                    ColorConstantsLight.buttonColor,
                                    ColorConstantsLight.buttonColor2,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Obx(
                                () => loginController.isLoginLoading.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Loading...",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          )
                                        ],
                                      )
                                    : Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Smallheading(
                          headingText: "You don't have an account Yet !  "),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontFamily: 'Inter V',
                            decoration: TextDecoration.underline,
                            decorationColor: ColorConstantsLight.whiteColor,
                            decorationThickness: 2,
                            color: ColorConstantsLight.whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/Path 158.png"),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Login with",
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset("assets/img/Path 158.png"),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                                "assets/img/Continue with google_button.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                                "assets/img/Icon awesome-apple.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset("assets/img/Facebook Logo.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                                "assets/img/Icon awesome-twitter.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
