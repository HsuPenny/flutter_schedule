import 'package:app_schedule/pages/add_record/location_add_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../my_color.dart';
import '../../my_text_style.dart';
import '../../share/my_filled_button.dart';
import '../../share/my_outline_button.dart';

class AddRecordStep2Page extends StatefulWidget {
  const AddRecordStep2Page({super.key});

  @override
  State<StatefulWidget> createState() => _AddRecordStep2PageState();
}

class _AddRecordStep2PageState extends State<AddRecordStep2Page> {

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
        '新增行程（2/2）',
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
                        children: [
                          LocationAddLabel(),
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
                    text: '返回',
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
                    text: '確定新增',
                    style: MyTextStyle.white(16),
                    color: MyColor.darkAqua,
                    radius: 30,
                    onPressed: () {
                      // TODO: 新增
                    }
                )
            )
          ]
      ),
    );
  }
}

class _LocationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_pin, color: MyColor.red, size: 24),
        const SizedBox(width: 12),
        Container(

        ),
      ],
    );
  }
}