import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/home/bindings/home_binding.dart';
import 'package:test_app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(
          'en',
        ),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(
        'en',
      ),
      child: ScreenUtilInit(
        designSize: const Size(360, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            themeMode: ThemeMode.light,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialBinding: HomeBinding(),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        },
      ),
    ),
  );
}
