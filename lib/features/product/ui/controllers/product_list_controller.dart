import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/product/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool inProgress = false;
  bool _initailLoadingProgress = false;
  bool get initailLoadingProgress => _initailLoadingProgress;

  int count = 20;
  int currentPage = 0;

  int? _lastPage;

  List<ProductModel> getProductModelList = [];

  Future<void> getProductList(String cId) async {
    if (inProgress || _initailLoadingProgress) {
      return;
    }
    currentPage++;

    if (_lastPage != null && _lastPage! < currentPage) {
      currentPage--;
      return;
    }

    if (currentPage == 1) {
      _initailLoadingProgress = true;
      getProductModelList.clear();
    } else {
      inProgress = true;
    }
    update();

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productList(count, currentPage, cId),
    );
    if (response.isSuccess) {
      _lastPage = response.responseData!['data']['last_page'];
      final product = (response.responseData!['data']['results'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();

      getProductModelList.addAll(product);
    } else {
      currentPage--;
    }
    if (currentPage == 1) {
      _initailLoadingProgress = false;
    } else {
      inProgress = false;
    }
    update();
  }
}
