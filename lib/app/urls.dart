import 'package:flutter/material.dart';

class Urls {
  Urls._(); // Private Constructor
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verify_otp = '$_baseUrl/auth/verify-otp';
  static const String login = '$_baseUrl/auth/login';

  static const String slides = '$_baseUrl/slides';
  static String categoryList(int count, int page) =>
      '$_baseUrl/categories?count=$count&page=$page';

  static String productList(int count, int currentPage, String catId) =>
      '$_baseUrl/products?count=$count&page=$currentPage&category=$catId';
}
