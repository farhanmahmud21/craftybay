import 'package:craftybay/app/app_AssetsPath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({this.height, this.width, super.key});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssetspath.logo,
      height: height,
      width: width ?? 120,
    );
  }
}
