import 'package:app_schedule/pages/record/record_filter_button.dart';
import 'package:app_schedule/pages/record/record_filter_controller.dart';
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
  //-----view data
    final filterController = Get.find<FilterController>();
  //-----view data

  //-----sys data
  //-----sys data

  //-----localize
  //   StatusFilter _status = StatusFilter.all;
  //-----localize

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  //-----mainView
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
      return Container(
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
      );
    }
  //-----mainView

  //-----subView


  //   Widget statusDropDown() {
  //     return Obx(() =>
  //       Container(
  //         width: 130,
  //         padding: const EdgeInsets.symmetric(horizontal: 16),
  //         decoration: BoxDecoration(
  //           color: const Color(0xFFEDEDED),
  //           borderRadius: BorderRadius.circular(24)
  //         ),
  //         child: DropdownButtonFormField(
  //             style: MyTextStyle.darkAqua(16, fontWeight: FontWeight.w600),
  //             decoration: const InputDecoration(
  //               border: InputBorder.none,
  //               enabledBorder: InputBorder.none,
  //               focusedBorder: InputBorder.none,
  //               contentPadding: EdgeInsets.zero,
  //             ),
  //             value: filterController.getStatus(),
  //             items: [
  //               buildDropDownItem(StatusFilter.all),
  //               buildDropDownItem(StatusFilter.finished),
  //               buildDropDownItem(StatusFilter.unstart),
  //               buildDropDownItem(StatusFilter.ongoing),
  //               buildDropDownItem(StatusFilter.overdue),
  //             ],
  //             onChanged: (val) {
  //               if (val is StatusFilter) filterController.setStatus(val);
  //             }
  //         ),
  //       )
  //     );
  //   }
  //   DropdownMenuItem buildDropDownItem(StatusFilter statusFilter) {
  //     String text = '';
  //     switch (statusFilter) {
  //       case StatusFilter.all: text = '全部'; break;
  //       case StatusFilter.finished: text = '完成'; break;
  //       case StatusFilter.unstart: text = '尚未開始'; break;
  //       case StatusFilter.ongoing: text = '進行中'; break;
  //       case StatusFilter.overdue: text = '逾期'; break;
  //     }
  //
  //     return DropdownMenuItem(
  //       value: statusFilter,
  //       child: Center(
  //         child: Text(
  //           text,
  //           style: MyTextStyle.darkAqua(16, fontWeight: FontWeight.w600),
  //         ),
  //       )
  //     );
  //   }
  //-----subView

  //-----function
    double get screenWidth {
      return MediaQuery.of(context).size.width;
    }

    double get screenHeight {
      return MediaQuery.of(context).size.height;
    }
  //-----function
}