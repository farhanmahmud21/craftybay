import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/auth/data/models/signUp_request_model.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //Loading State

  bool _isProgress = false;

  // Error State

  String? _errorMessage;
  late String _message;
  bool get inProgress => _isProgress;

  String? get errorMessage => _errorMessage;

  String get message => _message;
  // Model Expose
  // actual method

  Future<bool> signup(SignupRequestModel model) async {
    _isProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.signUpUrl, body: model.toJson());

    if (response.isSuccess) {
      _message = response.responseData!['msg'];
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _isProgress = false;

    update();
    return isSuccess;
  }
}
