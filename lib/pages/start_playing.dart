import 'package:Bquiz/pages/lang_screen.dart';
import 'package:Bquiz/routes/routes.dart';
import 'package:Bquiz/widegts/primary_btn.dart';
import 'package:flutter/material.dart';

class StartPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bibble Quiz"),
        ),
        body: SizedBox.expand(
          child: Container(
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
                    Text("BIBLE",
                        style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 38,
                            letterSpacing: 8.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("QUIZ",
                        style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 38,
                            letterSpacing: 8.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ]),
                  Column(children: <Widget>[
                    Text("Quit",
                        style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 18,
                            letterSpacing: 3.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Container(
                      padding: EdgeInsets.only(
                          right: 24, left: 24, bottom: 20, top: 10),
                      child: GlobePrimaryButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/questionScreen');
                        },
                        buttonLabel: "START PLAYING",
                          bg:Color(0xfff1ad62),
                      ),
                    ),
                  ]),
                ],
              )),
        ));
  }
}
