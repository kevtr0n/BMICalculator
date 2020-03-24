// Remote imports
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Local imports
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/data/constants.dart' as constants;
import 'package:bmi_calculator/data/gender.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selected;
  int age = 18;
  int height = 60;
  int weight = 140;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: constants.kCardColor,
                    onTap: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                      iconColor: (selected == Gender.male) ? constants.kActiveTextColor : constants.kInactiveTextColor,
                    )
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: constants.kCardColor,
                    onTap: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                      iconColor: (selected == Gender.female) ? constants.kActiveTextColor : constants.kInactiveTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: constants.kCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[200]
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: constants.kBigTextStyle,
                      ),
                      Text(
                        'in',
                        style: constants.kLabelTextStyle
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.grey[200],
                      inactiveTrackColor: Colors.grey[800],
                      thumbColor: Colors.deepOrange[300],
                      overlayColor: Colors.deepOrange[300].withAlpha(0x29),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      min: 10,
                      max: 100,
                      value: height.toDouble(),
                      onChanged: (double set) {
                        setState(() {
                          height = set.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: constants.kCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: constants.kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: constants.kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: constants.kCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: constants.kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: constants.kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.deepOrange[300],
            margin: EdgeInsets.only(top: 20.0),
            width: double.infinity,
            height: constants.kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}

