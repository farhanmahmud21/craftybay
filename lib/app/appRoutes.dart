import 'package:craftybay/features/auth/ui/screens/verify__otp_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/features/product/data/models/category_model.dart';
import 'package:craftybay/features/product/ui/screens/product_categories_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';

import 'package:flutter/material.dart';

import '../features/home/ui/screens/home_screen.dart';
import '../features/auth/ui/screens/login_screen.dart';
import '../features/auth/ui/screens/signup_screen.dart';
import '../features/auth/ui/screens/splashScreen.dart';

class Approutes {
  static Route<dynamic> getappRoute(RouteSettings settings) {
    late final Widget ScreenWidget;
    if (settings.name == Splashscreen.name) {
      ScreenWidget = Splashscreen();
    } else if (settings.name == MainBottomNavScreen.name) {
      ScreenWidget = MainBottomNavScreen();
    } else if (settings.name == LoginScreen.name) {
      ScreenWidget = LoginScreen();
    } else if (settings.name == SignupScreen.name) {
      ScreenWidget = SignupScreen();
    } else if (settings.name == HomeScreen.name) {
      ScreenWidget = HomeScreen();
    } else if (settings.name == ProductCategoriesScreen.name) {
      ScreenWidget = ProductCategoriesScreen();
    } else if (settings.name == ProductListScreen.name) {
      final category = settings.arguments as CatagoryModel;
      ScreenWidget = ProductListScreen(catagory: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      final pId = settings.arguments as String;
      ScreenWidget = ProductDetailsScreen(productId: pId);
    } else if (settings.name == VerifyOtpScreen.name) {
      final email = settings.arguments as String;
      ScreenWidget = VerifyOtpScreen(email: email);
    }
    return MaterialPageRoute(builder: (context) => ScreenWidget);
  }
}
