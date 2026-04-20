import 'package:app_schedule/model/record_data.dart';
import 'package:get/get.dart';

class RecordController extends GetxController {
  final RxList<RecordData> _recordList = <RecordData>[].obs;

  List<RecordData> get recordList => _recordList;

  void clearList() {
    _recordList.clear();
    update();
  }

  void addRecord(RecordData data) {
    _recordList.add(data);
    update();
  }

  RecordData? getRecord(int index) {
    if (_recordList.length <= index) {
      return null;
    }
    return _recordList[index];
  }
}