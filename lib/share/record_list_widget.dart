import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/schedule_data.dart';
import '../my_color.dart';
import '../my_text_style.dart';
import 'status_tag.dart';

class RecordListWidget extends StatelessWidget {
  final ScheduleData item;
  const RecordListWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SvgPicture.asset(
            width: 30,
            'assets/svgs/pin.svg',
            color: MyColor.aqua,
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: MyTextStyle.darkAqua(16, fontWeight: FontWeight.w500),
                  ),
                  if (item.time != null)
                    Text(
                      item.time!,
                      style: MyTextStyle.black(14),
                    ),
                ],
              )
          ),
          const SizedBox(width: 10),
          StatusTag(item: item)
        ],
      ),
    );
  }
}