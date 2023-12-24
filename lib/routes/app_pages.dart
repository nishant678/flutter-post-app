import 'package:get/get.dart';
import 'package:test_app/modules/bottom_bar/binding/bottom_bar_binding.dart';
import 'package:test_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:test_app/modules/login/binding/login_binding.dart';
import 'package:test_app/modules/login/view/login.dart';
import 'package:test_app/modules/profile/binding/profile_binding.dart';
import 'package:test_app/modules/profile/view/profile.dart';
import 'package:test_app/modules/register/binding/register_binding.dart';
import 'package:test_app/modules/register/view/register.dart';
import 'package:test_app/modules/resturent/binding/resturent_binding.dart';
import 'package:test_app/modules/resturent/view/resturent.dart';
import 'package:test_app/modules/splash/binding/splash_binding.dart';
import 'package:test_app/modules/splash/view/splash.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => Register(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => BottomBar(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => Profile(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.RESTURENT,
      page: () => Resturent(),
      binding: ResturentBinding(),
    ),
  ];
}
