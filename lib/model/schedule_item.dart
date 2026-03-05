class ScheduleItem {
  final String name;
  final String? time;
  final int status; //0.未開始 1.進行中 2.逾期 3.完成
  final List<LocationItem> locationList;

  ScheduleItem({required this.name, this.time, required this.status, required this.locationList});

  factory ScheduleItem.init({required String name, String? time, required int status}) {
    List<LocationItem> list = [
      LocationItem(
        location: '台北101',
        remark: '地標建築',
        lat: 25.033964,
        lng: 121.564468,
        time: '09:00',
      ),
      LocationItem(
        location: '故宮博物院',
        remark: '文化景點',
        lat: 25.102398,
        lng: 121.548483,
        time: '10:30',
      ),
      LocationItem(
        location: '淡水漁人碼頭',
        remark: null,
        lat: 25.295679,
        lng: 121.911842,
        time: '16:00',
      ),
      LocationItem(
        location: '士林夜市',
        remark: '夜市小吃',
        lat: 25.087149,
        lng: 121.525348,
        time: '18:00',
      ),
      LocationItem(
        location: '象山登山步道',
        remark: '賞夜景',
        lat: 25.027368,
        lng: 121.578507,
        time: null,
      ),
    ];

    return ScheduleItem(
      name: name,
      time: time,
      status: status,
      locationList: list
    );
  }
}

class LocationItem {
  final String location;
  final String? remark;
  final double lat;
  final double lng;
  final String? time;

  LocationItem({required this.location, required this.remark, required this.lat, required this.lng, required this.time});
}