import 'package:craftybay/features/common/ui/controllers/category_list_controller.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/home/ui/controllers/home_slider_controller.dart';
import 'package:craftybay/features/product/ui/widgets/product_card.dart';
import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:craftybay/features/product/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/appbar.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/productSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchC = TextEditingController();
  final controller = Get.find<HomeSliderController>();
  final category_controller = Get.find<CategoryListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProductSearchBar(searchC: searchC),
                GetBuilder<HomeSliderController>(
                  builder: (_) => Visibility(
                    visible: controller.inProgress == false,
                    replacement: CircularProgressIndicator.adaptive(),
                    child: HomeCarouselSlider(sliders: controller.sliders),
                  ),
                ),
                buildSectionHeader(
                  title: 'Categories',
                  onTapText: () {
                    Get.find<MainBottomNavController>().moveToCategory();
                  },
                ),
                _getCategoryList(),

                buildSectionHeader(title: 'Popular', onTapText: () {}),
                _getPopularProducts(),
                buildSectionHeader(title: 'Special', onTapText: () {}),
                _getSpecialProducts(),
                buildSectionHeader(title: 'New', onTapText: () {}),
                _getNewProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 96,
      child: GetBuilder<CategoryListController>(
        builder: (controller) => ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 20),
          scrollDirection: Axis.horizontal,
          itemCount: Get.find<CategoryListController>().categoryLength,
          // primary: true,
          // shrinkWrap: true,
          itemBuilder: (context, index) => ProductCategoryItem(
            catagoryModel: category_controller.categoryModelList[index],
          ),
        ),
      ),
    );
  }

  Widget _getPopularProducts() {
    // return ProductCard();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [1, 2, 3, 4]
            .map(
              (e) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProductDetailsScreen.name,
                  arguments: '123',
                ),
                child: Container(),
                // ProductCard(),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _getSpecialProducts() {
    // return ProductCard();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        // children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _getNewProducts() {
    // return ProductCard();

    return SizedBox(
      height: 175,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (context, index) => Container(),
        // ProductCard(),
        itemCount: 4,
      ),
    );
  }

  Row buildSectionHeader({
    required String title,
    required VoidCallback onTapText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(onPressed: onTapText, child: Text('See All')),
      ],
    );
  }
}
