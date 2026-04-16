import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_service.dart';

class MapManager {
  static final MapManager _instance = MapManager._internal();
  factory MapManager() => _instance;
  MapManager._internal();

  late GoogleMapController controller;
  LatLng userPosition = LatLng(-1, -1);     // 使用者目前座標
  LatLng mapCenter = LatLng(-1, -1);        // 地圖畫面中心座標

  final defaultZoom = 15.0; // 預設縮放等級
  double zoom = 15.0;       // 當前縮放等級

  MarkerId? pendingMarkerId;      // 待顯示資訊視窗的marker

  /// 取得使用者目前定位，並更新內部座標
  Future fetchPosition() async {
    await MapService.requestLocationPermission();
    Position position = await MapService.fetchCurrentLocation();

    final latLng = LatLng(position.latitude, position.longitude);
    userPosition = latLng;
    mapCenter = latLng;
  }

  /// 移動地圖畫面到指定座標，可選擇顯示marker
  void moveCameraTo(LatLng latLng, {String? serialNumber}) {
    mapCenter = latLng;
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

  /// 顯示待顯示marker的資訊視窗
  Future<void> _showPendingMarkerInfo() async {
    if (pendingMarkerId == null) return;
    await controller.showMarkerInfoWindow(pendingMarkerId!);
  }
}