import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../my_color.dart';
import '../../my_text_style.dart';
import '../../share/see_more_button.dart';
import '../main_page.dart';
import 'home_page.dart';
import 'home_today_list_widget.dart';

class HomeTodayCard extends StatefulWidget{
  final Function changePage;
  const HomeTodayCard({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _HomeTodayCardState();
}

class _HomeTodayCardState extends State<HomeTodayCard> {
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
                width: 24,
                color: MyColor.aqua,
                'assets/svgs/calendar.svg'
            ),
            const SizedBox(width: 8),
            Text(
              '今日行跡',
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
            child: buildTodaySchedule()
          // child: todayNoSchedule
        )
      ],
    );
  }

  ///今日無行程
  Widget get todayNoSchedule {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            width: screenWidth * 0.3,
            'assets/png/calendar.png',
          ),
          Text(
            '今日沒有安排行程，可以好好休息～',
            style: MyTextStyle.darkGrey(14),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
  ///已建立
  Widget buildTodaySchedule() {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return HomeTodayListWidget(item: list[index]);
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