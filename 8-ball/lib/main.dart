import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );
class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Ask Me Anything',
        ),
      ),
      backgroundColor: Colors.blue,
      body: Ball(

      ),

    );
  }
}
class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int Ballnumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          onPressed:(){
            setState(() {
              Ballnumber = Random().nextInt(5)+1;
            });
          },
          child: Image.asset('images/ball$Ballnumber.png'),
      ),
    );
  }
}

