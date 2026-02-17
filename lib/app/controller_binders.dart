import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/auth/ui/controllers/login_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/signup_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:craftybay/features/auth/ui/screens/login_screen.dart';
import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/home/ui/controllers/home_slider_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(AuthController());
    Get.put(LoginController());
    Get.put(
      NetworkClient(
        onUnAuthorize: _onAuthorize,
        commonHeaders: commonHeaders(),
      ),
    );
    Get.put(SignupController());

    Get.put(VerifyOtpController());

    Get.put(HomeSliderController());
  }

  void _onAuthorize() {
    //To Do  logout from device and  re login

    Get.find<AuthController>().clearUsereData();
    Get.toNamed(LoginScreen.name);
  }

  Map<String, String> commonHeaders() => {
    'content-type': 'application/json',
    'token': Get.find<AuthController>().accessToken ?? '',
  };
}
