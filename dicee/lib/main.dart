import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}
int changeDiceNumber(int Button){
  Button = Random().nextInt(6)+1;
  return Button;
}
class _DicePageState extends State<DicePage> {
  int leftButton=1;
  int rightButton=1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rightButton = changeDiceNumber(rightButton);
                  leftButton = changeDiceNumber(leftButton);
                });
              },
              child: Image(
                image: AssetImage('images/dice$leftButton.png'),
              ),
            ),
          ),

          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rightButton = changeDiceNumber(rightButton);
                  leftButton = changeDiceNumber(leftButton);
                });
              },
              child: Image(
                image: AssetImage('images/dice$rightButton.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


