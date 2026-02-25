import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/app/app_AssetsPath.dart';
import 'package:craftybay/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.themeColor.withOpacity(0.1),
            offset: Offset(0, 1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 140,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: (productModel.icon.isNotEmpty)
                ? Image.network(productModel.icon.first, height: 80, width: 80)
                : Icon(Icons.image_not_supported),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productModel.currentPrice}',
                      style: TextStyle(color: AppColor.themeColor),
                    ),
                    Wrap(
                      children: [
                        Icon(Icons.star, size: 18, color: Colors.amber),
                        Text('4.8', style: TextStyle(color: Colors.grey)),
                      ],
                    ),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      color: AppColor.themeColor,
                      child: Icon(
                        Icons.favorite_outline_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
