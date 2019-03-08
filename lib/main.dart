import 'package:flutter/material.dart';
import 'package:calculator/view/calc_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowMaterialGrid: false,
      home: Scaffold(
        body: CalcView(),
      ),
    );
  }
}