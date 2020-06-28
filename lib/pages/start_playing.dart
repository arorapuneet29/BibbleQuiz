
import 'package:Bquiz/widegts/primary_btn.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class StartPlaying extends StatefulWidget {
  final String arguments;
const StartPlaying({Key key, this.arguments}) : super(key: key);
  @override
  _StartPlayingState createState() => _StartPlayingState();
}

class _StartPlayingState extends State<StartPlaying> {
   int _questionNo = 0;
  int _correctAns = 0;
  String _lang;
   void readDataLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String questionNo = prefs.getString('questionNo');
     final String correctAns = prefs.getString('correctAns');
      final String lang = prefs.getString('lang');
     setState(() {
      _questionNo = int.parse(questionNo);
      _correctAns=int.parse(correctAns);
       _lang=lang;
    });
  }

  @override
  void initState() {
    super.initState();
     readDataLocal();
  }
  @override
  Widget build(BuildContext context) {
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
                  Visibility(
                    visible: (_questionNo>0)? true: false,
                                      child: Column(children: <Widget>[
                      Text((_lang=="0")?"CORRECT ANSWERS":"RESPUESTA CORRECTA",
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 14,
                              letterSpacing: 2.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.only(
                            right: 24, left: 24, bottom: 20, top: 10),
                        child: Text("$_correctAns/$_questionNo",
                            style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 36,
                                letterSpacing: 6,
                                color: Color(0xfff1ad62),
                                fontWeight: FontWeight.bold)),
                      ),
                    ]),
                  ),
                  Column(children: <Widget>[
                    RaisedButton(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        exit(0);
                      },
                      elevation: 0.0,
                      child: Text((_lang=="0")?"QUIT":"DEJAR",
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
                          Navigator.pushNamed(context, '/questionScreen',arguments: _lang);
                        },
                        buttonLabel: (_lang=="0")?"START PLAYING":"EMPIEZA A JUGAR",
                        bg: Color(0xfff1ad62),
                      ),
                    ),
                  ]),
                ],
              ))));

  

  }
}
