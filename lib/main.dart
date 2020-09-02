import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'Core/Constants/app_constanst.dart';
import 'Core/Service/Localization/language_service.dart';
import 'View/View/home_view.dart';

void main() {
  runApp(
    EasyLocalization(
      path: LanguageService.path,
      saveLocale: true,
      supportedLocales: LanguageService.instance.locales,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData(),
      home: HomeView(),
    );
  }
}
