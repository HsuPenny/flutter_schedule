import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../my_color.dart';
import '../../my_text_style.dart';

class HomeStatisticsCard extends StatefulWidget {
  const HomeStatisticsCard({super.key});

  @override
  State<StatefulWidget> createState() => _HomeStatisticsCardState();
}

class _HomeStatisticsCardState extends State<HomeStatisticsCard> {
  int _pieTouchIndex = -1;
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  BoxShadow get shadow {
    return const BoxShadow(
        color: Colors.black12,
        offset: Offset(2, 2),
        blurRadius: 8
    );
  }

@override
  Widget build(BuildContext context) {
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
            buildColorTag(color: MyColor.green, tag: '完成'),
            const SizedBox(height: 8),
            buildColorTag(color: MyColor.orange, tag: '進行中'),
            const SizedBox(height: 8),
            buildColorTag(color: MyColor.lightGrey, tag: '尚未開始'),
            const SizedBox(height: 8),
            buildColorTag(color: MyColor.red, tag: '逾期'),
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
              color: MyColor.green,
              radius: radius,
              title: isTouched ? '12' : '',
              titleStyle: MyTextStyle.white(14)
          );
        case 1: //進行中
          return PieChartSectionData(
              value: 3,
              color: MyColor.orange,
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
              color: MyColor.red,
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
}