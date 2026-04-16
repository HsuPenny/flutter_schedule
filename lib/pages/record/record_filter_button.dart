import 'package:app_schedule/pages/record/record_page.dart';
import 'package:app_schedule/share/my_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:app_schedule/controllers/record_filter_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../my_color.dart';
import '../../my_text_style.dart';

class RecordFilterButton extends StatefulWidget {
  const RecordFilterButton({super.key});

  @override
  State<StatefulWidget> createState() => _RecordFilterButtonState();
}

class _RecordFilterButtonState extends State<RecordFilterButton> {
  final filterController = Get.find<FilterController>();
  final List<StatusFilter> statusList = [
    StatusFilter.finished,
    StatusFilter.unstart,
    StatusFilter.ongoing,
    StatusFilter.overdue
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
        onTap: () {
          Get.bottomSheet(
            _bottomSheet(),
            backgroundColor: MyColor.white
          );
        },
        child: SvgPicture.asset(
          (filterController.statusList.isEmpty) ?
          'assets/svgs/filter_clear.svg' : 'assets/svgs/filter_apply.svg',
          width: 28,
        )
    ));
  }

  Widget _bottomSheet() {
    return Obx(() => Column(
      spacing: 16,
      children: [
        const SizedBox(height: 8),
        Text('篩選狀態', style: MyTextStyle.darkAqua(18, fontWeight: FontWeight.w500)),
        const Divider(color: MyColor.lightGrey),
        Expanded(
          child: Wrap(
            spacing: 20,
            runSpacing: 16,
            children: List.generate(statusList.length, (index) =>
                GestureDetector(
                  onTap: () => filterController.addOrRemoveStatus(statusList[index]),
                  child: _statusChip(statusList[index]),
                )
            ),
          )
        ),
        _sheetFooter()
      ],
    ));
  }

  Widget _statusChip(StatusFilter statusFilter) {
    String text = '';
    switch (statusFilter) {
      case StatusFilter.finished: text = '完成'; break;
      case StatusFilter.unstart: text = '尚未開始'; break;
      case StatusFilter.ongoing: text = '進行中'; break;
      case StatusFilter.overdue: text = '逾期'; break;
    }

    final selected = filterController.statusList.contains(statusFilter);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              color: selected ? MyColor.aqua : MyColor.lightGrey,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Text(text, style: selected ? MyTextStyle.white(14) : MyTextStyle.darkAqua(14)),
        ),

        if (selected)
          Positioned(
            top: -4,
            right: -4,
            child: _selectedDot()
          )
      ]
    );
  }
  Widget _selectedDot() {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(
        color: MyColor.darkAqua,
        shape: BoxShape.circle
      ),
      child: const Icon(Icons.check, size: 12, color: MyColor.white),
    );
  }

  Widget _sheetFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: MyColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, -1),
            blurRadius: 20
          )
        ]
      ),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: MyOutlineButton(
              text: '重設篩選',
              style: MyTextStyle.darkGrey(16),
              color: MyColor.darkGrey,
              radius: 30,
              onPressed: () {
                filterController.clearAll();
              }
            )
          ),
          Expanded(
            child: MyOutlineButton(
              text: '確定',
              style: MyTextStyle.darkAqua(16),
              color: MyColor.darkAqua,
              radius: 30,
              onPressed: () {
                Get.back();
              }
            )
          )
        ]
      ),
    );
  }
}