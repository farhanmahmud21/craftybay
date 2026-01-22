import 'package:craftybay/app/appRoutes.dart';
import 'package:craftybay/app/appTheme.dart';
import 'package:craftybay/app/controller_binders.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/auth/ui/screens/splashScreen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Apptheme.lightTheme,

      initialRoute: Splashscreen.name,

      onGenerateRoute: Approutes.getappRoute,

      initialBinding: ControllerBinders(),
    );
  }
}
