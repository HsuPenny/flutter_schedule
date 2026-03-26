import 'package:app_schedule/my_color.dart';
import 'package:app_schedule/pages/loading_page.dart';
import 'package:app_schedule/pages/record/record_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Get.put(FilterController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JourneyLog', //行跡
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColor.aqua),
        useMaterial3: true,
      ),
      home: const LoadingPage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'TW'),
        Locale('en')
      ],
    );
  }
}