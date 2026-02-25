import 'package:craftybay/features/common/ui/controllers/category_list_controller.dart';

import 'package:craftybay/features/product/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({super.key});

  static final name = '/product-category';

  @override
  State<ProductCategoriesScreen> createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  final ScrollController _scrollController = ScrollController();
  final _categoryController = Get.find<CategoryListController>();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryController.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catagories'),
        automaticallyImplyLeading: true,
      ),
      body: GetBuilder<CategoryListController>(
        builder: (controller) {
          if (_categoryController.initialLoadingInProgress) {
            return LinearProgressIndicator();
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: _categoryController.categoryModelList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) => ProductCategoryItem(
                      catagoryModel:
                          _categoryController.categoryModelList[index],
                    ),
                  ),
                ),
              ),
              if (controller.inProgess)
                Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
