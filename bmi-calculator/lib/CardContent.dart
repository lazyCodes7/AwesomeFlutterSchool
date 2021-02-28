import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CardContent extends StatelessWidget {
  final Icon icon;

  final String cardTitle;

  CardContent({@required this.icon, @required this.cardTitle});
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardTitle,
          style: ktextStyle,
        ),
      ],
    );
  }
}