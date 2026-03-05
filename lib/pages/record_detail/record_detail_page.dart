import 'package:flutter/material.dart';

import '../../model/schedule_item.dart';
import '../../my_color.dart';
import '../../my_text_style.dart';

class RecordDetailPage extends StatefulWidget {
  final ScheduleItem item;
  const RecordDetailPage({super.key, required this.item});

  @override
  State<StatefulWidget> createState() => _RecordDetailPageState();
}

class DetailPageIndex {
  static const int list = 0;
  static const int map = 1;
}

class _RecordDetailPageState extends State<RecordDetailPage> {
  //-----view data
  //-----view data

  //-----sys data
    ScheduleItem get item => widget.item;
  //-----sys data

  //-----localize
    late TabController _tabController;
    int _index = DetailPageIndex.list;
  //-----localize

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  //-----mainView
    PreferredSizeWidget get appBar {
      return AppBar(
        toolbarHeight: screenHeight * 0.08,
        backgroundColor: MyColor.aqua,
        title: Text(
          item.name,
          style: MyTextStyle.white(24, fontWeight: FontWeight.w700),
        ),

      );
    }

    Widget get body {
      return Stack(
        children: [

        ],
      );
    }
  //-----mainView

  //-----subView
    Widget get tabView {
      return TabBarView(
        controller: _tabController,
        children: [

        ],
      );
    }
    Widget get tab {
      return TabBar(
        controller: _tabController,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        tabs: [

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

    void gotoAddNewSchedule() {

    }
  //-----function
}