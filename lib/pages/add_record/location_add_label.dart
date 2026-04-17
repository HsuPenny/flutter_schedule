import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/location_controller.dart';
import '../map/map_page.dart';

class LocationAddLabel extends StatefulWidget {
  const LocationAddLabel({super.key});

  @override
  State<StatefulWidget> createState() => _LocationAddLabelState();
}

class _LocationAddLabelState extends State<LocationAddLabel> {
  final locationController = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        Get.to(
            MapPage(
              onTap: (data) {
                locationController.addLocation(data);
              }
            )
        );
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: MyColor.aqua, width: 2)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              const Icon(Icons.add, color: MyColor.aqua, size: 24),
              Text(
                "新增地點",
                style: MyTextStyle.darkAqua(16),
              ),
            ],
          )
      ),
    );
  }
}