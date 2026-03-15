import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/services/network/network_client.dart';
import 'package:craftybay/features/product/data/models/product_detail_model.dart';
import 'package:get/get.dart';

class ProductDetailListController extends GetxController{
bool inProgress=false;

String message="";

String  _errorMessage = "";

ProductDetailModel? _productDetail;


String get errorMessage=> _errorMessage;

ProductDetailModel? get pDetail => _productDetail;



Future<void> getProductDetail (String id) async{

inProgress=true;
update();

NetworkResponse response=await Get.find<NetworkClient>().getRequest(Urls.productDetailList(id));

if(response.isSuccess){


_productDetail=ProductDetailModel.fromJson(response.responseData!['data']);

message=response.responseData!['msg'];
}

else{
  _errorMessage=response.errorMessage!;
}
inProgress=false;
update();
}


}