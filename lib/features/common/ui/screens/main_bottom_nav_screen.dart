import 'package:craftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:craftybay/features/home/ui/controllers/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/main_bottom_nav_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final name = '/main-navigation';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavController control = Get.find<MainBottomNavController>();
  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getSlider();
    Get.find<CategoryListController>().getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        control.moveToHome();
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            selectedIndex: control.activeIndex,

            onDestinationSelected: control.changeIndex,

            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.category_outlined),
                label: 'Categories',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist',
              ),
            ],
          ),
        ),
        body: Obx(() => control.screens[control.activeIndex]),
      ),
    );
  }
}
