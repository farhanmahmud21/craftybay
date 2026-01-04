import 'package:craftybay/features/common/ui/screens/product_categories_screen.dart';
import 'package:craftybay/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final name = '/main-navigation';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [HomeScreen(), ProductCategoriesScreen()];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: activeIndex,

        onDestinationSelected: (int index) {
          setState(() {
            activeIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Wishlist',
          ),
        ],
      ),
      body: screens[activeIndex],
    );
  }
}
