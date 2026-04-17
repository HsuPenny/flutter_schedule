import 'package:app_schedule/model/location_data.dart';
import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:flutter/material.dart';

class MapLocationListView extends StatelessWidget {
  final List<PlaceSuggestion> places;
  final Function(PlaceSuggestion) onSelect;
  const MapLocationListView({super.key, required this.places, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(12),
      itemCount: places.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelect(places[index]);
          },
          child: _LocationItemView(place: places[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(height: 1, color: MyColor.lightGrey)
        );
      },
    );
  }
}

class _LocationItemView extends StatelessWidget {
  final PlaceSuggestion place;
  const _LocationItemView({required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: MyColor.lightGrey,
            borderRadius: BorderRadius.circular(24)
          ),
          child: const Icon(Icons.place, color: MyColor.aqua, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place.mainText, style: MyTextStyle.darkGrey(16)),
              Text(place.secondaryText, style: MyTextStyle.lightGrey(14)),
            ],
          )
        )
      ],
    );
  }
}