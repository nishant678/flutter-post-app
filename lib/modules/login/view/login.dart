import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/login/controller/login_controller.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/utils/color_constant.dart';
import 'package:test_app/utils/smallheading.dart';
import 'package:test_app/utils/textheading.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextHeading(text: "Login"),
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  const Smallheading(headingText: "Mobile number*"),
                  SizedBox(
                    height: 5.h,
                  ),
                  InputField(
                    hintText: 'Enter your mobile no.',
                    textInputType: TextInputType.number,
                    maxLength: 10,
                    data: "mobile no.",
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Smallheading(headingText: "password*"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(
                    () => InputField(
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
                    height: 40.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!loginController.isLoginLoading.value) {
                        if (_formKey.currentState!.validate()) {
                          loginController.login(
                            mobile: phoneController.text,
                            password: passwordController.text,
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstantsLight.primaryColor,
                      minimumSize: Size(double.infinity, 44.h),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(11.r)),
                    ),
                    child: Obx(
                      () => loginController.isLoginLoading.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                          : Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text(
                          " Register",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
