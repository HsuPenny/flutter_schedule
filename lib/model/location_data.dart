import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationData {
  final String location;
  final LatLng latLng;

  LocationData({required this.location, required this.latLng});
}