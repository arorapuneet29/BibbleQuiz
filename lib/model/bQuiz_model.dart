class Questions {
  final String question;
  final int correct;
  final List<dynamic> options;

  Questions({this.question,this.correct,this.options});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return new Questions(
      question: json['question'] as String,
      correct: json['correct'],
      options: json['options']
    );
  }
}