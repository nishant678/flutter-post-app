import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/register/controller/register_controller.dart';
import 'package:test_app/utils/color_constant.dart';
import 'package:test_app/widgets/input_field_signup.dart';
import 'package:test_app/widgets/inputfield.dart';

import '../../../utils/smallheading.dart';
import '../../../utils/textheading.dart';

class Register extends GetView<RegisterController> {
  Register({Key? key}) : super(key: key);

  final RegisterController registerController = Get.find();
  // final RegisterController registerController = Get.put(RegisterController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset("assets/img/back_arrow.png")),
        title: const Text("Sign up"),
        centerTitle: true,
      ),
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
                    height: 10.h,
                  ),
                  const Smallheading(headingText: "Name"),
                  SizedBox(
                    height: 5.h,
                  ),
                  InputFieldSignUp(
                    hintText: 'Enter your name',
                    data: "name",
                    textCapitalization: TextCapitalization.sentences,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InputFieldSignUp(
                    hintText: 'Enter your email',
                    data: "email",
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InputFieldSignUp(
                    textInputType: TextInputType.number,
                    hintText: 'Enter your mobile no.',
                    maxLength: 10,
                    data: "mobile no.",
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Obx(
                    () => InputFieldSignUp(
                      suffix: InkWell(
                        onTap: () {
                          registerController.isVisible2.value =
                              !registerController.isVisible2.value;
                        },
                        child: registerController.isVisible2.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      obscureText: registerController.isVisible2.value,
                      hintText: 'Enter your password',
                      data: "password",
                      controller: passwordController,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Obx(
                    () => InputFieldSignUp(
                      suffix: InkWell(
                        onTap: () {
                          registerController.isVisible.value =
                              !registerController.isVisible.value;
                        },
                        child: !registerController.isVisible.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      obscureText: registerController.isVisible.value,
                      hintText: 'Enter confirm password',
                      data: "confirm password",
                      controller: confirmPasswordController,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  InputFieldSignUp(
                    hintText: 'Enter user name',
                    data: "user name",
                    controller: userNameController,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Obx(
                        () => Checkbox(
                          side: BorderSide(
                              color: ColorConstantsLight.borderColor),
                          value: registerController.isCheckedTerms.value,
                          onChanged: (value) {
                            registerController.isCheckedTerms.value = value!;
                            print(
                                "check terms value ${registerController.isCheckedTerms.value}");
                          },
                        ),
                      ),
                      RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        textDirection: TextDirection.rtl,
                        softWrap: false,
                        maxLines: 3,
                        textScaleFactor: 1,
                        text: TextSpan(
                          text: "I agree with the company's ",
                          style: TextStyle(
                            fontFamily: 'Inter V',
                            color: ColorConstantsLight.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'privacy\npolicy',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Inter V',
                                color: ColorConstantsLight.buttonColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                fontFamily: 'Inter V',
                                color: ColorConstantsLight.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'terms of service',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Inter V',
                                color: ColorConstantsLight.buttonColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!registerController.isRegisterLoading.value) {
                        if (_formKey.currentState!.validate()) {
                          if (!registerController.isCheckedTerms.value) {
                            registerController.register(
                              name: nameController.text,
                              email: emailController.text,
                              mobile: phoneController.text,
                              password: passwordController.text,
                              conPassword: confirmPasswordController.text,
                              userName: userNameController.text,
                            );
                          } else {
                            Get.snackbar(
                              "Missing terms & condition",
                              "Select terms & condition.",
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: ColorConstantsLight.buttonColor,
                              duration: const Duration(seconds: 2),
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                            );
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 122, 100, 242),
                      minimumSize: Size(double.infinity, 44.h),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(11.r)),
                    ),
                    child: Obx(
                      () => registerController.isRegisterLoading.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Loading...",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )
                              ],
                            )
                          : Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
