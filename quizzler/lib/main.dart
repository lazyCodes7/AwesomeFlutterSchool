import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(Quizzler());
QuizBrain questionBank = QuizBrain();
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionPos = 0;
  bool ans;
  List<Icon> questionValue = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                ans = true;
                if(questionBank.getAnswer() == ans){
                  questionValue.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 30.0,
                    ),
                  );
                }else{
                  questionValue.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  );
                }
                setState(() {
                  if(!questionBank.getNextQuestion()){
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "YOU ARE DONE",
                      desc: "You have already completed the quiz!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              questionValue.clear();
                            });

                          },
                          color: Color.fromRGBO(0, 179, 134, 1.0),
                        ),

                      ],
                    ).show();
                  }

                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                ans = false;
                if(questionBank.getAnswer() == ans){
                  questionValue.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 30.0,
                    ),
                  );
                }
                else{
                  questionValue.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  );
                }
                //The user picked false.
                setState(() {
                  if(!questionBank.getNextQuestion()){
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "YOU ARE DONE",
                      desc: "You have already completed the quiz!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              questionValue.clear();
                              Navigator.pop(context);
                            });

                          },
                          color: Color.fromRGBO(0, 179, 134, 1.0),
                        ),

                      ],
                    ).show();
                  }

                });
              },
            ),
          ),
        ),
        Row(
          children: questionValue,
        )
      ],
    );
  }
}
