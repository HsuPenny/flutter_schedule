import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../my_color.dart';
import '../../my_text_style.dart';
import '../../share/record_list_widget.dart';
import '../../share/see_more_button.dart';
import '../main_page.dart';
import 'home_page.dart';

class HomeRecordCard extends StatefulWidget {
  final Function changePage;
  const HomeRecordCard({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _HomeRecordCardState();
}

class _HomeRecordCardState extends State<HomeRecordCard> {
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  BoxShadow get shadow {
    return const BoxShadow(
        color: Colors.black12,
        offset: Offset(2, 2),
        blurRadius: 8
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
                width: 24,
                color: MyColor.aqua,
                'assets/svgs/file.svg'
            ),
            const SizedBox(width: 8),
            Text(
              '行跡紀錄',
              style: MyTextStyle.black(20, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [shadow]
          ),
          child: buildRecordList(),
          // child: noRecord,
        )
      ],
    );
  }

  ///沒紀錄
  Widget get noRecord {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            width: screenWidth * 0.3,
            'assets/png/no_record.png',
          ),
          Text(
            '最近沒有紀錄喔！',
            style: MyTextStyle.black(16),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
  ///有記錄
  Widget buildRecordList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recordList.length,
          itemBuilder: (context, index) {
            return RecordListWidget(item: recordList[index]);
          },
          separatorBuilder: (context, index) {
            return Container(
              color: MyColor.lightGrey,
              height: 1,
              width: double.infinity,
            );
          },
        ),
        const SizedBox(height: 4),
        SeeMoreButton(() => widget.changePage(PageIndex.record))
      ],
    );
  }
}