import 'package:Bquiz/pages/lang_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Bquiz/routes/route.dart' as router;
import 'package:simple_splashscreen/simple_splashscreen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Simple_splashscreen(
      context: context,
      gotoWidget: QuizApp(),
      splashscreenWidget: SplashScreen(),
      timerInSeconds: 3,
    );
  }
}

//Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
             padding: EdgeInsets.fromLTRB(0, 95, 0, 50),
            width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ))
      ),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      home: LangScreen(),
    );
  }
}
