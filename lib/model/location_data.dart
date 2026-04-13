import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationData {
  final String location;
  final LatLng latlng;

  LocationData({required this.location, required this.latlng});
}