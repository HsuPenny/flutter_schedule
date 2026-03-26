import 'package:app_schedule/my_color.dart';
import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle aqua(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.aqua, fontSize: fontSize, fontWeight: fontWeight);
  }
  static TextStyle darkAqua(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.darkAqua, fontSize: fontSize, fontWeight: fontWeight);
  }
  static TextStyle lightGrey(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.lightGrey, fontSize: fontSize, fontWeight: fontWeight);
  }
  static TextStyle darkGrey(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.darkGrey, fontSize: fontSize, fontWeight: fontWeight);
  }
  static TextStyle white(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.white, fontSize: fontSize, fontWeight: fontWeight);
  }
  static TextStyle coralPink(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.red, fontSize: fontSize, fontWeight: fontWeight);
  }
  static TextStyle yellow(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.yellow, fontSize: fontSize, fontWeight: fontWeight);
  }
  static TextStyle black(double fontSize, {FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(color: MyColor.black, fontSize: fontSize, fontWeight: fontWeight);
  }
}