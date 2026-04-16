import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

void showToast({BuildContext? context, String? title, required String message, ToastGravity? gravity = ToastGravity.CENTER}) {

  var showMessage = message;
  if (title != null) {
    showMessage = '$title\n$message';
  }

  FToast fToast = FToast();
  fToast.init(context ?? navigatorKey.currentContext!);

  Widget toast = Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: MyColor.aqua.withAlpha((255 * 0.3).toInt()),
            offset: const Offset(0, 2),
            blurRadius: 50,
            spreadRadius: -3
        ),
      ],
    ),
    child: Text(
      showMessage,
      textAlign: TextAlign.center,
      style: MyTextStyle.darkAqua(16),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: gravity,
    toastDuration: const Duration(milliseconds: 1600),
  );
}