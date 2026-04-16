import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/ac_widget.dart';
import 'map/map_service.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  //-----view data
  //-----view data

  //-----sys data
  //-----sys data

  //-----localize
  //-----localize

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background,
          body
        ],
      ),
    );
  }

  //-----mainView
    Widget get background {
      return Container(
        width: screenWidth,
        height: screenHeight,
        color: MyColor.aqua,
      );
    }

    Widget get body {
      return Center(
        child: appLogoNoBG(screenWidth * 0.75),
      );
    }
  //-----mainView

  //-----subView
  //-----subView

  //-----function
    double get screenWidth {
      return MediaQuery.of(context).size.width;
    }

    double get screenHeight {
      return MediaQuery.of(context).size.height;
    }

    void onInit() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await MapService.requestLocationPermission();
        Future.delayed(const Duration(seconds: 2));
        Get.to(const MainPage());
      });
    }
  //-----function
}