import 'package:craftybay/features/product/data/models/category_model.dart';
import 'package:craftybay/features/product/ui/controllers/product_list_controller.dart';
import 'package:craftybay/features/product/ui/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.catagory});
  static String name = '/product-list';
  final CatagoryModel catagory;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductListController controller = ProductListController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.getProductList(widget.catagory.id);
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      controller.getProductList(widget.catagory.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.catagory.title)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder(
          init: controller,
          builder: (_) => Visibility(
            visible: controller.initailLoadingProgress == false,
            replacement: Center(child: CircularProgressIndicator()),
            child: GridView.builder(
              controller: _scrollController,
              itemCount: controller.getProductModelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => FittedBox(
                child: ProductCard(
                  productModel: controller.getProductModelList[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
