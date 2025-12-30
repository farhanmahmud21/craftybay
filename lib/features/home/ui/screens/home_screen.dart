import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
