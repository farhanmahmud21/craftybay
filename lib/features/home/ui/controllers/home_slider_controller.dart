import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/home/data/models/slider_model.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  late String _message;
  String? _errorMessage;
  List<SliderModel> _sliders = [];

  bool get inProgress => _inProgress;
  String get message => _message;
  String? get errorMessage => _errorMessage;
  List<SliderModel> get sliders => _sliders;

  Future<bool> getSlider() async {
    _inProgress = true;
    bool isSuccess = false;
    update();
    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.slides,
    );

    if (response.isSuccess) {
      List<SliderModel> list = [];
      isSuccess = true;
      _message = response.responseData!['msg'];
      for (Map<String, dynamic> slider
          in response.responseData!['data']['results']) {
        list.add(SliderModel.fromJson(slider));
      }
      _sliders = list;

      // _sliders = (response.responseData['data']['results'] as List)
      //     .map((item) => SliderModel.fromJson(item))
      //     .toList();
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
