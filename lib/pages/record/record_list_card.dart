import 'package:app_schedule/share/record_list_widget.dart';
import 'package:flutter/material.dart';

import '../../model/schedule_item.dart';
import '../../my_color.dart';

class RecordListCard extends StatelessWidget {
  ScheduleItem item;
  RecordListCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {

      },
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 2),
                blurRadius: 8
              )
            ]
        ),
        child: RecordListWidget(item: item),
      ),
    );
  }
}