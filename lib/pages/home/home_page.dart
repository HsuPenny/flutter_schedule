import 'package:app_schedule/my_text_style.dart';
import 'package:app_schedule/pages/home/home_record_card.dart';
import 'package:app_schedule/pages/home/home_statistics_card.dart';
import 'package:app_schedule/pages/home/home_today_card.dart';
import 'package:flutter/material.dart';

import '../../model/schedule_item.dart';
import '../../my_color.dart';

class HomePage extends StatefulWidget {
  final Function changePage;
  const HomePage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body
    );
  }

  PreferredSizeWidget get appBar {
    return AppBar(
      toolbarHeight: screenHeight * 0.06,
      backgroundColor: MyColor.aqua,
      automaticallyImplyLeading: false, //不加返回鍵
      title: Text(
        'XXX，您好！',
        style: MyTextStyle.white(24, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget get body {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            HomeTodayCard(changePage: widget.changePage),
            const SizedBox(height: 30),
            HomeRecordCard(changePage: widget.changePage),
            const SizedBox(height: 30),
            const HomeStatisticsCard()
          ],
        ),
      ),
    );
  }
}

List<ScheduleItem> list = [
  ScheduleItem.init(name: '拜訪客戶A', status: 2, time: '10:00'),
  ScheduleItem.init(name: '會議', status: 0, time: '14:30'),
  ScheduleItem.init(name: '視察工地B', status: 1, time: '18:00'),
];
List<ScheduleItem> recordList = [
  ScheduleItem.init(name: '拜訪客戶A', status: 3, time: '2025/08/20 14:30'),
  ScheduleItem.init(name: '會議', status: 0, time: '2025/08/19 10:00'),
  ScheduleItem.init(name: '視察工地B', status: 2, time: '2025/08/18 18:00'),
];