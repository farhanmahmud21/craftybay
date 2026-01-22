import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../home/ui/screens/home_screen.dart';
import '../screens/product_categories_screen.dart';

class MainBottomNavController extends GetxController {
  RxInt _activeIndex = 0.obs;
  List<Widget> screens = [HomeScreen(), ProductCategoriesScreen()];

  get activeIndex => _activeIndex.value;

  void changeIndex(int value) {
    if (value == _activeIndex.value) {
      return;
    }
    _activeIndex.value = value;
  }

  void moveToCategory() {
    changeIndex(1);
  }

  void moveToHome() {
    changeIndex(0);
  }
}
