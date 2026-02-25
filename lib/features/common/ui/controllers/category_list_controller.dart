import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/services/network/network_client.dart';

import 'package:craftybay/features/product/data/models/category_model.dart';

import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool inProgess = false;
  late String _message;
  int count = 30;
  int _currentPage = 0;
  int? lastPage;
  bool _initialLoadingInProgress = false;
  bool get initialLoadingInProgress => _initialLoadingInProgress;

  String get message => _message;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  int get categoryLength =>
      _categoryModelList.length > 10 ? 10 : _categoryModelList.length;
  final List<CatagoryModel> _categoryModelList = [];
  List<CatagoryModel> get categoryModelList => _categoryModelList;

  Future<void> getCategoryList() async {
    if (inProgess || _initialLoadingInProgress) return;

    _currentPage++;

    if (lastPage != null && lastPage! < _currentPage) {
      _currentPage--;
      return;
    }

    if (_currentPage == 1) {
      _categoryModelList.clear();
      _initialLoadingInProgress = true;
    } else {
      inProgess = true;
    }
    update();

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.categoryList(count, _currentPage),
    );
    if (response.isSuccess) {
      lastPage = response.responseData!['data']['last_page'];
      final newCategories = (response.responseData!['data']['results'] as List)
          .map((category) => CatagoryModel.fromModel(category))
          .toList();
      _categoryModelList.addAll(newCategories);
      _message = response.responseData!['msg'];
    } else {
      _errorMessage = response.errorMessage;
      _currentPage--;
    }
    if (_currentPage == 1) {
      _initialLoadingInProgress = false;
    } else {
      inProgess = false;
    }
    update();
  }
}
