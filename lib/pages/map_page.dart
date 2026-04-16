import 'package:app_schedule/model/location_data.dart';
import 'package:app_schedule/pages/map/map_manager.dart';
import 'package:app_schedule/share/my_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../my_color.dart';
import '../my_text_style.dart';

class MapPage extends StatefulWidget {
  final Function(LocationData data) onTap;
  const MapPage({super.key, required this.onTap});

  @override
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final searchController = TextEditingController();
  final mapManager = MapManager();

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await mapManager.fetchPosition();
    });
  }

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
        '選擇地點',
        style: MyTextStyle.white(24, fontWeight: FontWeight.w700),
      )
    );
  }

  Widget get body {
    return Stack(
      fit: StackFit.expand,
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: mapManager.userPosition,
            zoom: mapManager.defaultZoom,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _SearchBar(searchController: searchController),
        ),
        Positioned(
          bottom: 20,
          left: 40,
          right: 40,
          child: MyFilledButton(
              text: '確認地點',
              style: MyTextStyle.darkAqua(16),
              color: MyColor.white,
              radius: 24,
              borderSide: const BorderSide(
                  color: MyColor.darkAqua,
                  width: 2
              ),
              onPressed: () {

              }
          )
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const _SearchBar({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.aqua,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hint: Text('請搜尋地點', style: MyTextStyle.darkGrey(16)),
                    border: InputBorder.none,
                  )
              )
            ),
            const Icon(Icons.search, color: MyColor.darkGrey, size: 24)
          ],
        )
      ),
    );
  }
}