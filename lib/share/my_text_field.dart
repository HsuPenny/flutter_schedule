import 'package:app_schedule/my_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_text_style.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final int maxLines;
  const MyTextField({super.key, required this.controller, this.hintText, this.icon, this.keyboardType, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColor.darkAqua, width: 1.5)
      ),
      child: Row(
        spacing: 8,
        children: [
          if (icon != null) Icon(icon?.icon, color: MyColor.aqua, size: 24),
          Expanded(
              child: TextField(
                  controller: controller,
                  cursorColor: MyColor.darkAqua,
                  style: MyTextStyle.darkAqua(16),
                  keyboardType: keyboardType ?? TextInputType.text,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: hintText ?? '',
                    hintStyle: MyTextStyle.darkGrey(16),
                  )
              )
          )
        ],
      ),
    );
  }
}