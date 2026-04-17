import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationData {
  final String location;
  final LatLng latLng;

  LocationData({required this.location, required this.latLng});
}

class PlaceSuggestion {
  final String placeId;
  final String mainText;
  final String secondaryText;

  PlaceSuggestion({
    required this.placeId,
    required this.mainText,
    required this.secondaryText,
  });

  factory PlaceSuggestion.fromJson(Map<String, dynamic> json) {
    final p = json['placePrediction'];

    return PlaceSuggestion(
      placeId: p['placeId'],
      mainText: p['structuredFormat']['mainText']['text'],
      secondaryText: p['structuredFormat']['secondaryText']['text'],
    );
  }
}

class PlaceDetail {
  final String name;
  final double lat;
  final double lng;

  PlaceDetail({
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory PlaceDetail.fromJson(Map<String, dynamic> json) {
    return PlaceDetail(
      name: json['displayName']['text'],
      lat: json['location']['latitude'],
      lng: json['location']['longitude'],
    );
  }
}