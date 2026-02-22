import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/features/product/data/models/category_model.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key, required this.catagoryModel});
  final CatagoryModel catagoryModel;
  @override
  Widget build(BuildContext context) {
    final tTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProductListScreen.name,
        arguments: 'Shoes',
      ),
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.themeColor.withOpacity(0.2),
            ),
            child: Image.network(
              catagoryModel.icon,
              height: 32,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          ),

          Text(
            catagoryModel.title,
            // catagoryModel.title.split(' ').first,
            style: tTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
