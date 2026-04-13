import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:flutter/material.dart';

class AddRecordTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay time) onChanged;
  const AddRecordTimePicker({super.key, required this.initialTime, required this.onChanged});

  @override
  State<StatefulWidget> createState() => _AddRecordTimePickerState();
}

class _AddRecordTimePickerState extends State<AddRecordTimePicker> {
  Future<void> _pickDate() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.initialTime,
    );

    if (picked != null) {
      widget.onChanged(picked);
    }
  }

  TimeOfDay get time => widget.initialTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickDate();
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
              const Icon(Icons.access_time, color: MyColor.aqua, size: 24),
              Text(
                "${time.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}",
                style: MyTextStyle.darkAqua(16),
              ),
            ],
          )
      ),
    );
  }
}