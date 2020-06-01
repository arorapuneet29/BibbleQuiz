import 'package:Bquiz/pages/lang_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Bquiz/routes/route.dart' as router;

void main() {
  runApp(QuizApp());
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
