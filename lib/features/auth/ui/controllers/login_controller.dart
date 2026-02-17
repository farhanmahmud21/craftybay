import 'dart:convert';

import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/auth/data/models/login_request_model.dart';
import 'package:craftybay/features/common/ui/controllers/auth_controller.dart';
import 'package:craftybay/features/common/ui/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  //Loading State
  bool _isProgress = false;

  bool _isObsecureText = false;

  bool get isObesecureText => _isObsecureText;

  late String _message;
  String? _errorMessage;

  bool get isProgress => _isProgress;

  String get message => _message;

  String? get errorMessage => _errorMessage;

  void changeObsecure() {
    _isObsecureText = !_isObsecureText;
    update();
  }

  //Actual Method

  Future<bool> login(LoginRequestModel model) async {
    _isProgress = true;
    bool isSuccess = false;
    update();
    NetworkResponse response = await Get.find<NetworkClient>().postRequest(
      Urls.login,
      body: model.toJson(),
    );
    if (response.isSuccess) {
      await Get.find<AuthController>().saveUserData(
        response.responseData!['data']['token'],
        UserModel.fromJson(response.responseData!['data']['user']),
      );
      isSuccess = true;

      _message = response.responseData!['msg'];
    } else {
      _errorMessage = response.errorMessage;
      isSuccess = false;
    }
    _isProgress = false;
    update();
    return isSuccess;
  }
}
