import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/modules/profile/controller/profile_controller.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/utils/smallheading.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 122, 100, 242),
        title: const Text(
          "Profile",
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
        () => profileController.isProfileLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
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
                            controller: nameController
                              ..text = profileController
                                      .profileModel?.data.first.clientName ??
                                  "",
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
                            controller: emailController
                              ..text = profileController
                                      .profileModel?.data.first.mail ??
                                  "",
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
                            controller: phoneController
                              ..text = profileController
                                      .profileModel?.data.first.clientPhone ??
                                  "",
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
                            controller: userNameController
                              ..text = profileController
                                      .profileModel?.data.first.username ??
                                  "",
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
