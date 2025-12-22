import 'package:flutter/material.dart';

import '../features/ui/screens/splashScreen.dart';

class Approutes {

static Route<dynamic> appRoute(RouteSettings settings){

late final Widget ScreenWidget;
if (settings.name == Splashscreen.name) {
ScreenWidget = Splashscreen();
}

return MaterialPageRoute(builder: (context) => ScreenWidget);

}
}