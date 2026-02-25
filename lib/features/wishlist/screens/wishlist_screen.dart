import 'package:craftybay/features/product/ui/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static String name = '/wish-list';

  @override
  State<WishListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(title: Text('WishList')),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            // itemBuilder: (context, index) => FittedBox(child: ProductCard()),
            itemBuilder: (context, index) => FittedBox(child: Container()),
          ),
        ),
      ),
    );
  }
}
