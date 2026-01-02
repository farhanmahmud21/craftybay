import 'package:flutter/material.dart';

class ProductCategoriesScreen extends StatelessWidget {
  const ProductCategoriesScreen({super.key});
  static final name = '/product-category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catagories')),
      body: Text('Product'),
    );
  }
}
