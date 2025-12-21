import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => throw Exception(),
            child: const Text("Throw Test Exception"),
          ),
        ),
      ),
    );

  }
}
