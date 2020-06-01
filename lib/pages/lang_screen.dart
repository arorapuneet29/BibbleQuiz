import 'package:flutter/material.dart';
import 'package:Bquiz/widegts/primary_btn.dart';
import 'package:Bquiz/widegts/secondary_btn.dart';

class LangScreen extends StatefulWidget {
  @override
  _LangScreenState createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  int selected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width:double.infinity,
          padding: EdgeInsets.fromLTRB(0, 60, 0, 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("CHOOSE YOUR \n DISPLAY LANGUAGE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 24,
                              letterSpacing: 4.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ]),
                Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        right: 24, left: 24, bottom: 20, top: 10),
                    child: GlobeSecondaryButton(
                      onPressed: () {
                        setState(() {
                          selected = 0;
                        });
                        print(selected);
                      },
                      bgColor: (selected != null && selected == 0)
                          ? Colors.white
                          : Color(0xff3a6666),
                      color: (selected != null && selected == 0)
                          ? Colors.black
                          : Colors.white,
                      buttonLabel: "ENGLISH",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: 24, left: 24, bottom: 20, top: 10),
                    child: GlobeSecondaryButton(
                      onPressed: () {
                        setState(() {
                          selected = 1;
                        });
                        print(selected);
                      },
                      buttonLabel: "SPANISH",
                      bgColor: (selected != null && selected == 1)
                          ? Colors.white
                          : Color(0xff3a6666),
                      color: (selected != null && selected == 1)
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ]),
                Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        right: 24, left: 24, bottom: 20, top: 10),
                    child: GlobePrimaryButton(
                      onPressed: () {
                        if (selected != null) {
                          Navigator.pushNamed(context, '/startPlaying',arguments:"$selected");
                        }
                      },
                      buttonLabel: "NEXT",
                      bg: (selected != null)
                          ? Color(0xfff1ad62)
                          : Color(0xfff1ad62).withOpacity(0.2),
                    ),
                  ),
                ]),
              ],
            )));
  }
}
