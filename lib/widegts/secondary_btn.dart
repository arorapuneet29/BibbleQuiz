import 'package:flutter/material.dart';

class GlobeSecondaryButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color color;

  const GlobeSecondaryButton(
      {this.buttonLabel, this.color, this.bgColor, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
            height: 50,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white, //                   <--- border color
                width: 2.0,
              ),
              color: bgColor,
            ),
            child: Center(
              child: Text(
                buttonLabel,
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 14,
                    color: color,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold),
              ),
            )));
  }
}
