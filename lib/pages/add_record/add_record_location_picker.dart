import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:flutter/material.dart';

class AddRecordLocationPicker extends StatefulWidget {
  final Function() onChanged;
  const AddRecordLocationPicker({super.key, required this.onChanged});

  @override
  State<StatefulWidget> createState() => _AddRecordLocationPickerState();
}

class _AddRecordLocationPickerState extends State<AddRecordLocationPicker> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MyColor.darkAqua, width: 1.5)
          ),
          child: Row(
            spacing: 8,
            children: [
              const Icon(Icons.location_on, color: MyColor.aqua, size: 24),
              Text(
                "選擇地點",
                style: MyTextStyle.darkAqua(16),
              ),
            ],
          )
      ),
    );
  }
}