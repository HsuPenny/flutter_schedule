import 'package:app_schedule/my_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_text_style.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Icon? icon;
  final TextInputType? keyboardType;
  const MyTextField({super.key, required this.controller, this.hintText, this.icon, this.keyboardType});

  @override
  State<StatefulWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
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
          Icon(widget.icon?.icon, color: MyColor.aqua, size: 24),
          Expanded(
              child: TextField(
                  controller: widget.controller,
                  cursorColor: MyColor.darkAqua,
                  style: MyTextStyle.darkAqua(16),
                  keyboardType: widget.keyboardType ?? TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: widget.hintText ?? '',
                    hintStyle: MyTextStyle.darkGrey(14),
                  )
              )
          )
        ],
      ),
    );
  }
}