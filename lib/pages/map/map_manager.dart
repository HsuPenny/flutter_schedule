import 'package:app_schedule/config/ApiConfig.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

import 'dart:convert';
import '../../model/location_data.dart';
import 'map_service.dart';

class MapManager {
  static final MapManager _instance = MapManager._internal();
  factory MapManager() => _instance;
  MapManager._internal();

  late GoogleMapController controller;
  LatLng latLng = const LatLng(-1, -1);

  final defaultZoom = 15.0; // 預設縮放等級

  MarkerId? pendingMarkerId;      // 待顯示資訊視窗的marker

  /// 取得使用者目前定位，並更新內部座標
  Future fetchPosition() async {
    await MapService.requestLocationPermission();
    Position position = await MapService.fetchCurrentLocation();
    latLng = LatLng(position.latitude, position.longitude);
  }

  /// 移動地圖畫面到指定座標，可選擇顯示marker
  void moveCameraTo(LatLng latLng, {String? serialNumber}) {
    CameraPosition currentPosition = CameraPosition(
      target: latLng,
      zoom: defaultZoom,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));

    if (serialNumber != null) {
      pendingMarkerId = MarkerId(serialNumber);
    } else {
      pendingMarkerId = null;
    }
    _showPendingMarkerInfo();
  }

  /// 搜尋地點
  Future<List<PlaceSuggestion>> searchPlace(String input) async {
    final url = Uri.parse(
      "https://places.googleapis.com/v1/places:autocomplete",
    );

    final response = await post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-Goog-Api-Key": ApiConfig.googleApiKey,
      },
      body: jsonEncode({
        "input": input,
        "languageCode": "zh-TW"
      }),
    );

    final data = jsonDecode(response.body);
    final list = (data as List)
        .map((e) => PlaceSuggestion.fromJson(e))
        .toList();
    return list;
  }

  Future<PlaceDetail> getPlaceDetail(String placeId) async {
    final url = Uri.parse(
      "https://places.googleapis.com/v1/places/$placeId",
    );

    final response = await get(
      url,
      headers: {
        "X-Goog-Api-Key": ApiConfig.googleApiKey,
        "X-Goog-FieldMask": "location,displayName",
      },
    );

    final data = jsonDecode(response.body);
    final place = PlaceDetail.fromJson(data);
    return place;
  }

  /// 顯示待顯示marker的資訊視窗
  Future<void> _showPendingMarkerInfo() async {
    if (pendingMarkerId == null) return;
    await controller.showMarkerInfoWindow(pendingMarkerId!);
  }
}