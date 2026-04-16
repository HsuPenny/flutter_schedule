import 'package:app_schedule/model/location_data.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final RxList<LocationData> _locationList = <LocationData>[].obs;

  List<LocationData> get locationList => _locationList;

  void clearList() {
    _locationList.clear();
    update();
  }

  void addLocation(LocationData data) {
    _locationList.add(data);
    update();
  }

  LocationData? getLocation(int index) {
    if (_locationList.length <= index) {
      return null;
    }
    return _locationList[index];
  }
}