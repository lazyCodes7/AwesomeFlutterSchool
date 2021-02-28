import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/results.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff12163A),
        scaffoldBackgroundColor: Color(0xff0B1033),
      ),
      routes: {
        '/result':(context) => ResultPage()
      },
      home: InputPage(),
    );
  }
}

