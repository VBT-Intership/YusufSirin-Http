import 'package:flutter/material.dart';
import 'package:harrypotterapp/View/View/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry Potter',
      theme: ThemeData(),
      home: HomeView(),
    );
  }
}
