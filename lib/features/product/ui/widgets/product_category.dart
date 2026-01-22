import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key});

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
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.themeColor.withOpacity(0.2),
            ),
            child: Icon(Icons.computer, color: AppColor.themeColor, size: 32),
          ),

          Text(
            'Computers',
            style: tTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
