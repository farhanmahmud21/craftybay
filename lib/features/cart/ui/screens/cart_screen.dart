import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/app/app_AssetsPath.dart';
import 'package:craftybay/features/cart/ui/widgets/cart_item.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) => CartItem(),
              ),
            ),
          ),
          _buildPriceAndCheckoutSection(context),
        ],
      ),
    );
  }

  Widget _buildPriceAndCheckoutSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColor.themeColor.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: Theme.of(context).textTheme.labelLarge),
              Text(
                '\$1000',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: AppColor.themeColor),
              ),
            ],
          ),

          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Checkout',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
