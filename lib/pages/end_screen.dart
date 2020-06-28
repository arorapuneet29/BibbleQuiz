import 'package:Bquiz/widegts/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:Bquiz/model/screen_arg.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class EndPlaying extends StatelessWidget {
  final ScreenArguments arguments;
  final data;
  const EndPlaying({Key key, this.data, this.arguments}) : super(key: key);

  void setDataLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('questionNo', null);
    prefs.setString('correctAns', null);
    prefs.setString('lang', null);
  }

  @override
  Widget build(BuildContext context) {
    setDataLocal();
    int correctQuestion = arguments.correct;
    int totalQuestion = arguments.total;
    String lang=arguments.lang;
    return WillPopScope(
      onWillPop: () async => false,
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
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 84.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(children: <Widget>[
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
                    ),
                  ]),
                  Column(children: <Widget>[
                    Text((lang=="0")?"CORRECT ANSWERS":"RESPUESTA CORRECTA",
                        style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 14,
                            letterSpacing: 2.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Container(
                      padding: EdgeInsets.only(
                          right: 24, left: 24, bottom: 20, top: 10),
                      child: Text("$correctQuestion/$totalQuestion",
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 36,
                              letterSpacing: 6,
                              color: Color(0xfff1ad62),
                              fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  Column(children: <Widget>[
                    RaisedButton(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        exit(0);
                      },
                      elevation: 0.0,
                      child: Text((lang=="0")?"QUIT":"DEJAR",
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
                          Navigator.pushNamed(context, '/');
                        },
                        buttonLabel:(lang=="0")?"START PLAYING AGAIN":"EMPEZAR DE NUEVO",
                        bg: Color(0xfff1ad62),
                      ),
                    ),
                  ]),
                ],
              ))),
    );
  }
}
