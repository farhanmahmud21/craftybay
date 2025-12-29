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
    }
    if (settings.name == LoginScreen.name) {
      ScreenWidget = LoginScreen();
    }
    if (settings.name == SignupScreen.name) {
      ScreenWidget = SignupScreen();
    }
    if (settings.name == HomeScreen.name) {
      ScreenWidget = HomeScreen();
    }

    return MaterialPageRoute(builder: (context) => ScreenWidget);
  }
}
