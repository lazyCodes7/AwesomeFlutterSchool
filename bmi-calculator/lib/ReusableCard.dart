import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  const ReusableCard({@required this.colour, this.cardChild,this.selectGender}) ;
  final Function selectGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectGender,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(

            color: colour,
            borderRadius: BorderRadiusDirectional.circular(10.0)
        ),
      ),
    );
  }
}