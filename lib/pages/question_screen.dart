import 'package:Bquiz/model/bQuiz_model.dart';
import 'package:Bquiz/model/screen_arg.dart';
import 'package:flutter/material.dart';
import 'package:Bquiz/widegts/primary_btn.dart';
import 'package:Bquiz/widegts/secondary_btn.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionScreen extends StatefulWidget {
  final String arguments;
  const QuestionScreen({Key key, this.arguments}) : super(key: key);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _selected;
  int _questionNo = 0;
  int _correctAns = 0;
  int _totalQuestion;
  int _questionNumber=0;

  List<Questions> _questions = List<Questions>();
  Future<List<Questions>> fetchJSON() async {
    String data;
    if (widget.arguments == "1") {
      data = await DefaultAssetBundle.of(context)
          .loadString('assets/json/bquiz_spanish.json');
    } else {
      data = await DefaultAssetBundle.of(context)
          .loadString('assets/json/bquiz.json');
    }
    final jsonResult = json.decode(data);
    var questionData = List<Questions>();
    for (var result in jsonResult) {
      questionData.add(Questions.fromJson(result));
    }
    return questionData;
  }

  void validateAnswer(x) {
    setDataLocal();
    if (_questions[_questionNo].correct == x) {
      setState(() {
        _correctAns = _correctAns + 1;
      });
    }
     if (_questionNo == _totalQuestion - 1) {
                              Navigator.pushNamed(context, '/endPlaying',
                                  arguments: ScreenArguments(
                                    _correctAns,
                                    _totalQuestion,
                                    widget.arguments

                                  ));
                            }
  }

  void setDataLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _questionNumber=_questionNo+1;
    prefs.setString('questionNo', "$_questionNumber");
    prefs.setString('correctAns', "$_correctAns");
  }

  void readDataLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String questionNo = prefs.getString('questionNo');
    final String correctAns = prefs.getString('correctAns');
    setState(() {
      _questionNo = int.parse(questionNo) ;
      _correctAns = int.parse(correctAns);
      _questionNumber=int.parse(questionNo);
    });
    if (_questionNo == _totalQuestion) {
      Navigator.pushNamed(context, '/endPlaying',
          arguments: ScreenArguments(
            _correctAns,
            _totalQuestion,
            widget.arguments
          ));
    }
  }

  void navigate() async{
 final SharedPreferences prefs = await SharedPreferences.getInstance();
   // prefs.setString('questionNo', "$_questionNo");
    //prefs.setString('correctAns', "$_correctAns");
 String lang=widget.arguments;
    prefs.setString('lang', lang);
      Navigator.pushNamed(context, '/startPlaying');

  }

  @override
  void initState() {
    super.initState();
    readDataLocal();
    fetchJSON().then((value) {
      setState(() {
        _questions.addAll(value);
        _totalQuestion = _questions.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   
    double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
    print(width);
    
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.only(top: 32),
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
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                navigate();
                                },
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 60),
                                  child: Text((widget.arguments=="0")?"CORRECT ANSWERS":"RESPUESTA CORRECTA",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'BebasNeue',
                                           fontSize:(height>650)? 15:12,
                                          letterSpacing: 2.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10),
                            width: 130,
                            decoration: BoxDecoration(
                              color: Color(0xffffff).withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: Text("$_correctAns/$_questionNumber",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontSize:(height>650)? 30:24,
                                    letterSpacing: 2.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ]),

                  /// grey color question wrap started
                  Container(
                    width: double.infinity,
                    padding: (height>642)?EdgeInsets.fromLTRB(30, 20, 30, 30):EdgeInsets.fromLTRB(30, 10, 30, 10),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.0)),
                      color: Color(0xfff2f2f2),
                    ),
                    child: Column(children: <Widget>[
                      Container(
                        padding:(height>650)? EdgeInsets.fromLTRB(0, 0, 0, 50):EdgeInsets.fromLTRB(0, 0, 0, 10),
                        margin:(width>767)?EdgeInsets.only(bottom: 20):EdgeInsets.only(bottom:0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_questions[_questionNo].question,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'PlayfairDisplay',
                                      fontSize:(height>650)? 18:15,
                                      letterSpacing: 0.3,
                                      color: Color(0xff2e2e2e),
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 24, left: 24, bottom: 10, top: 0),
                        child: GlobeSecondaryButton(
                          onPressed: () {
                            if (_selected == null) {
                              setState(() {
                                _selected = 0;
                              });
                              validateAnswer(0);
                            }
                          },
                          bgColor: (_selected != null && _selected == 0)
                              ? (_questions[_questionNo].correct == 0)
                                  ? Color(0xff02d664)
                                  : Colors.red
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 0)
                                  ? Color(0xff02d664)
                                  : Colors.white,
                          color: (_selected != null && _selected == 0)
                              ? Colors.white
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 0)
                                  ? Colors.white
                                  : Colors.black,
                          buttonLabel: _questions[_questionNo].options[0],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 24, left: 24, bottom: 10, top: 0),
                        child: GlobeSecondaryButton(
                          onPressed: () {
                            if (_selected == null) {
                              setState(() {
                                _selected = 1;
                              });
                              validateAnswer(1);
                            }
                          },
                          buttonLabel: _questions[_questionNo].options[1],
                          bgColor: (_selected != null && _selected == 1)
                              ? (_questions[_questionNo].correct == 1)
                                  ? Color(0xff02d664)
                                  : Colors.red
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 1)
                                  ? Color(0xff02d664)
                                  : Colors.white,
                          color: (_selected != null && _selected == 1)
                              ? Colors.white
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 1)
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 24, left: 24, bottom: 10, top: 00),
                        child: GlobeSecondaryButton(
                          onPressed: () {
                            if (_selected == null) {
                              setState(() {
                                _selected = 2;
                              });
                              validateAnswer(2);
                            }
                          },
                          bgColor: (_selected != null && _selected == 2)
                              ? (_questions[_questionNo].correct == 2)
                                  ? Color(0xff02d664)
                                  : Colors.red
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 2)
                                  ? Color(0xff02d664)
                                  : Colors.white,
                          color: (_selected != null && _selected == 2)
                              ? Colors.white
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 2)
                                  ? Colors.white
                                  : Colors.black,
                          buttonLabel: _questions[_questionNo].options[2],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 24, left: 24, bottom: 10, top: 00),
                        child: GlobeSecondaryButton(
                          onPressed: () {
                            if (_selected == null) {
                              setState(() {
                                _selected = 3;
                              });
                              validateAnswer(3);
                            }
                          },
                          bgColor: (_selected != null && _selected == 3)
                              ? (_questions[_questionNo].correct == 3)
                                  ? Color(0xff02d664)
                                  : Colors.red
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 3)
                                  ? Color(0xff02d664)
                                  : Colors.white,
                          color: (_selected != null && _selected == 3)
                              ? Colors.white
                              : (_selected != null &&
                                      _questions[_questionNo].correct == 3)
                                  ? Colors.white
                                  : Colors.black,
                          buttonLabel: _questions[_questionNo].options[3],
                        ),
                      ),
                      Container(
                         margin:(width>767)?EdgeInsets.fromLTRB(0, 200, 0, 60):EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding:(height>650)? EdgeInsets.only(
                            right: 24, left: 24, bottom: 0, top: 40):EdgeInsets.only(
                            right: 24, left: 24, bottom: 0, top: 10),
                        child: GlobePrimaryButton(
                          onPressed: () {
                            if (_questionNo == _totalQuestion - 1) {
                              Navigator.pushNamed(context, '/endPlaying',
                                  arguments: ScreenArguments(
                                    _correctAns,
                                    _totalQuestion,
                                    widget.arguments

                                  ));
                            } else {
                              if (_selected != null) {
                                setState(() {
                                  _questionNo = _questionNo + 1;
                                  _selected = null;
                                });
                              }
                            }
                          },
                          buttonLabel: (widget.arguments=="0")?"NEXT":"PROXIMA",
                          bg: (_selected != null)
                              ? Color(0xfff1ad62)
                              : Color(0xfff1ad62).withOpacity(0.4),
                        ),
                      ),
                    ]),
                  ),
                ],
              ))),
    );
  }
}
