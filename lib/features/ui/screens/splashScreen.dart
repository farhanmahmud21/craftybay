import 'package:craftybay/features/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_logo.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  static final name = '/';

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> _moveToNextPage() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacementNamed(context, LoginScreen.name);
  }

  @override
  void initState() {
    super.initState();
    _moveToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                'Version 1.0',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
