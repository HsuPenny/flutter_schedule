import 'package:app_schedule/my_text_style.dart';
import 'package:app_schedule/pages/main_page.dart';
import 'package:app_schedule/share/record_list_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'home_today_list_widget.dart';
import '../../model/schedule_item.dart';
import '../../my_color.dart';

class HomePage extends StatefulWidget {
  final Function changePage;
  const HomePage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //-----view data
  //-----view data

  //-----sys data
  //-----sys data

  //-----localize
    int _pieTouchIndex = -1;
  //-----localize

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body
    );
  }

  //-----mainView
    PreferredSizeWidget get appBar {
      return AppBar(
        toolbarHeight: screenHeight * 0.06,
        backgroundColor: MyColor.aqua,
        automaticallyImplyLeading: false, //不加返回鍵
        title: Text(
          'XXX，您好！',
          style: MyTextStyle.white(24, fontWeight: FontWeight.w700),
        ),
      );
    }

    Widget get body {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              buildTodayCard(),
              const SizedBox(height: 30),
              buildRecordCard(),
              const SizedBox(height: 30),
              buildStatisticsCard()
            ],
          ),
        ),
      );
    }
  //-----mainView

  //-----subView
    ///今日總攬
    Widget buildTodayCard() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                width: 24,
                color: MyColor.aqua,
                'assets/svgs/calendar.svg'
              ),
              const SizedBox(width: 8),
              Text(
                '今日行跡',
                style: MyTextStyle.black(20, fontWeight: FontWeight.w700),
              )
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [shadow]
            ),
            child: buildTodaySchedule()
            // child: todayNoSchedule
          )
        ],
      );
    }
    ///今日無行程
    Widget get todayNoSchedule {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              width: screenWidth * 0.3,
              'assets/png/calendar.png',
            ),
            Text(
              '今日沒有安排行程，可以好好休息～',
              style: MyTextStyle.darkGrey(14),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    }
    ///已建立
    Widget buildTodaySchedule() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return HomeTodayListWidget(item: list[index]);
        },
        separatorBuilder: (context, index) {
          return Container(
            color: MyColor.lightGrey,
            height: 1,
            width: double.infinity,
          );
        },
      );
    }


    ///顯示近三天紀錄
    Widget buildRecordCard() {
      return Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                width: 24,
                color: MyColor.aqua,
                'assets/svgs/file.svg'
              ),
              const SizedBox(width: 8),
              Text(
                '行跡紀錄',
                style: MyTextStyle.black(20, fontWeight: FontWeight.w700),
              )
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [shadow]
            ),
            child: buildRecordList(),
            // child: noRecord,
          )
        ],
      );
    }
    ///沒紀錄
    Widget get noRecord {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              width: screenWidth * 0.3,
              'assets/png/no_record.png',
            ),
            Text(
              '最近沒有紀錄喔！',
              style: MyTextStyle.black(16),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    }
    ///有記錄
    Widget buildRecordList() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recordList.length,
            itemBuilder: (context, index) {
              return RecordListWidget(item: recordList[index]);
            },
            separatorBuilder: (context, index) {
              return Container(
                color: MyColor.lightGrey,
                height: 1,
                width: double.infinity,
              );
            },
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              widget.changePage(PageIndex.record);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '查看更多',
                  style: MyTextStyle.darkAqua(14, fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset(
                  width: 14,
                  color: MyColor.darkAqua,
                  'assets/svgs/double_arrow.svg',
                )
              ],
            ),
          )
        ],
      );
    }


    ///本週統計
    Widget buildStatisticsCard() {
      return Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                  width: 24,
                  color: MyColor.aqua,
                  'assets/svgs/pie_chart.svg'
              ),
              const SizedBox(width: 8),
              Text(
                '本週統計',
                style: MyTextStyle.black(20, fontWeight: FontWeight.w700),
              )
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [shadow]
            ),
            child: buildStatisticsChart(),
            // child: noStatistics,
          )
        ],
      );
    }
    ///沒有統計資料
    Widget get noStatistics {
      return Column(
        children: [
          Text(
            '本週尚無行程統計',
            style: MyTextStyle.black(16),
          ),
          const SizedBox(height: 12),
        ],
      );
    }
    ///圖表
    Widget buildStatisticsChart() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: screenWidth * 0.4,
            width: screenWidth * 0.4,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    startDegreeOffset: 90,
                    centerSpaceRadius: 35,
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            _pieTouchIndex = -1;
                            return;
                          }
                          _pieTouchIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    sections: showingSections()
                  )
                ),
                const Center(
                  child: Text('75%'),
                )
              ],
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildColorTag(color: MyColor.darkAqua, tag: '完成'),
              const SizedBox(height: 8),
              buildColorTag(color: MyColor.aqua, tag: '進行中'),
              const SizedBox(height: 8),
              buildColorTag(color: MyColor.lightGrey, tag: '尚未開始'),
              const SizedBox(height: 8),
              buildColorTag(color: MyColor.coralPink, tag: '逾期'),
            ],
          )
        ],
      );
    }
    ///圓餅圖區塊
    List<PieChartSectionData> showingSections() {
      return List.generate(4, (i) {
        final isTouched = i == _pieTouchIndex;
        final radius = isTouched ? 55.0 : 50.0;
        switch (i) {
          case 0: //完成
            return PieChartSectionData(
              value: 12,
              color: MyColor.darkAqua,
              radius: radius,
              title: isTouched ? '12' : '',
              titleStyle: MyTextStyle.white(14)
            );
          case 1: //進行中
            return PieChartSectionData(
              value: 3,
              color: MyColor.aqua,
              radius: radius,
              title: isTouched ? '3' : '',
              titleStyle: MyTextStyle.white(14)
            );
          case 2: //未開始
            return PieChartSectionData(
              value: 5,
              color: MyColor.lightGrey,
              radius: radius,
              title: isTouched ? '5' : '',
              titleStyle: MyTextStyle.black(14)
            );
          case 3: //逾期
            return PieChartSectionData(
              value: 1,
              color: MyColor.coralPink,
              radius: radius,
              title: isTouched ? '1' : '',
              titleStyle: MyTextStyle.white(14)
            );
          default:
            throw Error();
        }
      });
    }
    ///圖表色卡
    Widget buildColorTag({required Color color, required String tag}) {
      return Row(
        children: [
          Container(
            width: 30,
            height: 15,
            color: color,
          ),
          const SizedBox(width: 10),
          Text(
            tag,
            style: MyTextStyle.black(14),
          )
        ],
      );
    }
  //-----subView

  //-----function
    double get screenWidth {
      return MediaQuery.of(context).size.width;
    }

    double get screenHeight {
      return MediaQuery.of(context).size.height;
    }

    BoxShadow get shadow {
      return const BoxShadow(
          color: Colors.black12,
          offset: Offset(2, 2),
          blurRadius: 8
      );
    }
  //-----function
}

List<ScheduleItem> list = [
  ScheduleItem.init(name: '拜訪客戶A', status: 2, time: '10:00'),
  ScheduleItem.init(name: '會議', status: 0, time: '14:30'),
  ScheduleItem.init(name: '視察工地B', status: 1, time: '18:00'),
];
List<ScheduleItem> recordList = [
  ScheduleItem.init(name: '拜訪客戶A', status: 3, time: '2025/08/20 14:30'),
  ScheduleItem.init(name: '會議', status: 0, time: '2025/08/19 10:00'),
  ScheduleItem.init(name: '視察工地B', status: 2, time: '2025/08/18 18:00'),
];