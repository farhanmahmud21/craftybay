import 'package:craftybay/app/appColor.dart';
import 'package:flutter/material.dart';

class Apptheme {
  static ThemeData get lightTheme {
    return ThemeData(
      //Color(0xFF07ADAE)
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.themeColor),
      textTheme: _textTheme,
      //Input Decoration
      inputDecorationTheme: _inputDecorationTheme,

      //Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: AppColor.themeColor,

          padding: EdgeInsetsGeometry.all(15),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
      ),

      // Icon Button
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(backgroundColor: Colors.grey.shade300),
      ),
    );
  }

  static OutlineInputBorder _getInputColor(Color color, [double? width]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width ?? 1),
    );
  }

  // Text Theme
  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 28,
        color: Color(0xEC111010),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: Color(0xEC111010),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Color(0xEC111010),
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.grey,
      ),
    );
  }

  // Input Decoration
  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      hintStyle: TextStyle(color: Colors.grey),
      border: _getInputColor(AppColor.themeColor),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.themeColor),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.themeColor, width: 2),
      ),
      errorBorder: _getInputColor(Colors.red),
    );
  }
}
