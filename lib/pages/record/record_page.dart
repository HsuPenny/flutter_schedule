import 'package:app_schedule/pages/record/record_filter_button.dart';
import 'package:app_schedule/controllers/record_filter_controller.dart';
import 'package:app_schedule/pages/record/record_list_card.dart';
import 'package:app_schedule/share/date_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../my_color.dart';
import '../../my_text_style.dart';
import '../home/home_page.dart';

enum StatusFilter{
  finished,
  unstart,
  ongoing,
  overdue
}

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final filterController = Get.find<FilterController>();
  final List<QuickRange> rangeList = [QuickRange.today, QuickRange.yesterday, QuickRange.thisWeek, QuickRange.thisMonth];

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  PreferredSizeWidget get appBar {
    return AppBar(
      toolbarHeight: screenHeight * 0.08,
      backgroundColor: MyColor.aqua,
      automaticallyImplyLeading: false, //不加返回鍵
      title: Text(
        '紀錄',
        style: MyTextStyle.white(24, fontWeight: FontWeight.w700),
      ),
      actions: const [
        RecordFilterButton(),
        SizedBox(width: 16)
      ],
    );
  }

  Widget get body {
    return Obx(() => Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              DatePickerField(
                initialDate: filterController.getStartDate(),
                onChanged: (date) {
                  filterController.setStartDate(date);
                }
              ),
              Text('~', style: MyTextStyle.darkAqua(20)),
              DatePickerField(
                initialDate: filterController.getEndDate(),
                onChanged: (date) {
                  filterController.setEndDate(date);
                }
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: List.generate(rangeList.length, (index) {
              return buildRangeChip(rangeList[index], onTap: () {
                filterController.setQuickRange(rangeList[index]);
              });
            }),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recordList.length,
            itemBuilder: (context, index) {
              return RecordListCard(item: recordList[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
          )
        ],
      ),
    ));
  }

  Widget buildRangeChip(QuickRange quickRange, {required Function() onTap}) {
    final selected = filterController.getQuickRange() == quickRange;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? MyColor.darkAqua : MyColor.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? Colors.transparent : MyColor.darkAqua)
        ),
        child: Text(
          filterController.getQuickRangeName(quickRange),
          style: selected ? MyTextStyle.white(12) : MyTextStyle.darkAqua(12),
        ),
      )
    );
  }
}