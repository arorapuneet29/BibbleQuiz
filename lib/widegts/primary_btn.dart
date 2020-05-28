import 'package:flutter/material.dart';

class GlobePrimaryButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onPressed;
  final Color bg;

  const GlobePrimaryButton(
      {this.buttonLabel, this.bg, @required this.onPressed});

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
              borderRadius: BorderRadius.circular(28),
              color: bg,
            ),
            child: Center(
              child: Text(
                buttonLabel,
                style: TextStyle(
                    fontFamily: 'AvenirNext',
                    fontSize: 18,
                    color: Color(0xff212121),
                    fontWeight: FontWeight.bold),
              ),
            )));
  }
}
