import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  State<StatefulWidget> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime _date = DateTime.now();
  bool _focused = false;

  Future<void> _pickDate() async {
    setState(() {
      _focused = true;
    });

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) _date = picked;
    setState(() {
      _focused = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickDate();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: _focused ? MyColor.aqua : MyColor.lightGrey,
            width: _focused ? 2 : 1.5,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.calendar_month_rounded,
              color: MyColor.darkAqua,
            ),
            const SizedBox(width: 8),
            Text(
              "${_date.year} / ${_date.month.toString().padLeft(2, '0')} / ${_date.day.toString().padLeft(2, '0')}",
              style: MyTextStyle.darkAqua(14),
            ),
          ],
        ),
      ),
    );
  }
}