import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'package:bmi_calculator/CardContent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

enum  Gender
{
  female,
  male
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 0;
  int age = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),

      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectGender: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kActiveColor : kInActiveColor,
                    cardChild: CardContent(
                      icon: Icon(
                      FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      cardTitle: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectGender: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveColor : kInActiveColor,
                    cardChild: CardContent(
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      cardTitle: 'FEMALE',
                    ),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              textBaseline: TextBaseline.alphabetic,

              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kColor,
                    cardChild: Column(
                      textBaseline: TextBaseline.alphabetic,

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: ktextStyle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumStyle,
                            ),
                            Text(
                              ' cm',
                              style: ktextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x29eb1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 16.0,

                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30.0,
                            ),

                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            inactiveColor: Color(0xff8d8e98),
                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: ktextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtonIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight+=1;
                                });
                              },

                            ),

                            SizedBox(
                              width: 16.0,
                            ),
                            RoundButtonIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  if(weight>0){
                                    weight-=1;
                                  }
                                });
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                ),
                Expanded(
                  child: ReusableCard(
                    colour: kColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: ktextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtonIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age+=1;
                                });
                              },

                            ),

                            SizedBox(
                              width: 16.0,
                            ),
                            RoundButtonIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  if(age>0){
                                    age-=1;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/result');
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0
                  )
                ),
              ),
              color: kBottomColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomHeight,
            ),
          ),
        ],

      ),

    );
  }

}
class RoundButtonIcon extends StatelessWidget {
  @override
  final IconData icon ;
  final Function onPressed;
  const RoundButtonIcon({Key key, this.icon,this.onPressed}) : super(key: key);
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        onPressed:onPressed,
        shape: CircleBorder(),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        fillColor: Color(0xFF4C4F5E),

    );
  }
}




