import 'package:Bquiz/model/bQuiz_model.dart';
import 'package:flutter/material.dart';
import 'package:Bquiz/widegts/primary_btn.dart';
import 'package:Bquiz/widegts/secondary_btn.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int selected;
  int _questionNo = 0;

  List<Questions> _questions = List<Questions>();
  String name, username, avatar;
  bool isData = false;
  Future<List<Questions>> fetchJSON() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json/bquiz.json');
    final jsonResult = json.decode(data);
    var questionData = List<Questions>();
    for (var result in jsonResult) {
      questionData.add(Questions.fromJson(result));
    }
    return questionData;
  }

  void validateAnswer() {}

  @override
  void initState() {
    super.initState();
    fetchJSON().then((value) {
      setState(() {
        _questions.addAll(value);
      });
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("hsh");
    print(_questions[0].question);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text("Correct Answer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'AvenirNext',
                                  fontSize: 38,
                                  letterSpacing: 2.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                                 Center(
                                   child: Text("0/1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 30,
                                letterSpacing: 2.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                                 ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_questions[_questionNo].question,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'AvenirNext',
                                fontSize: 20,
                                letterSpacing: 2.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ]),
                  Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          right: 24, left: 24, bottom: 20, top: 10),
                      child: GlobeSecondaryButton(
                        onPressed: () {
                          print(fetchJSON());
                          setState(() {
                            selected = 0;
                          });
                          validateAnswer();
                          print(selected);
                        },
                        bgColor: (selected != null && selected == 0)
                            ? (_questions[_questionNo].correct == 0)
                                ? Colors.green
                                : Colors.red
                            : Colors.grey,
                        color: (selected != null && selected == 0)
                            ? Colors.black
                            : Colors.white,
                        buttonLabel: _questions[_questionNo].options[0],
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
                          validateAnswer();
                          print(selected);
                        },
                        buttonLabel: _questions[_questionNo].options[1],
                        bgColor: (selected != null && selected == 1)
                            ? (_questions[_questionNo].correct == 1)
                                ? Colors.green
                                : Colors.red
                            : Colors.grey,
                        color: (selected != null && selected == 1)
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 24, left: 24, bottom: 20, top: 10),
                      child: GlobeSecondaryButton(
                        onPressed: () {
                          setState(() {
                            selected = 2;
                          });
                          validateAnswer();
                          print(selected);
                        },
                        bgColor: (selected != null && selected == 2)
                            ? (_questions[_questionNo].correct == 2)
                                ? Colors.green
                                : Colors.red
                            : Colors.grey,
                        color: (selected != null && selected == 2)
                            ? Colors.black
                            : Colors.white,
                        buttonLabel: _questions[_questionNo].options[2],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 24, left: 24, bottom: 20, top: 10),
                      child: GlobeSecondaryButton(
                        onPressed: () {
                          setState(() {
                            selected = 3;
                          });
                          validateAnswer();
                          print(selected);
                        },
                        bgColor: (selected != null && selected == 3)
                            ? (_questions[_questionNo].correct == 3)
                                ? Colors.green
                                : Colors.red
                            : Colors.grey,
                        color: (selected != null && selected == 3)
                            ? Colors.black
                            : Colors.white,
                        buttonLabel: _questions[_questionNo].options[3],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 24, left: 24, bottom: 20, top: 10),
                      child: GlobePrimaryButton(
                        onPressed: () {
                          setState(() {
                            _questionNo = _questionNo + 1;
                            selected = null;
                          });
                        },
                        buttonLabel: "NEXT",
                        bg: (selected != null)
                            ? Color(0xfff1ad62)
                            : Color(0xfff1ad62).withOpacity(0.2),
                      ),
                    ),
                  ]),
                ],
              )),
        ));
  }
}
