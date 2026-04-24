import 'dart:math';

class QuizQuestion {
  final int questionNumber;
  final String question;
  final List<String> answers;
  final List<String> correctAnswer; // changed to List<String>

  QuizQuestion({
    required this.questionNumber,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json, int questionNumber) {
    final correct = json['correct_answer'] as String;
    final incorrect = List<String>.from(json['incorrect_answers']);

    final allAnswers = [...incorrect, correct];
    allAnswers.shuffle(Random());

    return QuizQuestion(
      questionNumber: questionNumber,
      question: json['question'] as String,
      answers: allAnswers,
      correctAnswer: [correct], // wrapped in list
    );
  }
}