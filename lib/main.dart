import 'package:flutter/material.dart';
import 'package:harrypotterapp/Core/Constants/app_constanst.dart';
import 'package:harrypotterapp/View/View/home_view.dart';

void main() {
  runApp(MyApp());
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
