import 'package:app_schedule/pages/record/record_page.dart';
import 'package:get/get.dart';

enum QuickRange {
  today,
  yesterday,
  thisWeek,
  thisMonth
}

///紀錄篩選條件 日期區間、狀態(可複選)
class FilterController extends GetxController {
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  RxList<StatusFilter> statusList = RxList<StatusFilter>();
  Rx<QuickRange?> quickRange = Rx<QuickRange?>(null);

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();
    DateTime defaultStartDate = now.subtract(const Duration(days: 7));
    DateTime start = startOfDay(defaultStartDate);
    DateTime end = endOfDay(now);
    startDate.value = start;
    endDate.value = end;
    statusList.clear();
  }

  //日期
  void setStartDate(DateTime date) {
    startDate.value = date;
    quickRange.value = null;
  }
  DateTime getStartDate() {
    return startDate.value;
  }

  void setEndDate(DateTime date) {
    endDate.value = date;
    quickRange.value = null;
  }
  DateTime getEndDate() {
    return endDate.value;
  }

  //快速套用日期範圍
  void setQuickRange(QuickRange range) {
    quickRange.value = range;

    final today = DateTime.now();
    switch (range) {
      case QuickRange.today:
        startDate.value = startOfDay(today);
        endDate.value = endOfDay(today);
        break;
      case QuickRange.yesterday:
        final yesterday = today.subtract(const Duration(days: 1));
        startDate.value = startOfDay(yesterday);
        endDate.value = endOfDay(yesterday);
        break;
      case QuickRange.thisWeek:
        final weekday = today.weekday % 7; // 週日變 0
        final start = today.subtract(Duration(days: weekday));
        final end = start.add(const Duration(days: 6));
        startDate.value = startOfDay(start);
        endDate.value = endOfDay(end);
      case QuickRange.thisMonth:
        startDate.value = today.copyWith(day: 1, hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
        endDate.value = DateTime(today.year, today.month + 1, 0, 23, 59, 59, 999, 999);
    }
  }
  DateTime startOfDay(DateTime date) => date.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0,);
  DateTime endOfDay(DateTime date) => date.copyWith(hour: 23, minute: 59, second: 59, millisecond: 999, microsecond: 999,);

  QuickRange? getQuickRange() {
    return quickRange.value;
  }
  String getQuickRangeName(QuickRange quickRange) {
    switch (quickRange) {
      case QuickRange.today:
        return '今日';
      case QuickRange.yesterday:
        return '昨日';
      case QuickRange.thisWeek:
        return '本周';
      case QuickRange.thisMonth:
        return '本月';
      case null:
        return '';
    }
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