import 'package:craftybay/features/home/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/productSearch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final name = '/home';

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchC = .new();
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [ProductSearchBar(searchC: searchC)]),
        ),
      ),
    );
  }
}
