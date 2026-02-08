import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/auth/ui/controllers/signup_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(onUnAuthorize: _onAuthorize, commonHeaders: _commonHeaders),
    );
    Get.put(SignupController());

    Get.put(VerifyOtpController());
  }

  void _onAuthorize() {
    //To Do  logout from device and  re login
  }

  final Map<String, String> _commonHeaders = {
    'content-type': 'application/json',
    'token': '',
  };
}
