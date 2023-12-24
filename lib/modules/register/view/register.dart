import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/register/controller/register_controller.dart';
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
                    height: 30.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextHeading(text: "Sign Up"),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Smallheading(headingText: "Name"),
                  SizedBox(
                    height: 5.h,
                  ),
                  InputField(
                    hintText: 'Enter your name',
                    data: "name",
                    textCapitalization: TextCapitalization.sentences,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Smallheading(headingText: "email"),
                  SizedBox(
                    height: 5.h,
                  ),
                  InputField(
                    hintText: 'Enter your email',
                    data: "email",
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Smallheading(headingText: "Mobile number*"),
                  SizedBox(
                    height: 5.h,
                  ),
                  InputField(
                    textInputType: TextInputType.number,
                    hintText: 'Enter your mobile no.',
                    maxLength: 10,
                    data: "mobile no.",
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Smallheading(headingText: "password"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(
                    () => InputField(
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
                    height: 10.h,
                  ),
                  const Smallheading(headingText: "Confirm password"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(
                    () => InputField(
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
                    height: 10.h,
                  ),
                  const Smallheading(headingText: "User name*"),
                  SizedBox(
                    height: 5.h,
                  ),
                  InputField(
                    hintText: 'Enter user name',
                    data: "user name",
                    controller: userNameController,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!registerController.isRegisterLoading.value) {
                        if (_formKey.currentState!.validate()) {
                          registerController.register(
                            name: nameController.text,
                            email: emailController.text,
                            mobile: phoneController.text,
                            password: passwordController.text,
                            conPassword: confirmPasswordController.text,
                            userName: userNameController.text,
                          );
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
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          " Login",
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
