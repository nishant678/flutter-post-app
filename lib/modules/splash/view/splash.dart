import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/splash/controller/splash_controller.dart';

import '../../../utils/textheading.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadedScaleAnimation(
          child: Image.asset("assets/img/splash-resturent-logo.png"),
        ),
      ),
    );
  }
}
