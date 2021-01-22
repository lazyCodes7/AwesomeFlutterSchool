import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound({int i}){
    final player = AudioCache();
    player.play('note$i.wav');
  }
  Expanded buildKeys({Color colorInput, int numKey}){
    return Expanded(

      child: FlatButton(

          color: colorInput,

          onPressed: (){
            playSound(i: numKey);
          }
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(

          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKeys(
                    colorInput:Colors.red,
                    numKey: 1,
                ),
                buildKeys(
                  colorInput:Colors.blue,
                  numKey: 2,
                ),
                buildKeys(
                  colorInput:Colors.green,
                  numKey: 3,
                ),
                buildKeys(
                  colorInput:Colors.yellowAccent,
                  numKey: 4,
                ),
                buildKeys(
                  colorInput:Colors.pinkAccent,
                  numKey: 5,
                ),
                buildKeys(
                  colorInput:Colors.amberAccent,
                  numKey: 6,
                ),
                buildKeys(
                  colorInput:Colors.cyanAccent,
                  numKey: 7,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
