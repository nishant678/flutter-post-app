import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:test_app/modules/profile/view/profile.dart';
import 'package:test_app/modules/resturent/view/resturent.dart';

class BottomBarNavigationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  RxInt selectedIndex = 0.obs;
  static final List<Widget> widgetOptions = <Widget>[
    Resturent(),
    Profile(),
    // const ProductGrid(),
    // const CustomerOrderListPage(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
