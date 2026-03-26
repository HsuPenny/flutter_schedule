import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/schedule_item.dart';
import '../my_color.dart';

class StatusTag extends StatelessWidget {
  ScheduleItem item;
  StatusTag({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.transparent;
    Color bdColor;
    Color txtColor = MyColor.white;
    String text;
    if (item.status == 0) { //未開始
      bdColor = MyColor.darkGrey;
      txtColor = MyColor.darkGrey;
      text = '尚未開始';
    } else if (item.status == 1) { //進行中
      bgColor = MyColor.orange;
      bdColor = Colors.transparent;
      text = '進行中';
    } else if (item.status == 2) { //逾期
      bdColor = MyColor.red;
      txtColor = MyColor.red;
      text = '逾期';
    } else { //完成
      bdColor = MyColor.green;
      txtColor = MyColor.green;
      text = '完成';
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(color: bdColor, width: 1.5)
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            color: txtColor
        ),
      ),
    );
  }
}