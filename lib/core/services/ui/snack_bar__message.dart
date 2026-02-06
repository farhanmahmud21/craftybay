import 'package:flutter/material.dart';

void showSnackMessage(
  BuildContext context,
  String title, [
  bool isError = false,
]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: isError ? Colors.red : Colors.green,
    ),
  );
}
