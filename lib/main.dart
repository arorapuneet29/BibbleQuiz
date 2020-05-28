import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "routes/routes.dart";
// import 'package:globe/styling.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'BibbleQuiz',
      debugShowCheckedModeBanner: false,
     home:  QuizApp()
    )
  );
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
        home: Routes.getHomePage(),
        routes: Routes.getRoutingTable(),
        onUnknownRoute: Routes.getUnknownRoute(),
      );

  }
}
