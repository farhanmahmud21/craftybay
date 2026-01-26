import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/app/app_AssetsPath.dart';
import 'package:craftybay/features/product/ui/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          _buildproductImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New Year Special Shoe',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Color: Red Size: X',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 16),
              Text(
                '\$ 100',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: AppColor.themeColor),
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(4),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.delete_outlined)),
                SizedBox(height: 16),
                IncDecButton(value: 1, onIncrease: () {}, onDecrease: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildproductImage() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      height: 100,
      width: 100,
      child: Image.asset(AppAssetspath.shoeImage0),
    );
  }
}
