import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Colors.deepOrange[300],
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      elevation: 6.0,
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}