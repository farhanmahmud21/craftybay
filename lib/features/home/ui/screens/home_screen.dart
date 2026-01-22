import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/app/app_AssetsPath.dart';
import 'package:craftybay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybay/features/home/ui/widgets/product_card.dart';
import 'package:craftybay/features/home/ui/widgets/product_category.dart';
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
  final TextEditingController searchC = .new();

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
                HomeCarouselSlider(),
                buildSectionHeader(
                  title: 'Catagories',
                  onTapText: () {
                    Get.find<MainBottomNavController>().moveToCategory();
                  },
                ),
                SizedBox(
                  height: 96,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    // primary: true,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) => ProductCategoryItem(),
                  ),
                ),

                buildSectionHeader(title: 'Popular', onTapText: () {}),
                _getPopularProducts(),
                buildSectionHeader(title: 'Special', onTapText: () {}),
                buildSectionHeader(title: 'New', onTapText: () {}),
              ],
            ),
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
        children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
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
