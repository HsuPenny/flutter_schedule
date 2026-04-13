import 'package:app_schedule/pages/add_record/add_record_date_picker.dart';
import 'package:app_schedule/pages/add_record/add_record_time_picker.dart';
import 'package:app_schedule/share/my_filled_button.dart';
import 'package:app_schedule/share/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../my_color.dart';
import '../../my_text_style.dart';
import '../../share/my_outline_button.dart';

class AddRecordPage extends StatefulWidget {
  const AddRecordPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  final titleController = TextEditingController();

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
      foregroundColor: Colors.white,
      backgroundColor: MyColor.aqua,
      centerTitle: true,
      title: Text(
        '新增行程（1/2）',
        style: MyTextStyle.white(24, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget get body {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                spacing: 24,
                children: [
                  MyTextField(
                    controller: titleController,
                    hintText: '請輸入行程名稱',
                    icon: const Icon(Icons.edit),
                  ),

                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                          child: AddRecordDatePicker(
                              initialDate: DateTime.now(),
                              onChanged: (date) {

                              }
                          )
                      ),
                      AddRecordTimePicker(
                          initialTime: TimeOfDay.now(),
                          onChanged: (time) {

                          }
                      )
                    ],
                  ),

                  MyTextField(
                    controller: titleController,
                    hintText: '請輸入備註',
                    maxLines: 3,
                  ),
                ]
              )
            )
          )
        ),
        footer
      ],
    );
  }
  Widget get footer {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
          color: MyColor.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
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
                    text: '取消',
                    style: MyTextStyle.darkGrey(16),
                    color: MyColor.darkGrey,
                    radius: 30,
                    onPressed: () {
                      Get.back();
                    }
                )
            ),
            Expanded(
                child: MyFilledButton(
                    text: '下一步',
                    style: MyTextStyle.white(16),
                    color: MyColor.darkAqua,
                    radius: 30,
                    onPressed: () {
                      //TODO: 新增地點
                    }
                )
            )
          ]
      ),
    );
  }
}