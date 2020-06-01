
import 'package:Bquiz/widegts/primary_btn.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class StartPlaying extends StatelessWidget {
    final String arguments;
   const StartPlaying({Key key, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {print(arguments);

    return  WillPopScope(
      onWillPop: () async => true,
          child: Scaffold(
          body: Container(
             padding: EdgeInsets.fromLTRB(0, 95, 0, 50),
            width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                       padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 84.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("BIBLE",
                        style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 38,
                            letterSpacing: 8.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("QUIZ",
                        style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 38,
                            letterSpacing: 8.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ]),
                  Column(children: <Widget>[
                                      RaisedButton(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        exit(0);
                      },
                      elevation: 0.0,
                      highlightColor:Color(0xff3a6666).withOpacity(0.0),
                      splashColor:Color(0xff3a6666).withOpacity(0.0),
                      child: Text("Quit",
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 18,
                              letterSpacing: 3.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 24, left: 24, bottom: 20, top: 25),
                      child: GlobePrimaryButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/questionScreen',arguments: '$arguments');
                        },
                        buttonLabel: "START PLAYING",
                          bg:Color(0xfff1ad62),
                      ),
                    ),
                  ]),
                ],
              ))),
    );
  }
}
