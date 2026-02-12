import 'package:craftybay/app/appColor.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatelessWidget {
  const IncDecButton({
    super.key,
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
  });
  final int value;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(icon: Icons.remove, onWork: onDecrease),
        Text('$value', style: Theme.of(context).textTheme.labelLarge),
        _buildButton(icon: Icons.add, onWork: onIncrease),
      ],
    );
  }

  Widget _buildButton({required IconData icon, required VoidCallback onWork}) {
    return GestureDetector(
      onTap: onWork,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 30,
        width: 32,
        decoration: BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}
