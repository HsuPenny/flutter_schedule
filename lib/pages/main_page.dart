import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/my_text_style.dart';
import 'package:app_schedule/pages/home/home_page.dart';
import 'package:app_schedule/pages/record/record_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'add_record/add_record_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class PageIndex {
  static const int home = 0;
  static const int record = 1;
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  //-----view data
  //-----view data

  //-----sys data
  //-----sys data

  //-----localize
    late TabController _tabController;
    int _index = PageIndex.home;
  //-----localize

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabView,
      bottomNavigationBar: footer,
      floatingActionButton: CircularFab(
        onPressed: () {
          Get.to(() => const AddRecordPage());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //-----mainView
    Widget get tabView {
      return TabBarView(
        controller: _tabController,
        children: [
          HomePage(changePage: (index) {
            changePage(index);
          }),
          const RecordPage()
        ],
      );
    }

    Widget get footer {
      return Container(
        width: screenWidth,
        height: screenHeight * 0.1,
        decoration: const BoxDecoration(
          color: MyColor.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 20,
              color: Colors.black12
            )
          ]
        ),
        child: TabBar(
          controller: _tabController,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          tabs: [
            buildTabView(index: 0, path: 'assets/svgs/home.svg', text: '首頁'),
            buildTabView(index: 1, path: 'assets/svgs/document.svg', text: '紀錄'),
          ],
          indicatorColor: Colors.transparent,
        ),
      );
    }
  //-----mainView

  //-----subView
    Widget buildTabView({required int index, required String path, required String text}) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            path,
            width: screenWidth * 0.08,
            color: (index == _index) ? MyColor.aqua : MyColor.lightGrey,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: (index == _index) ? MyTextStyle.aqua(14) : MyTextStyle.lightGrey(14),
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

    void changePage(int index) {
      _tabController.animateTo(index);
      setState(() {
        _index = index;
      });
    }

    void onInit() {
      _tabController = TabController(length: 2, vsync: this);
    }

    void onDispose() {
      _tabController.dispose();
    }
  //-----function
}

class CircularFab extends StatelessWidget {
  final VoidCallback onPressed;

  const CircularFab({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColor.aqua,
      shape: const CircleBorder(),
      elevation: 3,
      shadowColor: Colors.black54,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: const SizedBox(
          width: 45,
          height: 45,
          child: Center(
            child: Icon(Icons.add, size: 28, color: Colors.white),
          ),
        ),
      ),
    );
  }
}