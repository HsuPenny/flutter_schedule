import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime date) onChanged;
  const DatePickerField({super.key, required this.initialDate, required this.onChanged});

  @override
  State<StatefulWidget> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      widget.onChanged(picked);
    }
  }

  DateTime get date => widget.initialDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickDate();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: MyColor.lightGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "${date.year} / ${date.month.toString().padLeft(2, '0')} / ${date.day.toString().padLeft(2, '0')}",
          style: MyTextStyle.darkAqua(16),
        ),
      ),
    );
  }
}