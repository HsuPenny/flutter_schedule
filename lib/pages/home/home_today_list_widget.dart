import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/schedule_item.dart';
import '../../my_color.dart';
import '../../my_text_style.dart';
import '../../share/status_tag.dart';

class HomeTodayListWidget extends StatelessWidget {
  final ScheduleItem item;
  const HomeTodayListWidget({super.key, required this.item});

  Color get color {
    Color color;
    switch (item.status) {
      case 0: //未開始
        color = MyColor.darkGrey;
        break;
      case 1: //進行中
        color = MyColor.orange;
        break;
      case 2: //逾期
        color = MyColor.coralPink;
        break;
      case 3: //完成
        color = MyColor.green;
        break;
      default:
        color = MyColor.lightGrey;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    final proceeding = item.status == 1;

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: color,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            item.time!,
            style: MyTextStyle.black(16, fontWeight: proceeding ? FontWeight.w800 : FontWeight.w400),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              item.name,
              style: MyTextStyle.darkAqua(16, fontWeight: proceeding ? FontWeight.w800 : FontWeight.w400),
            )
          ),
          const SizedBox(width: 10),
          StatusTag(item: item)
        ],
      ),
    );
  }
}