import 'package:craftybay/features/home/ui/widgets/product_category.dart';
import 'package:craftybay/features/product/ui/screens/product_categories_screen.dart';
import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProductSearchBar(searchC: searchC),
              HomeCarouselSlider(),
              buildSectionHeader(
                title: 'Catagories',
                onTapText: () {
                  Navigator.pushReplacementNamed(
                    context,
                    ProductCategoriesScreen.name,
                  );
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
              buildSectionHeader(title: 'Special', onTapText: () {}),
              buildSectionHeader(title: 'New', onTapText: () {}),
            ],
          ),
        ),
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
