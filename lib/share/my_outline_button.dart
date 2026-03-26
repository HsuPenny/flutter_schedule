import 'package:flutter/material.dart';

class MyOutlineButton extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final double radius;
  final VoidCallback onPressed;
  const MyOutlineButton({super.key, required this.text, required this.style, required this.color, required this.onPressed, this.radius = 12});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        side: BorderSide(color: color, width: 1.5),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}