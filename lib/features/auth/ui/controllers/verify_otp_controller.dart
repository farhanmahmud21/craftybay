import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/auth/data/models/verify_otp_request.dart';
import 'package:craftybay/features/auth/ui/controllers/signup_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  // Loading State
  bool _inProgress = false;
  bool _isSuccess = true;
  // Error State
  String? _errorMessage;
  late String _message;

  bool get inProgress => _inProgress;
  bool get isSuccess => _isSuccess;

  String? get errorMessage => _errorMessage;

  String get message => _message;
  //Data Model Expose

  // actual method

  Future<bool> verifyOtp(VerifyOtpRequestModel model) async {
    _inProgress = true;

    _isSuccess = false;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.verify_otp, body: model.toJson());

    if (response.isSuccess) {
      _message = response.responseData!['msg'];
      _errorMessage = null;
      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
      _isSuccess = false;
    }
    _inProgress = false;
    update();
    return _isSuccess;
  }
}
