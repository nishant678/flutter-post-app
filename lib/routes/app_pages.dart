import 'package:get/get.dart';
import 'package:test_app/modules/home/bindings/home_binding.dart';
import 'package:test_app/modules/home/views/home_view.dart';
import 'package:test_app/modules/post_details/bindings/post_detail_binding.dart';
import 'package:test_app/modules/post_details/views/post_detail_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
