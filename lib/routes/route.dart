import 'package:flutter/material.dart';
import 'package:Bquiz/pages/end_screen.dart';
import 'package:Bquiz/pages/lang_screen.dart';
import 'package:Bquiz/pages/question_screen.dart';
import 'package:Bquiz/pages/start_playing.dart';
import 'package:Bquiz/routes_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LangRoute:
      return MaterialPageRoute(builder: (context) => LangScreen());
    case StartPlayingRoute:
     var lang= settings.arguments;
      return MaterialPageRoute(builder: (context) => StartPlaying(arguments:lang));
    case QuestionRoute:
    var lang= settings.arguments;
      return MaterialPageRoute(builder: (context) => QuestionScreen(arguments:lang));
    case EndPlayingRoute:
    var data = settings.arguments;
      return MaterialPageRoute(builder: (context) => EndPlaying(arguments: data));
   
    default:
      return MaterialPageRoute(builder: (context) => LangScreen());
  }
}
