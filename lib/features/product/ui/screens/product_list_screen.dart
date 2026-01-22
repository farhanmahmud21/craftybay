import 'package:craftybay/features/home/ui/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.catagory});
  static String name = '/product-list';
  final String catagory;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.catagory)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: 50,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) => FittedBox(child: ProductCard()),
        ),
      ),
    );
  }
}
