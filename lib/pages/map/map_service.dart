import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../share/custom_toast.dart';

class MapService {

  /// 取得定位權限
  static Future requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        showToast(message: '無法取得定位權限');
        return;
      }
    }
  }

  /// 取得目前位置
  static Future<Position> fetchCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  /// 開啟外部地圖
  static Future openMapNavigation(double lat, double lng, {String? label}) async {
    final encodedLabel = Uri.encodeComponent(label ?? '目的地');
    String url = '';

    if (Platform.isAndroid) {
      // 嘗試用 Google Maps App
      url = 'geo:$lat,$lng?q=$lat,$lng($encodedLabel)';
    } else if (Platform.isIOS) {
      // Apple Maps
      url = 'http://maps.apple.com/?q=$encodedLabel&ll=$lat,$lng';
    }

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      showToast(message: '無法開啟地圖');
      throw '無法開啟地圖：$url';
    }
  }
}