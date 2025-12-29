import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar() {
  return AppBar(
    actionsPadding: EdgeInsetsGeometry.all(8),
    title: SvgPicture.asset(
      'assets/images/logo_nav.svg',
      height: 30,
      width: 30,
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.person_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
    ],
  );
}
