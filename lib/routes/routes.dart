import 'package:Bquiz/pages/lang_screen.dart';
import 'package:Bquiz/pages/question_screen.dart';
import 'package:Bquiz/pages/start_playing.dart';
import 'package:flutter/material.dart';


class Routes {
  static const lang = '/lang';
  static const startPlaying = '/startPlaying';

  static getRoutingTable() {
    return <String, WidgetBuilder>{
     '/lang': (BuildContext context) => LangScreen(),
      '/startPlaying': (BuildContext context) => StartPlaying(),
       '/questionScreen': (BuildContext context) => QuestionScreen(),

    };
  }

  static getUnknownRoute() {
    return (settings) {
      MaterialPageRoute(
        builder: (ctx) => StartPlaying(),
      );
    };
  }

  static getHomePage() {
    return LangScreen();
  }
}
