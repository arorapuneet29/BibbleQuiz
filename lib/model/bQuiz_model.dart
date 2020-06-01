class Questions {
  final String question;
  final int correct;
  final int questionNo;
  final List<dynamic> options;

  Questions({this.question,this.questionNo,this.correct,this.options});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return new Questions(
      question: json['question'] as String,
      correct: json['correct'],
      options: json['options'],
      questionNo: json['questionNo']
    );
  }
}