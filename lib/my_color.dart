import 'package:flutter/material.dart';

class MyColor {
  static const Color aqua = Color(0xFF309EB8);
  static const Color darkAqua = Color(0xFF064B5A);
  static const Color lightGrey = Color(0xFFD9D9D9);
  static const Color darkGrey = Color(0xFFA6A6A6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFD32F2F);
  static const Color green = Color(0xFF2E7D32);
  static const Color orange = Color(0xFFF57C00);
  static const Color yellow = Color(0xFFFFD54F);
  static const Color black = Color(0xFF000000);

  static const int _mainBlue = 0xFF309EB8;
  static MaterialColor mainBlue = MaterialColor(
    _mainBlue,
    <int, Color>{
      50: const Color(_mainBlue).withOpacity(0.05),
      100: const Color(_mainBlue).withOpacity(0.1),
      200: const Color(_mainBlue).withOpacity(0.2),
      300: const Color(_mainBlue).withOpacity(0.3),
      400: const Color(_mainBlue).withOpacity(0.4),
      500: const Color(_mainBlue).withOpacity(0.5),
      600: const Color(_mainBlue).withOpacity(0.6),
      700: const Color(_mainBlue).withOpacity(0.7),
      800: const Color(_mainBlue).withOpacity(0.8),
      900: const Color(_mainBlue).withOpacity(0.9),
    },
  );

  static const int _lightGray = 0xFF309EB8;
  static MaterialColor lightGray = MaterialColor(
    _lightGray,
    <int, Color>{
      50: const Color(_lightGray).withOpacity(0.05),
      100: const Color(_lightGray).withOpacity(0.1),
      200: const Color(_lightGray).withOpacity(0.2),
      300: const Color(_lightGray).withOpacity(0.3),
      400: const Color(_lightGray).withOpacity(0.4),
      500: const Color(_lightGray).withOpacity(0.5),
      600: const Color(_lightGray).withOpacity(0.6),
      700: const Color(_lightGray).withOpacity(0.7),
      800: const Color(_lightGray).withOpacity(0.8),
      900: const Color(_lightGray).withOpacity(0.9),
    },
  );
}