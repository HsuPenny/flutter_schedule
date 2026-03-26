import 'package:app_schedule/pages/record/record_page.dart';
import 'package:get/get.dart';

///紀錄篩選條件 日期區間、狀態(可複選)
class FilterController extends GetxController {
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  RxList<StatusFilter> statusList = RxList<StatusFilter>();

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();
    DateTime start = DateTime(now.year, now.month, now.day - 7);
    DateTime end = DateTime(now.year, now.month, now.day, 23, 59, 59, 999, 999);
    startDate.value = start;
    endDate.value = end;
    statusList.clear();
  }

  //日期
  void setStartDate(DateTime date) {
    startDate.value = date;
  }
  DateTime getStartDate() {
    return startDate.value;
  }

  void setEndDate(DateTime date) {
    endDate.value = date;
  }
  DateTime getEndDate() {
    return endDate.value;
  }

  //狀態
  void addOrRemoveStatus(StatusFilter statusFilter) {
    if (statusList.contains(statusFilter)) {
      statusList.remove(statusFilter);
    } else {
      statusList.add(statusFilter);
    }
  }
  List<StatusFilter> getStatusList() {
    return statusList;
  }

  void clearAll() {
    startDate.value = DateTime.now();
    endDate.value = DateTime.now();
    statusList.clear();
  }
}