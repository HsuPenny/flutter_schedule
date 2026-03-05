import 'package:app_schedule/pages/record/record_page.dart';
import 'package:get/get.dart';

///紀錄篩選條件 日期區間、狀態(可複選)
class FilterController extends GetxController {
  Rx<DateTime> date = DateTime.now().obs;
  Rx<StatusFilter> status = StatusFilter.all.obs;

  //日期
  void setDate(DateTime date) {
    this.date.value = date;
  }
  DateTime getDate() {
    return date.value;
  }

  //狀態
  void setStatus(StatusFilter statusFilter) {
    status.value = statusFilter;
  }
  StatusFilter getStatus() {
    return status.value;
  }

  void clearAll() {
    date.value = DateTime.now();
    status.value = StatusFilter.all;
  }
}