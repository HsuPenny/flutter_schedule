import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final double radius;
  final VoidCallback onPressed;
  final BorderSide? borderSide;

  const MyFilledButton({
    super.key,
    required this.text,
    required this.style,
    required this.color,
    required this.onPressed,
    this.radius = 12,
    this.borderSide
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: color,
        side: borderSide ?? BorderSide.none,
        elevation: 3,
        shadowColor: Colors.black54,
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