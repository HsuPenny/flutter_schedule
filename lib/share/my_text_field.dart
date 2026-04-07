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
    return TextField(
      controller: widget.controller,
      cursorColor: MyColor.darkAqua,
      style: MyTextStyle.darkAqua(14),
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        icon: widget.icon,
        iconColor: MyColor.aqua,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: MyColor.aqua, width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: MyColor.darkGrey, width: 2)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        hintText: widget.hintText ?? '',
        hintStyle: MyTextStyle.darkGrey(14),
      )
    );
  }
}