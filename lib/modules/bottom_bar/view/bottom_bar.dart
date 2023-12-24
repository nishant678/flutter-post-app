import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/bottom_bar/controller/bottom_bar_controller.dart';

class BottomBar extends GetView<BottomBarNavigationController> {
  BottomBar({Key? key}) : super(key: key);
  final BottomBarNavigationController bottomBarNavigationController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomerNavDrawer(),

      body: Obx(
        () => Center(
          child: BottomBarNavigationController.widgetOptions
              .elementAt(bottomBarNavigationController.selectedIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: bottomBarNavigationController.selectedIndex.value,
          selectedItemColor: const Color.fromARGB(255, 201, 57, 226),
          onTap: bottomBarNavigationController.onItemTapped,
        ),
      ),
    );
  }
}
