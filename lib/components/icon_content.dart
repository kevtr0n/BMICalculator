import 'package:flutter/material.dart';
import 'package:bmi_calculator/data/constants.dart' as constants;

class IconContent extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;

  IconContent({@required this.icon, @required this.text, @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: iconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: constants.kLabelTextStyle,
        )
      ],
    );
  }
}