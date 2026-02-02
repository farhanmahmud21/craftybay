import 'package:craftybay/core/network/network_client.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());

    Get.put(
      NetworkClient(onAuthorize: _onAuthorize, commonHeaders: _commonHeaders),
    );
  }

  void _onAuthorize() {
    //To Do - Logout from apps and relogin
  }

  final Map<String, String> _commonHeaders = {
    'content-type': 'application.json',
    'token': '',
  };
}
