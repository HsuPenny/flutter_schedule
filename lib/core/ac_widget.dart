import 'package:app_schedule/my_color.dart';
import 'package:flutter/cupertino.dart';

Widget appLogo(double width) {
  Widget view = Image.asset(
    'assets/logo/logo.png',
    width: width,
  );
  return view;
}

Widget appLogoNoBG(double width, {Color? color}) {
  Widget view = Image.asset(
    'assets/logo/logo_no_bg.png',
    width: width,
    color: color?? MyColor.white,
  );
  return view;
}